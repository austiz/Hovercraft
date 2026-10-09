/* ============================================================================
   HOVER RACER — 3D PRINTABLE PARTS
   Science Olympiad Hovercraft B, 2027 rules
   Companion file to "Hover Racer Workshop.html"

   Every printed part named in the workshop lives in this one file.  Pick a part
   with the PART variable below, press F5 to look at it, F6 to render, then
   File > Export > Export as STL.  (export_stl.ps1 next to this file does all of
   them in one go.)

   PART options
   ------------------------------------------------------------------------
     "assembly"     the whole craft, for checking fit.  Not printable.
                    Read the Console: it prints the rule checks.
     "mockup"       the same without the see-through skirt, for exporting
                    as one STL (stl\mockup_assembly.stl) to look at in the
                    slicer or any 3D viewer.  Do NOT print it.
     "fan_tube"     FOAM-BOARD DECK ONLY: the shroud that glues over the
                    12 cm hole.  The printed deck has it built in.
     "fan_cage"     the top guard; the RS-550 bolts straight to its hub.
                    The ring on top is the duct's rounded inlet (bellmouth)
     "fan_cage_hs390"  the same cage with a hub for the HS390 motor instead
     "fan_guard"    FOAM-BOARD DECK ONLY: the guard that glues UNDER the
                    hole.  The printed deck has it built in.
     "nozzle"       the box over the 3 x 10 cm slot with the card guide
                    (NOZZLE_V = 2) or the press-fit socket (NOZZLE_V = 1).
                    "nozzle_v1" / "nozzle_v2" pick one explicitly.
     "plate"        one speed card (or plate for v1)  (set PLATE_TIME)
     "plates"       a batch of them (set PLATE_BATCH)
     "plate_zero"   the no-hole card for the drift test
     "plate_test"   the three calibration cards: 15, 22 and 30 mm
     "plate_rack"   numbered rack that carries the cards to the tournament
     "rack_aux"     4-slot sibling rack: the zero card + the three test cards
     "chart_plate"  engraved calibration chart, one column per surface.
                    Print TWO: charts must be IMPOUNDED to be used (rule 2a)
     "nickel_tray"  two roll slots.  Print TWO of these.
     "tray_bar"     snap-on bridge over a tray's rolls.  Print TWO.
     "coin_bin"     half roll + 20 loose nickels
     "bin_lid"      snap-on windowed lid for the coin bin
     "stick_stand"  socket for the 1/4" timing dowel
     "switch_bracket" panel for the toggle switch (it cannot mount through
                    foam: the nut crushes it and the body hangs in the bag)
     "aa4_mount"    glue-on snap frame for a 4 x AA holder.  Print TWO.
     "aa2_tray"     glue-on sliding trim tray for the 2 x AA holder
     "aa2_fences"   the pair of drop-in fences for that tray
     "wire_clips"   six saddle clips for the 18 AWG wire runs
     "templates"    marking templates for the fan hole and the nozzle slot
     "wear_pad"     the 14 cm foot that is duct-taped to the outside of the
                    bag under the fan (the workshop uses a milk jug)
     "deck_fl" "deck_fr" "deck_bl" "deck_br"
                    OPTIONAL printed deck in four quarters (front-left,
                    front-right, back-left, back-right) that replaces the
                    foam board — with the fan duct and the bottom guard
                    BUILT IN: fan, straight 136 mm duct, guard grid, bag,
                    no glued flange anywhere.  "deck" shows all four put
                    together.  Every part presses into a pocket in it
                    (DECK_SOCKETS); only the fan_cage still bolts on.
     "deck_fit_test" coupons of those pockets, the duct seam (both halves,
                    with its dovetail key) and a jigsaw tab pair.  Print
                    this first and press the real parts in; adjust
                    SOCK_FIT / DT_CLR / DECK_TAB_CLR, then print the
                    quarters.

   Hardware to buy (none of it comes with the motor)
   ------------------------------------------------------------------------
     2x M3 x 6 socket head     motor to cage hub.  6 mm, NO LONGER.
     6x M3 x 10 + 6x M3 nut    cage to tube lugs (nuts drop into the lugs)
     1x M3 x 8                 dowel set screw in the stick stand
     Printed deck: NO screws — the quarters lock with dovetails.  Thin
                               CA glue (and gel CA for the bore seams)
                               and clear packing tape for the joints.
     5 ft of 1/8" or 3/16" shock cord (bungee by the foot, any hardware
                               store) + a cord lock   the hem cord of the
                               skirt cap, which snaps over the deck's lip
                               (DECK_LIP).  Cut the skirt plastic 48 x 47 cm:
                               43 x 42 of skirt + a 2 cm hem each side.
     HS390 instead: 2x M2.5 x 5 socket head (M2.6 x 5 if its holes are
                               M2.6, as on the Mabuchi 385), and a
                               2.3 mm collet prop adapter
     4x 6.3 mm female spade crimps   the toggle switch has spade tabs; the
                               lever connectors in the shopping list do
                               not take them
     The MECCANIXITY 5030 props have a 6 mm bore and the adapter is 5 mm:
     use the 5 mm ring from the prop's bag, and glue it if it is loose.

   Print settings  (per-part table in PRINT_SETTINGS.md next to this file)
   ------------------------------------------------------------------------
     Material     PLA.  Parts on the craft are about 330 g at these settings
                  (the deck quarters are the heavy ones, ~65-75 g each,
                  duct included); the whole set with spares and the rack
                  is about 500 g.
     Layers       0.2 mm, 0.4 mm nozzle
     Walls        3 everywhere; fan_cage 4 walls / 40% infill (it carries
                  the motor)
     Infill       15%
     Supports     none for the v2 set.  Only nozzle v1 needs supports
                  (everywhere, or painted on the socket bore and box roof).
     Orientation  every part is already drawn the way it prints.  Do not
                  rotate anything except to fit the bed.

   Build order (printed deck + fan)
   ------------------------------------------------------------------------
     1. Snap the breakaway support rings and posts out of each quarter,
        through the open bore.  Light-test the skin; tape any pinholes.
     2. Right side up on a flat table: lower front-right onto front-left
        (the dovetails only go in straight down), the same for the back
        pair, then lower the front half onto the back half.  No screws.
        Bolt the bare fan_cage across all four duct tops: it holds the
        duct round while the glue sets.
     3. Wick thin CA into every dovetail outline and seam line from the
        top face, and along the seam ribs underneath.  Run a bead of gel
        CA down each duct seam inside the bore.  Clear tape over the
        joints underneath.  Take the cage off again.
     4. Bolt the motor to the fan_cage hub from UNDERNEATH with two M3 x 6
        screws.  The heads sit in counterbores, flush with the cage.
        Longer screws reach the windings inside the motor: 6 mm, no more.
     5. Push the adapter and propeller onto the shaft, under the cage.
     6. Drop an M3 nut into the pocket on top of each lug, lower the cage
        (with motor and prop) on, 6x M3 x 10 from above, through the six
        holes in the bellmouth ring (a 2.5 mm hex key, 15 mm+ shank).
     The propeller is larger than the duct bore, so it can only go in from
     above with the cage off.  This order is not optional.
     (Foam-board deck instead: glue fan_tube over the hole and fan_guard
     under it, airtight all the way round both flanges, then 4-6.)

   WHY THE MOTOR BOLTS STRAIGHT TO THE CAGE: an RS-550 shaft only sticks out
   7.5 to 12.5 mm.  Any plate between motor and cage lifts the propeller
   into the cage.  Measure PROP_DROP on your own motor before printing.

   SAFETY: cage and guard openings are GRID_OPEN mm wide.  The rules say a
   9.5 mm (3/8") dowel must not reach the blades, and the workshop says
   test with a pencil (~7 mm).  Do not raise GRID_OPEN above 7.

   RULE 3a: the craft must fit a 40 x 40 x 40 cm box WHILE FLOATING, skirt
   and all.  The workshop's 36 x 34 cm deck is too big once the skirt puffs
   out.  DECK_X / DECK_Y below are what to cut instead; cut the skirt
   plastic 10 cm bigger than the deck each way, as the workshop says.
   The fan hole is 13 cm, not 12 (see DECK_HOLE_D).  Print "templates" and
   trace them rather than measuring: they follow these numbers.

   The maths behind all of this is in ENGINEERING_CHECK.md next to this file.
============================================================================ */


// ---------------------------------------------------------------- what to show
PART = "assembly";

PLATE_TIME  = 12;                       // for PART = "plate"
PLATE_BATCH = [6, 7, 8, 9, 10, 11];     // for PART = "plates"
MAGIC       = 242;                      // YOUR craft's magic number, step 8c
                                        // hole size (mm) = MAGIC / target time


// ---------------------------------------------------------------- quality
$fa  = 2;
$fs  = 0.5;
EPS  = 0.02;

// ---------------------------------------------------------------- hardware
M3_CLEAR = 3.4;     // M3 passes through (vertical printed hole)
M3_SNUG  = 3.3;     // M3 located by the hole
M3_TAP   = 2.6;     // M3 self-taps into PLA (vertical hole)
M3_TAP_H = 2.9;     // M3 self-tap, HORIZONTAL printed hole: prints 0.3-0.4
                    // small, lands at ~2.6 effective = normal tap fit
M3_HEAD_D= 6.5;     // counterbore for an M3 socket head (5.5 mm)
M3_HEAD_H= 3;

// ---------------------------------------------------------------- the deck
// Foam board, 12 cm fan hole, 3 x 10 cm nozzle slot.
// +Y is the FRONT (the end that crosses the timing beams first).
DECK_X      = 330;    // 33 x 32 cm, NOT the workshop's 36 x 34: see RULE 3a
DECK_Y      = 320;
DECK_T      = 5;
SKIRT_OVER  = 30;     // how far the inflated skirt sticks out past the deck,
                      // each side.  Measure yours while it floats.
DECK_HOLE_D = 130;    // 13 cm, not the workshop's 12: the 127 mm propeller
                      // overhangs a 12 cm hole by 3.5 mm all round and its
                      // tips, which do most of the work, blow onto foam
SLOT_X      = 100;    // slot, left to right
SLOT_Y      = 30;     // slot, front to back
SLOT_BACK   = 42;     // slot centre, this far forward of the back edge

// ---------------------------------------------------------------- printed deck
// Optional replacement for the foam board: four quarters, each fits the P1S
// bed.  A thin skin (the deck's top face, printed on the bed) with a
// triangle grid of ribs underneath, like an aircraft panel.  See PART 11.
DECK_PRINTED = true;  // assembly preview: show the printed deck, not foam
DECK_SKIN   = 0.84;   // 3 layers of 0.28.  The quarters print top face UP
                      // (the fan duct rises out of them), so the skin is
                      // BRIDGED over the rib cells the way the pocket
                      // floors always were: a bridge plus two layers to
                      // close it (the SOCK_FLOOR rule).  Light-test it.
DECK_RIB_H  = 10;     // grid ribs, below the skin, all the way to the bed
                      // plane (the lip bottom): they print from the bed up
                      // and carry the bridged skin
DECK_RIB_W  = 0.9;    // two 0.45 lines
DECK_RIB_FOOT = 0.4;  // extra width per side on the ribs' first 0.6 mm, a
                      // foot that keeps a 10 mm tall 0.9 mm wall on the bed
DECK_CELL   = 55;     // triangle side of the grid
DECK_BAND   = 40;     // flat band round the edge, no ribs: the skirt plastic
                      // and its tape go here
DECK_BAND_SKIN = 0.84;// the band, no ribs: 3 layers like the skin
DECK_SEAM_W = 1.6;    // seam ribs, one each side of every joint, glued
DECK_SEAM_H = 10;     // back to back; to the bed plane like the grid ribs.
                      // The dovetail keys (DT_*, fan section) hold them.
DECK_TAB_D  = 9;      // jigsaw tabs that lock the skin across the joints
DECK_TAB_CLR= 0.2;    // knob and slot now print as TOP-surface features on
                      // bridged skin (no elephant's foot), so expect to
                      // retune DOWN (~0.15) with deck_fit_test's tab pair
DECK_MARKS  = true;   // engraved outlines showing where each part glues on
DECK_MARK_D = 0.28;   // one layer, recessed into the top surface
DECK_MARK_W = 0.8;    // a strip under each mark keeps 3 full layers
DECK_MARK_PAD = 1.2;  // under the line, this far either side of it

// ---------------------------------------------------------------- deck sockets
// Every printed part presses into a pocket in the deck's top face (the fan
// guard into one underneath), so nothing is marked out or held by glue
// alone, and the parts cannot be put on crooked.  Pockets are cut to the
// parts as drawn in this file.  Print "deck_fit_test" first: it is three
// small coupons to press the real parts into before printing the quarters.
// Printing rule behind all of this: the deck prints top face UP, so the
// pockets are ordinary top-surface recesses — their floors print over the
// pads' bridged undersides and come out solid.  The pads' UNDERSIDES are
// the bridges now (2.3 mm below the skin, spans up to ~33 mm inside the
// rib cells), which the P1S does without help.
DECK_SOCKETS = true;
SOCK_D      = 1.5;    // pocket depth: half the thinnest flange (nozzle, 2.4)
SOCK_FIT    = 0.2;    // per side.  The pocket walls now start on bridged
                      // layers instead of the bed: no elephant's foot, so
                      // fits run LOOSE, not tight.  Expect ~0.1 after the
                      // fit test.  Tight: 0.1.  Drop-in: 0.35.
SOCK_RIM    = 2.4;    // solid rim round each pocket, flush with the deck top
SOCK_FLOOR  = 0.84;   // pad thickness below the pockets: 3 layers of 0.28,
                      // the first of them a bridge (underside), two more
                      // over it to close.  Same rule as the main skin.
SOCK_LIP    = 1.35;   // lip round the nozzle slot that the frame bridges to.
                      // It makes the slot 96.7 x 26.7; the cards absorb that.
SOCK_PEG_D  = 11.2;   // pegs through the trays' 12 mm floor holes (print ~11.7)

// skirt tape line: a groove on the underside, one layer deep, where the
// first strip of tape goes (the workshop says 1 cm in from the edge).  It
// breaks where a socket pad or a jigsaw tab is in the way.  LEGACY: only
// drawn when DECK_LIP is off — on the top-face-up print the band's
// underside is a bridge and a 0.28 mm relief there comes out as mush; the
// lip + shock cord is the skirt attachment now.
DECK_TAPE_IN = 10;
DECK_TAPE_W  = 1.0;
DECK_TAPE_D  = 0.28;

// ---------------------------------------------------------------- wear pad
// The workshop's 14 cm milk-jug circle, printed: flat, 2 layers, edge
// chamfered so the tape lies over it and nothing catches on the track.
// ~10 g against ~5 g of milk jug; durable and slippery.
WEAR_PAD_D  = 140;
WEAR_PAD_T  = 0.48;   // 2 layers: it only has to stay flat and slide
WEAR_PAD_CH = 0.2;    // edge chamfer: the first layer, one step in

// ---------------------------------------------------------------- skirt lip
// A lip round the underside of the edge, like a bucket rim turned down,
// with a ridge at its bottom.  The skirt is a CAP: 1/8" or 3/16" shock cord
// runs in a taped hem round the plastic's edge, like a shower cap or a bowl
// cover.  Stretch it over the lip and the cord snaps in above the ridge; it
// holds the skirt and seals it.  On, or off, in ten seconds, nothing taped.
// The lip also stiffens the edge.
DECK_LIP     = true;
LIP_CROWN    = 5;      // the printed deck's sides bow out: each side's middle
                       // is on DECK_X / DECK_Y, its ends (the corners) 5 mm
                       // in.  A cord round a STRAIGHT side presses on nothing
                       // (pressure = tension / radius), so only the ridge
                       // would hold it there; bowed, a 20 N cord presses
                       // ~7 N/m on every side, about the bag's whole pull.
                       // Rule 3a is unchanged: the middles set the size.
LIP_H        = 10;     // below the band's underside: 3/16" cord + plastic fit
LIP_T        = 1.35;   // 3 lines
LIP_RIDGE    = 1.6;    // ridge at the bottom, outward, past the deck edge
LIP_RIDGE_H  = 1.2;    // ridge height; above it, 45 degree steps back to the wall
LIP_CORD_D   = 4.8;    // hardware-store shock cord: 1/8" (3.2) or 3/16" (4.8),
                       // sold by the foot.  ~1.5 m, plus a cord lock
SKIRT_HEM    = 20;     // plastic folded over the cord to make the hem

// the print bed plane of the top-face-up quarters: the lip bottom.  Rib
// feet, the lip and the guard's breakaway supports all land on it.
function deck_bed_z() = -(DECK_BAND_SKIN + LIP_H);

// where things sit on the deck: shared by the assembly preview and the
// engraved marks on the printed deck
TRAY_X      = 118;                        // nickel trays at (+/-TRAY_X, 0)
BIN_POS     = [62, DECK_Y / 2 - 42];      // coin bin, front right
AA2_POS     = [-62, DECK_Y / 2 - 42];     // 2 x AA holder, front left
AA4_POS     = [110, -112];                // 4 x AA holders at (+/-x, y)
SW_POS      = [118, -80];                 // switch bracket, panel centre
AA4_SIZE    = [62, 57];
AA4_H       = 16;
AA2_SIZE    = [58.5, 32.4];
AA2_H       = 14.6;

// ---------------------------------------------------------------- the fan
// Motor: RS-550, 12 V, can 35.8 mm, two M3 holes 25 mm apart on the shaft
// face, 3.17 mm shaft.  Propeller: 5030, 127 mm across, on a collet adapter.
PROP_D      = 127;
PROP_DROP   = 10;     // motor face to the TOP of the propeller hub with the
                      // adapter fitted.  MEASURE YOURS.  The blades clear
                      // the cage by PROP_DROP - HUB_T; keep that >= 3 mm.
PROP_HUB_T  = 7;      // preview only
MOTOR_CAN_D = 35.8;
MOTOR_BOLTS = 25;     // spacing of the motor's own two M3 holes
MOTOR_BOSS_D= 14.5;   // clears the ~13 mm centring boss after print shrink
MOTOR_LEN   = 57;     // can length, preview only

TUBE_BORE   = 136;    // 4.5 mm of tip clearance round the propeller
TUBE_WALL   = 2.4;
TUBE_H      = 50;     // deck surface to the top rim
FLANGE_OD   = 164;    // 14 mm of gluing area round the bore
FLANGE_T    = 3;
LUG_N       = 6;      // cage screws
LUG_R       = 74;
LUG_D       = 12;
LUG_H       = 9;      // clearance hole depth
LUG_PHASE   = 15;     // lugs at 15, 75 ... 315 degrees: the duct is split
                      // between the four deck quarters along x = 0 and
                      // y = 0, and no lug may straddle a seam.  The cage
                      // and the legacy fan_tube share this phase.
TUBE_RIB_TOP= 2;      // the duct's seam keys stop this far below the rim
                      // (cage seat)
// dovetail keys: no screws anywhere in the deck.  Every joint is a set of
// VERTICAL dovetails (a tail on one quarter, its socket on the other), so a
// quarter only goes together one way — lowered straight down onto its
// neighbour — and then cannot pull apart sideways.  Each key is a solid
// DT_BLOCK block straddling the joint, bed to skin (to the duct rim on the
// four duct seams), cut by the tail's outline all the way through the skin.
DT_NECK     = 4;      // tail width at the joint line
DT_TIP      = 6;      // tail width at its tip (18 degree flare)
DT_DEPTH    = 3;      // how far the tail reaches across the joint
DT_CLR      = 0.2;    // per side, round the tail.  Vertical walls, so this
                      // is an XY fit: tune it on deck_fit_test's duct pair
                      // (slides down by hand, no wobble; CA wicks the gap)
DT_BLOCK    = [10, 10];             // key block: along the joint, across it
DT_DUCT_R   = TUBE_BORE / 2 + 5;    // duct key centre: its block runs from
                                    // the bore face (68) out to 78
// keys along each joint: [position, owning side].  Joint x = 0 (V) by y,
// joint y = 0 (H) by x.  Owners alternate so every quarter has tails and
// sockets.  +/-DT_DUCT_R are the tall duct keys.  The outer H keys sit in
// the tray pockets, between the pegs; the tray covers them.
DT_KEYS_V   = [[DT_DUCT_R, 1], [100, -1], [-DT_DUCT_R, -1], [-91, 1]];
DT_KEYS_H   = [[DT_DUCT_R, -1], [118, 1], [-DT_DUCT_R, 1], [-118, -1]];
NUT_AF      = 5.8;    // M3 nut is 5.5 across flats, 2.4 thick
NUT_T       = 2.6;    // pocket 0.2 deeper than the nut, so the nut always
                      // drops below the cage seat.  That means tightening
                      // pulls the nut UP against the cage and the lug top
                      // carries no preload — so at assembly, bed each nut
                      // on a little epoxy (or wick CA round the flats after
                      // seating, threads kept clean) before the cage goes
                      // on.  Glue the nut, never the screw.

GRID_OPEN   = 6.5;    // every opening in every guard.  Never above 7.
GRID_BAR    = 2.4;    // spoke width.  Also the printed deck's seam bars:
                      // a spoke on each half-axis, 1.2 per quarter
GRID_RING   = 1.6;    // ring width (4 lines).  Thin rings are most of the
                      // open area: 67% open (spokes included) against 63%
GRID_CHAMF  = 0.4;    // 45 deg chamfer on the upstream (top) edge of every
                      // ring, so the air meets a point, not a flat.  Widens
                      // the slot only at the surface; the throat a probe
                      // has to pass stays GRID_OPEN
GRID_SPOKES = 8;      // spokes tying the rings together

CAGE_OD     = 164;    // rim: matches FLANGE_OD, lug holes at LUG_R 74
CAGE_T      = 4;      // rim and rings
CAGE_ZONE   = TUBE_BORE;  // rings live inside this circle.  Not wider:
                          // the rim sits on the duct wall, so a slot past
                          // the bore just blows into the wall
INLET_R     = 12;     // bellmouth on top of the cage rim: radius of the
                      // flare from the bore (r 68) out to r 80.  A sharp
                      // inlet chokes the blade tips; ~0.1 D of radius
                      // gets most of that back.  The prop is only 4 mm
                      // under the cage, so the flare has to be up here.
INLET_T     = 2;      // flare shell thickness (5 lines).  45 deg underside,
                      // open to the outside: no supports, little plastic
INLET_ACC_D = 7.5;    // driver/head access holes through the flare over
                      // the six lug screws (M3 head 5.5)
HUB_OD      = 44;     // solid middle the motor bolts to
HUB_T       = 6;      // 3 mm counterbore + 3 mm under the screw heads.
                      // If measured PROP_DROP <= 9 (blade under 3 mm from
                      // the cage): set 5 and use M3 x 5 motor screws — with
                      // 2 mm under the head an M3 x 6 would reach 4 mm into
                      // the motor, the Mabuchi winding-contact limit

GUARD_OD    = DECK_HOLE_D + 20;   // on the printed deck the 67..75 annulus
                                  // fuses to the skin and is the ring the
                                  // duct lands on; on foam it is glue area
GUARD_T     = 3;
GUARD_ZONE  = DECK_HOLE_D + 4;
GUARD_NUB_H = 4;      // little feet that stop the skirt sealing flat on it
GUARD_HUB_D = 16;     // printed deck: solid disc where all four quarters
                      // meet, instead of four knife-edged slivers
GUARD_NUB_A = 22.5;   // printed deck: nub angles 22.5 + 45k, off the seams
GUARD_NUB_R = GUARD_HUB_D / 2 + GRID_RING / 2 + 6 * (GRID_OPEN + GRID_RING);
                      // and on the 6th ring's centreline (57.4)
SUP_W       = 0.9;    // breakaway supports under the integral guard grid:
SUP_GAP     = 0.28;   // ring walls one layer short of the grid, snapped
                      // out through the bore after printing

// ---------------------------------------------------------------- HS390 cage
// Optional second motor: HS390 (390 size, 12 V, 22 000 rpm, ~28 mm can,
// 2.3 mm shaft).  Its can covers the RS-550 screw holes, so it gets its own
// cage (PART 2b, "fan_cage_hs390"): same grid, same tube, different hub.
// Screw pattern is the Mabuchi 385 datasheet's.  MEASURE YOUR MOTOR.
MOTOR_TYPE  = "RS550";// assembly preview: "RS550" or "HS390"
HS_CAN_D    = 28.0;   // listings say 28; the Mabuchi 385 is 27.7
HS_LEN      = 38;     // can length, preview only
HS_BOLTS    = 16;     // its two tapped holes (M2.6 on the 385)
HS_BOSS_D   = 11.5;   // clears the ~10 mm centring boss.  The counterbores
                      // break into it a little: deliberate, so no knife edge
M25_SNUG    = 2.8;    // M2.5 located by the hole.  If your motor's screws
                      // turn out to be M2.6 (the Mabuchi 385 pattern), set
                      // 2.9: a vertical hole prints ~0.1-0.15 small and 2.8
                      // is an interference fit on an M2.6 major diameter
M25_HEAD_D  = 5;      // counterbore for an M2.5 socket head (4.5 mm)
M25_HEAD_H  = 3.5;    // leaves 2.5 mm under the head: M2.5 x 5 goes 2.5 mm in

// ---------------------------------------------------------------- the nozzle
NZ_WALL     = 2;
NZ_FLOOR    = 2.4;
NZ_FLANGE   = 10;     // gluing flange round the slot
NZ_IN_X     = 104;    // plenum inside, left to right
NZ_IN_Y     = 40;     // plenum inside, front to back
NZ_IN_Z     = 60;     // plenum inside height
SOCKET_ID   = 50;     // the speed plate socket
SOCKET_WALL = 3;
SOCKET_LEN  = 8;
SOCKET_Z    = 32;     // socket axis height above the deck.  Keep the socket
                      // top (SOCKET_Z + SOCKET_ID/2 + SOCKET_WALL) at least
                      // 1 mm below the roof, NZ_FLOOR + NZ_IN_Z.
SOCKET_SEAT = 5;      // how deep the press fit is
SOCKET_THRU = 48;     // flow hole behind the seat.  The flange is the stop,
                      // so this can be nearly the full socket: a smaller
                      // hole here throttles the fast plates.

// ---------------------------------------------------------------- v2: cards
NOZZLE_V    = 2;      // 2 = drop-in card guide (default), 1 = press-fit socket.
                      // Both are being compared on the track: v1 is printed
                      // and fits well; v2 should be more repeatable.  The
                      // export script writes the v1 set to stl\v1\ as well.
CARD_T      = 2;      // card thickness
CARD_CLEAR  = 0.5;    // slot is this much wider than the card: it must DROP in
CARD_W      = 60;
CARD_HEAD_W = 74;     // the T head, wider than the guide so it is easy to grab
CARD_HEAD_H = 6;      // head height
CARD_HEAD_D = 8;      // head depth: wall face to its outer edge, covers the guide
GUIDE_T     = 2.4;    // the guide's outer plate
GUIDE_RAIL  = 3;      // its side rails
GUIDE_H     = 57;     // guide height above the floor (the roof is at 62.4)
EXIT_D      = 46;     // hole in the back wall and the outer plate.  The card's
                      // hole must stay inside it: cards up to 42 mm, which
                      // covers a 6 s card for any MAGIC up to 252.

// ---------------------------------------------------------------- speed plates
// The boss goes PLATE_BOSS_T - PLATE_FLANGE_T deep into the seat.  Air
// pressure pushes the plate OUT, so the fit is what seals it: a loose plate
// leaks round its flange and the drift-test "zero" plate is not zero.
// Print the plate_test set first and adjust PLATE_FIT until a plate pushes
// in firmly by hand and stays put when the fan runs.
PLATE_FIT      = 0.1;   // bigger number = looser.  A horizontal printed
                        // bore already comes out 0.2 to 0.4 mm small.
PLATE_OD       = SOCKET_ID - PLATE_FIT;
PLATE_BOSS_T   = 6;     // 2 mm flange + 4 mm in the seat
PLATE_LEAD     = 0.6;   // chamfer on the nose of the boss
PLATE_FLANGE_D = 60;
PLATE_FLANGE_T = 2;
PLATE_TAB_W    = 26;
PLATE_TAB_H    = 20;
PLATE_TAB_Y    = 36;
PLATE_TEXT_D   = 0.6;   // number is cut INTO the back face, readable from
                        // behind the craft once the plate is in

// ---------------------------------------------------------------- plate rack
RACK_N       = 13;      // slots.  States and Nationals use 0.5 s steps:
RACK_STEP    = 1;       // set RACK_STEP = 0.5 and print two racks, one with
RACK_T0      = 6;       // RACK_T0 = 6 and one with RACK_T0 = 12.5
RACK_SLOT_W  = (NOZZLE_V == 2) ? CARD_T + 1.2 : 7.2;
RACK_FIN_T   = (NOZZLE_V == 2) ? 1.6 : 2;
RACK_PITCH   = (NOZZLE_V == 2) ? CARD_HEAD_D + 2.2      // cards: the 8 mm heads
                               : RACK_SLOT_W + RACK_FIN_T; // sit side by side
RACK_FIN_H   = (NOZZLE_V == 2) ? 18 : 24;
RACK_DEPTH   = 62;      // the plates are 60 mm across the flange
RACK_LABEL   = 15;
RACK_BASE_T  = 2.4;

// ---------------------------------------------------------------- calibration chart
// The chart must be IMPOUNDED to be used on the floor (rule 2a: nothing
// comes in after impound), so it is a PLA tablet, not paper.  One column
// per surface: the lesson from plywood state tracks is that a smooth-floor
// calibration is useless on wood — each surface gets its own magic number.
// Run 2 needs no chart at all: d2 = d1 x t1 / TT (engraved in the footer).
CHART_MAGICS = [["SMOOTH", MAGIC], ["WOOD", MAGIC]]; // [name, magic] per
                       // surface.  Measure the wood number at a practice
                       // session and update it here; reprint both copies.
CHART_REV    = "A";    // bump when a magic changes, so stale charts get binned
CHART_T0     = 6;      // first row's target time (s)
CHART_T1     = 18;     // last row
CHART_STEP   = 1;      // 0.5 also fits: 25 rows stays under the bed assert
CHART_COL0   = 18;     // TT label column width
CHART_COL    = 28;     // width of one surface column
CHART_ROW    = 9;      // row pitch
CHART_MARGIN = 6;
CHART_TAB_T  = 2.4;    // tablet thickness
CHART_TEXT_D = 0.6;    // engraved like PLATE_TEXT_D; stroke >= 0.5 at size 5
CHART_CELL_S = 5;      // cell text size
RACK_AUX_LABELS = ["0", "15mm", "22mm", "30mm"]; // match the card heads
                       // exactly ("15" would read as a TT-15 speed card)

// ---------------------------------------------------------------- nickel trays
// A bank roll of nickels is 21.6 to 22.5 mm across and 80 to 85 mm long
// with its crimped ends.  Slots are cut oversize on purpose; test them with
// the real rolls from the bank.
ROLL_D      = 21;
SLOT_ROLL_W = 23;
SLOT_ROLL_L = 86;
SLOT_HALF_L = 50;     // coin bin: half roll, 39 mm of coins plus the crimps
TRAY_WALL   = 2.4;
TRAY_FLOOR  = 2;
TRAY_WALL_H = 14;     // the rules say nothing may fall off.  Keep 12 or more.
TRAY_LIGHTEN= true;   // holes in the floor save weight; lighter floats better

// ---------------------------------------------------------------- nickel retention
// Rough plywood tracks shake cargo loose.  Rule 4j: ANYTHING falling off is
// a x0.8 construction penalty, and fallen nickels stop scoring (7f.iv).
// Rule 4g bans tape/adhesive ON the nickels; rigid snap-on retainers are
// legal.  A 22.5 mm roll tops out 8.5 mm above the 14 mm tray walls and can
// pivot an end over the wall at ~9.5 degrees of tilt; a bar whose underside
// is at RET_UNDER caps the rise at ~3 mm.  The loose-20 slot is shortened
// (SLOT_LOOSE_L) and covered by a windowed lid; dimple recesses in the
// tray/bin outer walls give the snap legs a real detent (friction-only
// clips fail a shake test).
NICKEL_D     = 21.2;   // US nickel: 21.21 x 1.95 mm
NICKEL_T     = 1.95;
ROLL_D_MAX   = 22.5;   // fattest crimped bank roll seen
SLOT_LOOSE_L = 41;     // 20 x 1.95 = 39 mm of coins + 2 play (was SLOT_HALF_L:
                       // 11 mm of slop let the on-edge coins fan and climb)
RET_UNDER    = TRAY_FLOOR + ROLL_D_MAX + 0.5;  // 25.0: bar & lid underside
RET_LEG_T    = 1.6;    // snap legs; 0.7 flex over ~17 mm = ~0.6% strain, PLA-safe
RET_LEG_FIT  = 0.15;   // leg inner face off the wall outer face
RET_NUB      = 0.85;   // nub stand-off; 0.7 engagement after RET_LEG_FIT
RET_NUB_H    = 4;      // nub: 45 deg lead-in below, 80 deg hold face above
RET_DIMPLE_D = 1.05;   // recess depth in the tray/bin outer walls
RET_DIMPLE_H = 4.1;    // shrink to 3.9 if a retainer rattles vertically
RET_SNAP_Z   = 8;      // nub/dimple centre height (deck pocket rim ends at 1.5)
BAR_W        = 10;     // tray bar width (= dimple width - 0.4: locates it in Y)
BAR_T        = 2.4;    // bridge plate
BAR_LEG_END  = 4;      // legs stop this far above the tray bottom
LID_T        = 1.2;
LID_RIM_T    = 1.6;    // rims that seat on the bin wall tops
LID_LEG_W    = 12;
LID_WIN_D    = 12;     // < NICKEL_D: a nickel cannot pass a window

// ---------------------------------------------------------------- timing stick
// Rule 3e: the dowel must be within 3 cm of the craft's front edge, and the
// front edge is the SKIRT, not the deck.  So the tower hangs out past the
// deck edge by STAND_OVERHANG.
DOWEL_D     = 6.35;   // 1/4 inch.  Many "1/4 inch" dowels are really 6.0 to
                      // 6.3 mm: measure yours, or the stick will wobble.
DOWEL_FIT   = 0.5;    // loose on purpose: a vertical printed hole comes out
                      // 0.2 to 0.3 mm small, and a true 6.35 dowel must
                      // still drop in.  The set screw takes up the slack.
TOWER_D     = 16;
TOWER_H     = 38;
STAND_X     = 46;
STAND_Y     = 36;     // the part of the base that sits on the deck
STAND_T     = 3;
STAND_OVERHANG = 12;  // dowel axis this far past the deck's front edge
STAND_NECK  = 32;     // the arm is narrower than the base where it crosses
STAND_STOP  = 4;      // the deck edge: the pocket keeps a shoulder 4 deep x
                      // 7 wide each side of it, so the stand can't slide
                      // forward off the deck (it was held by glue alone).
                      // 32 clears the +-40 deg ribs where they cross.

// ---------------------------------------------------------------- switch
// DaierTek 30 A toggle: 12.2 mm panel hole, M12 bushing, body about
// 28 x 16 mm and 30 mm deep behind the panel, two 6.3 mm spade tabs.
SW_HOLE     = 12.8;   // 12.2 mm bushing; a horizontal printed hole comes
                      // out 0.3 to 0.4 mm small
SW_FACE_W   = 34;
SW_FACE_H   = 36;
SW_FACE_T   = 3;
SW_HOLE_Z   = 22;     // body bottom ends up 14 mm above the deck
SW_BASE_D   = 30;     // glue flange under the body
SW_BASE_T   = 3;

// ---------------------------------------------------------------- battery mounts
// The first build taped the holders down with foam tape; on a rough track
// that is a x0.8 "something fell off" waiting to happen.  These are GLUE-ON
// frames — nothing may pierce the deck skin, it is the air cushion's lid —
// aligned by eye to the engraved outline boxes (deck_marks_2d).  Holders
// count as "wires" (rule 3b) and stay on the craft at impound: the cells
// lift out.  A strip of foam tape INSIDE each frame preloads the holder up
// into the hooks: located by the fence, damped by the tape, zero rattle.
// Side walls stay low so every cell label is visible (rule 3f-ii).
BATT_FIT      = 0.3;   // per side: drop-in; the tape preload takes the slack
BATT_WALL     = 1.6;
BATT_FENCE_H  = 6;     // 10 mm below the holder rim: labels stay readable
BATT_FLANGE   = 5;     // glue flange width.  NONE on the +Y side of the
                       // aa4_mount: the switch bracket base is 1.6 mm away
BATT_FLANGE_T = 1.2;
BATT_LIP      = 2;     // fixed lip tabs over the rear rim, 45 deg under-chamfer
BATT_LIP_W    = 12;
BATT_NOTCH_W  = 12;    // wire notch in the rear wall (the 18 AWG exits)
BATT_FOAM     = 0.8;   // the 1 mm foam strip at ~20% crush.  Hooks and lips
                       // sit at AA4_H + BATT_FOAM: they can close over the
                       // rim AND the foam still preloads the holder up
BATT_ARM_TIP  = 10;    // +Y snap arms: SIDEWAYS cantilevers in the wall
BATT_ARM_ROOT = 27;    // plane, rooted outboard (|x| = ROOT..wall end),
BATT_ARM_T    = 1.2;   // free tip toward the middle.  Flex bends the blade
BATT_ARM_Z    = 15;    // about a vertical axis — in-plane, never across
                       // layer adhesion (the tray_bar rule).  strain =
                       // 3*d*t/(2*L^2) = 3 x 1.0 x 1.2 / (2 x 14.5^2)
                       // ~ 0.9% vs 3-5% in-plane PLA break: 3x margin
BATT_HOOK     = 1.0;   // (cells lift out from the top; the arms only
                       // move when the holder itself comes out)
TRIM_TRAVEL   = 30;    // aa2 tray: +/-15 mm of front/back trim for the 2xAA
TRIM_PITCH    = 5;     // fence stations; log the station on the chart card
TRIM_SLOT_W   = 2.0;
TRIM_SLOT_D   = 1.0;
TRIM_FIT      = 0.15;  // fence tab vs station groove (crush ribs take it up)
WCLIP_N       = 6;
WCLIP_W       = 8;     // channel: two 3.5 mm 18 AWG wires side by side
WCLIP_H       = 4;


/* ==========================================================================
   SHARED HELPERS
   ========================================================================== */

// Concentric ring openings, GRID_OPEN wide, tied together by spokes.  About
// 67% open, against 45% for a square mesh, and a 9.5 mm rod still cannot
// get through a 6.5 mm slot.  Returns the OPENINGS (what gets cut away):
// a t-thick cutter whose top edges are chamfered GRID_CHAMF into the rings.
function grid_ring_starts(zone_d, hub_d) =
    [for (r = [hub_d / 2 + GRID_RING : GRID_OPEN + GRID_RING : zone_d / 2 - 1]) r];

module ring_slot(r1, r2, t, c) {                 // one opening, chamfered on top
    rotate_extrude()
        polygon([[r1, -EPS], [r2, -EPS], [r2, t - c],
                 [r2 + c + EPS, t + EPS], [r1 - c - EPS, t + EPS], [r1, t - c]]);
}

module ring_grid_cut(zone_d, hub_d, t) {
    c = GRID_CHAMF;
    difference() {
        for (r = grid_ring_starts(zone_d, hub_d))
            ring_slot(r, min(r + GRID_OPEN, zone_d / 2), t, c);
        for (a = [0 : 360 / GRID_SPOKES : 359])
            rotate(a) translate([0, -GRID_BAR / 2, -1])
                cube([zone_d / 2 + 2, GRID_BAR, t + 2]);
    }
}

// A disc with ring openings between hub_d and zone_d.  Everything outside
// zone_d stays solid (that is the screw rim) and everything inside hub_d
// stays solid (that is where the motor bolts on).
module grid_plate(od, zone_d, t, hub_d = 0) {
    difference() {
        cylinder(d = od, h = t);
        ring_grid_cut(zone_d, hub_d, t);
    }
}

// The cage's bellmouth, as an (r, z) profile with z = 0 on the cage's top
// face: a quarter-circle INLET_R from the bore wall (vertical tangent at the
// throat) outward, INLET_T thick, with a 45 degree underside and a vertical
// foot onto the rim right over the duct wall.
function inlet_foot_h() = sqrt(2) * (INLET_R - INLET_T) - INLET_R + INLET_T;
module inlet_lip_2d() {
    r0 = TUBE_BORE / 2;
    union() {
        intersection() {
            translate([r0 + INLET_R, 0]) circle(r = INLET_R);
            translate([r0, 0]) square([INLET_R, INLET_R]);
            translate([r0 + INLET_R, 0]) rotate(135)
                translate([INLET_R - INLET_T, -2 * INLET_R]) square([INLET_R, 4 * INLET_R]);
        }
        intersection() {                        // foot, its inner face on the arc
            translate([r0 + INLET_R, 0]) circle(r = INLET_R);
            translate([r0, -EPS]) square([INLET_T, inlet_foot_h() + 2 * EPS]);
        }
    }
}

module bore(d, h, z = 0) {
    translate([0, 0, z - EPS]) cylinder(d = d, h = h + 2 * EPS);
}

// Rounded rectangle, corner at the origin unless centred.
module rrect(size, r = 3, center = false) {
    translate(center ? [-size[0] / 2, -size[1] / 2] : [0, 0])
        offset(r = r) offset(delta = -r) square(size);
}

module raised_text(txt, size, h = 0.8) {
    linear_extrude(h)
        text(txt, size = size, halign = "center", valign = "center");
}


/* ==========================================================================
   PART 1 — FAN TUBE  (FOAM-BOARD DECK ONLY)
   The printed deck has this duct built into its four quarters (PART 11);
   print this one only for a foam deck.  Glues over the 13 cm hole.  Prints
   flange down, no supports.  Glue it with hot glue or silicone all the way
   round the flange: air that escapes here never reaches the skirt.
   ========================================================================== */
module fan_tube() {
    shroud_od = TUBE_BORE + 2 * TUBE_WALL;

    difference() {
        union() {
            // gluing flange
            linear_extrude(FLANGE_T, convexity = 4)
                difference() {
                    circle(d = FLANGE_OD);
                    circle(d = TUBE_BORE);
                }
            // shroud
            linear_extrude(TUBE_H, convexity = 4)
                difference() {
                    circle(d = shroud_od);
                    circle(d = TUBE_BORE);
                }
            // screw lugs for the cage.  Each one sits on a thin rib with a
            // 45 degree cone under it, so it prints without an overhang and
            // without the weight of a solid column.  LUG_PHASE keeps this
            // legacy tube bolt-compatible with the re-phased cage.
            for (i = [0 : LUG_N - 1])
                rotate(LUG_PHASE + i * 360 / LUG_N) {
                    translate([LUG_R, 0, TUBE_H - LUG_H - 3])
                        cylinder(d = LUG_D, h = LUG_H + 3);
                    translate([LUG_R, 0, TUBE_H - LUG_H - 3 - LUG_D / 2 + EPS])
                        cylinder(d1 = 0, d2 = LUG_D, h = LUG_D / 2);
                    translate([TUBE_BORE / 2 + TUBE_WALL - EPS, -1.2, FLANGE_T - EPS])
                        cube([LUG_R + LUG_D / 2 - TUBE_BORE / 2 - TUBE_WALL,
                              2.4, TUBE_H - LUG_H - 3 - FLANGE_T + 2 * EPS]);
                }
            // gussets, flange to shroud
            for (a = [0 : 45 : 359])
                rotate(a)
                    translate([shroud_od / 2 - EPS, 0, FLANGE_T - EPS])
                        rotate([90, 0, 0])
                            linear_extrude(2.4, center = true)
                                polygon([[0, 0], [10, 0], [0, 14]]);
        }
        // cage screw holes, with an M3 nut trap in the top of each lug.
        // The cage covers the nuts so they cannot fall out, and the threads
        // are steel: the cage comes off for every propeller change without
        // wearing anything.  (Self-tapped PLA strips after a few cycles.)
        for (i = [0 : LUG_N - 1])
            rotate(LUG_PHASE + i * 360 / LUG_N)
                translate([LUG_R, 0, 0]) {
                    bore(M3_CLEAR, LUG_H + EPS, TUBE_H - LUG_H);
                    translate([0, 0, TUBE_H - NUT_T])
                        cylinder(d = NUT_AF / cos(30), h = NUT_T + EPS, $fn = 6);
                }
    }
}


/* ==========================================================================
   PART 2 — FAN CAGE
   The top guard, and the thing the motor bolts to.  Prints flat, hub up.
   4 walls, 40% infill: it carries a 200 g motor that shakes.
   The two motor screws go in from underneath into counterbores, so their
   heads sit flush with the cage and nothing hangs down toward the prop.

   PART 2b — "fan_cage_hs390": the same cage with a hub for the HS390
   (two M2.5 x 5 screws, 16 mm apart).  Print the one for the motor you fly;
   the tube, the lugs and everything else are shared.
   ========================================================================== */
// The arguments describe the motor face; the defaults are the RS-550.
// vent_a is the half-angle of the vent windows: wide enough to breathe,
// narrow enough to keep a wall beside the screw counterbores.
module fan_cage(bolts = MOTOR_BOLTS, boss_d = MOTOR_BOSS_D, can_d = MOTOR_CAN_D,
                screw_d = M3_SNUG, head_d = M3_HEAD_D, head_h = M3_HEAD_H,
                vent_a = 16) {
    difference() {
        union() {
            grid_plate(CAGE_OD, CAGE_ZONE, CAGE_T, HUB_OD);
            cylinder(d = HUB_OD, h = HUB_T);
            translate([0, 0, CAGE_T - EPS])                     // bellmouth
                rotate_extrude() inlet_lip_2d();
        }
        bore(boss_d, HUB_T);                                    // boss + shaft
        for (s = [-1, 1])                                       // motor screws
            translate([s * bolts / 2, 0, 0]) {
                bore(screw_d, HUB_T);
                bore(head_d, head_h);                           // head, underneath
            }
        // windows under the motor's face vents, so it can breathe.  They sit
        // inside the motor's own footprint (the can covers them) and are
        // GRID_OPEN wide radially, so the 9.5 mm rule holds even without it.
        for (a = [45 : 90 : 359])
            rotate(a)
                linear_extrude(HUB_T + 2 * EPS, center = true)
                    intersection() {
                        difference() {
                            circle(r = min(boss_d / 2 + 2 + GRID_OPEN, can_d / 2 - 1));
                            circle(r = boss_d / 2 + 2);
                        }
                        // RS-550: +/-16 degrees keeps 3 mm of wall beside
                        // the counterbores at +/-12.5 mm.  HS390: +/-12
                        // keeps ~2 mm beside the ones at +/-8 mm.
                        polygon([[0, 0], [30 * cos(-vent_a), 30 * sin(-vent_a)],
                                 [30, 0], [30 * cos(vent_a), 30 * sin(vent_a)]]);
                    }
        for (i = [0 : LUG_N - 1])                               // onto the tube
            rotate(LUG_PHASE + i * 360 / LUG_N)
                translate([LUG_R, 0, 0]) {
                    bore(M3_CLEAR, CAGE_T);
                    bore(INLET_ACC_D, INLET_R + 1, CAGE_T);     // through the flare
                }
    }
}


module fan_cage_hs390() {
    fan_cage(HS_BOLTS, HS_BOSS_D, HS_CAN_D, M25_SNUG, M25_HEAD_D, M25_HEAD_H,
             vent_a = 12);
}


/* ==========================================================================
   PART 3 — FAN GUARD  (the one teams forget — FOAM-BOARD DECK ONLY)
   The printed deck has this grid built into its four quarters (PART 11);
   print this one only for a foam deck.  Glues to the UNDERSIDE of the
   deck, over the 13 cm hole, inside the bag.  It stops the skirt plastic
   being sucked into the propeller.  Prints flat, nubs up; glue the nub
   side towards the skirt.
   ========================================================================== */
module fan_guard() {
    grid_plate(GUARD_OD, GUARD_ZONE, GUARD_T);
    for (a = [0 : 45 : 359])                    // feet that hold the bag off
        rotate(a) translate([GRID_RING / 2 + 7 * (GRID_OPEN + GRID_RING), 0, GUARD_T - EPS])
            cylinder(d = 5, h = GUARD_NUB_H);
}


/* ==========================================================================
   PART 4 — NOZZLE
   An airtight box over the 3 x 10 cm slot.  Air from the squashed skirt comes
   up through the slot, fills the box and leaves straight backwards through a
   hole in the back wall.  The speed card / plate sets the size of that hole.
   Print flange down.

   v2 (NOZZLE_V = 2, the default): a CARD GUIDE on the back wall.  The card
   drops in from the top and bag pressure pushes it flat against the guide's
   outer plate, so the pressure makes the seal and the fit does not matter.
   No supports.  Swap cards in two seconds.

   v1 (NOZZLE_V = 1): the workshop's press-fit socket.  The seal is the fit
   of the plate's boss in the seat, so every plate must feel the same going
   in.  Needs supports everywhere (the roof of the 50 mm seat).
   ========================================================================== */
function nz_out_x() = NZ_IN_X + 2 * NZ_WALL;
function nz_out_y() = NZ_IN_Y + 2 * NZ_WALL;
function nz_wall_y() = -nz_out_y() / 2;          // outer face of the back wall
function guide_d()   = CARD_T + CARD_CLEAR + GUIDE_T; // card guide, wall to outer face

// the box itself: flange, floor, walls, roof, deck slot.  Shared by v1 and v2.
module nz_box() {
    ox = nz_out_x();
    oy = nz_out_y();
    difference() {
        union() {
            linear_extrude(NZ_FLOOR)                                   // flange + floor
                rrect([ox + 2 * NZ_FLANGE, oy + 2 * NZ_FLANGE], 4, center = true);
            translate([0, 0, NZ_FLOOR])                                // walls
                linear_extrude(NZ_IN_Z + NZ_WALL, convexity = 4)
                    difference() {
                        rrect([ox, oy], 3, center = true);
                        rrect([NZ_IN_X, NZ_IN_Y], 2, center = true);
                    }
            translate([0, 0, NZ_FLOOR + NZ_IN_Z])                      // roof
                linear_extrude(NZ_WALL) rrect([ox, oy], 3, center = true);
        }
        translate([0, 0, -EPS])                                        // the deck slot
            linear_extrude(NZ_FLOOR + 2 * EPS)
                rrect([SLOT_X, SLOT_Y], 2, center = true);
    }
}

module nozzle_v2() {
    wall_y = nz_wall_y();
    slot   = CARD_T + CARD_CLEAR;
    gw     = CARD_W + 1 + 2 * GUIDE_RAIL;       // guide outer width
    gd     = guide_d();

    difference() {
        union() {
            nz_box();
            // the card guide: a U channel on the back wall, open at the top
            translate([-gw / 2, wall_y - gd, NZ_FLOOR - EPS])
                cube([gw, gd + EPS, GUIDE_H + EPS]);
        }
        // the slot the card drops into.  Its floor is the nozzle floor.
        translate([-(CARD_W + 1) / 2, wall_y - slot, NZ_FLOOR])
            cube([CARD_W + 1, slot + EPS, GUIDE_H + 1]);
        // exit hole through the back wall and the guide's outer plate.  A
        // round horizontal hole sags at the crown and a sag on the guide
        // plate pokes into the slot and jams the card, so the top of the
        // hole is a 45 degree roof with a short flat bridge instead.
        translate([0, wall_y + NZ_WALL + EPS, SOCKET_Z]) rotate([90, 0, 0])
            linear_extrude(NZ_WALL + gd + 2 * EPS, convexity = 2)
                union() {
                    circle(d = EXIT_D);
                    t = EXIT_D / 2 * sin(45);              // 45 degree tangent point
                    polygon([[-t, t], [t, t], [t - (EXIT_D / 2 + 1 - t), EXIT_D / 2 + 1],
                             [-(t - (EXIT_D / 2 + 1 - t)), EXIT_D / 2 + 1]]);
                }
    }
}

module nozzle_v1() {
    oy        = nz_out_y();
    socket_od = SOCKET_ID + 2 * SOCKET_WALL;
    face_y    = -(oy / 2 + SOCKET_LEN);     // outer face of the socket
    wall_y    = nz_wall_y();

    difference() {
        union() {
            nz_box();
            // socket, filled solid down to the flange so its outside has no
            // overhang at all (overlaps the wall by half its thickness)
            hull() {
                translate([0, wall_y + NZ_WALL / 2, SOCKET_Z]) rotate([90, 0, 0])
                    cylinder(d = socket_od, h = SOCKET_LEN + NZ_WALL / 2);
                translate([-socket_od / 2, face_y, 0])
                    cube([socket_od, SOCKET_LEN + NZ_WALL / 2, NZ_FLOOR]);
            }
        }
        // press fit seat for the speed plate
        translate([0, face_y - EPS, SOCKET_Z]) rotate([-90, 0, 0])
            cylinder(d = SOCKET_ID + 0.2, h = SOCKET_SEAT + EPS);
        // flow hole behind the seat
        translate([0, face_y + SOCKET_SEAT, SOCKET_Z]) rotate([-90, 0, 0])
            cylinder(d = SOCKET_THRU, h = SOCKET_LEN + NZ_WALL + 2 * EPS);
    }
}

module nozzle() { if (NOZZLE_V == 2) nozzle_v2(); else nozzle_v1(); }


/* ==========================================================================
   PART 5a — SPEED CARD  (for nozzle v2)
   A flat card with the hole in it and a T head on top.  The head is the
   datum: it sits on top of the guide, so every card hangs at the same height
   and the hole is always inside the 44 mm exit.  Pressure presses the card
   against the guide's outer plate; the head covers the mouth of the slot.
   Prints lying on its face, head sticking up, no supports.  The number is
   cut into the top of the head so it reads while the card is in.
   ========================================================================== */
module card(hole_d = 22, label = "12") {
    body_h = GUIDE_H - 0.5;                              // never bottoms out
    hole_y = body_h - (NZ_FLOOR + GUIDE_H - SOCKET_Z);   // hole on the exit axis
    size   = (len(label) > 2) ? 4 : 5;
    assert(hole_d <= EXIT_D - 4,
           str("Card ", label, " needs a ", hole_d,
               " mm hole, bigger than the exit.  Raise EXIT_D."));
    difference() {
        union() {
            linear_extrude(CARD_T) rrect([CARD_W, body_h + EPS], 2, center = false);
            translate([(CARD_W - CARD_HEAD_W) / 2, body_h, 0])      // the head
                cube([CARD_HEAD_W, CARD_HEAD_H, CARD_HEAD_D]);
        }
        if (hole_d > 0)
            translate([CARD_W / 2, hole_y, 0]) bore(hole_d, CARD_T);
        // the number, cut into the top face of the head
        translate([CARD_W / 2, body_h + CARD_HEAD_H + EPS, CARD_HEAD_D / 2])
            rotate([90, 0, 0])
                linear_extrude(PLATE_TEXT_D + EPS)
                    text(label, size = size, halign = "center", valign = "center");
    }
}


/* ==========================================================================
   PART 5 — SPEED PLATES
   Big hole = more air = faster.  Small hole = slower.
   The flange stops the plate going in too far and gives you something to pull
   on; the tab carries the number.  Prints flange down, number up, no supports.
   ========================================================================== */
// Tenths of a millimetre: a whole millimetre is 7% of the slow plates'
// hole, about 1.4 s at 18 s, and 17 s and 17.5 s would print the same.
function plate_hole(t) = round(10 * MAGIC / t) / 10;
function plate_label(t) = (t == floor(t)) ? str(floor(t)) : str(t);
// same rounding, any magic: the chart must print exactly what a card drills
function chart_hole(m, t) = round(10 * m / t) / 10;
// "24.2", always one decimal, no float noise ("24.199999")
function fmt1(x) = str(floor(round(10 * x) / 10), ".", round(10 * x) % 10);

module plate_flange_2d() {
    hull() {
        circle(d = PLATE_FLANGE_D);
        translate([0, PLATE_TAB_Y]) rrect([PLATE_TAB_W, PLATE_TAB_H], 4, center = true);
    }
}

module speed_plate(hole_d = 22, label = "12") {
    size = (len(label) > 2) ? 6 : 10;
    assert(hole_d <= SOCKET_THRU - 4,
           str("Plate ", label, " needs a ", hole_d,
               " mm hole, bigger than the nozzle lets through.  Raise SOCKET_THRU."));
    difference() {
        union() {
            linear_extrude(PLATE_FLANGE_T) plate_flange_2d();
            cylinder(d = PLATE_OD, h = PLATE_BOSS_T - PLATE_LEAD);
            translate([0, 0, PLATE_BOSS_T - PLATE_LEAD - EPS])            // lead-in
                cylinder(d1 = PLATE_OD, d2 = PLATE_OD - 2 * PLATE_LEAD,
                         h = PLATE_LEAD + EPS);
        }
        if (hole_d > 0) bore(hole_d, PLATE_BOSS_T);
        // the number, mirrored and cut into the bed face
        translate([0, PLATE_TAB_Y, -EPS])
            linear_extrude(PLATE_TEXT_D + EPS)
                mirror([1, 0])
                    text(label, size = size, halign = "center", valign = "center");
    }
}

// One orifice part of whichever kind the nozzle takes.
module orifice(hole_d, label) {
    if (NOZZLE_V == 2) card(hole_d, label); else speed_plate(hole_d, label);
}

// Lay a list of target times out on the bed (2 columns of cards or 3 of
// plates fit a 220 mm bed).
module orifice_set(times) {
    cols    = (NOZZLE_V == 2) ? 2 : 3;
    pitch_x = (NOZZLE_V == 2) ? CARD_HEAD_W + 6 : PLATE_FLANGE_D + 6;
    pitch_y = (NOZZLE_V == 2) ? GUIDE_H + CARD_HEAD_H + 6
                              : PLATE_FLANGE_D / 2 + PLATE_TAB_Y + PLATE_TAB_H / 2 + 6;
    for (i = [0 : len(times) - 1])
        translate([(i % cols) * pitch_x, -floor(i / cols) * pitch_y, 0])
            orifice(plate_hole(times[i]), plate_label(times[i]));
}

// Step 8b: time these three, then work out your magic number.
module orifice_test() {
    cols    = (NOZZLE_V == 2) ? 2 : 3;
    pitch_x = (NOZZLE_V == 2) ? CARD_HEAD_W + 6 : PLATE_FLANGE_D + 6;
    pitch_y = (NOZZLE_V == 2) ? GUIDE_H + CARD_HEAD_H + 6 : PLATE_FLANGE_D + PLATE_TAB_Y;
    for (i = [0 : 2])
        translate([(i % cols) * pitch_x, -floor(i / cols) * pitch_y, 0])
            orifice([15, 22, 30][i], str([15, 22, 30][i], "mm"));
}


/* ==========================================================================
   PART 6 — PLATE RACK
   Goes into impound with the craft as spare parts, so the plates cannot get
   mixed up.  Numbers read from above.  Prints flat, no supports.
   ========================================================================== */
// labels = undef: the speed-card rack, numbered RACK_T0 upward (unchanged).
// labels = a list: the same rack with those labels and as many slots —
// rack_aux below uses it for the zero + test cards.
module plate_rack(labels = undef) {
    pair  = (NOZZLE_V == 2);      // cards: a pair of thin fins per slot, spaced
                                  // so the heads sit side by side above them
    n     = is_undef(labels) ? RACK_N : len(labels);
    pitch = RACK_PITCH;
    span  = RACK_FIN_T + RACK_SLOT_W + (pair ? RACK_FIN_T : 0);
    off   = pair ? (pitch - span) / 2 : 0;
    len_x = pair ? n * pitch : n * pitch + RACK_FIN_T;
    dep_y = RACK_DEPTH + RACK_LABEL;

    // base
    linear_extrude(RACK_BASE_T) rrect([len_x, dep_y], 4);
    // fins and numbers
    for (i = [0 : n - 1]) {
        x     = i * pitch + off;
        label = is_undef(labels) ? plate_label(RACK_T0 + i * RACK_STEP)
                                 : labels[i];
        translate([x, RACK_LABEL, RACK_BASE_T - EPS])
            cube([RACK_FIN_T, RACK_DEPTH, RACK_FIN_H]);
        if (pair)
            translate([x + RACK_FIN_T + RACK_SLOT_W, RACK_LABEL, RACK_BASE_T - EPS])
                cube([RACK_FIN_T, RACK_DEPTH, RACK_FIN_H]);
        translate([x + RACK_FIN_T + RACK_SLOT_W / 2, RACK_LABEL / 2, RACK_BASE_T - EPS])
            raised_text(label, pair ? ((len(label) > 2) ? 3.5 : 5)
                                    : ((len(label) > 2) ? 4 : 6), 0.8 + EPS);
    }
    if (!pair)                    // plates: one shared fin closes the last slot
        translate([n * pitch, RACK_LABEL, RACK_BASE_T - EPS])
            cube([RACK_FIN_T, RACK_DEPTH, RACK_FIN_H]);
}

// the zero card and the three calibration cards get their own rack, so the
// whole card family goes to impound sorted and nothing rides loose
module rack_aux() { plate_rack(RACK_AUX_LABELS); }


/* ==========================================================================
   PART 6b — CALIBRATION CHART
   An engraved PLA tablet of hole size against target time, one column per
   surface.  Rule 2a: nothing comes into the track area after impound, so
   the chart goes to impound WITH the craft — paper gets lost or wet, a PLA
   tablet rides in the box.  PRINT TWO (one is a spare; spares are legal
   impound items).  Prints flat; the text is engraved into the TOP face and
   is NOT mirrored, unlike speed_plate, which engraves its bed face.
   ========================================================================== */
module chart_plate() {
    times = [for (t = [CHART_T0 : CHART_STEP : CHART_T1]) t];
    nr    = len(times);
    ns    = len(CHART_MAGICS);
    w     = 2 * CHART_MARGIN + CHART_COL0 + ns * CHART_COL;
    // rows from the top: title, surface names, magics, nr data rows,
    // two footer lines
    h     = 2 * CHART_MARGIN + (nr + 5) * CHART_ROW;
    assert(w <= 250 && h <= 250,
           str("chart_plate is ", w, " x ", h,
               " mm: too big for the bed.  Fewer surfaces or a bigger CHART_STEP."));
    for (s = CHART_MAGICS)
        echo(str("CHART    ", s[0], "  magic ", s[1], "  rev ", CHART_REV,
                 "  (d mm = ", s[1], " / TT)"));

    cx0 = CHART_MARGIN + CHART_COL0 / 2;                        // TT column
    function cxs(j) = CHART_MARGIN + CHART_COL0 + (j + 0.5) * CHART_COL;
    function ry(r)  = h - CHART_MARGIN - (r + 0.5) * CHART_ROW; // row r, top down

    difference() {
        linear_extrude(CHART_TAB_T) rrect([w, h], 3);
        // all the text, cut into the top face
        translate([0, 0, CHART_TAB_T - CHART_TEXT_D])
            linear_extrude(CHART_TEXT_D + EPS) {
                translate([w / 2, ry(0)])
                    text(str("HOVERCRAFT B  rev ", CHART_REV), size = 5,
                         halign = "center", valign = "center");
                translate([cx0, ry(1)])
                    text("TT s", size = CHART_CELL_S,
                         halign = "center", valign = "center");
                translate([cx0, ry(2)])
                    text("d mm", size = CHART_CELL_S,
                         halign = "center", valign = "center");
                for (j = [0 : ns - 1]) {
                    translate([cxs(j), ry(1)])
                        text(CHART_MAGICS[j][0], size = CHART_CELL_S,
                             halign = "center", valign = "center");
                    translate([cxs(j), ry(2)])
                        text(str("M=", CHART_MAGICS[j][1]), size = CHART_CELL_S,
                             halign = "center", valign = "center");
                }
                for (i = [0 : nr - 1]) {
                    translate([cx0, ry(3 + i)])
                        text(plate_label(times[i]), size = CHART_CELL_S,
                             halign = "center", valign = "center");
                    for (j = [0 : ns - 1])
                        translate([cxs(j), ry(3 + i)])
                            text(fmt1(chart_hole(CHART_MAGICS[j][1], times[i])),
                                 size = CHART_CELL_S,
                                 halign = "center", valign = "center");
                }
                translate([w / 2, ry(3 + nr)])
                    text("d (mm) = M / TT", size = CHART_CELL_S,
                         halign = "center", valign = "center");
                translate([w / 2, ry(4 + nr)])
                    text("run2: d2 = d1 x t1 / TT", size = CHART_CELL_S,
                         halign = "center", valign = "center");
            }
        // rules under the header block and above the footer
        for (yy = [ry(2) - CHART_ROW / 2, ry(2 + nr) - CHART_ROW / 2])
            translate([CHART_MARGIN, yy - 0.4, CHART_TAB_T - CHART_TEXT_D])
                cube([w - 2 * CHART_MARGIN, 0.8, CHART_TEXT_D + EPS]);
    }
}


/* ==========================================================================
   PART 7 — NICKEL TRAY   (print TWO; they are symmetrical)
   The rules forbid tape and glue on the nickels and forbid opening the rolls,
   so the walls — and the snap-on retainers below — hold the cargo on.
   ========================================================================== */
// the detent recesses in a tray's or bin's +/-X outer walls that the snap
// legs click into.  Friction-only clips fail a shake test; this is a real
// mechanical catch.  Square top edge = the hold face (a 1 mm internal
// ceiling prints fine); 45-degree chamfer below eases the click.  The
// recess width also locates the retainer in Y, +/-0.2.
module ret_dimples(ox, w = BAR_W + 0.4) {
    for (s = [-1, 1])
        translate([s * ox / 2, 0, RET_SNAP_Z])
            scale([s, 1, 1])                       // local +x points outward
                rotate([90, 0, 0])
                    linear_extrude(w, center = true, convexity = 2)
                        polygon([[ EPS,            RET_DIMPLE_H / 2],
                                 [-RET_DIMPLE_D,   RET_DIMPLE_H / 2],
                                 [-RET_DIMPLE_D,  -RET_DIMPLE_H / 2],
                                 [ EPS,           -RET_DIMPLE_H / 2 - RET_DIMPLE_D]]);
}

// one snap leg with its nub, as a 2D profile: x across the part, y = the
// INSTALLED height.  The caller extrudes it to width.  Leg tip: 45-degree
// lead-in on the inner edge (rides over the wall), 1.5 mm pry flare on the
// outer (thumbnail removal).  Nub: 45-degree lead-in below; the hold face
// above defaults near-square — vertical shake cannot cam it open, a
// deliberate pry can.  That default suits parts printed on their side
// (tray_bar).  A part printed legs-UP must pass hold = RET_NUB: its hold
// face becomes an underside, and anything steeper than 45 degrees there
// is a one-layer overhang that droops into spaghetti.  `t` thins the leg
// for parts whose snap flex runs across layer adhesion (bin_lid).
module ret_leg_2d(xi, z_tip, z_top, hold = 0.15, t = RET_LEG_T) {
    xo = xi + t;
    polygon([[xi + 0.6, z_tip], [xo + 1.5, z_tip], [xo, z_tip + 3],
             [xo, z_top], [xi, z_top], [xi, z_tip + 0.6]]);
    polygon([[xi + EPS,     RET_SNAP_Z - RET_NUB_H / 2],
             [xi - RET_NUB, RET_SNAP_Z - RET_NUB_H / 2 + RET_NUB],
             [xi - RET_NUB, RET_SNAP_Z + RET_NUB_H / 2 - hold],
             [xi + EPS,     RET_SNAP_Z + RET_NUB_H / 2]]);
}

module nickel_tray() {
    ox = 2 * SLOT_ROLL_W + 3 * TRAY_WALL;
    oy = SLOT_ROLL_L + 2 * TRAY_WALL;
    h  = TRAY_FLOOR + TRAY_WALL_H;

    difference() {
        linear_extrude(h) rrect([ox, oy], 3, center = true);

        for (s = [-1, 1]) {
            // the roll slot
            translate([s * (SLOT_ROLL_W + TRAY_WALL) / 2, 0, TRAY_FLOOR])
                linear_extrude(TRAY_WALL_H + EPS)
                    rrect([SLOT_ROLL_W, SLOT_ROLL_L], 2, center = true);
            // floor holes: every gram off the craft is a gram the fan can lift
            if (TRAY_LIGHTEN)
                for (k = [-1, 0, 1])
                    translate([s * (SLOT_ROLL_W + TRAY_WALL) / 2, k * 26, 0])
                        bore(12, TRAY_FLOOR);
            // finger notches in the end walls, so you can lift a roll out
            for (e = [-1, 1])
                translate([s * (SLOT_ROLL_W + TRAY_WALL) / 2, e * oy / 2,
                           TRAY_FLOOR + TRAY_WALL_H])
                    rotate([90, 0, 0])
                        cylinder(d = 14, h = 2 * TRAY_WALL + 2 * EPS, center = true);
        }
        ret_dimples(ox);
    }
}


/* ==========================================================================
   PART 7b — TRAY BAR   (print TWO, one per tray, plus a spare)
   A 22.5 mm roll stands 8.5 mm proud of the 14 mm tray walls: pivoting
   about one end, the rising end clears the wall at ~9.5 degrees of tilt.
   This bar snaps across the tray at mid-span with its underside at
   RET_UNDER, capping the rise at ~3 mm — the roll cannot get out, and the
   end-wall finger notches stay clear (pop the bar, lift rolls as before).
   Drawn in PRINT orientation: lying on its side, layers through the legs,
   so snap flex loads the plastic in-plane, not across layer adhesion.
   ========================================================================== */
module tray_bar() {
    ox = 2 * SLOT_ROLL_W + 3 * TRAY_WALL;      // the tray's outer width
    xi = ox / 2 + RET_LEG_FIT;                 // leg inner face
    xo = xi + RET_LEG_T;
    linear_extrude(BAR_W, convexity = 4) {
        translate([-xo, RET_UNDER]) square([2 * xo, BAR_T]);   // bridge plate
        for (s = [-1, 1]) scale([s, 1])
            ret_leg_2d(xi, BAR_LEG_END, RET_UNDER + EPS);
    }
}


/* ==========================================================================
   PART 8 — COIN BIN
   One slot for the half roll, one for the 20 loose nickels standing on edge.
   The loose slot is cut to the coin stack (SLOT_LOOSE_L): the old shared
   50 mm slot left 11 mm of slop for the coins to fan and climb in.  The
   half-roll slot stays 50 — crimped lengths vary, and a captive roll
   rattling lengthwise costs nothing.  bin_lid below closes the top.
   ========================================================================== */
module coin_bin() {
    ox = 2 * SLOT_ROLL_W + 3 * TRAY_WALL;
    oy = SLOT_HALF_L + 2 * TRAY_WALL;
    h  = TRAY_FLOOR + TRAY_WALL_H;
    labels = ["1/2", "20"];

    difference() {
        union() {
            linear_extrude(h) rrect([ox, oy], 3, center = true);
            for (i = [0, 1])
                translate([(i == 0 ? -1 : 1) * (SLOT_ROLL_W + TRAY_WALL) / 2,
                           -oy / 2 + EPS, h - 7])
                    rotate([90, 0, 0]) raised_text(labels[i], 6, 0.8);
        }
        for (s = [-1, 1])
            translate([s * (SLOT_ROLL_W + TRAY_WALL) / 2, 0, TRAY_FLOOR])
                linear_extrude(TRAY_WALL_H + EPS)
                    rrect([SLOT_ROLL_W, s > 0 ? SLOT_LOOSE_L : SLOT_HALF_L],
                          2, center = true);
        // floor bores like the trays': every gram off is lift margin.  A
        // 21.2 mm coin on edge spans a 10 mm hole with its contact points
        // 10 mm apart — stable.  The bin pocket floor is solid underneath.
        if (TRAY_LIGHTEN)
            for (s = [-1, 1], k = [-1, 1])
                translate([s * (SLOT_ROLL_W + TRAY_WALL) / 2, k * 12, 0])
                    bore(10, TRAY_FLOOR);
        ret_dimples(ox, LID_LEG_W + 0.4);
    }
}


/* ==========================================================================
   PART 8b — BIN LID   (print ONE, plus a spare)
   A snap-on windowed lid over both bin slots: coins stand on edge under a
   ceiling at RET_UNDER with ~1 mm of headroom, so nothing can flip, fan or
   jump.  The six 12 mm windows are smaller than a nickel, so the event
   supervisor counts the cargo through them — or pops the lid in two
   seconds.  Rims seat on the wall tops (no rock); the dimples hold it.
   bin_lid() is the PRINT orientation: plate on the bed, legs up, text
   engraved into the bed face (the fan_guard flip).  bin_lid_installed()
   is what the assembly shows.
   ========================================================================== */
module bin_lid_installed() {
    ox  = 2 * SLOT_ROLL_W + 3 * TRAY_WALL;
    oy  = SLOT_HALF_L + 2 * TRAY_WALL;
    xi  = ox / 2 + RET_LEG_FIT;
    xo  = xi + RET_LEG_T;
    top = RET_UNDER + LID_T;
    wx  = (SLOT_ROLL_W + TRAY_WALL) / 2;        // slot centres, +/-12.7

    difference() {
        union() {
            // plate
            translate([0, 0, RET_UNDER])
                linear_extrude(LID_T) rrect([2 * xo, oy], 3, center = true);
            // side rims, centred over the 2.4 mm side walls
            for (s = [-1, 1])
                translate([s * (ox / 2 - TRAY_WALL / 2) - LID_RIM_T / 2, -23,
                           RET_UNDER - 9])
                    cube([LID_RIM_T, 46, 9 + EPS]);
            // end tabs on the end-wall tops
            for (e = [-1, 1])
                translate([-6, e * (oy / 2 - TRAY_WALL / 2) - LID_RIM_T / 2,
                           RET_UNDER - 9])
                    cube([12, LID_RIM_T, 9 + EPS]);
            // snap legs.  Printed legs-up, so (a) the nub hold face is cut
            // at 45 degrees (hold = RET_NUB) — near-square would be an
            // unprintable one-layer overhang; the dimple ceiling still
            // stops it with ~0.2 mm free play — and (b) the legs are
            // thinned to 1.2 with a root gusset: their flex runs ACROSS
            // layer adhesion, unlike the on-side tray_bar, so this cuts
            // strain to ~0.44% and braces the sharp plate corner where
            // the bending moment peaks
            for (s = [-1, 1])
                scale([s, 1, 1]) rotate([90, 0, 0])
                    linear_extrude(LID_LEG_W, center = true, convexity = 4) {
                        ret_leg_2d(xi, 5.5, RET_UNDER + EPS, RET_NUB, 1.2);
                        polygon([[xi + EPS, RET_UNDER + EPS],
                                 [xi - 2,   RET_UNDER + EPS],
                                 [xi + EPS, RET_UNDER - 2]]);
                    }
        }
        // windows: none passes a nickel, all show the cargo
        for (yy = [-13, 0, 13]) translate([ wx, yy]) bore(LID_WIN_D, LID_T, RET_UNDER);
        for (yy = [-15, 0, 15]) translate([-wx, yy]) bore(LID_WIN_D, LID_T, RET_UNDER);
        // labels, engraved into the top face over each slot
        for (i = [0, 1])
            translate([(i == 0 ? -1 : 1) * wx, 20.5, top - 0.4])
                linear_extrude(0.4 + EPS)
                    text(["1/2", "20"][i], size = 5,
                         halign = "center", valign = "center");
    }
}

module bin_lid() {
    // rotate, NOT mirror: a mirrored model prints the ENANTIOMER — a part
    // that can never be flipped back into the designed shape, with its
    // labels mirror-imaged however you turn it.  rotate([180,0,0]) negates
    // z just the same but is a rigid motion, and it lands the engraving on
    // the bed face already mirror-imaged, which the flip onto the bin undoes.
    translate([0, 0, RET_UNDER + LID_T]) rotate([180, 0, 0]) bin_lid_installed();
}


/* ==========================================================================
   PART 9 — TIMING STICK STAND
   The dowel has to stand dead straight at the very front of the craft, with
   nothing on the craft in front of it.  The base glues into its pocket,
   its wide plate stopping on the pocket's shoulders 4 mm short of the deck
   edge; the narrower arm with the tower hangs out over the skirt.  All the bracing points backwards.  Prints base down, no supports.
   ========================================================================== */
// +Y is the front, same as the deck.  y = STAND_Y / 2 is the deck edge.
function stand_tower_y() = STAND_Y / 2 + STAND_OVERHANG;

// base outline: the full-width plate stops STAND_STOP short of the deck
// edge, and a STAND_NECK wide arm runs on out to the tower.  The pocket is
// this same outline, so the deck keeps a shoulder each side of the neck.
module stand_base_2d() {
    arm = STAND_OVERHANG + TOWER_D / 2;
    y0  = -STAND_Y / 2;
    y1  = STAND_Y / 2 - STAND_STOP;               // end of the wide plate
    translate([0, (y0 + y1) / 2]) rrect([STAND_X, y1 - y0], 4, center = true);
    translate([0, (y1 - 6 + STAND_Y / 2 + arm) / 2])
        rrect([STAND_NECK, STAND_Y / 2 + arm - (y1 - 6)], 4, center = true);
}

module stick_stand() {
    ty  = stand_tower_y();

    difference() {
        union() {
            linear_extrude(STAND_T) stand_base_2d();
            translate([0, ty, 0]) cylinder(d = TOWER_D, h = TOWER_H);
            // three ribs, all pointing backwards (-Y)
            for (a = [-40, 0, 40])
                translate([0, ty, STAND_T - EPS]) rotate([0, 0, a])
                    rotate([90, 0, 90])
                        linear_extrude(2.4, center = true)
                            polygon([[0, 0], [-24, 0], [0, TOWER_H - STAND_T - 4]]);
        }
        translate([0, ty, 0])
            bore(DOWEL_D + DOWEL_FIT, TOWER_H, 1.5);
        // M3 set screw from the back, self-tapped: "1/4 inch" dowels run
        // from 6.0 to 6.35 mm and the stick must not wobble 24 cm up.
        // M3_TAP_H, not M3_TAP: this hole is horizontal in the print and
        // comes out 0.3-0.4 small; at 2.6 it printed below the M3 minor
        // diameter and the screw reamed solid plastic (tower crack risk)
        translate([0, ty, TOWER_H - 8]) rotate([90, 0, 0])
            cylinder(d = M3_TAP_H, h = TOWER_D);
    }
}


/* ==========================================================================
   PART 10 — SWITCH BRACKET
   The toggle switch's nut would crush foam board and its body would hang
   down inside the skirt, so it mounts through this panel instead.  Glue the
   base to the deck with the panel facing the back of the craft and the
   switch body pointing forward.  Prints base down, no supports (the panel
   hole is a short bridge).
   ========================================================================== */
module switch_bracket() {
    difference() {
        union() {
            // base, under the switch body
            linear_extrude(SW_BASE_T)
                rrect([SW_FACE_W, SW_BASE_D + SW_FACE_T], 3, center = false);
            // panel, at y = 0
            cube([SW_FACE_W, SW_FACE_T, SW_FACE_H]);
            // gussets
            for (x = [0, SW_FACE_W - 2.4])
                translate([x, SW_FACE_T - EPS, SW_BASE_T - EPS])
                    rotate([90, 0, 90])
                        linear_extrude(2.4)
                            polygon([[0, 0], [SW_BASE_D - 4, 0], [0, SW_FACE_H - SW_BASE_T - 4]]);
        }
        // panel hole with a 45-degree teardrop roof (apex up): a 12.8 mm
        // round horizontal bore sags 0.3-0.5 at the crown and can pinch the
        // 12.2 mm switch bushing.  The M12 nut flange covers the corners.
        translate([SW_FACE_W / 2, SW_FACE_T + EPS, SW_HOLE_Z]) rotate([90, 0, 0])
            linear_extrude(SW_FACE_T + 2 * EPS, convexity = 2)
                union() {
                    circle(d = SW_HOLE);
                    polygon([[-SW_HOLE / 2 * cos(45), SW_HOLE / 2 * cos(45)],
                             [ SW_HOLE / 2 * cos(45), SW_HOLE / 2 * cos(45)],
                             [0, SW_HOLE / 2 * sqrt(2)]]);
                }
    }
}


/* ==========================================================================
   PART 12 — BATTERY MOUNTS
   The holders were foam-taped to the deck: a shake-off risk (rule 4j,
   anything falling off = x0.8) and a slow battery swap.  These frames glue
   to the deck over the engraved outline boxes — nothing pierces the
   airtight skin, and holders count as "wires" under rule 3b, so they stay
   on the craft at impound while the cells lift out.  A strip of foam tape
   goes INSIDE each aa4 frame, under the holder, preloading it up into the
   hooks: zero rattle.  Side walls stay low so every cell label shows
   (rule 3f-ii).
   ========================================================================== */

// one snap frame per 4xAA holder; print TWO, one STL serves both rear
// corners.  Load: hook the holder's -Y top edge under the two lip tabs,
// press the +Y edge down past the two snap arms.
module aa4_mount() {
    ix = AA4_SIZE[0] + 2 * BATT_FIT;        // 62.6 cavity
    iy = AA4_SIZE[1] + 2 * BATT_FIT;        // 57.6
    ox = ix + 2 * BATT_WALL;
    oy = iy + 2 * BATT_WALL;
    hz = AA4_H + BATT_FOAM;                 // hook underside: the holder's
                                            // top edge, riding on the foam
    ht = hz + 1.5;                          // -Y wall and arm tops

    // fence ring + the tall -Y wall, with the wire notch cut out of it
    difference() {
        union() {
            linear_extrude(BATT_FENCE_H, convexity = 4) difference() {
                rrect([ox, oy], 2, center = true);
                square([ix, iy], center = true);
            }
            translate([-ox / 2, -oy / 2, 0]) cube([ox, BATT_WALL, ht]);
        }
        // wire notch, centred: the twin 18 AWG runs leave over the fence
        translate([-BATT_NOTCH_W / 2, -oy / 2 - EPS, BATT_FENCE_H])
            cube([BATT_NOTCH_W, BATT_WALL + 2 * EPS, ht]);
    }
    // lip tabs on the -Y wall top: true 45-degree underside from the wall
    // face at ht - BATT_LIP up to the 2 mm tip, so the holder's top edge
    // (at ~hz on its foam) wedges under it and the preload self-tightens
    for (s = [-1, 1])
        translate([s * 17 - BATT_LIP_W / 2, -iy / 2, 0])
            rotate([90, 0, 90]) linear_extrude(BATT_LIP_W)
                polygon([[0, ht - BATT_LIP], [BATT_LIP, ht], [0, ht]]);
    // +Y snap arms: a tall thin wall segment each side whose top strip is
    // a SIDEWAYS cantilever — rooted outboard, slit free below, tip toward
    // the middle with the hook on it.  The blade bends about a vertical
    // axis, so snap flex loads the plastic in-plane (the tray_bar rule);
    // the 1.2 mm slit roof is a short bridge the printer handles.  Hook:
    // 45-degree underside (printable), 0.5 mm hold face at hz, then a cam
    // ramp the holder's rim rides to spread the arm ~0.7 mm on the way in
    for (s = [-1, 1]) scale([s, 1, 1]) {
        difference() {
            translate([BATT_ARM_TIP, iy / 2, 0])
                cube([ix / 2 - 1 - BATT_ARM_TIP, BATT_ARM_T, ht]);
            translate([BATT_ARM_TIP - EPS, iy / 2 - EPS, BATT_ARM_Z - 1.5])
                cube([BATT_ARM_ROOT - BATT_ARM_TIP + EPS,
                      BATT_ARM_T + 2 * EPS, 1.5]);
        }
        translate([BATT_ARM_TIP, 0, 0]) rotate([90, 0, 90]) linear_extrude(5)
            polygon([[iy / 2 + 0.4,       hz - BATT_HOOK - 0.4],
                     [iy / 2 - BATT_HOOK, hz],
                     [iy / 2 - BATT_HOOK, hz + 0.5],
                     [iy / 2 + 0.4,       ht]]);
    }
    // glue flange: -Y and +/-X only — the switch bracket base sits 1.6 mm
    // off the +Y face.  Open floor, so the engraved deck mark stays
    // visible for glue-up
    linear_extrude(BATT_FLANGE_T) difference() {
        intersection() {
            rrect([ox + 2 * BATT_FLANGE, oy + 2 * BATT_FLANGE], 3, center = true);
            translate([0, -BATT_FLANGE])
                square([ox + 2 * BATT_FLANGE, oy + 2 * BATT_FLANGE], center = true);
        }
        square([ix, iy], center = true);
    }
}

// the 2xAA is the trim weight, so it rides a slide tray: +/-15 mm of
// travel along Y in TRIM_PITCH steps.  Two drop-in fences (next module)
// bracket the holder — the rigid one sets the station, the spring one
// preloads it.  Trim change: pop the spring fence, move holder and rigid
// fence a station, re-seat.  Under 15 s, tool-free, and the station
// number goes on the calibration chart.
module aa2_tray() {
    ix = AA2_SIZE[0] + 2 * BATT_FIT;              // 59.1 between the walls
    iy = AA2_SIZE[1] + TRIM_TRAVEL + 4;           // 66.4: travel + 2 fences + slack
    ox = ix + 2 * BATT_WALL;
    oy = iy + 2 * BATT_WALL;
    wh = AA2_H + 1.0;                             // 15.6: holder + foam strip
    ht = wh + BATT_LIP;                           // lip chamfer tops out here
    // groove centres: 6 stations per end at |y| = 5.5 + 5k.  The 2.7 inset
    // is load-bearing: a facing pair then spans 11 + 5n mm, and 36 is on
    // that grid = holder stack 34.0 (32.4 + two half-plates) + 2.0 for the
    // bow leaf, which sits 3.0 proud — so EVERY trim position seats the
    // spring 1.0 mm compressed.  Real preload, not a loose fit.
    sta = [for (k = [0 : 5]) iy / 2 - 2.7 - k * TRIM_PITCH];

    difference() {
        union() {
            // side walls, full height, with the holder-retaining lip as an
            // integral prism: 45-degree underside from the wall's inner
            // face at wh up to the 2 mm tip at ht — prints support-free
            for (s = [-1, 1]) scale([s, 1, 1])
                translate([ix / 2, oy / 2, 0]) rotate([90, 0, 0])
                    linear_extrude(oy, convexity = 4)
                        polygon([[0, 0], [BATT_WALL, 0], [BATT_WALL, ht],
                                 [-BATT_LIP, ht], [0, wh]]);
            // low end walls: fence backstop and frame stiffness
            for (e = [-1, 1])
                translate([-ox / 2, e * (iy / 2 + BATT_WALL / 2) - BATT_WALL / 2, 0])
                    cube([ox, BATT_WALL, BATT_FENCE_H]);
            // glue flange all round, open floor so the engraved deck mark
            // stays visible for glue-up
            linear_extrude(BATT_FLANGE_T) difference() {
                rrect([ox + 8, oy + 8], 3, center = true);
                square([ix, iy], center = true);
            }
        }
        // fence stations: a vertical groove in each wall's inner face (the
        // fence's side tabs ride in it, full height)...
        for (e = [-1, 1], k = [0 : 5], s = [-1, 1]) scale([s, 1, 1])
            translate([ix / 2 - EPS, e * sta[k] - TRIM_SLOT_W / 2, -EPS])
                cube([TRIM_SLOT_D + EPS, TRIM_SLOT_W, ht + 2 * EPS]);
        // ...and a 2.4 mm break in the lip above it, so the fence plate
        // drops past the lips into its station
        for (e = [-1, 1], k = [0 : 5], s = [-1, 1]) scale([s, 1, 1])
            translate([ix / 2 - BATT_LIP / 2 - 0.1, e * sta[k], ht])
                cube([BATT_LIP + 0.6, 2.4, 2 * (ht - wh) + EPS], center = true);
        // wire letterbox through the +X wall, 45-degree gable roof so it
        // prints without support (the teardrop precedent)
        translate([ix / 2 - EPS, 0, 0]) rotate([90, 0, 90])
            linear_extrude(BATT_WALL + 2 * EPS)
                polygon([[-6, 3], [6, 3], [6, 7], [0, 13], [-6, 7]]);
    }
    // station numbers 1..6 from each end, RAISED 0.4 on the -X wall's
    // outer face.  Raised, not engraved: an engraving here would sit over
    // the 1.0 mm groove in the 1.6 mm wall and leave a 0.2 mm web — half
    // an extrusion line, which prints as pinholes
    for (e = [-1, 1], k = [0 : 5])
        translate([-ox / 2 + EPS, e * sta[k], 9])
            rotate([90, 0, -90]) linear_extrude(0.4 + EPS)
                text(str(k + 1), size = 5, halign = "center", valign = "center");
}

// one drop-in fence for the aa2 tray, drawn as printed AND as installed
// (standing, extruded up — layer lines vertical, so the spring leaf
// flexes in-plane, never across layer adhesion).  Plate centred on the
// origin, thickness along +Y.  End tabs ride the wall grooves, stopping
// TRIM_FIT short of the groove floors so the fence drops in by hand;
// 0.15 mm crush ribs on the tab faces take out the station slop.
// spring=true swaps in a 0.8 mm bow leaf, 3 mm proud on +Y: the tray's
// stations are laid out so a facing pair spans 36 mm = holder stack
// (34.0) + 2.0 for the bow, which therefore seats 1.0 mm compressed —
// real preload at every trim position.  aa2_fences prints the pair.
module aa2_fence(spring = false) {
    hx = (AA2_SIZE[0] + 2 * BATT_FIT) / 2;        // 29.55, the wall faces
    th = 1.6;
    ba = 24;                                      // bow half-span
    bw = 3;                                       // bow proud of the plate
    linear_extrude(14, convexity = 4) {
        square([2 * hx - 0.2, th], center = true);
        for (s = [-1, 1]) scale([s, 1]) {
            // tab into the groove, with two crush ribs on its faces
            translate([hx + (TRIM_SLOT_D - TRIM_FIT) / 2 - 0.1, 0])
                square([TRIM_SLOT_D - TRIM_FIT + 0.2, th], center = true);
            for (f = [-1, 1])
                translate([hx + TRIM_SLOT_D / 2, f * (th / 2 - 0.15)]) circle(d = 0.6);
        }
        if (spring)
            polygon(concat(
                [for (xx = [-ba : 2 : ba])
                    [xx, th / 2 - 0.8 + bw * (1 - pow(xx / ba, 2))]],
                [for (xx = [ba : -2 : -ba])
                    [xx, th / 2 + bw * (1 - pow(xx / ba, 2))]]));
    }
}

module aa2_fences() {
    translate([0, -6, 0]) aa2_fence(false);
    translate([0,  6, 0]) aa2_fence(true);
}

// C-saddles for the twin 18 AWG runs: glue 2-3 along each holder-to-
// switch run.  A flapping wire run is a x0.8 "fell off" waiting to
// happen, and prop bait.  The 45-degree hooks leave a 3 mm mouth — under
// the 3.5 mm wire, so each wire clicks past (the hooks flex ~0.25 mm a
// side) and cannot bounce back out.  Both hook faces print at 45.
module wire_clips() {
    for (i = [0 : WCLIP_N - 1])
        translate([i * 16, 0, 0]) rotate([90, 0, 0])
            linear_extrude(10, center = true, convexity = 4)
                for (s = [-1, 1]) scale([s, 1]) {
                    square([6, 1.2]);                                   // half flange
                    translate([WCLIP_W / 2, 0])
                        square([1.2, 1.2 + WCLIP_H]);                   // wall
                    polygon([[WCLIP_W / 2 + 1.2, 1.2 + WCLIP_H],        // hook
                             [1.5, 1.2 + WCLIP_H + 3.7],
                             [1.5, 1.2 + WCLIP_H + 2.5],
                             [WCLIP_W / 2, 1.2 + WCLIP_H]]);
                }
}


/* ==========================================================================
   WEAR PAD
   Prints flat.  Duct-tape it to the outside centre of the bag, chamfered
   side towards the track, then cut the six air holes in a ring 3 cm out
   from its edge, as the workshop says.
   ========================================================================== */
module wear_pad() {
    cylinder(d1 = WEAR_PAD_D - 2 * WEAR_PAD_CH, d2 = WEAR_PAD_D, h = WEAR_PAD_CH + EPS);
    translate([0, 0, WEAR_PAD_CH]) cylinder(d = WEAR_PAD_D, h = WEAR_PAD_T - WEAR_PAD_CH);
}


/* ==========================================================================
   BONUS — MARKING TEMPLATES
   Lay these on the foam board and trace round the inside.  Saves hunting for
   a bowl exactly 12 cm across.
   ========================================================================== */
module templates() {
    linear_extrude(2, convexity = 4) {
        difference() { circle(d = DECK_HOLE_D + 14); circle(d = DECK_HOLE_D); }
        // slot template below the ring, so the pair fits a 220 mm bed
        translate([0, -(DECK_HOLE_D / 2 + 7 + SLOT_Y / 2 + 7 + 6)])
            difference() {
                rrect([SLOT_X + 14, SLOT_Y + 14], 2, center = true);
                rrect([SLOT_X, SLOT_Y], 2, center = true);
            }
    }
}


/* ==========================================================================
   PART 11 — PRINTED DECK  (optional, replaces the foam board)
   Four quarters, each about 167 x 172 mm, so each one fits the P1S bed —
   with the fan duct and the bottom guard BUILT IN.  The airflow is one
   monolithic piece: fan, straight 136 mm duct, guard grid, bag.  No glued
   flange anywhere; only the fan_cage still bolts on top.

   Modelled the way it sits on the craft: top face at z = 0, ribs hanging
   below, duct rising to z = 50.  deck_quarter() prints it AS INSTALLED,
   raised so the lip bottom (deck_bed_z) is the bed: the lip's ridge is
   the adhesion foot, the full-depth ribs reach the bed, the skin bridges
   the rib cells (light-test it), and the guard grid prints on breakaway
   support rings that snap out through the bore.  Slicer auto-support OFF.

   How the four pieces lock together:
   - Jigsaw tabs in the skin, out in the rib-free edge band, lock the
     joints flat.
   - Vertical dovetail keys (DT_*): two on each half-joint, eight in all.
     The four next to the duct run from the bed to just under the rim, so
     they also hold the duct seams; the other four are deck depth.  Each
     is a solid block straddling the joint with the tail's outline cut
     straight through it, skin included, so the quarters are put together
     by lowering one onto the other — nothing to reach underneath, no
     screws, no ribs in the way — and cannot then pull apart sideways.
   - Each piece also has a tall seam rib along its two inner edges; the
     ribs of neighbouring pieces sit back to back and are glued.
   - The fan_cage bolts across all four duct tops: it spans all 6 lugs
     and holds the top of the duct round.
   - The parts glued over the joints splice them: the nozzle flange the
     back joint, the stick stand the front joint, the nickel trays the
     side joints.
   - CA in the dovetails and on the rib pairs, a bead down each duct seam
     inside the bore, and clear packing tape along each joint underneath
     make it airtight.  The deck is the lid of the air cushion.

   Build order: see the file header, and ENGINEERING_CHECK §9.  Print
   deck_fit_test FIRST — the flip moves every fit from the tight first
   layer to the loose top surface, so SOCK_FIT / DECK_TAB_CLR get tuned
   DOWN, and DT_CLR checked on the duct-seam pair, on coupons, before any
   2-hour quarter.
   ========================================================================== */
function tray_size()  = [2 * SLOT_ROLL_W + 3 * TRAY_WALL, SLOT_ROLL_L + 2 * TRAY_WALL];
function bin_size()   = [2 * SLOT_ROLL_W + 3 * TRAY_WALL, SLOT_HALF_L + 2 * TRAY_WALL];
function deck_fan_clear() = TUBE_BORE / 2;         // ribs run in to the bore edge:
                                                   // under the duct wall and the
                                                   // guard's solid annulus they
                                                   // are its permanent print
                                                   // support
function slot_centre() = [0, -DECK_Y / 2 + SLOT_BACK];

// jigsaw tabs: position along the joint, and which side (+1 / -1) owns it.
// A knob can only go into its slot straight down (it is wider than its
// neck), so a tab must sit where nothing stands over the slot: in the edge
// band, where there are no ribs and the seam ribs have ended.  With sockets
// the band on x = 0 is taken by the stand pocket (front) and the nozzle
// pocket (back), and those pockets lock that joint better than a tab would,
// so it has none; the y = 0 pair moves out past the tray pockets.
DECK_TABS_V = DECK_SOCKETS ? []
            : [[-(DECK_Y / 2 - DECK_BAND / 2), -1], [DECK_Y / 2 - DECK_BAND / 2, 1]];   // joint x = 0
DECK_TABS_H = DECK_SOCKETS ? [[-(DECK_X / 2 - 10), 1], [DECK_X / 2 - 10, -1]]
            : [[-(DECK_X / 2 - DECK_BAND / 2), 1], [DECK_X / 2 - DECK_BAND / 2, -1]];   // joint y = 0

// the printed deck's edge: DECK_X x DECK_Y, R10 corners, each side bowed
// out by LIP_CROWN (a parabola: the middle on the line, the ends in), so
// the skirt's hem cord presses on the lip all the way round (see LIP_CROWN).
// Everything that follows the edge — skin, band, rib zone, lip — uses this.
module deck_edge_2d() {
    c = DECK_LIP ? LIP_CROWN : 0;
    // the region under one bowed side of span L at y = H / 2
    module side(L, H) {
        n = 64;
        polygon(concat([for (i = [0 : n]) let(x = -L / 2 - 20 + i * (L + 40) / n)
                            [x, H / 2 - c * pow(2 * x / L, 2)]],
                       [[L, -H], [-L, -H]]));
    }
    if (c <= 0) rrect([DECK_X, DECK_Y], 10, center = true);
    else offset(r = 10) offset(delta = -10)
        intersection() {
            side(DECK_X, DECK_Y);
            mirror([0, 1]) side(DECK_X, DECK_Y);
            rotate(-90) side(DECK_Y, DECK_X);
            rotate(90)  side(DECK_Y, DECK_X);
        }
}

module deck_outline_2d() {
    difference() {
        deck_edge_2d();
        // the hole IS the duct bore: one straight 136 from prop to bag.
        // (DECK_HOLE_D = 130 stays for the foam path and the templates.)
        circle(d = TUBE_BORE);
        // with sockets the slot is smaller by the lip (see sock_lip_2d)
        translate(slot_centre())
            offset(delta = DECK_SOCKETS ? -(0.3 + SOCK_LIP) : 0)
                rrect([SLOT_X, SLOT_Y], 2, center = true);
    }
}

// one jigsaw tab on the joint line x = 0, sticking out towards -o * x
module deck_tab_2d(o) {
    r = DECK_TAB_D / 2;
    translate([-o * (r + 1.5), 0]) circle(r = r);                     // knob
    translate([o > 0 ? -(r + 1.5) : 0, -r * 0.5]) square([r + 1.5, r]); // neck
}

// one dovetail tail on the joint line x = 0, reaching across towards -o * x
module dt_tail_2d(o) {
    polygon([[o * EPS, -DT_NECK / 2], [o * EPS, DT_NECK / 2],
             [-o * DT_DEPTH, DT_TIP / 2], [-o * DT_DEPTH, -DT_TIP / 2]]);
}

// side s of the joint x = 0 (axis "V") or y = 0 (axis "H"), tabs and
// dovetail tails included, their sockets cut.  Every layer of a quarter is
// clipped by this, so tails and sockets run straight up through the whole
// part and the quarters can only be put together by lowering them.
module deck_side_2d(axis, s) {
    tabs = (axis == "V") ? DECK_TABS_V : DECK_TABS_H;
    keys = (axis == "V") ? DT_KEYS_V : DT_KEYS_H;
    // H is V turned 90 degrees: x -> y.  Positions along it map to -x.
    g = axis == "V" ? 1 : -1;
    rotate(axis == "V" ? 0 : 90)
        difference() {
            union() {
                translate([s > 0 ? 0 : -1000, -1000]) square([1000, 2000]);
                for (t = tabs) if (t[1] == s) translate([0, g * t[0]]) deck_tab_2d(s);
                for (k = keys) if (k[1] == s) translate([0, g * k[0]]) dt_tail_2d(s);
            }
            for (t = tabs) if (t[1] == -s)
                translate([0, g * t[0]]) offset(delta = DECK_TAB_CLR) deck_tab_2d(-s);
            for (k = keys) if (k[1] == -s)
                translate([0, g * k[0]]) offset(delta = DT_CLR) dt_tail_2d(-s);
        }
}

// the solid blocks the keys are cut in, straddling the joints: bed to the
// skin, or bed to just under the rim for the duct keys
module dt_blocks() {
    zb = deck_bed_z();
    for (k = DT_KEYS_V)
        translate([0, k[0], zb])
            linear_extrude((abs(k[0]) == DT_DUCT_R ? TUBE_H - TUBE_RIB_TOP : 0.01 - DECK_SKIN) - zb)
                square([DT_BLOCK[1], DT_BLOCK[0]], center = true);
    for (k = DT_KEYS_H)
        translate([k[0], 0, zb])
            linear_extrude((abs(k[0]) == DT_DUCT_R ? TUBE_H - TUBE_RIB_TOP : 0.01 - DECK_SKIN) - zb)
                square([DT_BLOCK[0], DT_BLOCK[1]], center = true);
}

module deck_quarter_2d(sx, sy) {
    intersection() {
        deck_outline_2d();
        deck_side_2d("V", sx);
        deck_side_2d("H", sy);
    }
}

// where ribs are allowed: inside the edge band, outside the guard ring
module deck_rib_zone_2d() {
    difference() {
        offset(delta = -DECK_BAND) deck_edge_2d();
        circle(r = deck_fan_clear());
        translate(slot_centre()) rrect([SLOT_X, SLOT_Y], 2, center = true);
    }
}

module deck_grid_2d() {
    h = DECK_CELL * sqrt(3) / 2;
    n = ceil(max(DECK_X, DECK_Y) / h);
    intersection() {
        deck_rib_zone_2d();
        union() {
            for (a = [0, 60, 120]) rotate(a)
                for (k = [-n : n]) translate([-500, k * h - DECK_RIB_W / 2]) square([1000, DECK_RIB_W]);
            // rim round every edge of the rib zone, closing the cells
            difference() { deck_rib_zone_2d(); offset(delta = -DECK_RIB_W) deck_rib_zone_2d(); }
        }
    }
}

module deck_mark_box_2d(c, size) {
    translate(c)
        difference() { square(size, center = true);
                       offset(delta = -DECK_MARK_W) square(size, center = true); }
}

module deck_marks_2d() {
    deck_mark_box_2d(AA2_POS, AA2_SIZE);
    for (s = [-1, 1]) deck_mark_box_2d([s * AA4_POS[0], AA4_POS[1]], AA4_SIZE);
    if (!DECK_SOCKETS) {                  // the pockets are the outlines otherwise
        for (s = [-1, 1]) deck_mark_box_2d([s * TRAY_X, 0], tray_size());
        deck_mark_box_2d(BIN_POS, bin_size());
        deck_mark_box_2d([SW_POS[0], SW_POS[1] + (SW_BASE_D + SW_FACE_T) / 2],
                         [SW_FACE_W, SW_BASE_D + SW_FACE_T]);
        deck_mark_box_2d([0, DECK_Y / 2 - STAND_Y / 2], [STAND_X, STAND_Y]);
        deck_mark_box_2d(slot_centre(), [nz_out_x() + 2 * NZ_FLANGE, nz_out_y() + 2 * NZ_FLANGE]);
        difference() { circle(d = FLANGE_OD); circle(d = FLANGE_OD - 2 * DECK_MARK_W); }
    }
}

// the lip: wall at the edge, ridge at the bottom, stepped chamfer above
// the ridge so the ridge prints without support (it is on the print's top
// side, the overhang faces the bed).  Includes the ridge outside the edge,
// so it is clipped by half-planes, not by the deck outline.
module deck_lip() {
    z0 = -DECK_BAND_SKIN;                    // top of the lip
    z1 = z0 - LIP_H;                         // bottom
    module ring(out, in) {
        difference() {
            offset(delta = out) deck_edge_2d();
            offset(delta = in)  deck_edge_2d();
        }
    }
    translate([0, 0, z1]) linear_extrude(LIP_H, convexity = 4) ring(0, -LIP_T);         // wall
    translate([0, 0, z1]) linear_extrude(LIP_RIDGE_H + EPS, convexity = 4) ring(LIP_RIDGE, -LIP_T); // ridge
    steps = 4;
    for (k = [1 : steps])                                                            // chamfer
        translate([0, 0, z1 + LIP_RIDGE_H + (k - 1) * LIP_RIDGE / steps])
            linear_extrude(LIP_RIDGE / steps + EPS, convexity = 4)
                ring(LIP_RIDGE * (1 - k / steps), -LIP_T);
}

module deck_tape_line_2d() {
    difference() {
        offset(delta = -DECK_TAPE_IN) deck_edge_2d();
        offset(delta = -(DECK_TAPE_IN + DECK_TAPE_W)) deck_edge_2d();
        if (DECK_SOCKETS) offset(delta = SOCK_FIT + SOCK_RIM + 0.5) sock_flat_2d();  // not through a pocket floor
        for (t = DECK_TABS_H) translate([t[0], 0]) square([14, 14], center = true);  // not through a tab
        for (t = DECK_TABS_V) translate([0, t[0]]) square([14, 14], center = true);
    }
}

// ---- sockets.  Footprints are the parts' own base outlines, in deck
// coordinates, taken from the same parameters the parts are drawn with.
module sock_tray_2d()    { for (s = [-1, 1]) translate([s * TRAY_X, 0]) rrect(tray_size(), 3, center = true); }
module sock_bin_2d()     { translate(BIN_POS) rrect(bin_size(), 3, center = true); }
module sock_stand_2d() {                              // base plate, incl. the arm off the edge
    translate([0, DECK_Y / 2 - STAND_Y / 2]) stand_base_2d();
}
module sock_bracket_2d() {                            // base, plus the panel's
    translate([SW_POS[0] - SW_FACE_W / 2, SW_POS[1]]) { // square corners
        rrect([SW_FACE_W, SW_BASE_D + SW_FACE_T], 3);
        square([SW_FACE_W, SW_FACE_T]);
    }
}
module sock_nozzle_2d() {
    translate(slot_centre())
        rrect([nz_out_x() + 2 * NZ_FLANGE, nz_out_y() + 2 * NZ_FLANGE], 4, center = true);
}
module sock_flat_2d() { sock_tray_2d(); sock_bin_2d(); sock_stand_2d(); sock_bracket_2d(); sock_nozzle_2d(); }

// the lip inside the nozzle's slot: 0.3 inside the nozzle's own slot edge so
// it never touches, SOCK_LIP wide, standing at deck-top height.  The frame
// pocket's floor bridges from the pocket wall to it.
module sock_lip_2d() {
    translate(slot_centre()) offset(delta = -0.3) rrect([SLOT_X, SLOT_Y], 2, center = true);
}

// pegs that stand up through the trays' floor holes, flush with the deck top
module sock_pegs() {
    if (TRAY_LIGHTEN)
        for (t = [-1, 1], s = [-1, 1], k = [-1, 0, 1])
            translate([t * TRAY_X + s * (SLOT_ROLL_W + TRAY_WALL) / 2, k * 26, -SOCK_D - EPS])
                cylinder(d = SOCK_PEG_D, h = SOCK_D + 2 * EPS);
}

// solid pads under every flat pocket: rim + floor, from the deck top down
module sock_pads() {
    translate([0, 0, -(SOCK_D + SOCK_FLOOR)])
        linear_extrude(SOCK_D + SOCK_FLOOR, convexity = 8)
            offset(delta = SOCK_FIT + SOCK_RIM) sock_flat_2d();
}

// everything that gets cut: the pockets, less the pegs.  (The fan ring and
// its pockets are gone: the duct and guard are part of the quarters now.)
module sock_cuts() {
    difference() {
        translate([0, 0, -SOCK_D]) linear_extrude(SOCK_D + 1, convexity = 8)
            difference() {
                offset(delta = SOCK_FIT) sock_flat_2d();
                sock_lip_2d();
            }
        sock_pegs();
    }
}

// ---- the integral fan duct.  Full rings, drawn in installed coordinates;
// deck_quarter_installed() clips them to its 90 degrees.  The shroud is the
// old fan_tube without the flange, rooted straight into the skin; the guard
// grid is the old fan_guard fused to the skin's underside; the supports are
// breakaway print scaffolding under the grid, snapped out through the bore.

module duct_tube_full() {
    od = TUBE_BORE + 2 * TUBE_WALL;
    difference() {
        union() {
            // shroud, rooted into the skin
            translate([0, 0, -DECK_SKIN])
                linear_extrude(TUBE_H + DECK_SKIN, convexity = 4)
                    difference() { circle(d = od); circle(d = TUBE_BORE); }
            // cage lugs: pad, cone, rib down to the deck (phased off the seams)
            for (i = [0 : LUG_N - 1]) rotate(LUG_PHASE + i * 360 / LUG_N) {
                translate([LUG_R, 0, TUBE_H - LUG_H - 3])
                    cylinder(d = LUG_D, h = LUG_H + 3);
                translate([LUG_R, 0, TUBE_H - LUG_H - 3 - LUG_D / 2 + EPS])
                    cylinder(d1 = 0, d2 = LUG_D, h = LUG_D / 2);
                translate([TUBE_BORE / 2 + TUBE_WALL - EPS, -1.2, -EPS])
                    cube([LUG_R + LUG_D / 2 - TUBE_BORE / 2 - TUBE_WALL, 2.4,
                          TUBE_H - LUG_H - 3 + 2 * EPS]);
            }
            // gussets tying the shroud to the skin, kept off the seams
            for (a = [GUARD_NUB_A : 45 : 359])
                rotate(a) translate([od / 2 - EPS, 0, -EPS]) rotate([90, 0, 0])
                    linear_extrude(2.4, center = true)
                        polygon([[0, 0], [10, 0], [0, 14]]);
        }
        for (i = [0 : LUG_N - 1]) rotate(LUG_PHASE + i * 360 / LUG_N)
            translate([LUG_R, 0, 0]) {
                bore(M3_CLEAR, LUG_H + EPS, TUBE_H - LUG_H);
                translate([0, 0, TUBE_H - NUT_T])
                    cylinder(d = NUT_AF / cos(30), h = NUT_T + EPS, $fn = 6);
            }
    }
}

// the guard grid, fused to the skin's underside.  The solid 67..75 annulus
// sits right under the shroud wall; GRID_SPOKES = 8 puts a spoke along each
// half-axis, so every quarter carries a 1.2 mm half-bar on each straight
// edge and the joined deck has full 2.4 mm bars across the seams.
module duct_guard_full() {
    translate([0, 0, -DECK_SKIN - GUARD_T])
        difference() {
            cylinder(d = GUARD_OD, h = GUARD_T + EPS);
            ring_grid_cut(GUARD_ZONE, GUARD_HUB_D, GUARD_T + EPS);
        }
    for (a = [GUARD_NUB_A : 45 : 359])                 // standoff nubs, off the seams
        rotate(a) translate([GUARD_NUB_R, 0, -DECK_SKIN - GUARD_T - GUARD_NUB_H + EPS])
            cylinder(d = 5, h = GUARD_NUB_H);
}

// breakaway supports for the grid: a SUP_W ring-wall from the bed up to one
// layer below each circular bar (plus one under the hub's rim and a post
// under each nub), stopping SUP_GAP short so they snap out through the bore
// after printing.  The outermost opening and the annulus bridge to the rib
// rim at r = 68, which is permanent.  Slicer auto-support stays OFF.
module duct_support_full() {
    zb = deck_bed_z();
    h  = -zb - DECK_SKIN - GUARD_T - SUP_GAP;          // bed to grid, less the gap
    rings = concat([GUARD_HUB_D / 2 - 0.5],
                   [for (r = grid_ring_starts(GUARD_ZONE, GUARD_HUB_D))
                        if (r + GRID_OPEN + GRID_RING / 2 < GUARD_ZONE / 2 - 1)
                            r + GRID_OPEN + GRID_RING / 2]);
    difference() {
        translate([0, 0, zb]) linear_extrude(h, convexity = 10)
            for (rc = rings)
                difference() { circle(r = rc + SUP_W / 2); circle(r = rc - SUP_W / 2); }
        for (a = [GUARD_NUB_A : 45 : 359])             // keep clear of the nubs
            rotate(a) translate([GUARD_NUB_R, 0, zb - EPS])
                cylinder(d = 6.5, h = h + 2 * EPS);
    }
    for (a = [GUARD_NUB_A : 45 : 359])                 // posts under the nubs
        rotate(a) translate([GUARD_NUB_R, 0, zb])
            cylinder(d = 4, h = -zb - DECK_SKIN - GUARD_T - GUARD_NUB_H - SUP_GAP);
}

// the two DECK_SEAM_W strips along this quarter's joints (2D, unclipped)
module deck_seam_strips_2d(sx, sy) {
    translate([sx > 0 ? 0 : -DECK_SEAM_W, sy > 0 ? 0 : -1000])
        square([DECK_SEAM_W, 1000]);
    translate([sx > 0 ? 0 : -1000, sy > 0 ? 0 : -DECK_SEAM_W])
        square([1000, DECK_SEAM_W]);
}

// the quarter as it sits on the craft (top face at z = 0)
// (everything is drawn whole, then clipped once by this quarter's side of
// both joints — tails, sockets and tabs included — so every layer agrees)
module deck_quarter_installed(sx, sy) {
    zr = -DECK_SKIN;                                    // underside of the skin
    difference() {
      intersection() {
        union() {
            // skin, thicker in the rib-free edge band
            translate([0, 0, -DECK_SKIN]) linear_extrude(DECK_SKIN) deck_quarter_2d(sx, sy);
            if (DECK_BAND_SKIN > DECK_SKIN)
                translate([0, 0, -DECK_BAND_SKIN]) linear_extrude(DECK_BAND_SKIN - DECK_SKIN + 0.01)
                    intersection() {
                        deck_quarter_2d(sx, sy);
                        difference() {
                            deck_edge_2d();
                            offset(delta = -DECK_BAND) deck_edge_2d();
                        }
                    }
            // the skirt lip (the ridge sticks out past the deck outline, so
            // it is only clipped by the joint sides below)
            if (DECK_LIP) deck_lip();
            // grid ribs
            translate([0, 0, zr - DECK_RIB_H]) linear_extrude(DECK_RIB_H + 0.01, convexity = 10)
                deck_grid_2d();
            // seam ribs along this quarter's two joints, glued back to back
            translate([0, 0, zr - DECK_SEAM_H]) linear_extrude(DECK_SEAM_H + 0.01, convexity = 4)
                intersection() {
                    deck_rib_zone_2d();
                    deck_seam_strips_2d(sx, sy);
                }
            // rib feet: the walls' first two layers, DECK_RIB_FOOT wider each
            // side, so the 0.9 x 10 mm walls hold onto the bed
            translate([0, 0, deck_bed_z()]) linear_extrude(0.6, convexity = 10)
                offset(delta = DECK_RIB_FOOT)
                    union() {
                        deck_grid_2d();
                        intersection() { deck_rib_zone_2d(); deck_seam_strips_2d(sx, sy); }
                    }
            // the fan duct, the guard grid and its breakaway supports
            duct_tube_full(); duct_guard_full(); duct_support_full();
            // the dovetail key blocks
            dt_blocks();
            // a fourth layer either side of the tape groove, so its floor is 3
            // (legacy: only with the lip off — see DECK_TAPE_D)
            if (!DECK_LIP)
                translate([0, 0, -DECK_BAND_SKIN - DECK_TAPE_D])
                    linear_extrude(DECK_TAPE_D + 0.01, convexity = 6)
                        intersection() {
                            offset(delta = 1.5) deck_tape_line_2d();
                            deck_quarter_2d(sx, sy);
                        }
            // a layer under the engraved marks, so they do not thin the skin
            if (DECK_MARKS)
                translate([0, 0, -DECK_SKIN - 0.28])
                    linear_extrude(0.28 + 0.01, convexity = 6)
                        intersection() {
                            offset(delta = DECK_MARK_PAD) deck_marks_2d();
                            deck_quarter_2d(sx, sy);
                        }
            // socket pads, this quarter's share
            if (DECK_SOCKETS)
                intersection() {
                    sock_pads();
                    translate([0, 0, -20]) linear_extrude(40, convexity = 6) deck_quarter_2d(sx, sy);
                }
        }
        // this quarter's side of both joints, through the full height
        translate([0, 0, deck_bed_z() - 1]) linear_extrude(TUBE_H - deck_bed_z() + 2, convexity = 10)
            intersection() { deck_side_2d("V", sx); deck_side_2d("H", sy); }
      }
        if (DECK_SOCKETS) sock_cuts();
        // skirt tape line: a groove in the strip under the band (legacy, lip off)
        if (!DECK_LIP)
            translate([0, 0, -DECK_BAND_SKIN - DECK_TAPE_D - EPS])
                linear_extrude(DECK_TAPE_D + EPS) deck_tape_line_2d();
        // engraved outlines on the top face
        if (DECK_MARKS)
            translate([0, 0, -DECK_MARK_D]) linear_extrude(DECK_MARK_D + 0.01) deck_marks_2d();
    }
}

// print orientation: AS INSTALLED, top face up, raised so the lip bottom
// (deck_bed_z) is the bed plane.  The lip's ridge lands on the bed and is
// the part's adhesion foot; the duct rises 50 mm above the skin; the skin
// itself bridges the rib cells (light-test it — see PRINT_SETTINGS.md).
module deck_quarter(sx, sy) {
    translate([-sx * DECK_X / 4, -sy * DECK_Y / 4, DECK_BAND_SKIN + LIP_H])
        deck_quarter_installed(sx, sy);
}

// all four, installed (preview)
module deck_printed() {
    for (sx = [-1, 1], sy = [-1, 1]) deck_quarter_installed(sx, sy);
}

// the deck in one piece, no seams or tabs: only for cutting coupons from
module deck_whole_installed() {
    difference() {
        union() {
            translate([0, 0, -DECK_SKIN]) linear_extrude(DECK_SKIN) deck_outline_2d();
            translate([0, 0, -DECK_BAND_SKIN]) linear_extrude(DECK_BAND_SKIN - DECK_SKIN + 0.01)
                intersection() {
                    deck_outline_2d();
                    difference() {
                        deck_edge_2d();
                        offset(delta = -DECK_BAND) deck_edge_2d();
                    }
                }
            translate([0, 0, -DECK_SKIN - DECK_RIB_H])
                linear_extrude(DECK_RIB_H + 0.01, convexity = 10) deck_grid_2d();
            duct_tube_full();
            duct_guard_full();
            duct_support_full();
            dt_blocks();
            if (DECK_SOCKETS) sock_pads();
            if (DECK_LIP) deck_lip();
            if (!DECK_LIP)
                translate([0, 0, -DECK_BAND_SKIN - DECK_TAPE_D])
                    linear_extrude(DECK_TAPE_D + 0.01, convexity = 6) offset(delta = 1.5) deck_tape_line_2d();
        }
        if (DECK_SOCKETS) sock_cuts();
        if (!DECK_LIP)
            translate([0, 0, -DECK_BAND_SKIN - DECK_TAPE_D - EPS])
                linear_extrude(DECK_TAPE_D + EPS) deck_tape_line_2d();
    }
}

function tot_before(c, gap, i) = i == 0 ? 0 : tot_before(c, gap, i - 1) + c[i - 1][1][0] + gap;

// a throwaway riser under a fit coupon: a 0.84 plate for adhesion plus 1.2
// walls up to the skin's underside, following the coupon's edge and each
// pocket's edge (1 mm outside the cut, so parts still seat).  The coupons
// print as installed now — without this, band pieces hang 10 mm in the air.
module fit_riser(c0, s) {
    module zone() {
        difference() {
            square([s[0] - 0.2, s[1] - 0.2], center = true);
            translate([-c0[0], -c0[1]]) {
                offset(delta = SOCK_FIT + 1) sock_flat_2d();
                translate(slot_centre()) offset(delta = 1)
                    rrect([SLOT_X, SLOT_Y], 2, center = true);
            }
        }
    }
    linear_extrude(0.84) zone();
    linear_extrude(DECK_BAND_SKIN + LIP_H - DECK_SKIN + 0.01, convexity = 10)
        difference() { zone(); offset(delta = -1.2) zone(); }
}

// coupons cut out of the socketed deck, laid side by side, printed the
// same way up as the quarters.  Press a tray and the nozzle into them and
// try the seam hardware before committing to four 2-hour prints; adjust
// SOCK_FIT / DECK_TAB_CLR (both run LOOSE now — tune DOWN, not up).
module deck_fit_test() {
    up  = DECK_BAND_SKIN + LIP_H;
    gap = 8;
    c = [[[TRAY_X, 30],  [64, 40]],     // one end of a tray pocket, two pegs
         [[-50, -140],   [40, 32]],     // nozzle pocket corner, with the slot lip
         [[14, DECK_Y / 2 - 10], [32, 32]]];  // stick-stand pocket corner: its
                                        // shoulder (the forward stop), the
                                        // lip and ridge.  Glue nothing: drop
                                        // the stand in and push it forward.
    n   = len(c);
    tot = tot_before(c, gap, n) - gap;
    x   = [for (i = [0 : n - 1]) -tot / 2 + tot_before(c, gap, i) + c[i][1][0] / 2];
    for (i = [0 : n - 1]) {
        translate([x[i] - c[i][0][0], -c[i][0][1], up])
            intersection() {
                deck_whole_installed();
                translate([c[i][0][0], c[i][0][1], 0])
                    cube([c[i][1][0], c[i][1][1], 40], center = true);
            }
        translate([x[i], 0]) fit_riser(c[i][0], c[i][1]);
    }
    // the duct seam: both halves of the y = 0 joint crossing the shroud at
    // +X — lug with its nut trap, the full-height dovetail key, butt faces,
    // the guard's half-bars and a sample of the breakaway support rings.
    // The crop reaches DT_DEPTH + 1 past the joint so the tail (which sticks
    // across it) is kept; the halves sit DT_DEPTH + 3 apart so it clears
    // the socket.  Snap the supports out, then lower one half onto the
    // other.  The tail should slide all the way down by hand with no
    // wobble: tune DT_CLR (tight: up 0.05; wobbly: down 0.05).
    dxp = tot / 2 + gap + 20;
    dsp = (DT_DEPTH + 3) / 2;
    for (s = [-1, 1])
        translate([dxp - 72, s * dsp, up])
            intersection() {
                deck_quarter_installed(1, s);
                translate([52, s > 0 ? -DT_DEPTH - 1 : -26, -12])
                    cube([40, 26 + DT_DEPTH + 1, 64]);
            }
    // an outer key (the V key at y = 100): deck depth only, 10 mm of
    // engagement instead of the duct key's 50.  Just the key blocks and the
    // seam ribs under them, so nothing overhangs; lower one onto the other.
    ky = DT_KEYS_V[1][0];
    for (s = [-1, 1])
        translate([s * dsp, 40 - ky, up])
            intersection() {
                deck_quarter_installed(s, 1);
                translate([s > 0 ? -DT_DEPTH - 1 : -6, ky - 6, -12])
                    cube([DT_DEPTH + 7, 12, 14]);
            }
    // and a jigsaw tab: both halves of the one at the end of the side joint,
    // band thickness, 2 mm apart.  Push them together on the table.
    tx = DECK_TABS_H[1][0];
    for (s = [-1, 1])
        translate([-tx, -44 + s * 2, 0])
            linear_extrude(DECK_BAND_SKIN)
                intersection() {
                    deck_side_2d("H", s);
                    translate([tx - 15, -15]) square([30, 30]);
                }
}


/* ==========================================================================
   ASSEMBLY PREVIEW — not printable, just a fit check.
   Deck top sits at z = 0.  +Y is the front.
   ========================================================================== */
module deck_preview() {
    color("Cornsilk", 0.55)
    translate([0, 0, -DECK_T])
        linear_extrude(DECK_T, convexity = 4)
            difference() {
                rrect([DECK_X, DECK_Y], 10, center = true);
                circle(d = DECK_HOLE_D);
                translate([0, -DECK_Y / 2 + SLOT_BACK])
                    rrect([SLOT_X, SLOT_Y], 2, center = true);
            }
}

module assembly(skirt = true) {
    drop     = (DECK_PRINTED && DECK_SOCKETS) ? SOCK_D : 0;   // parts sit in pockets
    face     = TUBE_H + HUB_T;              // motor face height (the duct is
                                            // part of the deck: no pocket drop)
    prop_top = face - PROP_DROP;
    dowel_y  = DECK_Y / 2 + STAND_OVERHANG;

    // ---- rule checks, printed to the Console
    ridge = (DECK_PRINTED && DECK_LIP) ? 2 * LIP_RIDGE : 0;
    echo(str("RULE 3a  craft with skirt: ", DECK_X + ridge + 2 * SKIRT_OVER, " x ",
             DECK_Y + ridge + 2 * SKIRT_OVER, " mm  (limit 400 x 400)",
             (max(DECK_X, DECK_Y) + ridge + 2 * SKIRT_OVER > 400) ? "  <<< TOO BIG" : "  ok"));
    echo(str("RULE 3e  dowel is ", SKIRT_OVER + ridge / 2 - STAND_OVERHANG,
             " mm behind the skirt's front edge  (limit 30)",
             (SKIRT_OVER + ridge / 2 - STAND_OVERHANG > 30) ? "  <<< TOO FAR BACK" : "  ok"));
    assert(LUG_R + INLET_ACC_D / 2 < TUBE_BORE / 2 + INLET_R + 1,
           "lug access hole runs off the bellmouth");
    assert(TUBE_BORE / 2 + INLET_R <= CAGE_OD / 2,
           "bellmouth wider than the cage rim");
    echo(str("FIT      propeller to cage underside: ", PROP_DROP - HUB_T,
             " mm", (PROP_DROP - HUB_T < 3) ? "  <<< TOO CLOSE, check PROP_DROP" : "  ok"));
    assert(GRID_OPEN + DECK_TAB_CLR <= 7,
           "assembled guard opening over 7 mm at a seam (3/8\" dowel rule)");
    assert(LUG_R * sin(LUG_PHASE) - LUG_D / 2 - DT_BLOCK[1] / 2 > 2,
           "a cage lug fouls a duct dovetail key — check LUG_PHASE");
    assert(DT_BLOCK[1] / 2 - DT_DEPTH - DT_CLR >= 1.6,
           "dovetail socket wall under 1.6 mm — widen DT_BLOCK");
    assert(DT_BLOCK[0] - DT_TIP - 2 * DT_CLR >= 3.2,
           "dovetail socket end walls under 1.6 mm — lengthen DT_BLOCK");
    assert(DT_DUCT_R - DT_TIP / 2 - DT_CLR > TUBE_BORE / 2 + 1,
           "duct dovetail breaks into the bore — raise DT_DUCT_R");
    echo(str("DUCT     lug edge to dovetail key: ",
             LUG_R * sin(LUG_PHASE) - LUG_D / 2 - DT_BLOCK[1] / 2,
             " mm;  quarter print height: ", TUBE_H + DECK_BAND_SKIN + LIP_H, " mm"));

    if (DECK_PRINTED) color("WhiteSmoke") deck_printed(); else deck_preview();
    under = !DECK_PRINTED ? DECK_T                      // where the guard's face sits
          : DECK_SOCKETS ? SOCK_D + SOCK_FLOOR : DECK_SKIN;

    // skirt, roughly as it looks inflated
    if (skirt) color("SkyBlue", 0.18)
        translate([0, 0, -DECK_T - 34])
            linear_extrude(34)
                rrect([DECK_X + 2 * SKIRT_OVER, DECK_Y + 2 * SKIRT_OVER], 24, center = true);

    // printed deck: the duct and guard are part of the quarters — only the
    // foam-board path still places the separate glued-on fan parts
    if (!DECK_PRINTED) {
        color("DimGray")   translate([0, 0, -under]) mirror([0, 0, 1]) fan_guard();
        color("SteelBlue") fan_tube();
    }
    color("Teal") translate([0, 0, TUBE_H])
        if (MOTOR_TYPE == "HS390") fan_cage_hs390(); else fan_cage();

    // motor and propeller, preview only
    color("Gray", 0.8) translate([0, 0, face])
        if (MOTOR_TYPE == "HS390") cylinder(d = HS_CAN_D, h = HS_LEN);
        else cylinder(d = MOTOR_CAN_D, h = MOTOR_LEN);
    color("Black", 0.6) {
        translate([0, 0, prop_top - PROP_HUB_T]) cylinder(d = 20, h = PROP_HUB_T);
        translate([0, 0, prop_top - PROP_HUB_T / 2])
            cylinder(d = PROP_D, h = 2, center = true);
    }

    // nozzle, over the slot, blowing backwards, with a "12" in it
    color("Chocolate")
        translate([0, -DECK_Y / 2 + SLOT_BACK, -drop]) nozzle();
    if (NOZZLE_V == 2)
        color("Gold")
            translate([-CARD_W / 2, -DECK_Y / 2 + SLOT_BACK + nz_wall_y() - CARD_CLEAR,
                       NZ_FLOOR + 0.5 - drop])
                rotate([90, 0, 0]) card(plate_hole(12), "12");
    else
        color("Gold")
            translate([0, -DECK_Y / 2 + SLOT_BACK - nz_out_y() / 2 - SOCKET_LEN
                          - PLATE_FLANGE_T, SOCKET_Z - drop])
                rotate([-90, 0, 0]) rotate(180) speed_plate(plate_hole(12), "12");

    // cargo: rolls either side of the fan, bin off to one side at the front
    // (keep it clear of the fan tube flange and the stick stand)
    for (s = [-1, 1])
        color("SeaGreen") translate([s * TRAY_X, 0, -drop]) nickel_tray();
    color("SeaGreen") translate([BIN_POS[0], BIN_POS[1], -drop]) coin_bin();

    // the snap-on nickel retainers, shown installed
    color("DarkSeaGreen") {
        for (s = [-1, 1])
            translate([s * TRAY_X, BAR_W / 2, -drop]) rotate([90, 0, 0]) tray_bar();
        translate([BIN_POS[0], BIN_POS[1], -drop]) bin_lid_installed();
    }

    // battery holders, not printed; shown so nothing else gets planned for
    // that space.  LampVPath 4 x AA is 62 x 57 x 16 (four cells side by
    // side), rear corners.  LampVPath 2 x AA is 58.5 x 32.4 x 14.6, front
    // left, opposite the coin bin.  Each sits 1 mm up, on its foam strip.
    for (s = [-1, 1])
        color("Gray", 0.5) translate([s * AA4_POS[0], AA4_POS[1], 1 + AA4_H / 2])
            cube([AA4_SIZE[0], AA4_SIZE[1], AA4_H], center = true);
    // (the 2xAA sits against the rigid fence of the station pair below,
    // so its centre is +1.5 from the tray centre at this trim setting)
    color("Gray", 0.5) translate([AA2_POS[0], AA2_POS[1] + 1.5, 1 + AA2_H / 2])
        cube([AA2_SIZE[0], AA2_SIZE[1], AA2_H], center = true);

    // their glue-on mounts sit on the deck top — no pocket, so no -drop
    color("DarkSeaGreen") {
        for (s = [-1, 1])
            translate([s * AA4_POS[0], AA4_POS[1], 0]) aa4_mount();
        translate([AA2_POS[0], AA2_POS[1], 0]) aa2_tray();
        // fences bracketing the holder at a valid 36 mm station pair:
        // rigid at -15.5 (station 4 from the -Y end), spring (bow toward
        // the holder) at +20.5 (station 3 from the +Y end)
        translate([AA2_POS[0], AA2_POS[1] - 15.5, 0]) aa2_fence(false);
        translate([AA2_POS[0], AA2_POS[1] + 20.5, 0]) rotate(180) aa2_fence(true);
    }

    // toggle switch on its bracket, right side, lever pointing backwards
    color("Crimson") translate([SW_POS[0] - SW_FACE_W / 2, SW_POS[1], -drop]) switch_bracket();
    color("Silver") translate([SW_POS[0], SW_POS[1], SW_HOLE_Z - drop]) rotate([90, 0, 0]) cylinder(d = 6, h = 18);

    // timing stick, hanging out past the front edge
    color("Crimson") translate([0, DECK_Y / 2 - STAND_Y / 2, -drop]) stick_stand();
    color("Tan") translate([0, dowel_y, 1.5 - drop]) cylinder(d = DOWEL_D, h = 240);
}


/* ==========================================================================
   DISPATCH
   ========================================================================== */
if      (PART == "assembly")    assembly();
else if (PART == "mockup")      assembly(skirt = false);   // export as STL to view
else if (PART == "fan_tube")    fan_tube();                // foam-board deck only
else if (PART == "fan_cage")    fan_cage();
else if (PART == "fan_cage_hs390") fan_cage_hs390();
else if (PART == "fan_guard")   fan_guard();               // foam-board deck only
else if (PART == "nozzle")      nozzle();
else if (PART == "nozzle_v1")   nozzle_v1();
else if (PART == "nozzle_v2")   nozzle_v2();
else if (PART == "plate")       orifice(plate_hole(PLATE_TIME), plate_label(PLATE_TIME));
else if (PART == "plates")      orifice_set(PLATE_BATCH);
else if (PART == "plate_zero")  orifice(0, "0");
else if (PART == "plate_test")  orifice_test();
else if (PART == "plate_rack")  plate_rack();
else if (PART == "rack_aux")    rack_aux();
else if (PART == "chart_plate") chart_plate();
else if (PART == "nickel_tray") nickel_tray();
else if (PART == "tray_bar")    tray_bar();
else if (PART == "coin_bin")    coin_bin();
else if (PART == "bin_lid")     bin_lid();
else if (PART == "stick_stand") stick_stand();
else if (PART == "switch_bracket") switch_bracket();
else if (PART == "aa4_mount")   aa4_mount();
else if (PART == "aa2_tray")    aa2_tray();
else if (PART == "aa2_fences")  aa2_fences();
else if (PART == "wire_clips")  wire_clips();
else if (PART == "deck_fl")     deck_quarter(-1,  1);     // front left
else if (PART == "deck_fr")     deck_quarter( 1,  1);     // front right
else if (PART == "deck_bl")     deck_quarter(-1, -1);     // back left
else if (PART == "deck_br")     deck_quarter( 1, -1);     // back right
else if (PART == "deck")        deck_printed();           // all four, preview
else if (PART == "deck_fit_test") deck_fit_test();
else if (PART == "templates")   templates();
else if (PART == "wear_pad")    wear_pad();
else echo(str("Unknown PART: ", PART));
