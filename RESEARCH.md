# Hovercraft B — how this event is won

What the scoring actually rewards, how past seasons were won, where the cheap
points are, and the details that have to be bulletproof.  Companion to
`ENGINEERING_CHECK.md` (the physics and the rule-compliance engineering) and
the 2027 rules PDF.  Researched 2026-10-06; sources in §7.

---

## 1. Where the points are (2027 scoring)

Final Score = **best of two runs**; Run Score = DS + TS + MS, max **40 + 40 + 20 = 100**.

| Component | Formula | How to get it |
|---|---|---|
| Distance Score | complete run = **40** flat; incomplete = 40 × (185 − cm short)/185 | cross the finish within 2 × TT, never stall 3 s |
| Time Score | **40 × (1 − \|t − TT\|/TT)**, floor 0; incomplete run = 0 | calibration + repeatability |
| Mass Score | **4R + 0.1N**, max 20 | carry nickels; they only have to *stay on* |

- **A complete run with every nickel aboard is ≥ 60 points before the time
  even matters.**  All the nickels = 4 rolls (16) + half roll (2) + 20 loose
  (2) = exactly 20.  That is ~1 kg of payload and zero precision required.
- Time error costs **40/TT points per second**: 6.7 pts/s at TT 6, 3.3 at
  TT 12, 2.2 at TT 18.  Short target times punish spread hardest.
- **The ramp caps the score at 60** (DS × 0.5, MS = 0).  It is salvage for a
  craft that cannot start on flat, nothing more.
- An incomplete run prorates DS and MS by distance: dying 5 cm short with
  full nickels is still ~58 points.  A craft that *almost* finishes while
  loaded beats many teams' complete runs — load the nickels even if unsure.
- Multipliers on DS, TS and MS: **missed impound × 0.7** (= −30 on a perfect
  run); **each construction violation × 0.8** (anything falling off — a part,
  a roll, one nickel — is one violation per run, and fallen nickels also stop
  counting toward MS); **each competition violation × 0.9**.  Failing any 3f
  safety parameter that can't be fixed on the spot = participation points
  only.
- Tie-breaker #1 is **best TS over all runs** — both runs must be seriously
  timed, even after a good run 1.

## 2. How it was won in the past

### 2017–2019 (old rules: craft mass scored, written exam ≈ 45 of 100)

- Winners were separated by the exam and by **simply completing runs** — a
  large fraction of the field failed to levitate, stalled mid-track, or never
  passed inspection.  The build bar was low; reliability medaled.
- The 2017 nationals winner pulsed the thrust motor with a timer circuit and
  finished 0.2 s off target.  (ICs are banned under current rules; a
  relay-RC pulser would still be legal — but this craft's calibrated-orifice
  thrust makes it unnecessary.)
- The transferable lesson: every strong team kept a **calibration chart**
  (configuration → run time, built from dozens of logged runs) and treated
  competition as a lookup, not an experiment.

### 2026 (return season; build-only, no exam; same DS/TS/MS structure)

- Div B nationals podium: **1st Ladue MS, 2nd BASIS Cedar Park, 3rd Solon MS**.
- scioly wiki's field notes: most teams buy the same fans and batteries, so
  **skirts and testing volume separate the field**.  Top Div C teams (LASA,
  Troy, Boca Raton) run wall skirts; the bag skirt is the stable, forgiving
  choice (optionally with a flat low-friction sheet on the bottom).
- **At the Michigan and Pennsylvania states, plywood tracks wiped out teams
  that had only tested on smooth floors.**  Rule 6c explicitly blesses rough
  bases ("the point of a hovercraft is to traverse uneven terrain").  Teams
  that tested on multiple surfaces kept their calibration; teams that
  calibrated on a kitchen counter did not.
- 2026 official clarifications (soinc.org): slightly lifting the vehicle to
  help the skirt inflate is allowed if it then levitates unaided; spare
  batteries may be impounded; and rule 3c permits contact with the **inside
  edge** of the rails — rail-riding is legal (top/outside contact is not).

## 3. Easy points, ranked by effort

1. **Show up compliant** — impound on time with batteries stored separately
   (×0.7 otherwise), pass all of 3f: guard spacing, labeled commercial
   batteries ≤ 12.0 V by label, no lithium/lead, accessible mechanical
   switch.  Binary gates worth everything.
2. **Complete one run — 40 pts.**  Levitate, move, don't stall 3 s, finish
   inside 2 × TT.  Reliability before precision.
3. **Carry every nickel — 20 pts.**  Pure lift margin, zero precision.  The
   cheapest 20 points in the event, and many teams can't take them.
4. **Time — up to 40.**  Within 10 % of TT ≈ 36 pts.  After that it is a
   repeatability game: 0.3 s of spread at TT 12 ≈ 1 pt (see §3.1 of the
   engineering check).
5. **Tactics — run 2 recalibration.**  d × t is a constant of the craft, so
   run 1 doubles as a calibration run on the real track:
   **d₂ = d₁ × t₁ / TT**.  Pick the nearest card and run 2 lands on target.

## 4. Bulletproof checklist

Rule gates — verify with calipers and a mock inspection (cross-ref
`ENGINEERING_CHECK.md` §4):

- [ ] No 3/8" (9.525 mm) opening reaches any propeller, **including from
  underneath** (this craft: 6.5 mm ring slots everywhere).
- [ ] Battery labels original and visible; 10 × 1.2 V NiMH = 12.0 V exactly;
  never mix in a 1.5 V cell.
- [ ] Dowel ≥ 1/4", within 3.0 cm of the **inflated skirt's** front edge, top
  ≥ 20 cm above the track — and the *only* thing on the craft taller than
  ~15 cm, because photogate beams sit at 17 ± 2 cm and the dowel must break
  them first.
- [ ] 40.0 cm cube measured **levitated, skirt inflated**.
- [ ] Dowel crosses the start line within 3 s of launch (tight at TT 18;
  this design's 18 mm setback crosses in ~1.8 s).
- [ ] No tape or adhesive on nickels (rule 4g); walls plus the printed
  snap-on retainers (`tray_bar` ×2, `bin_lid`) instead — rigid retainers
  are legal, tape is not.  A dropped nickel is a double hit: ×0.8 on the
  whole run *and* its mass stops counting.
- [ ] **Calibration charts and notes must be impounded to be used** (rule
  2a — nothing brought in after impound).  This build prints the chart:
  two engraved `chart_plate` tablets, one column per surface — after
  measuring each surface's magic, update `CHART_MAGICS` in the SCAD and
  reprint both tablets before impound (the cells are engraved; pencil on
  PLA does not survive handling).  Calculators and tools are exempt.

Race-day robustness, learned from past failures:

- [ ] Calibrate on more than one surface, **including plywood or something
  rough** — keep a magic number per surface on the chart.  Measure the track
  and dry-sweep it before running (both allowed).
- [ ] Fresh cells per run; ~2 % of battery sag ≈ 0.2 s at TT 12.  Log drift
  across a session (§8.2 test 7).
- [ ] Drift test with the "0" card before runs — no creep means level and no
  leaks.
- [ ] Spares in impound (spare parts are allowed) — the impound box packs,
  in one zip bag: propeller + adapter, full card set in `plate_rack`, zero
  and test cards in `rack_aux`, both `chart_plate` tablets, second charged
  battery set (cells stored separately per rule 2a), a complete spare
  skirt cap (hem cord, wear pad and six holes done: it swaps in ten
  seconds), 3 spare `wear_pad`s, spare `tray_bar` and `bin_lid`,
  M3 × 8 screws + nuts, glue, tape.
- [ ] Category B eye protection, plus spares — no glasses, no run.

## 5. Competition-day playbook (the 8 minutes)

1. Measure and dry-sweep the track.  Note the surface; pick the matching
   magic number from the chart.
2. Drift test with the "0" card.
3. **Run 1 — the banker**: full nickels, the chart's card for the announced
   TT.  Worst case it still banks DS 40 + MS 20.
4. Compute **d₂ = d₁ × t₁ / TT** from run 1's actual time; drop in the
   nearest card (2 s swap with the v2 nozzle).
5. **Run 2 — the timed one.**  Still full nickels, still seriously timed
   (tie-breaker #1 is best TS over all runs).

- If lift is marginal on the day: shed the 20 loose nickels first (−2 pts),
  then the half roll (−2).  Never risk the complete run for mass.
- Never choose the ramp (score cap 60) unless the craft cannot start on flat
  at all.

## 6. What this means for this build

- **Full-load lift margin is the gating number** (§5.3, §8.1): it alone
  decides the 20 Mass points and whether the run completes.  Motor B (40k)
  if its holders pass the heat test, else A; run the §8.2 test-day protocol
  before committing.
- **Repeatability (spread, not average) is the Time Score budget** — the
  v1-vs-v2 nozzle spread test (§3.1) decides the orifice system; the average
  is whatever calibration makes it.
- Add a **rough-surface calibration session** (plywood/OSB) to the §6 tune
  list; the MI/PA story is the strongest field evidence found.
- Already aligned with what wins: single motor, bag-pressure thrust through
  calibrated drop-in cards (no field tuning, nothing to fiddle under time
  pressure), trapped-nut cage for fast prop swaps, skirt lip + shock cord
  for a one-minute skirt swap, 0.5 mm card steps for States/Nationals.

## 7. Sources

- 2027 Div B rules (`Science_Olympiad_Div_B_Rules_2027_Hovercraft (1).pdf`
  in this repo).
- scioly.org wiki, "Hovercraft" — 2026-season revision, retrieved
  2026-10-06 via the Wayback Machine (the live page is bot-gated):
  <https://scioly.org/wiki/index.php/Hovercraft>.  Source for the 2026
  podium, skirt taxonomy, fan/battery lore and the MI/PA plywood accounts.
- soinc.org Hovercraft Div B clarifications (titles/snippets; full answers
  are login-gated): inflation lift assist, spare batteries at impound,
  rail-start question.  <https://www.soinc.org/hovercraft-div-b>
- 2017 nationals competitor write-up:
  <https://matthewtran.dev/2017/05/hovercraft-2017/>
- 2017 build guide (old rules, still useful on sizing and charts):
  <https://patrickyepes.com/category/science-olympiad-hovercraft/>
- Not used: the "2026 Hovercraft Guide" PDF at thebmi.org — it belongs to
  Maryland Engineering Challenges, a different competition.
