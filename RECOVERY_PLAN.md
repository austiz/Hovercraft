# Recovery plan — after the first failed test

The first build showed three symptoms: the seam screws were very hard to
drive, the batteries got hot, and the craft produced no lift at all.
This is the bench procedure to find and fix each one.  Work the steps in
order: each one gates the next, and the whole list is an afternoon.

**Nothing needs reprinting.**  Every fix below is drilling, wiring,
taping or assembly.  (The SCAD file is already corrected for any
*future* prints: no seam screws at all, since the quarters now lock with vertical dovetail keys and glue; set-screw hole 2.9 mm.)

## Why it failed — the short version

| Symptom | Cause | Fix |
|---|---|---|
| Screws hard to drive | horizontal printed holes come out 0.3–0.5 mm small: the 3.4 mm seam bores printed ~2.9–3.1 mm, under the M3's 2.9–3.0 mm thread, so every screw was cutting threads through 3.2 mm of PLA — across two quarters that don't quite line up | drill 3.5 mm (9/64") through any hole pair that still needs a bolt.  Bolts that went in hard are mechanically fine: **leave them** |
| Hot batteries + no lift (one fault, two symptoms) | AA spring holders put ~20 spring/plate contacts in series at 30–100 mΩ each.  A healthy pack is ~0.35 Ω; a spring pack is realistically 1–2.4 Ω.  At motor current that eats 3–6 V: the motor sees too little voltage to spin the prop past the float threshold (~12 700 rpm = zero lift), while 40–56 W turns into heat in the cells and springs | pack surgery (below), then the electrical gates |
| No lift even at speed (possible second cause) | the build order never said to cut the six skirt holes or tape the wear pad on — a bag with no holes inflates but lifts nothing.  Also possible: prop mounted upside down, or rubbing | steps 0, 1 and 3 |

A note on the 40 000 rpm RS-550 ("motor B"): even with a *perfect* pack
it pulls ~12.6 A and dumps ~56 W into the cells — hot batteries are partly
its nature, not only a fault.  The 22 000 rpm motor ("A") pulls ~5 A and
~9 W.  See the heat budget at the end.

---

## The triage, in order

### Step 0 — identify the motor, spin by hand

- Which RS-550 is on the cage?  Read the label: 22 000 rpm/12 V is
  motor **A**, 40 000 rpm/12 V is motor **B**.  Unlabelled: run it
  no-load for 3 s — A idles near 1 A, B near 2.5 A.  Write it down;
  the electrical gates below differ by motor.
- Switch off, **spin the prop by hand**.  It must turn a full turn
  freely, nothing touching the cage above (4 mm clearance) or the tube
  wall (4.5 mm).  Check the collet grub screw is tight and the prop nut
  snug.  A rubbing or loose prop explains "no lift" all by itself.

### Step 1 — which way is it blowing (10 seconds)

Fan on, hold a strip of tissue just above the cage.  It must be **sucked
down** toward the cage — air in from the top, out into the bag.  If the
tissue blows upward:

- prop mounted upside down → flip it, or
- polarity reversed → swap the two wires **at the motor terminals**
  (not at the switch, so the switch wiring stays as labelled).

### Step 2 — bench electrical (the 10-minute test)

Full-charged cells, craft on the bench, prop free to spin.  You need a
multimeter.  **Never put the meter's 10 A range in series with motor B —
it pulls ~12.6 A and will blow the meter's fuse.**  Everything below is
voltage probing only.

1. **Each cell**, off the craft, fresh off the charger: ~1.40 V, rested
   ~1.30 V.  Any cell under 1.25 V: recharge it; still low → replace it.
2. **Pack open-circuit**: probe across the battery side of the switch,
   fan off.  10 fresh cells ≈ 13.0–13.5 V.
3. **Fan on, voltage at the motor terminals.**  This is the number that
   decides everything:
   - motor **A**: V_motor ≥ **10.0 V** → pack is healthy, go to step 3.
   - motor **B**: V_motor ≥ **7.4 V** → healthy, go to step 3.
   - Below the gate → the pack/wiring is eating the voltage: find where,
     then do the pack surgery.
4. **Find the bad element** (fan still on).  Probe the drop *across*
   each element in turn: each battery holder, the switch, each connector,
   each wire run.  Thresholds at motor A's ~5 A — double them for B's
   ~12.6 A:
   - the two 4×AA holders should read within **0.3 V** of each other;
     the one that's higher by more than that is the bad holder,
   - switch: < 0.1 V across it,
   - any single connector or joint dropping > 0.2 V is a fault point,
   - warm-to-the-touch = resistive.  A spring you can't hold a finger
     on is the smoking gun.
5. **Pack resistance**: (open-circuit V − V_motor) ÷ current.  Use the
   model's current for your motor (A: 5 A, B: 12.6 A) if you can't
   measure it.  **≤ 0.35 Ω is the pass**; a spring pack typically shows
   1–2 Ω.

### Step 3 — bag audit (the no-lift checklist)

Flip the craft and check, in this order:

- **Six ~Ø25 mm holes in the bag?**  Ring just outside the wear pad,
  centres ~10 cm from the bag's centre, evenly spaced.  The first-build
  instructions never said to cut them (now fixed, ENGINEERING_CHECK §9.3
  step 6).  **No holes = no lift**, full stop: the bag inflates hard
  and sits there.
- **Wear pad** taped to the centre of the bag's outside face, chamfer
  toward the track, not covering any hole.
- **Foam deck only: guard nubs down** (toward the bag): they stop the
  plastic sealing flat against the grid.  The printed deck's guard has
  no nubs: the fan's flow blows the plastic off it.
- **Seams and pocket floors taped** underneath; tube and nozzle pockets
  glued airtight; hold the deck to a light — no glowing pinholes.
- **Zero card in** the nozzle guide (or any card — never an open slot
  for a float test).

### Step 4 — bare float

Fresh cells, no nickels, zero card.  Fan on: the skirt should inflate in
~1 s and the craft rise and glide freely when pushed.  If step 2's
voltage gate passed and the rpm sounds healthy but it still won't float,
go back to step 3 — it is a bag problem, not a power problem.

Optional but worth it: phone spectrum app 30 cm from the fan, tallest
peak × 30 = prop rpm (2-blade).  Below ~12 700 rpm nothing will ever
float; ~15 000 rpm floats the full load.  `node tools/motor_model.js
--rpm <your number>` turns it into lift margin.

### Step 5 — load it up

Add weight in ~200 g steps (nickel rolls or rice bags) to the full
race load (~1 kg of nickels, ~2.14 kg total).  It should still rise
when pushed down gently (the rule 3c check).

**"Lift fixed" means**: after 5 minutes of accumulated fan-on time it
still floats ~2.57 kg (race load + ~430 g, i.e. +20 % margin).  Less
margin than that and race-day tired cells will ground it.

### Step 6 — compliance, floating at full load

- 40 cm box: expect ~393 × 383 mm with the skirt puffed (7/17 mm margin).
- Dowel top ≥ 20 cm above the track (design: ~28 cm).
- Dowel ≤ 3 cm behind the skirt's front face (design: ~19.6 mm).
- Measure, then set `SKIRT_OVER` in the SCAD to the real overhang and
  re-read the `assembly` console echoes.

### Step 7 — calibrate the magic number

Only after everything above passes: five runs each with the 15/22/30 mm
test cards, magic = hole × time, average them.  Each motor needs its own
calibration; if you switched motors or did pack surgery, old numbers are
void.

---

## Pack surgery (if step 2 failed its gate)

All of this is legal: rule 3b expressly allows "wires including battery
holders/connectors".  Keep the cell labels visible (3f-ii is checked by
label) and keep the pack detachable at one connector — batteries are
impounded separately (rule 2a).

1. **Bridge every negative spring.**  The current's path *through the
   spring coil* is the resistance.  Solder a short copper braid or
   18 AWG jumper from the spring's base plate to its top coil (or swap
   to holders with welded tabs).  This is the single biggest win.
2. **Shine the positive contacts.**  Sand or eraser-polish every
   positive button plate until bright.  Oxide films are tens of mΩ each.
3. **Replace thin pigtails.**  Holder leads are often 24–26 AWG.  Solder
   18 AWG directly to the holders' end plates; keep total wiring under
   0.6 m.
4. **Crimp *and* solder** the spade connectors at the switch; solder the
   holder-to-holder series joints — no twisted-wire joints anywhere.
5. **Re-test against the step 2 gates**: V_motor ≥ 10.0 V (A) or
   ≥ 7.4 V (B) under load, and pack resistance ≤ 0.35 Ω.  Holders should
   stay finger-touchable after a minute of fan-on.

## Motor B heat budget (if flying the 40k)

Fly B only if the pack passes ≤ 0.5 Ω after surgery — otherwise fly A on
fresh cells.  Even healthy, B puts ~56 W into the cells:

- run in **bursts of ≤ 2 minutes**, rest 5,
- a competition needs ~3 minutes of fan time (two runs + setup) —
  comfortably inside one charge,
- recharge after 6–7 cumulative minutes; total capacity is only ~9 min,
- holders too hot to touch at any point: stop, find the resistive joint.

Motor A is the calm choice: ~5 A, ~9 W of pack heat, ~23 min per charge,
and it floats the full load on fresh cells — its only weakness is thin
margin on tired ones.

## If race day arrives and it still won't float

Rule 3c: failure to levitate is a ×0.8 construction-score penalty, **not
a disqualification** — run anyway.  And the cheapest 190 g of margin is
always the 20 loose nickels (2 points of 20).
