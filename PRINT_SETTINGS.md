# Print settings

PLA, 0.4 mm nozzle, 0.2 mm layers for everything.  Every STL is already
oriented the way it prints: import it, do not rotate it.  All sizes are
millimetres at 1:1; nothing needs scaling.

Weights are solid volume × 1.24 g/cm³, so real prints come out 5–20 % lighter
depending on infill.  Times are rough, for a typical 0.4 mm / 0.2 mm profile
at normal speeds; a fast printer halves them.

| Part | Qty | Walls | Infill | Supports | Sits on the bed | Size (mm) | ~g | ~time | Notes |
|---|---|---|---|---|---|---|---|---|---|
| fan_tube | 1 | 3 | 15 % | none | flange | 164 × 164 × 50 | 85 | 4 h | Brim 3–5 mm: a big flat ring likes to lift at the edge. The nut pockets on the lug tops must come out clean; check a nut drops in before assembly. |
| fan_cage | 1 | **4** | **40 %** | none | flat, hub up | 164 × 164 × 6 | 55 | 2½ h | Carries the motor and is the safety guard. Counterbores are on the bed side; the 3.3 mm hole above each is a short bridge, fine. Brim helps here too. |
| fan_guard | 1 | 3 | 15 % | none | flat, nubs up | 150 × 150 × 7 | 28 | 1½ h | |
| nozzle (v2, card guide) `stl\nozzle.stl` | 1 | 3 | 15 % | none | flange | 128 × 64 × 64 | 65 | 3½ h | The 46 mm exit has a 45° roof so it prints without supports. The card guide channel is open at the top. |
| plates = cards (v2) `stl\plates.stl` | 1 batch | 3 | **100 %** | none | lying flat, head up | 154 × 200 × 8 | 60 | 2½ h | **Same settings and orientation for every card, always.** Consistency between cards is what makes the speed calibration repeatable. Needs a 220 mm bed; on a 180 mm bed set `PLATE_BATCH` to 4 cards (2 × 2). |
| plate_test (v2) | 1 | 3 | 100 % | none | flat | 154 × 132 × 8 | 33 | 1½ h | Print first and check all three drop freely into the guide. |
| plate_zero (v2) | 1 | 3 | 100 % | none | flat | 74 × 63 × 8 | 12 | ½ h | The no-hole card for the drift test. |
| plate_rack (v2) | 1 | 2 | 15 % | none | flat | 133 × 77 × 20 | 70 | 3 h | Not on the craft; goes to impound with the cards. Fins are 1.6 mm (4 lines). |
| **v1 set, press-fit** `stl\v1\` | | | | | | | | | The alternative being compared on the track. |
| nozzle (v1) | 1 | 3 | 15 % | **everywhere** (or painted on the socket bore and box roof) | flange | 128 × 64 × 64 | 65 | 4 h | The roof of the 50 mm seat is the sealing surface and sits above solid floor, so "touching build plate" supports never reach it. |
| plates (v1) | 1 batch | 3 | **100 %** | none | flange down | 192 × 158 × 6 | 60 | 2½ h | Same settings for every plate: the boss diameter is the seal. |
| plate_test / plate_zero / plate_rack (v1) | 1 each | 3 / 3 / 2 | 100 / 100 / 15 % | none | flange down / flat | 192 × 76 × 6, 60 × 76 × 6, 122 × 77 × 26 | 33 / 13 / 70 | | All three plates should push in with the same firm feel. |
| nickel_tray | **2** | 3 | 15 % | none | flat | 53 × 91 × 16 | 22 | 1 h each | |
| coin_bin | 1 | 3 | 15 % | none | flat | 53 × 56 × 16 | 16 | ¾ h | |
| stick_stand | 1 | 3 | 20 % | none | base | 46 × 56 × 38 | 16 | 1 h | The set-screw hole is a horizontal 2.6 mm hole; run an M3 screw through it once to clear it. |
| switch_bracket | 1 | 3 | 15 % | none | base | 34 × 33 × 36 | 9 | ¾ h | The 12.8 mm panel hole is horizontal; a little sag at the top is fine, the switch nut clamps it. |
| hs390_sleeve | 1 | **4** | **40 %** | none | bottom (as exported) | 50 × 50 × 26 | 12 | ½ h | **Only for the HS390 motor** (ENGINEERING_CHECK §8.6). The inside is a 45° cone, so no supports. The nut pocket is horizontal with a corner on top: check an M3 nut drops in. Measure the can first and set `HS_CAN_D`. |
| templates | 1 | 2 | 15 % | none | flat | 144 × 194 × 2 | 12 | ¾ h | Optional. Trace the inside edges. |

**Do not print** `mockup_assembly.stl`: it is the whole craft as one view-only
model.

## Totals

- On the craft: tube, cage, guard, nozzle, 2 trays, bin, stand, bracket, one
  card ≈ **330 g** printed.
- Whole set with 13 cards, test cards, rack and templates ≈ **500 g**, so
  budget most of a 1 kg spool.
- Bed: everything fits 220 × 220.  The 164 mm fan parts need at least 180.

## Settings that matter and why

- **Cards at 100 % infill, identical settings**: the card hole is the
  orifice that sets run time.  Infill does not change the hole, but
  consistency of thickness and hole edge does; the calibration (workshop
  step 8) absorbs anything that is the same for every card.
- **Cage at 4 walls / 40 %**: a 220 g motor shaking at 17 000 rpm sits on
  the 44 mm hub, and the whole disc is the top safety guard.
- **Tube at 3 walls / 15 %**: it is already ~85 g, the heaviest part; it is
  a shroud, not structural.  Nothing to gain from more plastic, and every
  gram off the craft is lift margin.
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
| switch_bracket (12.4 hole) | 12.8 hole | only if the switch does not fit; a round file fixes the old one |
| fan_cage | hub windows narrowed | recommended (see ENGINEERING_CHECK §1) |
| fan_guard | 150 mm for the 13 cm hole | with the 13 cm hole, yes |
| everything else | unchanged | no |
