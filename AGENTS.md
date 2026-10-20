# Hovercraft — Science Olympiad Div B 2027

3D-printed parts for a competition hover racer (Bambu P1S, PLA). Everything is in one
parametric file, `hovercraft_parts.scad` (~2,400 lines), behind a `PART` selector.
Units mm, Z up, every part is drawn **in its print orientation**.

## Where things are

| Path | What |
|---|---|
| `hovercraft_parts.scad` | header comment (part list, hardware, build order, rule notes) → knobs by section (`// ------- <name>` lines; grep these, line numbers drift) → helper modules → one module per part → `assembly()` (rule checks) → `PART` dispatch chain at the very bottom |
| `stl/`, `stl/v1/` | committed exports. **Regenerate after any geometry change** (`export_stl.ps1`) |
| `PRINT_SETTINGS.md` | per-part slicing table (walls, infill, brim, supports, g, time) |
| `ENGINEERING_CHECK.md` | math and slicer behaviour (850 lines: grep it, don't read the whole thing) |
| `RECOVERY_PLAN.md` | bench triage after the first failed test (screws, hot batteries, no lift) |
| `RESEARCH.md` | background research |
| `TEAM_AEOLUS.md` | team spirit, not engineering: the craft's name (Aeolus), dance, song + guitar chords, uniforms |
| `tools/motor_model.js` | `node tools/motor_model.js [--rpm N]`: fan motor / lift model |
| `tools/verify.ps1` | one-command verify: part lists, `assembly` rules, every part's asserts; `-Stl a,b` / `-Stl all` adds mesh checks (calls `check_parts.js`, `mesh_check.js`) |
| `SCAD_PRACTICES.md` | researched OpenSCAD / FDM / AI-CAD practices and how this repo compares |
| `*.pdf`, `Hover Racer Workshop.html` | the rules and the source workshop. Big: search them, don't load them whole |
| `sliced/`, `_*.scad`, `*.3mf` | gitignored output and scratch |

## Toolchain (Windows)

- OpenSCAD nightly (Manifold): `%LOCALAPPDATA%\Programs\OpenSCAD-Nightly\`.
  `openscad.com` is the console build (waits, returns exit code; use it headless),
  `openscad.exe` is the GUI.
- **MCP `openscad`** (`.mcp.json`): `render` (PNG), `measure`, `validate`, `check`,
  `export_model`. Use it first when you want to look at a part. `MCP_ALLOWED_PATHS` is
  the repo root only, so put scratch wrappers in the repo as `_*.scad` (gitignored), not in temp.
- Bambu Studio: `C:\Program Files\Bambu Studio\bambu-studio.exe` (path hard-coded in
  `slice_all.ps1`; also needs `node` on PATH). After export, slice what changed with
  `powershell -ExecutionPolicy Bypass -File slice_all.ps1 -Only deck_fl,deck_fr` and take
  g/time from `sliced\summary.json`. Don't estimate them.

### Headless render (CLI fallback)

PowerShell mangles `-D PART="..."`. Use a one-line wrapper (the last assignment wins):

```powershell
"include <hovercraft_parts.scad>`nPART = `"wear_pad`";" | Set-Content -Encoding ascii _peek.scad
& "$env:LOCALAPPDATA\Programs\OpenSCAD-Nightly\openscad.com" -o _peek.png --imgsize=1024,768 _peek.scad
# STL: -o stl\wear_pad.stl    camera: --camera=0,0,0,55,0,25,500    other knobs: add `nNOZZLE_V = 1;
Remove-Item _peek.scad
```

Failure = nonzero exit or a **case-sensitive** match on `ERROR|WARNING|not.*manifold`.
The nightly's `Fontconfig error` line is harmless.

## PART values

`assembly` (rule-check echo, not printable) · `mockup` (view-only STL, never print) ·
`fan_cage` `fan_cage_hs390` · `nozzle` (= v1 or v2 by `NOZZLE_V`) `nozzle_v1` `nozzle_v2` ·
`plate` (`PLATE_TIME`) `plates` (`PLATE_BATCH`) `plate_zero` `plate_test` `plate_rack`
`rack_aux` `chart_plate` · `nickel_tray` `tray_bar` `coin_bin` `bin_lid` · `stick_stand`
`switch_bracket` · `aa4_mount` `aa2_tray` `aa2_fences` `wire_clips` · `deck_fl` `deck_fr`
`deck_bl` `deck_br` `deck` (preview of all four) `deck_fit_test` · `bdeck_fl` `bdeck_fr`
`bdeck_bl` `bdeck_br` `bdeck` `blower_box` (blower variant: Delta BFB1212GH instead of the
propeller; these PART names set `BLOWER`, and `FAN_TYPE = "blower"` sets it for `assembly`/`deck`) ·
`templates` `wear_pad` ·
`fan_tube` `fan_guard` (**foam-board deck only**: the printed quarters have the duct and
guard built in, and these two are not exported any more)

Fit knobs, all per side: `SOCK_FIT` (deck pockets), `DT_CLR` (deck dovetail keys; the
quarters have no screws), `DECK_TAB_CLR` (jigsaw tabs), `PLATE_FIT`. Tune them by printing
`deck_fit_test` first.

## Verify after every geometry change

1. Render the changed part and look at it (MCP `render`, or a cross-section). Before
   looking, write down what must be true of it; then check each item with `measure`,
   not by eyeballing the picture.
2. Run `powershell -ExecutionPolicy Bypass -File tools\verify.ps1 -Stl <changed parts>`
   (~5 s plus about 1 s a part). It prints the `assembly` `RULE` / `FIT` / `DUCT` lines,
   fires every `assert`, checks the part lists agree, and checks each rendered mesh:
   manifold, fits the bed, sits at Z = 0. A failed assert is a design error. Don't
   loosen the assert to get past it.
3. Re-export the affected STLs (`powershell -ExecutionPolicy Bypass -File export_stl.ps1`
   does them all, ~minutes, and also writes `stl\v1\` and `mockup_assembly.stl`).
4. If print settings, mass or time change, update `PRINT_SETTINGS.md` (and
   `slice_all.ps1`'s per-part table).

## Adding or renaming a part: touch all of these

module in the .scad → dispatch line at the bottom → PART list in the .scad header →
`$parts` in `export_stl.ps1` → `$parts` table in `slice_all.ps1` → row in
`PRINT_SETTINGS.md` → PART list above. `node tools/check_parts.js` reports any it misses.

## Hard constraints (rules and physics; don't trade these away)

- **Rule 3a**: the craft must fit a 40 × 40 × 40 cm box *while floating*, skirt puffed out.
- **Finger safety**: cage/guard openings `GRID_OPEN` ≤ 7 mm (a 9.5 mm dowel must not reach the blades).
- RS-550 shaft is short: nothing goes between the motor and the cage hub. Motor screws M3 × 6 max (longer ones hit the windings).
- Horizontal printed holes come out 0.3–0.5 mm small. Use `M3_TAP_H` for a horizontal self-tap hole. The other `M3_*` sizes are for vertical holes. (This is what made the first build's seam screws so hard to drive.)
- Deck quarters print top face up with **no brim, no auto supports**: the guard grid is
  their first 3 mm on the bed (a brim webs it shut), and full-depth ribs, one-line
  half-ribs and a band ring carry the bridged skin (worst span ~24 mm). Nothing to snap
  out. Only nozzle v1 needs supports.
- STLs are pre-oriented: never tell anyone to rotate them in the slicer (moving them around on the bed is fine).
- Print `nickel_tray`, `tray_bar`, `aa4_mount` and `chart_plate` ×2.
- The skirt is a **cap** (shock cord in a taped hem, 48 × 47 cm sheet) that stretches over
  the deck's lip; no tape, no threading. Details: `ENGINEERING_CHECK.md` §9.1b.

## SCAD conventions (match the existing file)

- Every dimension is a commented top-level UPPER_CASE knob in its section. No magic numbers.
  Comments explain *why* (print behaviour, rule, failure seen), in plain sentences.
- Resolution comes from `$fa = 2; $fs = 0.5;`. Don't scatter `$fn`. Overlap cuts by `EPS` (0.02).
- 2D profiles are `*_2d()` modules and get extruded later. Deck geometry is built in installed
  coordinates (`*_installed`, `*_full`) and then split into quarters.
- The printed deck's edge is `deck_edge_2d()`, **not** `rrect([DECK_X, DECK_Y], ...)`: its
  sides bow out by `LIP_CROWN` (5 mm) so the skirt cap's hem cord presses on every side
  (a cord on a straight side presses on nothing). Anything that follows the edge uses it.
  Only the foam-board `deck_preview` stays a plain rectangle.
- Keep the header comment, build order and hardware list in sync when behaviour changes.
  The header is the user-facing manual.

## Git

Commit messages are short and lead with the part: `wear_pad: two layers`,
`Printed deck: engraved skirt tape line on the underside`. Commit the regenerated STLs
in the same commit as the geometry change.
