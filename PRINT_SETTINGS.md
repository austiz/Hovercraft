# Print settings

PLA, 0.4 mm nozzle, 0.2 mm layers for everything.  Every STL is already
oriented the way it prints: import it, do not rotate it.  All sizes are
millimetres at 1:1; nothing needs scaling.

Weights are solid volume × 1.24 g/cm³, so real prints come out 5–20 % lighter
depending on infill.  Times are rough, for a typical 0.4 mm / 0.2 mm profile
at normal speeds; a fast printer halves them.

| Part | Qty | Walls | Infill | Supports | Sits on the bed | Size (mm) | ~g | ~time | Notes |
|---|---|---|---|---|---|---|---|---|---|
| fan_tube | **0** (foam deck only) | 3 | 15 % | none | flange | 164 × 164 × 50 | 85 | 4 h | **Only for the foam-board deck** — the printed deck quarters have the duct built in. Brim 3–5 mm: a big flat ring likes to lift at the edge. The nut pockets on the lug tops must come out clean; check a nut drops in before assembly. |
| fan_cage | 1 | **4** | **40 %** | none | flat, hub up | 164 × 164 × 16 | 60.5 | 1½ h | Carries the motor and is the safety guard. The bellmouth ring on top needs no support (45° underside, open to the outside); the six holes through it are driver access to the lug screws. Counterbores are on the bed side; the 3.3 mm hole above each is a short bridge, fine. Brim helps here too. |
| fan_cage_hs390 | 1 | **4** | **40 %** | none | flat, hub up | 164 × 164 × 16 | 60.7 | 1½ h | **Only if you fly the HS390** (ENGINEERING_CHECK §8.6): the same cage with its hub drilled for 2 × M2.5 at 16 mm. Measure your motor's screw spacing first and set `HS_BOLTS`. |
| fan_guard | **0** (foam deck only) | 3 | 15 % | none | flat, nubs up | 150 × 150 × 7 | 28 | 1½ h | **Only for the foam-board deck** — the printed deck quarters have the guard grid built in. |
| nozzle (v2, card guide) `stl\nozzle.stl` | 1 | 3 | 15 % | none | flange | 128 × 64 × 64 | 65 | 3½ h | The 46 mm exit has a 45° roof so it prints without supports. The card guide channel is open at the top. |
| plates = cards (v2) `stl\plates.stl` | 1 batch | 3 | **100 %** | none | lying flat, head up | 154 × 200 × 8 | 60 | 2½ h | **Same settings and orientation for every card, always.** Consistency between cards is what makes the speed calibration repeatable. Needs a 220 mm bed; on a 180 mm bed set `PLATE_BATCH` to 4 cards (2 × 2). |
| plate_test (v2) | 1 | 3 | 100 % | none | flat | 154 × 132 × 8 | 33 | 1½ h | Print first and check all three drop freely into the guide. |
| plate_zero (v2) | 1 | 3 | 100 % | none | flat | 74 × 63 × 8 | 12 | ½ h | The no-hole card for the drift test. |
| plate_rack (v2) | 1 | 2 | 15 % | none | flat | 133 × 77 × 20 | 70 | 3 h | Not on the craft; goes to impound with the cards. Fins are 1.6 mm (4 lines). |
| rack_aux | 1 | 2 | 15 % | none | flat | 41 × 77 × 20 | 20 | 1 h | Four-slot sibling rack for the zero card and the 15/22/30 mm test cards, labels matching the card heads. Impound box. |
| chart_plate | **2** | 3 | **100 %** | none | flat, text up | 86 × 174 × 2.4 | 45 each | 1½ h each | The calibration chart as an engraved tablet: rule 2a says papers must be impounded to be used, and paper gets lost or soggy. One rides the impound box, one is the backup. The magic numbers are **engraved, not written in**: after measuring a surface's magic (workshop step 8), edit `CHART_MAGICS` (and bump `CHART_REV`) in the SCAD and reprint both tablets before impound — pencil on PLA smears off, and rule 2a bars adding notes after impound. |
| **v1 set, press-fit** `stl\v1\` | | | | | | | | | The alternative being compared on the track. |
| nozzle (v1) | 1 | 3 | 15 % | **everywhere** (or painted on the socket bore and box roof) | flange | 128 × 64 × 64 | 65 | 4 h | The roof of the 50 mm seat is the sealing surface and sits above solid floor, so "touching build plate" supports never reach it. |
| plates (v1) | 1 batch | 3 | **100 %** | none | flange down | 192 × 158 × 6 | 60 | 2½ h | Same settings for every plate: the boss diameter is the seal. |
| plate_test / plate_zero / plate_rack (v1) | 1 each | 3 / 3 / 2 | 100 / 100 / 15 % | none | flange down / flat | 192 × 76 × 6, 60 × 76 × 6, 122 × 77 × 26 | 33 / 13 / 70 | | All three plates should push in with the same firm feel. |
| rack_aux (v1) | 1 | 2 | 15 % | none | flat | 39 × 77 × 26 | 20 | 1 h | Only if the v1 card set wins the comparison: the v2 aux rack's 3.2 mm slots cannot take the 6 mm v1 plates. |
| nickel_tray | **2** | 3 | 15 % | none | flat | 53 × 91 × 16 | 22 | 1 h each | Now with snap-dimple recesses in the outer walls for the tray_bar. |
| tray_bar | **3** (2 + spare) | 3 | 15 % | none | **on its side** (as exported) | 57 × 25 × 10 | 3 each | 15 min each | Snap bridge over each tray's rolls: a 22.5 mm roll pivots out over the 14 mm wall at ~9.5° of tilt; the bar caps the rise at ~3 mm (rule 4j: anything off the craft is ×0.8, and fallen nickels stop scoring). Layers run through the snap legs — do not re-orient. |
| coin_bin | 1 | 3 | 15 % | none | flat | 53 × 56 × 16 | 16 | ¾ h | Loose-nickel slot shortened to 41 mm (20 coins + play), four Ø10 floor bores, snap dimples for the lid. |
| bin_lid | **2** (1 + spare) | 3 | 15 % | none | plate down, legs up (as exported) | 59 × 55 × 26 | 7 each | ½ h each | Windowed snap lid over both bin slots: no window passes a nickel, the supervisor counts cargo through them or pops the lid in two seconds. |
| stick_stand | 1 | 3 | 20 % | none | base | 46 × 56 × 38 | 12 (sliced) | 25 min | The base narrows to a 32 mm neck where it crosses the deck edge; the pocket's shoulders stop it sliding forward. The set-screw hole is a horizontal 2.9 mm hole (prints ~2.6, a normal M3 tap fit); run an M3 screw through it once to clear it. |
| switch_bracket | 1 | 3 | 15 % | none | base | 34 × 33 × 36 | 9 | ¾ h | The 12.8 mm panel hole is horizontal; a little sag at the top is fine, the switch nut clamps it. |
| aa4_mount | **2** | 3 | 15 % | none | flange | 76 × 66 × 18.3 | 4 each (sliced) | ½ h each | Glue-on snap frame per 4×AA holder — holders were foam-taped before, a ×0.8 shake-off risk. The +Y snap arms are sideways cantilevers (flex in-plane, the tray_bar rule) freed by a slit with a 1.2 mm bridge roof — leave bridging on. **Elephant-foot compensation on**: the arm walls are three 0.45 lines thick and start at the bed. **Print ONE first** and press the real *rewired* holder in (pack surgery changes the end geometry); tune `BATT_FIT`/`BATT_HOOK` like `SOCK_FIT`, then print the second. The 1 mm foam strip goes *inside* the frame, under the holder — the hooks assume it: they close at holder height + 0.8, so without foam the holder rattles. |
| aa2_tray | 1 | 3 | 15 % | none | flange | 70 × 78 × 17.6 | 6 (sliced) | ¾ h | Slide tray for the 2×AA trim weight: ±12.5 mm of travel in 5 mm stations, numbered 1–6 from each end (raised digits). The station grid is laid out so every facing fence pair spans 36 mm — the spring fence seats 1 mm compressed at every trim position. Elephant-foot comp on. |
| aa2_fences | 1 (pair) | 3 | 15 % | none | standing (as exported) | 61 × 17 × 14 | 2 | 15 min | Rigid fence sets the station, bow-leaf spring fence preloads the holder. Printed standing: the leaf flexes in-plane, never across layers. |
| wire_clips | 1 (six) | 2 | 15 % | none | flange | 92 × 10 × 9 | 2 | 15 min | C-saddles for the twin 18 AWG runs, 2–3 per run, glued. The 3 mm mouth is under the 3.5 mm wire: each wire clicks in and cannot bounce out. A flapping wire is a ×0.8 "fell off" and prop bait. |
| wear_pad | **4** (1 + spares) | 2 | 15 % (all skin) | none | flat, chamfer down | 140 × 140 × 0.5 | 9 each (sliced) | 17 min each | The foot on the outside of the bag. Two layers, like a milk jug; the chamfered edge goes toward the track. Pads abrade fast on plywood/rough tracks (the MI/PA states lesson) — spares ride the impound box. |
| templates | 1 | 2 | 15 % | none | flat | 144 × 194 × 2 | 12 | ¾ h | Optional. Trace the inside edges. |

| **Printed deck** (optional, replaces the foam board; ENGINEERING_CHECK §9) | | | | | | | | | |
| deck_fit_test | 1 | 3 | 15 % | **none** (modeled risers) | top face UP (as exported) | 200 × 115 × 61 | 37 (sliced) | 1 h 7 | **Print this first.** Pocket coupons (press a nickel tray and the nozzle in; drop the stick stand into its corner and push it forward — the shoulder must stop it), the two halves of a jigsaw tab (push them together flat on the table: `DECK_TAB_CLR`), the skirt lip on the stand coupon, both halves of an **outer dovetail key** (deck depth only — lower one onto the other), and **both halves of the duct seam** — **lower one half straight down onto the other** (the dovetail key: it should slide down by hand with no wobble; tight → raise `DT_CLR` 0.05, wobbly → lower it), and drop an M3 nut in the lug. The flip moved every fit from the tight first layer to the loose top surface, so fits run LOOSE now: if a part rattles, **lower** `SOCK_FIT` by 0.05 (expect ~0.1) and reprint; if it will not go in, raise it. Each coupon stands on a throwaway 0.84 plate + 1.2 mm riser walls — snap them off. Then print the quarters. |
| deck_fl, deck_fr, deck_bl, deck_br | 1 each | **3** | 15 % (none is used) | **NONE — auto support must stay OFF** | **top face UP, as installed** (as exported) | 170 × 172 × 61 (fl, br) / 170 × 165 × 61 (fr, bl) | 75–79 each (fl 76.4 / fr 78.6 / bl 76.7 / br 75.1 sliced) | 1 h 46 – 1 h 52 each (P1S, 0.28) | The fan duct and bottom guard are **built in**: the quarter prints as installed, duct rising 50 mm, the skirt lip's ridge on the bed as the adhesion foot, ribs full-depth to the bed. **0.20 mm first layer**, elephant's-foot comp on (0.15) — the lip ridge, rib feet and the guard grid (its first 3 mm, on the bed under the duct) are the first layers. **3 walls**: the 2.4 mm duct wall slices as solid perimeters. **No brim — mandatory**: it would web the guard grid openings shut. **Thick bridges on**: the whole skin is now a bridged surface over the rib cells (3 × 0.28; a one-line half-rib through every cell and a rib ring at mid-band keep the worst span ≈ 24 mm), as are the pocket floors. Nothing to snap out. After printing, hold the quarter up to a light — tape any pinhole on the underside. Probe the grid with a pencil (~7 mm): nothing may reach through (rule: 3/8" dowel must not reach the prop). Pockets and tabs are top-surface features now and run **loose**: tune `SOCK_FIT` / `DECK_TAB_CLR` DOWN on the fit test, never up. **No screws**: the quarters lock with 8 vertical dovetail keys (10 × 10 blocks across the joints) — lower each quarter straight down onto its neighbour, then wick thin CA in. |
| **Blower deck** (instead of the propeller deck: Delta BFB1212GH; ENGINEERING_CHECK §8.7) | | | | | | | | | |
| bdeck_fl, bdeck_fr, bdeck_bl, bdeck_br | 1 each | **3** | 15 % | **NONE — auto support OFF** | **top face UP, as installed** (as exported) | 170 × 172 × 10.8 (fl) / 170 × 165 × 10.8 (fr) / 170 × 165 × 13.3 (bl) / 170 × 172 × 13.3 (br) | 56–57 each (fl 56.9 / fr 57.2 / bl 56.6 / br 56.2 sliced) | 1 h 22 – 1 h 27 each (P1S, 0.28) | Same slicer settings as the deck quarters (no brim — the port's guard bars are on the bed; thick bridges on; 0.20 first layer). Every pocket, key and the lip are the same; the duct and round guard are replaced by a guarded 115 × 27 mm port, grooves for blower_box's walls, a 2.5 mm sill (the back quarters' extra height) and five Ø10 screw columns with M4 pilots. Same fit test (`deck_fit_test`) applies. |
| blower_box | 1 | 3 | 15 % | none | **roof down** (as exported) | 139 × 159 × 43 | 56.8 (sliced) | 1 h 20 | The blower's lid: roof grid over its inlet (on the bed), standoffs on its three holes, and the hood round its outlet. Everything rises straight off the roof, no bridges. **No brim**: the roof grid is on the bed. Stick 3 mm foam tape on the frame face that meets the blower's outlet side. 5 × M4 × 50 hold blower and box to the deck. |

**Do not print** `mockup_assembly.stl`: it is the whole craft as one view-only
model.

## Totals

- On the craft (printed deck): four quarters with the duct and guard built
  in, cage, nozzle, 2 trays + bars, bin + lid, stand, bracket, battery
  mounts and clips, one card.  Foam-board craft instead: fan_tube and
  fan_guard are separate glued-on parts (≈ 348 g printed).
- Whole set with 13 cards, test cards, both racks, two chart plates, spares
  and templates ≈ **600 g**, so budget most of a 1 kg spool.
- Printed deck, if you use it: four quarters ≈ **306 g** (deck_fr slices
  at 78.6 g / 1 h 53; duct, guard and dovetail keys included — the
  separate 85 g tube and 28 g guard are not printed at all), ~7¼ h in all
  on the P1S, plus the 1 h / 37 g fit test.  No
  breakaway support: every gram flies.  Hardware: **no
  screws** in the deck (dovetail keys), thin CA for the dovetails and
  seams plus gel CA for the duct seams inside the bore, 5 ft of 1/8" or
  3/16" shock cord with a cord lock for the skirt, and packing tape.
  Every other part presses into it.
- Blower deck instead: four bdeck quarters ≈ **227 g** + blower_box
  57 g ≈ **284 g**, ~7 h in all, against ≈ 366 g for the prop deck and
  cage.  Add the blower itself (weigh it) and 5 × M4 × 50; drop the
  RS-550, prop and cage hardware.
- Bed: everything fits 220 × 220 except the deck quarters (170 × 172 ×
  61 mm: fine on the P1S's 256).  The 164 mm fan parts need at least 180.

## Settings that matter and why

- **Cards at 100 % infill, identical settings**: the card hole is the
  orifice that sets run time.  Infill does not change the hole, but
  consistency of thickness and hole edge does; the calibration (workshop
  step 8) absorbs anything that is the same for every card.
- **Cage at 4 walls / 40 %**: a 220 g motor shaking at 17 000 rpm sits on
  the 44 mm hub, and the whole disc is the top safety guard.
- **Deck quarters at 3 walls, no brim, no auto support**: the 2.4 mm duct
  wall is exactly solid perimeters at 3 walls; a brim would web the guard
  grid shut (it is the first layers, on the bed); auto support would fill
  the duct and the rib cells, which the ribs and half-ribs already carry.
- **No supports anywhere** (nozzle v2 was designed around that; the old
  nozzle_v1 needed supports everywhere, which is one of the reasons it was
  replaced).
- **Brim** on the two 164 mm discs if your bed adhesion is marginal.  Remove
  it cleanly from the tube flange: it is the glue face.
- Slicer "elephant's foot" compensation on: the card slot, the nut pockets
  and the counterbores are all first-layer features.

## Which parts to reprint if you printed the first batch

| Printed before | Now | Reprint? |
|---|---|---|
| nozzle, plates, plate_rack (press-fit, v1) | v2 card guide is the default; v1 still exported to `stl\v1\` | keep them: they are the v1 side of the comparison. Print the v2 nozzle, `plate_test` and `plate_zero` to compare; print the full v2 card set only if v2 wins |
| fan_tube (self-tapped lugs) | nut traps in the lugs | optional: the old one works until the PLA threads wear; the new one survives unlimited cage removals |
| stick_stand (6.5 mm bore) | 6.85 mm bore | only if your dowel does not fit |
| switch_bracket (12.4 hole) | 12.8 hole, teardrop roof | only if the switch does not fit; a round file fixes the old one |
| deck quarters (3.4 mm seam holes) | no seam screws at all: vertical dovetail keys; stick_stand set screw 2.6 → 2.9 | a glued-up first-batch deck: no, drill its seam holes 3.5 mm (9/64") if a screw binds. New quarters: yes, the dovetails need all four from the new file. Run an M3 through the stand's hole once |
| deck quarters + separate fan_tube/fan_guard | duct and guard **built into** the quarters, printed as installed | **yes, if you want the integrated base**: all four quarters (a glued-up first-batch deck keeps working with its glued-on tube and guard — the old parts stay in the file for it) |
| fan_cage | hub windows narrowed; lug bolt circle re-phased 15° off the deck seams (tube and duct match) | recommended (see ENGINEERING_CHECK §1).  **Mandatory with the integrated deck**: a first-batch cage's bolt holes sit at the old 0° angles and miss the new lugs |
| fan_guard | 150 mm for the 13 cm hole | foam deck: with the 13 cm hole, yes.  Printed deck: not printed at all |
| nickel_tray ×2, coin_bin | snap dimples for the retainers; bin slot shortened to 41 mm + floor bores | **yes** (~3 h total): the first-batch parts have no dimple recesses, so the bars and lid have nothing to click into. Footprints unchanged — they drop into the same deck pockets |
| deck quarters | — | **still no**: every new part glues on or snaps on; nothing pierces or re-pockets the deck |
| everything else | unchanged | no |
