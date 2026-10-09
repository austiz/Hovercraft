# OpenSCAD practices: research notes and how this repo measures up

Researched 2026-10-08 (sources at the bottom). Two questions: what makes OpenSCAD
models print well on FDM, and what makes an AI writing OpenSCAD get it right. Each
finding below is followed by where this repo stands.

## Verdict

The repo already does most of what the sources recommend. The gap was **automation**:
the verify loop and the "touch seven places" checklist were done by hand and had
drifted (`fan_cage_hs390` was exported but never sliced). Two tools close that:

| Tool | What it does | Time |
|---|---|---|
| `powershell -ExecutionPolicy Bypass -File tools\verify.ps1` | part-list check, then `assembly` rule echoes, then every part evaluated, so every `assert` fires | ~5 s |
| `... tools\verify.ps1 -Stl deck_fl,wear_pad` (or `-Stl all`) | also renders throwaway STLs and runs `tools/mesh_check.js`: manifold edges, fits the 256 mm P1S bed, sits at Z = 0 | ~12 s for all 26 |
| `node tools/check_parts.js` | the seven part lists agree; lints uncommented knobs and resolution-style `$fn` | instant |

`tools/mesh_check.js` counts edges instead of trusting OpenSCAD's `--summary` "simple"
flag, because that flag is missing for some parts (`tray_bar`).

## 1. Printability (FDM)

| Practice | Source says | Here |
|---|---|---|
| Fit clearances from one calibration, not guesses | Print a comb or test once, record press/close/slide fits (≈0.15 / 0.25 / 0.30 mm) | ✅ `deck_fit_test` with per-side `SOCK_FIT`, `DT_CLR`, `DECK_TAB_CLR`, `PLATE_FIT` |
| Clearance ≠ printer slop | BOSL2 separates `$slop` (printer error) from designed clearance | ✅ the per-side fit knobs are clearance; the printer's error is measured by the fit test |
| Horizontal holes droop | Use teardrop holes, or oversize them | ✅ `M3_TAP_H`, teardrop roof on the switch panel hole and the nozzle exit |
| `circle()` is an *inscribed* polygon, so holes come out small (polyholes) | Compensate with fewer, larger segments | ✅ not needed here: with `$fa=2 $fs=0.5` an M3 hole has 19–22 sides and loses only 0.04 mm across the flats, about a tenth of the 0.3–0.5 mm print error |
| Overhangs ≤ 45°, chamfer downward faces | Design so no supports are needed | ✅ modeled breakaway supports on the deck, 45° roofs, chamfered wear pad |
| Round inside corners | Sharp inside corners are stress risers; do it with `offset()` in 2D | ⚠️ partly: `offset()` is used 25×. Worth a look at the snap-arm roots (`aa4_mount`, `tray_bar`, `bin_lid` legs) before the next reprint |
| Elephant's foot | Chamfer the first-layer edges, or use slicer compensation | ✅ slicer compensation (0.15) on the parts that need it |
| Layer direction under load | Orient so flexing parts bend in-plane | ✅ `tray_bar`, `aa2_fences` print on their side for exactly this |
| Minimum wall | ≥ 1.2 mm (3 lines) for a 0.4 nozzle | ✅ 2.4 mm duct wall, 3 walls everywhere |

## 2. Code structure

| Practice | Here |
|---|---|
| Every dimension is a named, commented top-level variable | ✅ the house rule. `check_parts.js` flags exceptions (`CAGE_OD` has no comment today) |
| Overlap coplanar faces by an epsilon | ✅ `EPS = 0.02` |
| Resolution from `$fa`/`$fs`, not scattered `$fn` | ✅ `$fn` only for hex nuts and for `rotate_extrude` at 180 (the same as `$fa=2`). One `$fn = 96` on the bellmouth inlet circle is flagged as a warning |
| Build 2D, then extrude; keep minkowski in 2D | ✅ `*_2d()` profiles; no `minkowski` at all, only 2 `hull()`s |
| `assert()` the constraints, `echo()` the derived numbers | ✅ `assembly()` RULE/FIT/DUCT lines and asserts |
| One module per part behind a selector | ✅ `PART` dispatch |
| Use BOSL2 | ❌ **not adopting.** It is a good library (attachments, `$slop`, teardrops), but this file is self-contained and its geometry is proven on the printer. Porting it would mean reprinting with no gain. Fine for a new, separate part file |

## 3. Using an AI on OpenSCAD

What the papers and benchmarks agree on:

1. **Close the loop with renders.** Generate, render, look, revise. CADCodeVerify (ICLR
   2025) gets its gains by having the model write *validation questions from the
   requirements first*, then answer each one against the rendered object.
   *Here:* before looking at a render, list what must be true (e.g. "the dowel pocket
   is 6.85 mm and open at the top"), then answer each with MCP `measure`, not by eye.
2. **The preview is not the export.** In the ModelRift benchmark, one model's preview looked
   right while its exported STL was broken. *Here:* `verify.ps1 -Stl` checks the actual
   exported mesh.
3. **Paste errors back verbatim.** OpenSCAD errors carry line numbers, and models fix them
   reliably. *Here:* `verify.ps1` prints the full console log of any failing part.
4. **Human mark-up beats autonomy for spatial work.** Even the strongest models did
   better when a person circled the problem on a render. *Here:* a screenshot with a
   scribble on it is the fastest way to say "this edge, not that one".
5. **Plan first, build incrementally.** Start from the base, add one feature at a time, and
   re-render after each. Explicit numbers beat words like "near the edge".
6. **Parametric test.** Change one knob, re-render, and confirm the geometry follows. This
   catches dimensions hard-coded where a knob should be. *Here:* worth doing on a fit knob
   (`SOCK_FIT ± 0.1`) after any socket edit.
7. **Give the purpose, not just the shape.** "Carries 2 kg, mounts under a shelf" leads to
   sensible walls and holes. The header comments here already state each part's job.

## Tool versions (checked 2026-10-08)

| Tool | Version | Status |
|---|---|---|
| OpenSCAD nightly (Manifold) | 2026.10.05 | current (3 days old). Manifold is the reason full renders take seconds |
| openscad-mcp (via `uvx`) | 0.6.1 | latest on PyPI |
| uv | 0.12.23 | current |
| BOSL2 | not installed | not needed (see above) |

Useful CLI flags found on the way: `--summary all --summary-file x.json` (bounding box,
facet count), `--hardwarnings` (stop at the first warning), `-o x.echo` (evaluate only:
asserts and echoes, no geometry, about 0.1 s).

## Sources

- [CADCodeVerify: Generating CAD Code with Vision-Language Models (ICLR 2025)](https://arxiv.org/abs/2410.05340v1)
- [OpenSCAD LLM Benchmark (ModelRift)](https://modelrift.com/blog/openscad-llm-benchmark/)
- [OpenSCAD LLM Workflow 2026](https://swiftwand.com/en/openscad-llm-code-cad-2026-en/)
- [openscad Claude skill (fit table, printability checks)](https://github.com/andreahaku/openscad_claude_skill)
- [Solver-aided hierarchical language for LLM CAD (AIDL)](https://arxiv.org/pdf/2502.09819)
- [OpenSCAD tips for RepRap developers](https://reprap.org/wiki/OpenSCAD_tips_for_RepRap_developers)
- [Designing shapes that print better (MatterHackers)](https://forums.matterhackers.com/post/377?page=1)
- [OpenSCAD list: accurate horizontal holes](https://lists.openscad.org/empathy/thread/NHG5T43SGY6ALYW4KVUDFDSTPLG5WQAZ)
- [OpenSCAD list: $slop vs clearance](https://lists.openscad.org/empathy/thread/PBZMSWZYR2B2XKNHACYNMKGIF3Z3JGF5?page=6)
- [OpenSCAD list: Manifold backend performance](https://lists.openscad.org/empathy/thread/4A45THDJLC2UERHLQSPMDHQBGP3RQEYK)
