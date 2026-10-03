// Lift-fan motor model: brushed DC motor + 5030 propeller + 10 x AA NiMH.
//
// Two ways to use it:
//
//   node tools/motor_model.js
//       Predicts all the motors in MOTORS below for fresh / nominal / tired
//       batteries.
//
//   node tools/motor_model.js --rpm 18500 [--rpm 16200 ...]
//       Uses a propeller speed you MEASURED (phone spectrum app, see
//       ENGINEERING_CHECK section 8) and tells you what it means: bag
//       pressure, lift margin, and how the speed-card holes scale.
//
// Propeller: Ct 0.10, Cp 0.045 (typical 5x3).  Bag pressure is anchored to
// the operating point in ENGINEERING_CHECK 5.3 (243 Pa at 17 000 rpm with
// the workshop skirt holes) and scales with rpm squared.  All of this is good
// to roughly +/-30 %; the float test and the extra-weight test are the truth.

const rho = 1.225, D = 0.127, Ct = 0.10, Cp = 0.045;
const RACE_KG = 2.06;                 // loaded craft, ENGINEERING_CHECK 5.1
const NEED = [136, 190];              // Pa: cushion pressure over bag .. deck area
const P_REF = 243, RPM_REF = 17000;   // bag pressure anchor
const CAP_AH = 1.9;                   // usable Eneloop capacity at high current

// kv = no-load rpm per volt, R = winding resistance (ohm), I0 = no-load amps,
// kg = loaded craft mass with this motor, if it is not RACE_KG
const MOTORS = {
  "A  RS-550 22k (workshop)":            { kv: 22000 / 12, R: 0.30, I0: 1.0 },
  "B  RS-550 40k 12 V":                  { kv: 40000 / 12, R: 0.15, I0: 2.5 },
  "C  smaller original (ASSUMED RS-380)":{ kv: 18000 / 12, R: 1.20, I0: 0.5 },
  // HS390: 12 V / 22 000 rpm is the listing; R and I0 are typical 390-size
  // guesses.  The 101 g motor + 12 g sleeve replace the 220 g RS-550.
  "D  HS390 22k 12 V (on the sleeve)":   { kv: 22000 / 12, R: 1.20, I0: 0.4, kg: RACE_KG - 0.220 + 0.113 },
};
const PACKS = [
  ["fresh, good contacts", 13.0, 0.25],
  ["nominal",              12.0, 0.35],
  ["tired / warm springs", 11.0, 0.50],
];

const bag = rpm => P_REF * Math.pow(rpm / RPM_REF, 2);
const margin = (p, kg = RACE_KG) => {
  const q = p * RACE_KG / kg;         // a lighter craft needs less pressure
  return `${(100 * (q / NEED[1] - 1)).toFixed(0).padStart(4)} .. ${(100 * (q / NEED[0] - 1)).toFixed(0).padStart(4)} %`;
};
const maxKg = p => `${(RACE_KG * p / NEED[1]).toFixed(1)} .. ${(RACE_KG * p / NEED[0]).toFixed(1)} kg`;

function operatingPoint(m, V, Rpack) {
  const Kt = 60 / (2 * Math.PI * m.kv), Rt = m.R + Rpack;
  const q = Cp * rho * Math.pow(D, 5) / (2 * Math.PI);    // prop torque = q n^2
  // V = I Rt + Kt (2 pi n),  I = q n^2 / Kt + I0
  const a = Rt * q / Kt, b = Kt * 2 * Math.PI, c = Rt * m.I0 - V;
  const n = (-b + Math.sqrt(b * b - 4 * a * c)) / (2 * a);
  const I = q * n * n / Kt + m.I0;
  return { rpm: n * 60, I, Vmotor: V - I * Rpack, shaftW: q * n * n * 2 * Math.PI * n,
           packHeatW: I * I * Rpack, motorHeatW: I * I * m.R,
           thrustN: Ct * rho * n * n * Math.pow(D, 4), tip: Math.PI * D * n };
}

const rpmArgs = [];
for (let i = 2; i < process.argv.length; i++)
  if (process.argv[i] === "--rpm") rpmArgs.push(+process.argv[++i]);

if (rpmArgs.length) {
  console.log("measured rpm   bag Pa   lift margin        floats up to      card holes vs 17 000 rpm");
  for (const r of rpmArgs) {
    const p = bag(r);
    console.log(`${String(r).padStart(10)}   ${p.toFixed(0).padStart(6)}   ${margin(p)}   ${maxKg(p).padStart(14)}      x ${(RPM_REF / r).toFixed(2)}`);
  }
  console.log("\nlift margin < 0 at the low end means it may not float the full load: test it.");
  process.exit(0);
}

for (const [name, m] of Object.entries(MOTORS)) {
  console.log(`\n== ${name}`);
  console.log("  battery state            rpm     amps  V@motor  shaft W  heat: pack/motor  bag Pa   lift margin        floats up to   fan-on per charge");
  for (const [label, V, Rp] of PACKS) {
    const o = operatingPoint(m, V, Rp), p = bag(o.rpm);
    console.log(`  ${label.padEnd(22)} ${o.rpm.toFixed(0).padStart(6)}  ${o.I.toFixed(1).padStart(6)}  ${o.Vmotor.toFixed(1).padStart(7)}  ${o.shaftW.toFixed(0).padStart(7)}  ${o.packHeatW.toFixed(0).padStart(5)} / ${o.motorHeatW.toFixed(0).padStart(3)} W   ${p.toFixed(0).padStart(6)}   ${margin(p, m.kg)}   ${maxKg(p).padStart(14)}   ${(CAP_AH / o.I * 60).toFixed(0).padStart(3)} min`);
  }
  const a = operatingPoint(m, 12.0, 0.35), b = operatingPoint(m, 11.76, 0.35);
  console.log(`  2 % battery sag -> ${(100 * (a.rpm / b.rpm - 1)).toFixed(1)} % slower run = ${(12 * (a.rpm / b.rpm - 1)).toFixed(2)} s at TT 12;  tip speed ${a.tip.toFixed(0)} m/s`);
}
