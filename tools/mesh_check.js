// Checks rendered ASCII STLs the way a slicer will see them.
//
//   node tools/mesh_check.js part.stl [more.stl ...]
//
// Per file: bounding box, lowest Z, triangle count and the number of edges
// not shared by exactly two triangles (0 = closed, manifold mesh).  Fails a
// file that is open or non-manifold, exceeds the P1S bed, or does not sit on
// the bed at Z = 0 (every part is drawn in its print orientation).
// OpenSCAD's --summary "simple" flag is not used: it is missing for some parts.

const fs = require("fs");
const path = require("path");

const BED = 256;     // P1S build volume, mm, each axis
const Z_TOL = 0.05;  // how far off Z = 0 the lowest point may sit (EPS overlaps)

let failed = 0;
for (const f of process.argv.slice(2)) {
    const txt = fs.readFileSync(f, "utf8");
    if (!/^\s*solid/.test(txt)) { console.log(`${path.basename(f)}: not an ASCII STL`); failed++; continue; }
    const verts = [...txt.matchAll(/vertex\s+(\S+)\s+(\S+)\s+(\S+)/g)].map(m => m.slice(1));
    const lo = [Infinity, Infinity, Infinity], hi = [-Infinity, -Infinity, -Infinity];
    for (const v of verts) for (let a = 0; a < 3; a++) {
        const x = Number(v[a]); if (x < lo[a]) lo[a] = x; if (x > hi[a]) hi[a] = x;
    }
    // OpenSCAD writes each shared vertex with identical text, so the text is the key
    const edges = new Map();
    for (let i = 0; i < verts.length; i += 3) {
        const k = [0, 1, 2].map(j => verts[i + j].join(","));
        for (const [a, b] of [[k[0], k[1]], [k[1], k[2]], [k[2], k[0]]]) {
            const e = a < b ? a + "|" + b : b + "|" + a;
            edges.set(e, (edges.get(e) || 0) + 1);
        }
    }
    const badEdges = [...edges.values()].filter(c => c !== 2).length;
    const size = hi.map((h, a) => h - lo[a]);
    const problems = [];
    if (!verts.length) problems.push("empty");
    if (badEdges) problems.push(`${badEdges} non-manifold edges`);
    if (Math.max(...size) > BED) problems.push(`exceeds the ${BED} mm bed`);
    if (Math.abs(lo[2]) > Z_TOL) problems.push("not sitting at Z = 0");
    const name = path.basename(f, ".stl").padEnd(16);
    const dims = size.map(s => s.toFixed(1).padStart(6)).join(" x ");
    console.log(`${name} ${dims} mm  zmin ${lo[2].toFixed(2).padStart(6)}  ${String(verts.length / 3).padStart(6)} tris` +
        (problems.length ? `  <- ${problems.join(", ")}` : ""));
    if (problems.length) failed++;
}
process.exit(failed ? 1 : 0);
