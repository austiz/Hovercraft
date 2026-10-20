// Consistency check for the hand-kept part lists and the SCAD conventions.
//
//   node tools/check_parts.js
//
// A part has to be named in seven places (AGENTS.md, "Adding or renaming a
// part"): the dispatch chain, the header PART list, export_stl.ps1,
// slice_all.ps1, PRINT_SETTINGS.md and the PART list in AGENTS.md.  They drift
// apart silently, so this script reads them all and reports every mismatch.
// It also lints two conventions: top-level knobs carry a comment, and $fn is
// only used for deliberate polygons (hex nut traps), never as resolution.
//
// Exit code 1 on an error (a list mismatch), 0 with warnings only.

const fs = require("fs");
const path = require("path");

const ROOT = path.join(__dirname, "..");
const read = f => fs.readFileSync(path.join(ROOT, f), "utf8");

// parts that exist in the file but are deliberately not exported or sliced
const NOT_EXPORTED = new Set([
    "assembly", "mockup",            // rule check / view-only
    "nozzle_v1", "nozzle_v2", "plate", // "nozzle" and "plates" are the exported forms
    "deck", "bdeck",                 // previews of the four quarters
    "fan_tube", "fan_guard",         // foam-board deck only
]);
// largest $fn that counts as a deliberate polygon, not a resolution override
const MAX_POLYGON_FN = 8;
// $fn = 360 / $fa is what $fa = 2 gives a large circle anyway: pinning it
// (so concentric cuts share vertices) is consistent with the quality knobs
const FA_FN = 180;

const errors = [], warnings = [];
const err  = m => errors.push(m);
const warn = m => warnings.push(m);

const scad = read("hovercraft_parts.scad");
const scadLines = scad.split(/\r?\n/);

// ---- 1. the dispatch chain at the bottom
const dispatch = new Set([...scad.matchAll(/PART\s*==\s*"([a-z0-9_]+)"/g)].map(m => m[1]));

// ---- 2. the header PART list (between "PART options" and the hardware list)
const hStart = scadLines.findIndex(l => /PART options/.test(l));
const hEnd = scadLines.findIndex((l, i) => i > hStart && /Hardware to buy/.test(l));
const header = new Set();
for (const l of scadLines.slice(hStart, hEnd))
    for (const m of l.matchAll(/"([a-z0-9_]+)"/g)) header.add(m[1]);

// ---- 3. export_stl.ps1: $parts plus the v1 loop
const exp = read("export_stl.ps1");
const listAfter = (src, re) => {
    const i = src.search(re);
    if (i < 0) return [];
    const tail = src.slice(i).split(/\r?\n/);
    let body = "";
    for (const l of tail) { body += l + "\n"; if (!/,\s*$/.test(l)) break; }
    return [...body.matchAll(/"([a-z0-9_]+)"/g)].map(m => m[1]);
};
const exported = new Set(listAfter(exp, /^\$parts\s*=/m));
const exportedV1 = new Set(listAfter(exp, /foreach \(\$part in "nozzle"/m));

// ---- 4. slice_all.ps1: the ordered table, keys -> stl paths
const slice = read("slice_all.ps1");
const sliced = new Map();
for (const m of slice.matchAll(/^\s+([a-z0-9_]+)\s*=\s*@\{\s*stl\s*=\s*"([^"]+)"/gm))
    sliced.set(m[1], m[2].replace(/\\/g, "/"));

// ---- 5. PRINT_SETTINGS.md: first cell of every table row
const ps = read("PRINT_SETTINGS.md");
const psCells = ps.split(/\r?\n/).filter(l => l.startsWith("|")).map(l => l.split("|")[1] || "");
const inPrintSettings = p => psCells.some(c => new RegExp(`(^|[^a-z0-9_])${p}([^a-z0-9_]|$)`).test(c));

// ---- 6. AGENTS.md "## PART values" section
const ag = read("AGENTS.md");
const agSec = (ag.split(/^## PART values/m)[1] || "").split(/^## /m)[0];
const agents = new Set([...agSec.matchAll(/`([a-z0-9_]+)`/g)].map(m => m[1]));

// ---- cross-checks
const need = (set, p, where) => { if (!set.has(p)) err(`${p}: missing from ${where}`); };

for (const p of dispatch) {
    need(header, p, "the .scad header PART list");
    need(agents, p, "AGENTS.md PART values");
    if (!NOT_EXPORTED.has(p) && !exported.has(p)) err(`${p}: dispatched but not in export_stl.ps1 $parts (add it, or to NOT_EXPORTED here)`);
}
for (const p of header) if (!dispatch.has(p)) err(`${p}: in the header PART list but has no dispatch line`);
for (const p of agents) if (!dispatch.has(p)) err(`${p}: in AGENTS.md PART values but has no dispatch line`);
for (const p of [...exported, ...exportedV1]) need(dispatch, p, "the dispatch chain");
for (const p of exported) {
    const hits = [...sliced.values()].filter(s => s === `${p}.stl`);
    if (!hits.length) err(`${p}: exported but no row in slice_all.ps1 $parts`);
    if (!inPrintSettings(p)) err(`${p}: exported but no row in PRINT_SETTINGS.md`);
}
for (const p of exportedV1)
    if (![...sliced.values()].includes(`v1/${p}.stl`)) warn(`v1/${p}: exported but not sliced by slice_all.ps1`);
for (const [k, s] of sliced) {
    const m = s.match(/^(v1\/)?([a-z0-9_]+)\.stl$/);
    const ok = m && (m[1] ? exportedV1 : exported).has(m[2]);
    if (!ok) err(`slice_all.ps1 row ${k}: ${s} is not produced by export_stl.ps1`);
}

// ---- lint: knobs without a comment
// A knob counts as commented if its line has a // comment, or it sits in a
// block of assignments directly under a comment line or another knob.
let prevKind = "blank";
scadLines.forEach((l, i) => {
    const knob = l.match(/^([A-Z][A-Z0-9_]*)\s*=/);
    if (knob) {
        if (!/\/\//.test(l) && prevKind === "blank" && !/^(PART)$/.test(knob[1]))
            warn(`line ${i + 1}: knob ${knob[1]} has no comment`);
        prevKind = "knob";
    } else if (/^\s*\/\//.test(l)) prevKind = "comment";
    else if (/^\s*$/.test(l)) prevKind = "blank";
    else prevKind = /^\s+\/\//.test(l) ? prevKind : "other";
});

// ---- lint: $fn used as resolution instead of a deliberate polygon
scadLines.forEach((l, i) => {
    const code = l.replace(/\/\/.*$/, "");
    for (const m of code.matchAll(/\$fn\s*=\s*([^,;)\s]+)/g)) {
        const n = Number(m[1]);
        if (!(Number.isFinite(n) && (n <= MAX_POLYGON_FN || n === FA_FN)))
            warn(`line ${i + 1}: $fn = ${m[1]} (resolution comes from $fa/$fs; $fn is for polygons like hex nuts)`);
    }
});

// ---- report
console.log(`parts: ${dispatch.size} dispatched, ${exported.size} exported (+${exportedV1.size} v1), ${sliced.size} sliced rows`);
for (const w of warnings) console.log(`WARN  ${w}`);
for (const e of errors) console.log(`FAIL  ${e}`);
console.log(errors.length ? `${errors.length} error(s)` : "part lists consistent");
process.exit(errors.length ? 1 : 0);
