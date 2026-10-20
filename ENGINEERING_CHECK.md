# Hover Racer — engineering check

How the printed parts and the bought parts go together, every fastener, the
speed-plate fit, and the physics of lift, thrust and timing, worked through
with numbers.  Companion to `hovercraft_parts.scad` (all dimensions below are
that file's parameters) and the 2027 Hovercraft B rules.

Everything here was checked against the rules PDF and the component specs
on 2026-10-02.  Numbers marked **measure** depend on the exact parts that
arrive and must be confirmed with calipers before printing.

---

## 1. How it goes together

Deck top is z = 0.  +Y is the front.

### 1.1 The fan stack (centre of the deck)

Printed deck (the default): the duct and the bottom guard are **part of the
deck quarters** — fan, straight 136 mm duct, guard grid, bag, one monolithic
piece of plastic with no glued flange anywhere.  Only the cage bolts on.

```
            RS-550 motor can  (z 56 → 113)
   ──────── motor face sits on the cage HUB (z 56)
   ████     fan_cage hub, 6 mm thick, 44 mm dia (z 50 → 56)
   ╭─   ─╮  fan_cage bellmouth, R 12 flare from the bore (r 68) to r 80,
            2 mm shell, 45° underside (z 54 → 66)
   ═══════  fan_cage rings + rim, 4 mm thick (z 50 → 54), 164 mm dia
   ║     ║  integral duct, 136 mm bore, 2.4 mm wall (z −10.84 → 50), PART OF
   ║  ▬  ║    the quarters; propeller 127 mm, top at z 46, bottom at z 39
   ▓▓▓▓▓▓▓  deck skin (z 0 → −0.84), ribs below to −10.84
   ═══════  guard grid at the bottom of the duct, level with the skirt lip
            bottom (z −10.84 → −7.84; the bed when printing), no nubs; bag below
```

Foam-board deck instead: separate `fan_tube` (glued over a 130 mm hole,
z 0 → 50) and `fan_guard` (glued under it, nubs down) — the old stack.

| Joint (printed deck) | How | Count | Check |
|---|---|---|---|
| Duct quarter → duct quarter | a full-height vertical dovetail key (10 × 10 mm block, bed to z 48) on the shroud's outside at each seam; thin CA wicked in, a bead of gel CA down each seam inside the bore | 4 keys, no screws | the bare cage, bolted across all 6 lugs, holds the duct round while the glue sets |
| Guard | printed into the quarters; a 2.4 mm spoke lies along each half-axis, so each quarter carries a 1.2 mm half-bar and joined seams make full bars | – | worst assembled opening 6.5 + 0.2 misalignment = 6.7 ≤ 7 mm (probe rule) |

| Joint | How | Count | Check |
|---|---|---|---|
| Motor → cage hub | M3 × 6 socket-head from **below**, through the hub into the motor's own threaded holes (25 mm apart). Heads sit in 6.5 × 3 mm counterbores, flush with the hub underside. | 2 | 6 − 3 (plate under head) = **3 mm into the motor**. Mabuchi datasheet: max 4 mm, or the screw hits the windings. 6 mm, never longer. |
| Cage → tube | M3 × 10 down through the cage rim into an **M3 nut trapped in the top of each lug** (the cage covers the nut, so it cannot fall out) | 6 + 6 nuts | 10 − 4 (rim) − 2.6 (nut) = 3.4 mm spare in the lug's clearance hole. Steel threads: the cage comes off for every prop change without wearing anything; self-tapped PLA would strip after a few cycles. Lugs and cage holes are generated from `LUG_N`/`LUG_R`, so they cannot mis-align. |
| Tube → deck (FOAM ONLY) | Hot glue or silicone, all the way round the 14 mm wide flange ring (r 68 → 82) | – | Any gap here leaks bag pressure. Bead inside and out. The printed deck has no such joint. |
| Guard → deck underside (FOAM ONLY) | Hot glue round the 10 mm overlap ring (r 65 → 75) | – | Nubs face the skirt so the bag cannot seal flat against the grid. Printed deck: no nubs; its guard is printed in and the fan's flow blows the plastic off it. |
| Propeller → motor | Collet adapter on the 3.17 mm shaft, prop on its 5 mm stub. **Thrust pushes the adapter onto the shaft**, the safe direction. | – | **measure** shaft protrusion and `PROP_DROP` (§2). |

Build order (forced by geometry: the 127 mm prop will not pass the 136 mm
bore from below — the guard grid is under it — and the cage must be off to
reach the adapter):

1. Assemble the deck (§9.3): lower the quarters onto each other (the
   dovetails), cage on to hold the duct round, CA + bead + tape.  Then
   take the cage off.
2. Screw the motor to the cage hub (2 × M3 × 6).
3. Fit adapter and prop under the cage.
4. Lower the cage-motor-prop onto the duct, 6 × M3 × 10.
   (Foam deck: glue tube and guard on and let them cure before 4.)

### 1.2 Everything else

| Part | Mounts by | Load on the joint |
|---|---|---|
| nozzle | glued over the slot, 10 mm flange all round | bag pressure × slot area ≈ 240 Pa × 3000 mm² = **0.7 N** lifting it. Trivial, but the joint must be **airtight**. |
| speed card | drops into the guide on the nozzle's back wall; hangs from its T head (§3) | 0.4 N pressing it against the guide plate, which is what seals it |
| nickel trays, coin bin | hot glue or foam tape; walls 14 mm hold the rolls (rule 4g: no tape or glue on the nickels themselves) | 400 g per tray; the air cushion carries it from below |
| stick stand | glue the 46 × 36 base (32 wide neck at the edge); the arm hangs 20 mm past the deck edge | 10 g dowel. Cantilever moment ≈ 0 |
| dowel | 6.85 mm bore (prints ~6.6), 36 mm deep + M3 × 8 set screw from the back | any 1/4" dowel (6.0–6.35) drops in; the set screw pins it. A snug bore was a mistake: printed holes shrink and a true 6.35 dowel would not have fitted |
| switch | through the 12.8 mm hole in the bracket's 3 mm panel with its own M12 nut; bracket glued | – |
| battery holders | foam tape; rear corners (4×AA ×2), front-left (2×AA) | shuffle to balance (§5.5) |

**Fasteners to buy: 2 × M3×6, 6 × M3×10, 6 × M3 nuts, 1 × M3×8, 4 × 6.3 mm
spade crimps.**  The printed deck needs none: its quarters lock with
dovetails and glue.  Nothing else on the craft uses a screw.  (Flying
the HS390 instead: 2 × M2.5×5 in place of the 2 × M3×6, §8.6.)

---

## 2. Fan stack numbers

| Item | Value | Where it comes from |
|---|---|---|
| Motor face height | z = 56 | `TUBE_H` 50 + `HUB_T` 6 |
| Cage underside (rings) | z = 50 | `TUBE_H` |
| Prop hub top | z = 46 | face − `PROP_DROP` (10) |
| **Blade-to-cage clearance** | **4 mm** | `PROP_DROP` − `HUB_T` |
| Prop bottom | z = 39 | 7 mm hub |
| Prop to deck | 39 mm | |
| Prop tip to tube wall | 4.5 mm | (136 − 127)/2 |
| Prop over the deck hole | 1.5 mm inside the 130 mm hole | was 3.5 mm *outside* a 120 mm hole |
| Adapter back end | Ø12, inside the Ø14.5 hub bore | clears the counterbored heads (inner edge r = 9.25) |
| Screw heads | flush, inside counterbores | nothing hangs below z = 50 |

`PROP_DROP` is the one number that depends on the exact adapter.  Generic
collet adapters put the prop seat ~8 mm below the back face and the back face
~2 mm below the motor face (it sits on the boss) → 10 mm.  **Measure it**: put
the adapter and prop on the motor, measure motor face to the top of the prop
hub.  If it comes out 8, the clearance is 2 mm: either live with it (it is
still a guard-compliant, non-touching fit) or set `HUB_T = 5` and use M3 × 5.

Why no separate motor-mount plate: RS-550 shafts protrude only 7.5–12.5 mm.
Every millimetre of plate between the motor and the cage lifts the prop one
millimetre toward the cage.  The original design had 11 mm of plate and the
prop touching the cage.

---

## 3. Speed card (nozzle v2)

```
  side view, back of the nozzle          front view of a card
        roof ─────┐
   box  │         │ wall                    ┌──────────────┐  T head 74 × 6 × 8,
   240  │   ·     │┊│ card  ┃ guide plate   │     "12"     │  number cut in the top
   Pa   │   ·     │┊│  2 mm ┃ 2.4 mm        └──┬────────┬──┘
        │  exit   │┊│       ┃                  │        │  body 60 wide, 56.5 tall
        │  Ø46 ───┼┊┼─ hole ┃ Ø46              │   ◯    │  hole on the exit axis
        │         │┊│       ┃                  │        │
   floor└─────────┴─┴───────┸────             └────────┘  0.5 mm above the floor
                    0.5 mm clearance slot, open at the top
```

- The card hangs from its head on top of the guide.  The head is the datum,
  so every card sits at the same height and its hole is always inside the
  46 mm exit.  Height tolerance is irrelevant to the orifice area.
- Bag pressure pushes the card against the guide's outer plate with
  p × A_exit = 240 Pa × π × 23² mm² = **0.40 N**.  That contact, around the
  exit, is the seal.  It gets tighter the harder the fan works, and it does
  not depend on how the card was printed.
- The only leak path is the 0.5 mm slot clearance up to the mouth under the
  head: ~30 mm² if the head seals nothing, ~2–5 mm² with the head sitting flat
  on the guide top.  Either way it is the **same for every card**, so the
  calibration absorbs it.  Variation card to card is ±0.05 mm of thickness ≈
  ±3 mm², against ±8 mm² for the press fit, with no wear over time.  A strip
  of 2 mm foam under the head takes it to zero if you want.
- Nothing to tune.  The slot is deliberately loose (`CARD_CLEAR` 0.5): if a
  card does not drop in under its own weight, the slot is too tight, not the
  card too loose.
- The "0" card is a true zero for the drift test.
- Hole sizes round to 0.1 mm (`plate_hole`).  Whole-mm rounding was 7 % of
  the slow cards' area and merged 17 s with 17.5 s.
- Cards up to 42 mm fit the 46 mm exit, which covers a 6 s card for any
  magic number up to 252; §5.4 shows the real range is about 10–34 mm.  A
  card is ~10 g vs 18 g for a plate.

### 3.1 v1 vs v2, and how to decide between them

The printed v1 socket came out with a good fit, so both are in play.  Set
`NOZZLE_V` to pick; the export script writes the v1 set to `stl\v1\`.

| | v1 press-fit plate | v2 drop-in card |
|---|---|---|
| What makes the seal | the fit of a Ø50 boss in the seat | bag pressure pressing the card on the guide plate |
| Depends on the printer | yes: 0.1 mm changes the leak by ~16 mm² | no: the slot is 0.5 mm loose on purpose |
| Plate-to-plate variation | ±8 mm² of leak for ±0.05 mm of boss | ±3 mm² |
| Wear | PLA on PLA, loosens over a season | none, nothing rubs |
| Swap time, 8-minute window | push/pull, needs a firm grip | drop in, 2 s |
| Can it come out mid-run | if loose, yes (construction penalty) | no, gravity + pressure hold it |
| Supports to print | nozzle: yes, everywhere | none |
| Orifice weight | 18 g | 10 g |
| Printed so far | nozzle + plates, fit is good | nozzle rendered, not printed |

**Test to settle it** (same day, same battery state, nickels aboard):

1. Print the v2 nozzle, `plate_test` and `plate_zero` only (not the full
   set).  Glue nothing yet: tape the v2 nozzle over the slot for the test.
2. With each nozzle, run the 22 mm orifice 5 times over the 185 cm track
   and write down the times.  Then the 15 mm one 5 times.
3. Compare the **spread** (max − min) of each set, not the average.  The
   average is what calibration fixes; the spread is what loses points.  A
   spread of 0.3 s at TT = 12 is 1 point of Time Score; 1 s is 3.3 points.
4. Pull the orifice out and put it back between runs, so the test includes
   the thing that actually varies.
5. Drift test with both "0" orifices: the craft should sit still.  If one
   creeps backwards, that nozzle leaks.

Whichever has the smaller spread is the one to glue down.  If they tie,
v2's advantages are the ones that show up later (wear, a different print
batch, a cold gym), so tie goes to v2.

---

## 4. Guards and the rules

| Rule | Design | Margin |
|---|---|---|
| 3f-i: 3/8" (9.525 mm) dowel must not touch the prop | every opening is a 6.5 mm wide ring slot; hub vent windows 6.5 mm radial, under the motor can | a 9.5 mm rod cannot enter a 6.5 mm slot of any length |
| cage sits on the tube rim | no gap (both at z = 50) | – |
| underneath | guard covers the hole with 10 mm overlap; nozzle socket and skirt holes all lead to the guard, not the prop | – |
| 3a: 40 cm box, levitated | deck 330 × 320; skirt puffs ~30 mm per side, and the printed deck's lip ridge adds 1.6 mm a side → **393 × 383**; height 253 (dowel) | 7 / 17 mm. `SKIRT_OVER` is a guess: **measure** the floating craft |
| 3e: dowel within 3 cm of the front edge | the *skirt* is the front edge. Dowel axis 12 mm past the deck edge, skirt front 31.6 mm out (overhang + ridge) → **19.6 mm** behind the skirt front | ~10 mm |
| 3e: dowel top ≥ 20 cm above track; beams at 17 ± 2 | top at 24 cm above the deck, ~28 cm above the track; nothing else on the craft reaches 15 cm | ok |
| 3f-ii: ≤ 12.0 V by label | 10 × 1.2 V NiMH = 12.0 | zero. Never mix in a 1.5 V cell |
| 6a: 45 cm track | craft 393 wide, deck 330 | ~2.9 cm each side; the deck cannot reach the rails |
| 4g: nickels unrestrained | 14 mm tray walls, no tape | 4 rolls + ½ + 20 loose = **MS 20, the maximum** |

---

## 5. Physics

### 5.1 Mass budget

| Item | g | Basis |
|---|---|---|
| Deck, 33 × 32 cm, 5 mm foam board | 80 | ~750 g/m² |
| Skirt (3 mil bag) + duct tape | 35 | 70 g/m² + tape |
| RS-550 motor | 220 | listing |
| Prop + adapter | 15 | |
| 10 × Eneloop AA | 270 | 27 g each |
| 3 battery holders | 56 | |
| Switch, wire, connectors | 35 | |
| Printed parts on the craft | 330 | STL volumes × 1.24 g/cm³, ~90 % solid at these wall counts |
| Dowel | 10 | |
| **Craft, empty** | **1 050** | |
| Nickels, all of them | 1 000 | rule 5d |
| **Craft, loaded** | **2 050 g = 20.1 N** | |

With the printed deck (§9) instead of foam: +75 g of deck (three-layer
skin, sockets, skirt lip) and +12 g of dovetail keys (the 7 g of seam
bolts are gone), so **~1 145 g empty / ~2 145 g loaded as built**.  That costs about 4 % of lift margin: with
motor A on tired cells, the margin was already thin (§8.1), so do the
extra-weight test with the printed deck on.  Note `tools/motor_model.js`
uses `RACE_KG = 2.06` (the foam-deck figure), which understates the
printed-deck craft by ~80 g — the §8.1 margins are ~4 % optimistic for
this build.

The printed parts are a third of the empty craft.  The fan tube (~85 g) and
nozzle (~70 g) are the heavy ones; both are already at 2–2.4 mm walls.

### 5.2 What pressure the bag needs

The cushion carries the weight: p = W / A.

- Over the inflated bag footprint (0.39 × 0.38 m): **136 Pa**
- Over the deck only (0.33 × 0.32 m): **190 Pa**

The truth is between them.  The bag itself must run somewhat above cushion
pressure to stay inflated, so the fan has to deliver roughly **200–250 Pa**
while pushing the leakage flow.

### 5.3 What the fan can deliver

5030 propeller, Cₜ ≈ 0.10, Cₚ ≈ 0.045 (typical 5 × 3 data):

| | 17 000 rpm (fresh cells) | 15 000 rpm (tired cells) |
|---|---|---|
| Static thrust | 2.6 N (260 g) | 2.0 N |
| Shaft power | 41 W | 28 W |
| Tip speed | 113 m/s | 100 m/s |
| Disk loading (free air) | 202 Pa | 157 Pa |
| Est. stall pressure (~1.8 × disk loading) | 364 Pa | 283 Pa |
| Free-air flow | 0.115 m³/s | 0.101 m³/s |

Operating point with six ~Ø25 mm skirt holes (the workshop's "1-inch";
modelled as Ø24, well inside the ±30 %) plus a 22 mm nozzle hole (orifice
Cd 0.62; fan curve taken as a straight line from free flow to stall):

| | 17 000 rpm | 15 000 rpm |
|---|---|---|
| Flow | 0.038 m³/s | 0.034 m³/s |
| **Bag pressure** | **243 Pa** | **189 Pa** |
| Needed | 136–190 Pa | 136–190 Pa |

So it floats with good cells and is marginal with tired ones.  That is the
single most important number in the design and is why:

- the deck hole went to 13 cm (prop tips over foam were wasting ~10–15 %),
- the guards are 67 % open rings (1.6 mm rings, 2.4 mm spokes, top edges
  chamfered 0.4; loss through the cage ≈ 10 Pa, the old 45 % mesh was
  ≈ 25 Pa),
- the cage carries a bellmouth (R 12 ≈ 0.09 D) above the blades: a
  sharp-edged inlet separates at the rim and starves the blade tips, where
  most of the thrust is made,
- every printed part was slimmed,
- the workshop's advice "fresh batteries or take weight off" is right.  The
  cheapest weight to drop is the 20 loose nickels (2 points of 20).

The skirt holes set the balance: bigger holes → more flow, lower pressure
(craft sits lower, bounces less); smaller → higher pressure, less lift margin
used.  Step 2d of the workshop tunes this empirically, which is correct.

Electrical: the pack is ~0.35 Ω (10 cells + holder springs).  At 4.5 A that
drops 1.6 V, so the motor sees ~10.4 V.  The RS-550 is 22 000 rpm/12 V
no-load; loaded at 10.4 V it runs about 15–17 000 rpm, the two columns above.
Capacity 2000 mAh → ~27 min of running; a competition run is ~30 s.
Stall surge: the pack cannot push more than ~35 A, inside the 30 A switch's
short-time capability.

### 5.4 Thrust, timing and the "magic number"

The nozzle is an orifice fed by bag pressure.  Jet speed v = √(2p/ρ), mass
flow ρ·Cd·A·v, so thrust **F = 2·Cd·A·p**.  With m = 2.05 kg, s = 1.85 m
(rule 6d), from rest: t = √(2s/a), a = F/m.

At 243 Pa:

| Plate hole | Thrust | Accel | Run time | d × t |
|---|---|---|---|---|
| 10 mm | 0.024 N | 0.0115 m/s² | 17.9 s | 179 |
| 13 mm | 0.040 N | 0.0195 | 13.8 s | 179 |
| 22 mm | 0.114 N | 0.056 | 8.1 s | 179 |
| 30 mm | 0.213 N | 0.104 | 6.0 s | 179 |

Three things fall out of this:

1. **t ∝ 1/d** exactly, so the workshop's "hole = magic ÷ time" is the right
   law, and the magic number is a real constant of the craft (d × t).
2. **The magic number does not depend on mass.**  F ∝ p ∝ W/A_cushion and
   a = F/m, so the mass cancels: magic = √(4·s·A_cushion / (π·Cd·g)).
   Loaded or empty, the same plate gives the same time.  (It does depend on
   bag-to-cushion pressure ratio, which is why it must be calibrated, not
   computed: this estimate gives ~180–200, the workshop's example craft was
   242.)
3. **Range**: TT 6 s needs ~30–34 mm, TT 18 s needs ~10–11 mm.  All inside
   the 48 mm socket through-hole with room to spare.

Air drag is negligible: at the fastest run (avg 0.3 m/s) it is ~0.002 N
against 0.2 N of thrust.

### 5.5 The start-line rule (4i) and why the dowel hangs over the edge

At TT = 18 s the acceleration is 0.0114 m/s².  The craft starts with its
front edge (the skirt) on the start line, so the dowel must travel its own
setback before timing starts, and rule 4i gives it 3 s.

- Dowel 18 mm behind the skirt front (this design): crosses in **1.8 s**. ok
- Dowel 36 mm back (stand on the deck edge, original): 2.5 s. Marginal, and
  any skirt bulge beyond 30 mm would fail it.
- The finish must come within 2 × TT = 36 s: a complete run at 18 s is fine.

Balance: the craft only floats level if its centre of mass is near the
centre of the cushion.  Heavy items are symmetric left-right (trays at
±118, 4×AA holders at ±110).  Front-back: motor stack on centre, nozzle
(70 g) and two 4×AA holders (~270 g with cells) at the back, coin bin, 2×AA
and stand (~200 g) at the front.  The 2×AA holder is the movable trim weight;
the workshop's drift test (step 7) is the real check.

### 5.6 Structural sanity

| Load path | Load | Capacity | Verdict |
|---|---|---|---|
| Motor screws, tension | 2.6 N thrust pulls the motor up off the hub | 2 × M3 in steel ≫ | fine |
| Cage lug screws, tension | motor + cage (0.3 kg) + 2.6 N | 6 × ~100 N pull-out in PLA | fine |
| Cage rings, 1.6 × 4 mm | motor weight + vibration | the 8 spokes (still 2.4 × 4) carry it to the rim; the rings only tie the spokes | fine; 4 walls/40 % infill as the header says |
| Tube flange glue | bag pressure acts on the deck, not the tube | – | airtightness is the only requirement |
| Deck (5 mm foam) | 2 kg spread, cushion pushes back from below | – | fine; it is a pressure vessel lid, not a beam |
| Printed deck skin, 0.76 mm over 55 mm triangle cells | 240 Pa on one cell ≈ 0.3 N | ribs on every edge of every cell | fine; the cells are small enough that the skin barely bows (§9) |
| Printed deck seams | picking the craft up by one quarter | 7 × M3 through 2 × 1.6 mm ribs, plus the parts glued across the joints | fine; lift it by two opposite edges anyway |
| Stand arm (3 mm PLA cantilever, 20 mm) | 10 g dowel | – | fine; glue the base well because it also takes the wood-block push at launch (4l) |

---

## 6. What to measure and tune, in order

1. **Shaft and `PROP_DROP`** before printing the cage.  (§2)
2. **Print `plate_test`** (15/22/30 mm cards) and check they drop freely
   into the guide.  (§3)
3. **Float test** with full nickels: adjust skirt hole size (§5.3).  If it
   will not lift the full load with fresh cells, drop the 20 loose nickels
   first, then the half roll.
4. **Measure the floating craft** against the 40 cm box — with the full
   nickel load aboard and fresh cells, which is when the skirt puffs
   widest — and set `SKIRT_OVER` to the real overhang; re-open `assembly`
   and read the console.  While it floats, also measure the dowel axis to
   the skirt's front face: rule 3e allows 30 mm and the design predicts
   ~20 mm (§4), so confirm there is real margin.
5. **Calibrate** the magic number with the three test plates (step 8).  Then
   `plates` prints the set in one go.  For States/Nationals set
   `RACK_STEP = 0.5`.

## 7. Where this deviates from the workshop page, and why

| Workshop | This design | Reason |
|---|---|---|
| 36 × 34 cm deck | 33 × 32 | rule 3a measured while floating, skirt counts |
| 46 × 44 skirt | 43 × 42 | same (10 cm bigger than the deck) |
| 12 cm fan hole | 13 cm | prop is 12.7 cm |
| motor on a mount plate | motor bolted to the cage hub | shaft too short for a plate |
| stick "right at the front edge" (of the deck) | 12 mm past the deck edge | the skirt is the front edge |
| ~150 g of PLA | ~330 g on the craft, ~500 g with spares | measured from the STLs |
| whole-mm plate holes | 0.1 mm | slow-end resolution and 0.5 s targets |
| press-fit speed plates | drop-in cards in a guide | the seal is made by pressure, not by the fit; nothing to tune or wear |
| self-tapped cage screws | nuts trapped in the lugs | the cage comes off for every prop change |
| switch "through the deck" (implied) | on a printed bracket | foam cannot take an M12 panel nut |

---

## 8. Motors: three candidates and how to choose

All three are brushed motors on the same 5030 propeller and 10 × AA NiMH
pack, so all three are legal.  (Rule 3b allows up to two motors, brushed
**or brushless**, and permits integrated circuits that come built into a
commercial motor.  What it bans is a *separate* electronic speed
controller between the battery and the motor — and a hobby brushless
motor cannot run without one, which is why brushed motors are the
practical choice here, not because brushless is illegal.)

| | A: RS-550 22k (workshop) | B: RS-550 40k, 12 V | C: smaller original |
|---|---|---|---|
| Rated | 12 V, 22 000 rpm no-load | 12 V, 40 000 rpm no-load | **unknown: measure** (modelled as a typical RS-380 class, 12 V ~18 000 rpm) |
| Fits the printed cage hub | yes (35.8 mm can, 2 × M3 at 25 mm) | same RS-550 frame: **check** screw spacing and shaft length | **probably not**: smaller cans use different screw spacing (often M2.5). The hub is generated from `MOTOR_BOLTS`, `MOTOR_BOSS_D` and the screw size, so a matching cage is a parameter change once it is measured |

A fourth option, the **HS390** (a 390-size motor), has its own cage,
`fan_cage_hs390`: §8.6.

### 8.1 Predicted performance

From `node tools/motor_model.js` (motor + propeller + pack resistance
solved together).  Lift margin is how far the bag pressure exceeds what
the 2.06 kg loaded craft needs (136–190 Pa); "floats up to" is the total
craft mass it could still lift.  All numbers are ±30 %.

**Nominal batteries (12 V, holders in decent shape):**

| | A 22k | B 40k | C small (assumed) |
|---|---|---|---|
| Propeller speed | 16 000 rpm | 19 000 rpm | 12 400 rpm |
| Current | 5.0 A | **12.6 A** | 2.4 A |
| Voltage left at the motor | 10.3 V | **7.6 V** | 11.1 V |
| Bag pressure | 217 Pa | 303 Pa | 128 Pa |
| **Lift margin** | +14 … +59 % | **+59 … +123 %** | **−32 … −6 %** |
| Floats up to | 2.4–3.3 kg | 3.3–4.6 kg | 1.4–1.9 kg |
| Heat in batteries + holders | 9 W | **56 W** | 2 W |
| Fan-on time per charge | ~23 min | **~9 min** | ~47 min |
| Propeller tip speed | 107 m/s | 126 m/s | 82 m/s |

**Tired batteries (11 V, warm holder springs):** A drops to −11 … +24 %
(may not float the full load), B to +12 … +56 %, C to −45 … −23 %.

What that means:

- **A (workshop motor)** works, but its margin disappears as the cells
  tire.  Gentle on the batteries.
- **B (40k)** has by far the most lift and keeps floating on tired cells.
  You will not see 40 000 rpm: the motor wants more current than ten AA
  cells can give, so roughly half the battery's energy becomes heat in the
  cells and holder springs.  The batteries are its bottleneck.
- **C (smaller)**, if it really is an RS-380 class motor, is likely too weak
  to lift the full nickel load on a 5-inch propeller.  It might float the
  craft empty or with a partial load.  This is the least certain row:
  measure it before ruling it out.

The run time for a given speed card is inversely proportional to propeller
speed, so **a faster motor means smaller holes for the same target time**
(B: about 0.89× the hole sizes of A).  Each motor needs its own
calibration (workshop step 8).  For all three, a 2 % battery sag makes a
run ~0.2 s slower at TT 12; B drains the pack about 2.5× faster, so its
times creep more across a session.

### 8.2 The test day

Do all of this with one set of freshly charged cells per motor, the same
propeller, the same skirt and the full nickel load.  Write the numbers in
the table in §8.4.

**Tools:** a phone with a free audio spectrum app (Spectroid on Android,
"Spectrum Analyzer" on iPhone), a multimeter, a kitchen scale, a timer,
and ~1 kg of extra weight in 100 g bags (coins or rice in zip bags).

1. **Fit check (motor off).**  Does it bolt to the cage hub?  Measure the
   screw spacing, can diameter and how far the shaft sticks out past the
   face.  Fit adapter and prop; measure motor face to the top of the prop
   hub (`PROP_DROP`).  Spin it by hand: nothing may touch the cage.
2. **Propeller speed (fan on, craft floating).**  Hold the phone 30 cm
   from the fan.  The spectrum shows a tall peak at the **blade-pass
   frequency**; for a 2-blade prop, **rpm = peak Hz × 30**.  (633 Hz →
   19 000 rpm.)  Then run `node tools/motor_model.js --rpm <your rpm>` to
   turn it into bag pressure and lift margin.
3. **Voltage at the motor (fan on).**  Multimeter across the motor's two
   terminals.  Compare with the pack voltage with the fan off.  A big gap
   (more than ~3 V) means high current and hot holders.
4. **Extra-weight test (the real lift margin).**  With the full nickel
   load aboard, add 100 g bags spread evenly until the craft no longer
   rises when you push it down gently (the rule 3c check).  Lift margin =
   (heaviest load that still floats ÷ race load) − 1.  Repeat after
   5 minutes of fan-on time to see the tired-battery margin.
5. **Heat check.**  After one minute of fan-on, touch the battery holders,
   the wires and the motor can.  Holders you cannot hold a finger on for
   5 seconds are wasting power: bridge the springs with wire or use better
   holders.  A motor too hot to touch after a minute is overloaded.
6. **Repeatability.**  Five runs with the 22 mm test orifice, reseating it
   between runs.  Record each time; the **spread** (max − min) is what
   costs Time Score.
7. **Drift over a session.**  Keep going with the same cells: 10 more runs
   at one-minute intervals.  Plot time against run number.  A steady creep
   is battery sag; a motor with less creep is easier to race.
8. **Endurance.**  Total fan-on minutes until the craft no longer floats
   the full load.  Must comfortably exceed a competition (2 runs plus
   setup, ~3 minutes of fan time).

### 8.3 How to choose

Rank the motors in this order; the first test that separates them decides:

1. **Floats the full load on cells that have done 5 minutes** (test 4,
   repeated).  A motor that fails this loses 20 points of Mass Score or
   doesn't run at all.  Want at least +20 % margin on tired cells.
2. **Smallest run-time spread** (test 6).  1 s of spread at TT 12 is
   ~3.3 points of Time Score.
3. **Least drift over 10 runs** (test 7).
4. **Holders and motor stay touchable** (test 5).

If B wins on lift but its holders cook, fix the holders rather than
dropping the motor: lift margin is worth more than battery efficiency.

### 8.4 Results sheet

| Test | A 22k | B 40k | C small |
|---|---|---|---|
| Rated V / no-load rpm (label) | 12 V / 22 000 | 12 V / 40 000 | |
| Fits hub? screw spacing / shaft length | | | |
| `PROP_DROP` (mm) | | | |
| Prop rpm, fresh cells (Hz × 30) | | | |
| Pack V off / motor V on | | | |
| Heaviest load that floats, fresh (kg) | | | |
| … after 5 min fan-on (kg) | | | |
| Holders after 1 min (ok / hot) | | | |
| 5 runs, 22 mm orifice: times | | | |
| Spread (s) | | | |
| Drift over 10 runs (s) | | | |
| Fan-on minutes until it won't float | | | |
| **Pick** | | | |

### 8.5 Batteries go with the motor

- Buy enough cells for **two full sets of 10**.  Calibrate and race on a
  freshly charged set; use the other for testing.
- With B, use 18-gauge wire if you can, keep wires short, and check the
  holders for heat (§8.2 test 5).
- Never mix cell types or add a 1.5 V cell: the 12.0 V limit is by label,
  and 10 × 1.2 V is exactly 12.0.
- Propeller safety scales with speed: do the workshop's one-minute spin
  test with each motor, wear glasses, and keep everyone out of the plane
  of the propeller on first power-up.

### 8.6 HS390: its own cage (`fan_cage_hs390`, PART 2b)

The HS390 (390 size: 12 V, 22 000 rpm no-load, Ø28 × ~38 mm can, 2.3 mm
shaft, ~101 g) cannot use the RS-550 cage: its can covers the hub's two M3
holes (25 mm apart), and a plate under it would lift the propeller into the
cage (§2).  So it gets its own cage: the same grid, rim and lug holes, so it
drops onto the same fan_tube with the same 6 × M3 × 10, and only the hub
differs.  Its face sits on the hub at z = 56, exactly where the RS-550's
does, so the propeller clearance is still `PROP_DROP − HUB_T`.

| Hub feature | RS-550 cage | HS390 cage |
|---|---|---|
| Motor screws | 2 × M3 × 6, 25 mm apart | 2 × **M2.5 × 5**, **16 mm** apart |
| Counterbore | 6.5 × 3 mm, 3 mm under the head | 5 × 3.5 mm, 2.5 mm under the head, so 2.5 mm into the motor |
| Boss bore | 14.5 mm | 11.5 mm (the counterbores open into it slightly; the heads still sit fully on the plate) |
| Vent windows | ±16°, out to r 15.75 | ±12°, out to r 13, under the Ø28 can |

The hole pattern is the Mabuchi RS-385 datasheet's (two M2.6 × 0.45 tapped
holes on 16 mm centres).  HS390 listings don't give it.  **Measure before
printing:** screw spacing (`HS_BOLTS`), thread (M2.5 screws run in M2.6
holes, same 0.45 pitch; buy M2.6 × 5 if you can), boss diameter
(`HS_BOSS_D`; it must drop into the bore), and how far the shaft sticks out.
Listings give 6 to 11 mm for the shaft.

**Buy:** 2 × M2.5 × 5 (or M2.6 × 5) socket head, and a **2.3 mm** collet
propeller adapter (the MECCANIXITY one is 3.17 mm; 2.3 mm adapters are sold
for 380-size motors).  With it fitted, measure `PROP_DROP` again.

**Predicted performance** (`node tools/motor_model.js`, row D, with the
craft 119 g lighter at 1.94 kg; R is a guess for a 390-size motor, so ±30 %
like the rest):

| Battery | Prop rpm | Current | Bag Pa | Lift margin |
|---|---|---|---|---|
| fresh | 14 300 | 3.6 A | 173 | −4 … +35 % |
| nominal | 13 200 | 3.1 A | 147 | **−18 … +14 %** |
| tired | 12 000 | 2.6 A | 121 | −32 … −6 % |

That puts it **between motors A and C**.  It is easy on the batteries
(~37 min of fan per charge), but it probably won't float the full nickel
load on tired cells.  Run the §8.2 fit check and extra-weight test (test 4)
before racing on it: if it floats the full load after 5 minutes of fan-on
with margin to spare, it is a fair pick.  Its speed cards need their own
calibration (holes ~1.2× A's for the same time).

### 8.7 Blower instead of the propeller (`bdeck_*` + `blower_box`)

**The fan:** Delta BFB1212GH (also sold as BFB1212GH-6A21R): a 120 × 120 ×
32 mm centrifugal blower, 12 V, 3.96 A max, 4 wires (reseller pinout:
yellow +12 V, black −, blue PWM, the fourth is the tach, unused).  Delta's
curve for it is close to a straight line from **1020 Pa shut-off** to
**60.4 CFM (28.5 L/s) free air**.  A propeller is the opposite kind of fan:
lots of flow, little pressure.  Its integrated driver IC is part of a
commercial fan, so rule 3b allows it like the RS-550's brushes.

**Layout:** label side down, inlet up, centred 17 mm ahead of the deck
centre, outlet facing the back.  `blower_box` is a roof with the ring grid
over the inlet, 6.5 mm above the blower (`BLW_GAP`, open all round, so it
is a guard opening: ≤ 7 mm), and a hood round the outlet that turns the air
down through a 115 × 27 mm port in the deck.  The port has bars along y,
6.5 mm apart, on the bed.  Five M4 × 50 screws: three through the box's
standoffs and the blower's own holes, two through the hood's tubes.  They
self-tap 8.5 mm (blower) and 7 mm (hood) into Ø10 columns in the deck.
The `assembly` BLOWER line checks these numbers, plus the 5.9 mm from the
hood groove to the nozzle pocket.  The hood frame seals on the outlet face
with 3 mm foam tape; a sill on the deck closes the window's bottom edge,
because a bar there on `blower_box` would be a 115 mm bridge.

**Operating point:** solve the fan line against the skirt holes (Ø24 each)
plus the 22 mm card, Cd 0.62.  Use the §8.5 batteries (13 / 12 / 11 V open
circuit through 0.25 / 0.35 / 0.50 Ω), with pressure ∝ V² and flow ∝ V:

| Skirt holes | 0 | 1 | **2** | 3 | 4 | 6 |
|---|---|---|---|---|---|---|
| fresh (12.2 V at the fan, 3.4 A): Pa | 745 | 504 | **349** | 250 | 184 | 109 |
| nominal (11.0 V, 2.8 A): Pa | 613 | 415 | **288** | 206 | 152 | 90 |
| tired (9.9 V, 2.2 A): Pa | 493 | 333 | **231** | 165 | 122 | 72 |
| flow, nominal (L/s) | 7.5 | 13.6 | **17.4** | 19.9 | 21.6 | 23.5 |

The RS-550 deck gives 169–268 Pa at ~34–38 L/s.  With six holes the blower
falls below the 136–190 Pa this craft needs (§8.1).  **Cut two holes**
(three only if it floats on tired cells with three).  The bag pressure is
then higher than the RS-550's, but the cushion flow is half of it, so the
hover gap is lower: expect it to need a smooth floor, and run the §8.2
float test before trusting it.  The battery draw is lower (2–3.4 A), and
the box stands 41.5 mm above the deck, against ~113 mm to the top of the
RS-550 on its cage.

**PWM:** on Delta's 4-wire fans an open PWM input normally means full
speed.  **Check it on the bench** before the deck goes on: power it with
blue open and listen.  If it idles slow, it needs a PWM signal (25 kHz, 5 V
logic).  Do not tie blue to +12 V: the PWM input is not rated for it.

**Fit risks (from a photo and listings, not a drawing):** the holes are
Ø4.3 on a 105 mm square at the three corners away from the outlet, and
are assumed to run through the full 32 mm.  If the hole-less corner is at
the back LEFT (label side down, outlet at the back), set `BLW_HAND = -1`.
If the holes are only in thin ears, the standoffs need lengthening.  If
the outlet is narrower than ~86 mm, it still fits: the window is 115 mm
and the foam seals on the face.

Sources: DigiKey BFB1212GH-A listing; Delta BFB1212H manual (ManualsLib);
the BFB1212GH-6A21R reseller listings (IndiaMART, Amazon); delta-fan.com.

---

## 9. Printed deck (optional, PART 11)

Four printed quarters replace the 5 mm foam board.  Same outline
(330 × 320 mm), same fan hole, so every other part and every rule check is
unchanged.  What it buys: **every printed part presses into a pocket in the
deck, and the fan duct and the bottom guard are part of the quarters
themselves** (§1.1) — the two glue flanges that leaked on the first build
no longer exist.  What it costs: more plastic than foam (three-layer skin,
10 mm ribs, the duct wall, the dovetail keys) and four taller prints.  No
screws: the quarters lock together with vertical dovetails.

| Piece | Where | Print size (mm) | Sliced g |
|---|---|---|---|
| `deck_fit_test` | – | 200 × 115 × 61 | 37 |
| `deck_fl` | front left | 170 × 172 × 61 | 76.4 |
| `deck_fr` | front right | 170 × 165 × 61 | 78.6 |
| `deck_bl` | back left | 170 × 165 × 61 | 76.7 |
| `deck_br` | back right | 170 × 172 × 61 | 75.1 |

Each quarter fits the P1S bed (256 × 256) and prints **top face up, as
installed**: the skirt lip's ridge is the first layer (a built-in adhesion
foot), the ribs run full depth to the bed, the quarter-duct rises 50 mm
up, and the skin is **bridged** across the rib cells 10 mm above the bed.
Print height 60.84 mm.  The guard grid is the bottom 3 mm of the duct,
on the bed, so it prints first and needs no support (§1.1); slicer
auto-support stays OFF and brim stays OFF — both are mandatory, a brim
would web the grid openings shut.  Nothing to snap out.

### 9.1 The sockets

The fan tube and fan guard no longer have pockets — they are part of the
quarters (§1.1).  The remaining pockets are recesses in the top surface.
The deck prints top face up, so every pocket floor is skin: **bridged**
10 mm above the bed across the rib cells, like the rest of the skin, with
the pocket walls and rims printed upward from it.

| Part | Pocket | Notes |
|---|---|---|
| nozzle | its 128 × 64 flange outline, 1.5 deep, down to the slot; the flange (2.4 mm) sits 0.9 proud | a 1.35 mm **lip** stands round the slot, 0.3 inside the nozzle's own slot edge.  The deck slot is 96.7 × 26.7 mm (2 580 mm², still 1.5× the 46 mm exit); the speed cards are calibrated with it in place, so nothing changes |
| nickel trays (2) | 53 × 91, 1.5 deep | six **pegs** (Ø 11.2, flush with the deck top) stand up through the trays' 12 mm floor holes |
| coin bin | 53 × 55, 1.5 deep | |
| stick stand | 46 × 32 plate + a 32 wide neck out through the front edge, 1.5 deep | the deck keeps a 4 × 7 mm **shoulder** each side of the neck: the stand's wide plate stops on it, so the stand cannot slide forward off the deck (it used to be held by glue alone) |
| switch bracket | 34 × 33 with the panel's square corners, 1.5 deep | |

- **Fit — the direction flipped.**  The pocket walls used to be first-layer
  features, squeezed tight by elephant's foot; now they are top-surface
  features and come out at or slightly **over** size.  If a part rattles in
  its coupon, tune `SOCK_FIT` **down** (expect ~0.1); never pre-tighten
  without the coupon.  Same for `DECK_TAB_CLR` (expect ~0.15).  The
  dovetails (`DT_CLR`, 0.05 per side after two fit tests) are cut the same way through every
  layer; tune them on the duct-seam coupon pair.
- **Rim**: 2.4 mm of solid at deck-top height round every pocket.
- **Floors are 3 layers (0.84 mm) — and so is the whole skin now.**  Every
  skin layer starts with a bridge layer, which has gaps between its lines;
  two more layers over the bridge close it.  Hold every quarter up to a
  bright light before assembly; any patch that glows through gets a strip
  of packing tape on the underside, inside the bag, where it costs nothing.
- **Airtightness**: the duct needs no sealing at all — it is the same piece
  of plastic as the deck.  The nozzle pocket still locates a separate part,
  and a press fit is not a seal: run a bead of hot glue or silicone round
  the inside of the pocket before pressing the nozzle in.
- The two outer side-joint keys (x = ±118) run up through the tray
  pockets, between the pegs: the dovetail outline shows in the pocket
  floor and the tray covers it.
- What a pocket pad adds is only its rim and pegs; the old fan ring
  (+15 g) is gone with the part it held.

### 9.1b The skirt lip

The skirt is a **cap**: shock cord runs in a taped hem round the edge of
the plastic, like a shower cap or a bowl cover, and the cap snaps over a
lip on the deck.  Round the underside of the edge
runs a 10 mm wall, 1.35 mm (3 lines) thick, with a 1.6 mm ridge along its
bottom edge pointing outward, like a bucket rim turned down.  The hem cord
sits above the ridge and clamps the plastic to the wall all the way round,
which both holds it and seals it.  **Putting a skirt on is: stretch it over
the lip.  Taking it off: peel one corner over the ridge.**  Ten seconds,
no tape, no cord to thread.  The wear pad and the six holes live on the
cap, so a spare skirt is made complete at home and swapped whole.

**Why the deck's sides are bowed (`LIP_CROWN` = 5 mm).**  A tensioned cord
only presses where it curves: pressure = tension ÷ radius.  On a straight
side the radius is infinite and the cord presses on **nothing**, so only
the 1.6 mm ridge would keep it on.  The inflated bag pulls the hem outward
at about 7 N/m (below), and a hand-tight cord (~20 N) across a 33 cm
straight side would bow out about as far as the ridge is tall.  That is
marginal.  So the printed deck's sides are parabolas: each side's middle is on
the 330 × 320 line and its ends (the corners) are 5 mm in.  The cord then
presses 8·T·c/L² ≈ 8 × 20 × 0.005 / 0.33² ≈ **7 N/m** on every side,
about the bag's whole pull before any friction, and the ridge is the second
line of defence.  Rule 3a is unchanged (the middles set the size).  The
band, rib zone and lip all follow the bowed edge, and every pocket and
mark still clears it (checked: only the stick stand, which overhangs the
front middle by design, reaches past the lip).  The deck loses ~4 % of
its area at the corners.

```
   deck edge, section            (printed as installed, the ridge is the
   ─────────────┐  skin           FIRST layer: a built-in adhesion foot
                │ 10 mm wall      all round the part.  The chamfer above
     plastic ──►│                 it recedes inward at 45°: no overhang,
     cord ────► ◯│                no support)
              ▄▄▄┘ ridge 1.6 out    ← plastic wraps under here
```

- **Cord**: 1/8" or 3/16" shock cord ("bungee cord by the foot" at any
  hardware store), 5 ft, with a cord lock from the same shelf.
  The lip height and ridge are sized so the 3/16" fits with the plastic.
- **Plastic**: cut it **48 × 47 cm**: the 43 × 42 skirt (10 cm bigger
  than the deck each way, as before, plus the wrap over the lip) and a
  2 cm hem (`SKIRT_HEM`) each side.  Cut a 2 × 2 cm square out of each
  corner so the hems fold flat.
- **Making the cap (once, ~15 min)**: lay the sheet flat, lay the cord
  along one edge, fold 2 cm of plastic over it and tape the flap down its
  whole length with packing tape (a ruler along the fold keeps it
  straight).  Keep the channel loose: the cord must slide in it, because
  that is what gathers the corners.  Do all four sides; the cord crosses
  each corner notch bare.  Bring both ends out at **one corner**, through
  the cord lock (the corners have the most room inside the rule 3a box),
  and knot the tails.  Write FRONT on the hem.
- **First fit**: cap on with the cord slack, pull the cord lock until the
  hem is hand-tight against the wall, and leave it there.  From then on the
  cap just stretches on and off, and the lock stays put.
- **Tension**: the bag's pull on the skirt is small (p × depth ≈ 240 Pa ×
  0.03 m ≈ 7 N per metre of edge), and the bowed sides turn a hand-tight
  cord into an equal clamp everywhere (above).  A strip of tape over the
  hem on race day is belt and braces.  (The old engraved
  tape groove is gone: a 0.28 relief on a bridged underside would print as
  mush, and the lip + cord is the attachment now.)
- **Stiffness**: the lip turns the 40 mm edge band into an L-section.
  Before it, the band was the floppiest part of the deck.
- **The lip is cut at each quarter seam** and the cord spans the gaps.
  Rule 3a: the ridge adds 1.6 mm each side, so the craft with skirt is
  393.2 × 383.2 (the assembly echo includes it).
- Mass: ~21 g.

### 9.1a Thin-spot audit (0.20 first layer, then 0.28)

The slicer prints a layer where the model is solid at the layer's middle,
so a feature's real thickness is a whole number of layers.  With the deck
printed as installed, the skin sits 10 mm up and every one of its layers
is bridged; the thin features, checked on that grid:

| Feature | Model | Printed | Note |
|---|---|---|---|
| main skin | 0.84 | **3 layers** | all bridged across the rib cells; the first is a bridge layer with gaps, the next two close it.  Light-test every quarter |
| edge band | 0.84 | 3 | a rib ring at mid-band (`DECK_BAND_RING`, 20 mm in) splits the 40 mm band into two ~19 mm bridges (thick bridges ON) |
| under the battery-holder marks | 0.84 − 0.28 + a strip | 3 | the mark takes the top layer; a strip under each mark puts one back |
| skirt lip wall | 1.35 wide | 3 lines | 10 mm tall; the 1.6 × 1.2 ridge is the first layer on the bed |
| pocket floors (all) | 0.84 | **3** | same bridged skin |
| duct wall | 2.4 | 5 lines | 3 wall loops: slices as solid perimeters, airtight by construction |
| guard grid rings | 1.6 wide × 3 thick, top edges chamfered 0.4 | 4 lines / 11 layers | the first layers, on the bed; spokes stay 2.4 |
| guard half-bars at the seams | 1.2 per quarter | 3 lines | joined pairs make 2.4 bars; worst assembled opening 6.7 ≤ 7 mm (probe rule) |
| rims, lips, slot lip | 2.34 tall; 2.4 / 1.35 wide | 9 | 5 / 3 lines wide |
| tray pegs | Ø11.2 × 1.5 | 6 | on the top surface |
| grid ribs | 0.9 wide × 10 tall | 2 lines | a 0.6 mm foot, 0.4 wider each side, anchors them to the bed |
| half-ribs | 0.45 wide × 10 tall | **1 line** | along X through the middle of every cell, cutting the skin's worst bridge from ~46 to ~24 mm; same foot (1.25 wide).  Scaffolding for the skin, not structure: a sagged or broken one costs nothing once the skin is on |
| seam ribs | 1.6 wide × 10 tall | 3 lines (arachne) | same foot |
| dovetail sockets | 1.8 mm walls round the tail | 4 lines | 10 × 10 blocks, bed up; the tail neck is 4 mm |
| jigsaw tabs | 0.84 | 3 | in the band |

Nothing on the deck is thinner than three layers.  The only one-line
walls are the half-ribs, which only have to hold the skin up while it
bridges.

### 9.2 How it is built

```
  section through a joint (deck as installed — and as printed)

   skin 0.84 (3 bridged layers)  band 0.84 (3 layers), 40 mm wide, one rib ring
  ════════════════╤╤══════════════════════════  ← jigsaw tab locks the skin
       ┃     ┃    ││    ┃     ┃                    across the joint
       ┃grid ┃    ││    ┃     ┃  grid ribs 0.9 × 10, 55 mm triangles,
       ┃     ┃    ││    ┃     ┃  down to the bed plane
                  ││  seam ribs 1.6 × 10, back to back, glued

  plan view of a dovetail key (every layer, skin included, is the same)

          quarter A  │  quarter B
        ┌────────────┼────────────┐
        │        ╲▔▔▔│            │   10 × 10 block straddling the joint;
        │  tail ► ▏  │            │   A's tail (4 neck, 6 tip, 3 deep)
        │        ╱▁▁▁│            │   sits in B's socket, 0.2 clear all
        └────────────┼────────────┘   round.  Goes together only by
                     │                lowering A straight down onto B.
```

- **Skin**: 0.84 mm (3 × 0.28, all bridged).  A 40 mm band round the edge
  is outside the grid (the jigsaw tabs are in it); one rib ring at mid-band
  halves its bridge.
- **Ribs**: 0.9 × 10 mm triangle grid (two 0.45 lines), closed by a rim
  round every edge of the rib zone, each rib on a 0.6 mm bed foot.  The
  grid now runs all the way in to the bore edge (r = 68), inside the duct
  wall, which itself runs down to the guard on the bed.  One-line
  half-ribs along X split every cell (worst bridge ~24 mm).  No ribs
  round the nozzle slot.
- **Deck joints — no screws.**  The first deck's seam screws sat under
  the deck between the ribs, where a driver could barely reach them, and
  the horizontal holes printed small.  They are gone.  Every joint is now
  held by **vertical dovetail keys** (`DT_*`): a solid 10 × 10 mm block
  straddling the joint, with a tail on one quarter and its socket on the
  other, cut straight through the block **and the skin**.  Because every
  layer has the same outline, a quarter goes on only one way — **lowered
  straight down** onto its neighbour — and once in, the joint cannot pull
  apart sideways.  Nothing to reach underneath, no ribs in the way, no
  hardware.  Eight keys: two per half-joint.  The inner four sit right on
  the duct (centre r = 73) and run from the bed to z = 48, so they hold
  the duct seams too; the outer four (y = 100, y = −91, x = ±118) are deck
  depth.  Owners alternate, so every quarter has both tails and sockets.
  The 1.6 × 10 mm seam ribs still run along each inner edge and sit back
  to back; they are glued.  Jigsaw tabs in the skin (0.05 mm clearance)
  keep the edge band in line out past the trays; a knob is wider than its
  neck, so like the dovetails it only enters straight down.  The centre
  joint has no free band (stand pocket at the front, nozzle pocket at the
  back), so it has no tab; those two pockets lock it instead.
- **Assembly order is free**: lower front-right onto front-left, back-right
  onto back-left, then the front pair onto the back pair.  All joints
  slide vertically, so the last quarter can always go in.
- **Strength**: a PLA tail with a 4 mm neck, 10 mm tall (deck keys), takes
  a few hundred newtons in tension before it shears; the duct keys are 59
  mm tall.  The glue does the sealing and stops the keys working loose;
  the keys carry the load.  Picking the craft up by one quarter is fine.
- **Duct joints**: each quarter carries a quarter of the duct, so the duct
  has four vertical seams, each held by its duct key.  The bolted **fan
  cage spans all four quarter-tops** and holds the duct round while the
  glue sets.  A bead of gel CA down each duct seam inside the bore
  finishes the seal.
- **Splices**: the pockets that straddle the joints (nozzle, stand, both
  trays) lock them further once everything is in.
- The parts-in-pockets fit was checked by intersecting the deck with every
  part seated in its pocket: empty.

### 9.3 Build order

1. **Print `deck_fit_test`** (~1 h).  Press a tray and the nozzle into
   their coupons, take the two duct-seam halves and
   **lower one onto the other**: the dovetail should slide all the way
   down by hand with no wobble (too tight: `DT_CLR` **up** 0.05; wobbly:
   **down** 0.05).  Try an M3 nut in the lug trap, fit the tab pair.  The pocket fits run **loose**, not tight:
   tune `SOCK_FIT` / `DECK_TAB_CLR` **down** until parts go in with a firm
   push and stay.  Reprint the coupons, not the quarters.
2. **Print** the four quarters (top face up, no brim, no auto support —
   both mandatory).  Nothing to snap out: the guard grid printed on the
   bed.  Hold each quarter up to a bright light: no pinholes in the skin,
   pocket floors included.
3. **Dry-fit — no glue yet.**  On a flat table, top side up: hold
   front-left still and **lower front-right straight down** onto it until
   the skins are flush.  Same for the back pair.  Then lower the front
   half onto the back half.  No tools, nothing underneath to reach.  If a
   key binds, do not force it: a light scrape of the tail's sides with a
   knife fixes one key; if they all bind, raise `DT_CLR`.  Then **bolt the
   bare fan cage across all four duct tops** (6 × M3 × 10 into the lug nut
   traps): it holds the duct round and the four duct edges flush.
4. **Glue, in place.**  With the deck assembled and the cage on, wick
   **thin CA** into every dovetail and down every seam from the top: it
   runs into the 0.05 mm gaps by itself.  Run a **bead of gel CA down each
   of the four duct seams inside the bore** and smooth it flat.  Press the
   deck flat on the table while it cures, then take the cage off again (it
   goes back on last).
5. **Tape every deck joint underneath** with clear packing tape.  The
   underside is the lid of the air cushion: a leak here is lift lost.
   (The duct and guard need no tape — they are the same plastic as the
   deck.)
6. **Skirt on**: make the cap once (48 × 47 cm plastic, cord taped into a
   2 cm hem, §9.1b).  Deck upside down: hook the hem over the ridge along
   the back edge, FRONT mark forward, then stretch it round the two
   back corners, down both sides and over the front corners.  First time
   only: pull the cord lock hand-tight.  Run a finger round the wall; the
   hem should sit above the ridge everywhere.
7. **Wear pad and skirt holes — do not skip this.**  Still upside down,
   skirt on: tape the 14 cm wear pad to the centre of the bag's outside
   face (chamfered edge toward the track), packing tape over its face
   onto the plastic.  Then cut the **six ~Ø25 mm skirt holes** in the bag
   in a ring just outside the pad — hole centres ~10 cm from the bag's
   centre, evenly spaced, and never under the pad.  These holes are where
   the cushion air escapes under the craft: **a bag with no holes inflates
   but lifts nothing** (§5.3), which is exactly what a first build that
   skips this step does.
8. Flip it.  **Bead of glue in the nozzle pocket, press the nozzle in.**
   Trays, bin, stand and bracket just press in; a dot of glue on each if
   you want them permanent.  Motor into the cage, prop on, cage back on
   its six lugs.

### 9.4 Checks

| Check | How | If it fails |
|---|---|---|
| Parts fit | the coupons, before the quarters | `SOCK_FIT` / `DECK_TAB_CLR` **down** in 0.05 steps; dovetail too tight → `DT_CLR` **up** 0.05, wobbly → **down** 0.05 |
| Skin airtight | hold each quarter up to a bright light before assembly: no pinholes (the whole skin is bridged now, not just pocket floors) | tape the spot underneath, inside the bag |
| Duct seams airtight | after gluing: shine a light inside the bore, look for glow through the four seams | another CA bead inside the bore |
| Deck joints airtight | float the craft and run a damp finger along the seams; the fan note changes if a joint is open | more tape underneath |
| Probe rule | a 7 mm dowel must not pass any guard opening, probing the assembled deck from below — worst case is a half-bar pair at a seam (6.7 mm with 0.2 misalignment) | check before gluing: lift the quarter, re-lower it with the cage on; after gluing, a strip of tape across the gap underneath |
| Startup inflation | craft on the track, fan on: the bag must inflate and the craft lift within ~2 s.  The guard has no nubs (the fan's flow blows the plastic off it), so watch that the plastic does not suck flat onto the grid | check the six skirt holes exist; if the plastic seals on the grid, add four hot-glue dots (~4 mm) on the grid's underside as standoffs |
| Flat | the assembled deck lies flat on a table with no rocking | check during the dry fit; glue with the deck pressed flat on the table |
| Size | 330 × 320 mm assembled; 393.2 × 383.2 with the skirt ridge | rule 3a margin is there, ±1 mm is irrelevant |
