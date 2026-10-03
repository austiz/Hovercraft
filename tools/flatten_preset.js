// Flatten a Bambu Studio system preset into one standalone JSON file.
//
// Bambu Studio's command line loads a preset file as flat keys and ignores
// its "inherits" / "include" chain, so a system preset passed straight in
// gives you the parent's defaults (0.2 mm layers, 2 walls...) with only the
// leaf's few keys applied.  This resolves the chain and merges overrides.
//
//   node flatten_preset.js <kind> <preset name> <out.json> [from] [overrides.json]
//
// kind: machine | process | filament.  from: "system" for machine and
// filament (the slicer refuses a user-defined machine), "User" for process.
// overrides.json is a file (PowerShell mangles inline JSON quotes).
const fs = require("fs"), path = require("path");
const SYS = path.join(process.env.APPDATA, "BambuStudio", "system", "BBL");

function load(kind, name) {
  const j = JSON.parse(fs.readFileSync(path.join(SYS, kind, name + ".json"), "utf8"));
  let base = {};
  if (j.inherits) base = load(kind, j.inherits);
  if (Array.isArray(j.include)) for (const inc of j.include) Object.assign(base, load(kind, inc));
  const out = Object.assign({}, base, j);
  delete out.inherits; delete out.include;
  return out;
}

const [,, kind, name, outFile, from = "system", overridesFile] = process.argv;
const flat = load(kind, name);
if (overridesFile) Object.assign(flat, JSON.parse(fs.readFileSync(overridesFile, "utf8")));
flat.from = from;
fs.writeFileSync(outFile, JSON.stringify(flat, null, 1));
console.log(`${path.basename(outFile)}: ${flat.name}` +
  (flat.layer_height ? `  layer ${flat.layer_height}  walls ${flat.wall_loops}  infill ${flat.sparse_infill_density}  support ${flat.enable_support}  brim ${flat.brim_type}` : ""));
