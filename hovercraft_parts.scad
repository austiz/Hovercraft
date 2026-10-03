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
     "fan_tube"     the shroud that glues over the 12 cm deck hole
     "fan_cage"     the top guard; the RS-550 bolts straight to its hub
     "fan_cage_hs390"  the same cage with a hub for the HS390 motor instead
     "fan_guard"    the guard that glues UNDER the deck hole
     "nozzle"       the box over the 3 x 10 cm slot with the card guide
                    (NOZZLE_V = 2) or the press-fit socket (NOZZLE_V = 1).
                    "nozzle_v1" / "nozzle_v2" pick one explicitly.
     "plate"        one speed card (or plate for v1)  (set PLATE_TIME)
     "plates"       a batch of them (set PLATE_BATCH)
     "plate_zero"   the no-hole card for the drift test
     "plate_test"   the three calibration cards: 15, 22 and 30 mm
     "plate_rack"   numbered rack that carries the cards to the tournament
     "nickel_tray"  two roll slots.  Print TWO of these.
     "coin_bin"     half roll + 20 loose nickels
     "stick_stand"  socket for the 1/4" timing dowel
     "switch_bracket" panel for the toggle switch (it cannot mount through
                    foam: the nut crushes it and the body hangs in the bag)
     "templates"    marking templates for the fan hole and the nozzle slot
     "deck_fl" "deck_fr" "deck_bl" "deck_br"
                    OPTIONAL printed deck in four quarters (front-left,
                    front-right, back-left, back-right) that replaces the
                    foam board.  "deck" shows all four put together.

   Hardware to buy (none of it comes with the motor)
   ------------------------------------------------------------------------
     2x M3 x 6 socket head     motor to cage hub.  6 mm, NO LONGER.
     6x M3 x 10 + 6x M3 nut    cage to tube lugs (nuts drop into the lugs)
     1x M3 x 8                 dowel set screw in the stick stand
     7x M3 x 8 + 7x M3 nut     printed deck only: bolts the seam ribs
                               together.  Plus clear packing tape for
                               the joints, top and bottom.
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
                  (the fan tube is the heavy one, ~90 g); the whole set with
                  spares and the rack is about 500 g.
     Layers       0.2 mm, 0.4 mm nozzle
     Walls        3 everywhere; fan_cage 4 walls / 40% infill (it carries
                  the motor)
     Infill       15%
     Supports     none for the v2 set.  Only nozzle v1 needs supports
                  (everywhere, or painted on the socket bore and box roof).
     Orientation  every part is already drawn the way it prints.  Do not
                  rotate anything except to fit the bed.

   Build order for the fan
   ------------------------------------------------------------------------
     1. Bolt the motor to the fan_cage hub from UNDERNEATH with two M3 x 6
        screws.  The heads sit in counterbores, flush with the cage.
        Longer screws reach the windings inside the motor: 6 mm, no more.
     2. Push the adapter and propeller onto the shaft, under the cage.
     3. Glue fan_tube to the deck, airtight all the way round the flange.
     4. Drop an M3 nut into the pocket on top of each lug, lower the cage on,
        6x M3 x 10 from above.
     The propeller is larger than the deck hole, so it can only go in from
     above with the cage off.  This order is not optional.

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
M3_CLEAR = 3.4;     // M3 passes through
M3_SNUG  = 3.3;     // M3 located by the hole
M3_TAP   = 2.6;     // M3 self-taps into PLA
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
DECK_PRINTED = false; // assembly preview: show the printed deck, not foam
DECK_SKIN   = 0.48;   // 2 layers at 0.28 (0.20 first layer + 0.28).  If the
                      // deck leaks air, use 0.76 (3 layers), +30 g.
DECK_RIB_H  = 5;      // grid ribs, below the skin
DECK_RIB_W  = 0.9;    // two 0.45 lines
DECK_CELL   = 55;     // triangle side of the grid
DECK_BAND   = 40;     // flat band round the edge, no ribs: the skirt plastic
                      // and its tape go here
DECK_BAND_SKIN = 0.76;// the band is 3 layers: with no ribs, 2 would be floppy
                      // when you pick the craft up by its edge
DECK_SEAM_W = 1.6;    // seam ribs, one each side of every joint, bolted
DECK_SEAM_H = 7;
DECK_TAB_D  = 9;      // jigsaw tabs that lock the skin across the joints
DECK_TAB_CLR= 0.15;
DECK_MARKS  = true;   // engraved outlines showing where each part glues on
DECK_MARK_D = 0.2;    // (the first layer only)
DECK_MARK_W = 0.8;

// where things sit on the deck: shared by the assembly preview and the
// engraved marks on the printed deck
TRAY_X      = 118;                        // nickel trays at (+/-TRAY_X, 0)
BIN_POS     = [62, DECK_Y / 2 - 42];      // coin bin, front right
AA2_POS     = [-62, DECK_Y / 2 - 42];     // 2 x AA holder, front left
AA4_POS     = [110, -112];                // 4 x AA holders at (+/-x, y)
SW_POS      = [118, -80];                 // switch bracket, panel centre
AA4_SIZE    = [62, 57];
AA2_SIZE    = [58.5, 32.4];

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
NUT_AF      = 5.8;    // M3 nut is 5.5 across flats, 2.4 thick
NUT_T       = 2.6;

GRID_OPEN   = 6.5;    // every opening in every guard.  Never above 7.
GRID_BAR    = 2.4;    // ring width
GRID_SPOKES = 8;      // spokes tying the rings together

CAGE_OD     = 164;
CAGE_T      = 4;      // rim and rings
CAGE_ZONE   = 140;    // rings live inside this circle
HUB_OD      = 44;     // solid middle the motor bolts to
HUB_T       = 6;      // 3 mm counterbore + 3 mm under the screw heads

GUARD_OD    = DECK_HOLE_D + 20;   // 10 mm of glue overlap all round
GUARD_T     = 3;
GUARD_ZONE  = DECK_HOLE_D + 4;
GUARD_NUB_H = 4;      // little feet that stop the skirt sealing flat on it

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
M25_SNUG    = 2.8;    // M2.5 / M2.6 located by the hole
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


/* ==========================================================================
   SHARED HELPERS
   ========================================================================== */

// Concentric ring openings, GRID_OPEN wide, tied together by spokes.  About
// 68% open, against 45% for a square mesh, and a 9.5 mm rod still cannot
// get through a 6.5 mm slot.  Returns the OPENINGS (what gets cut away).
module ring_grid_2d(zone_d, hub_d = 0, open = GRID_OPEN, bar = GRID_BAR) {
    p = open + bar;
    difference() {
        for (r = [hub_d / 2 + bar : p : zone_d / 2 - 1])
            difference() {
                circle(r = min(r + open, zone_d / 2));
                circle(r = r);
            }
        for (a = [0 : 360 / GRID_SPOKES : 359])
            rotate(a) translate([0, -bar / 2]) square([zone_d / 2 + 1, bar]);
    }
}

// A disc with ring openings between hub_d and zone_d.  Everything outside
// zone_d stays solid (that is the screw rim) and everything inside hub_d
// stays solid (that is where the motor bolts on).
module grid_plate(od, zone_d, t, hub_d = 0) {
    linear_extrude(t, convexity = 10)
        difference() {
            circle(d = od);
            ring_grid_2d(zone_d, hub_d);
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
   PART 1 — FAN TUBE
   Glues to the deck over the 12 cm hole.  Prints flange down, no supports.
   Glue it with hot glue or silicone all the way round the flange: air that
   escapes here never reaches the skirt.
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
            // without the weight of a solid column.
            for (i = [0 : LUG_N - 1])
                rotate(i * 360 / LUG_N) {
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
            rotate(i * 360 / LUG_N)
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
            rotate(i * 360 / LUG_N)
                translate([LUG_R, 0, 0]) bore(M3_CLEAR, CAGE_T);
    }
}


module fan_cage_hs390() {
    fan_cage(HS_BOLTS, HS_BOSS_D, HS_CAN_D, M25_SNUG, M25_HEAD_D, M25_HEAD_H,
             vent_a = 12);
}


/* ==========================================================================
   PART 3 — FAN GUARD  (the one teams forget)
   Glues to the UNDERSIDE of the deck, over the 12 cm hole, inside the bag.
   It stops the skirt plastic being sucked into the propeller.  Prints flat,
   nubs up; glue the nub side towards the skirt.
   ========================================================================== */
module fan_guard() {
    grid_plate(GUARD_OD, GUARD_ZONE, GUARD_T);
    for (a = [0 : 45 : 359])                    // feet that hold the bag off
        rotate(a) translate([GUARD_ZONE / 2 - 12, 0, GUARD_T - EPS])
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
module plate_rack() {
    pair  = (NOZZLE_V == 2);      // cards: a pair of thin fins per slot, spaced
                                  // so the heads sit side by side above them
    pitch = RACK_PITCH;
    span  = RACK_FIN_T + RACK_SLOT_W + (pair ? RACK_FIN_T : 0);
    off   = pair ? (pitch - span) / 2 : 0;
    len_x = pair ? RACK_N * pitch : RACK_N * pitch + RACK_FIN_T;
    dep_y = RACK_DEPTH + RACK_LABEL;

    // base
    linear_extrude(RACK_BASE_T) rrect([len_x, dep_y], 4);
    // fins and numbers
    for (i = [0 : RACK_N - 1]) {
        x     = i * pitch + off;
        label = plate_label(RACK_T0 + i * RACK_STEP);
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
        translate([RACK_N * pitch, RACK_LABEL, RACK_BASE_T - EPS])
            cube([RACK_FIN_T, RACK_DEPTH, RACK_FIN_H]);
}


/* ==========================================================================
   PART 7 — NICKEL TRAY   (print TWO; they are symmetrical)
   The rules forbid tape and glue on the nickels and forbid opening the rolls,
   so the walls are the only thing holding the cargo on.
   ========================================================================== */
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
    }
}


/* ==========================================================================
   PART 8 — COIN BIN
   One slot for the half roll, one for the 20 loose nickels standing on edge.
   A nickel is 21.2 mm across, so 14 mm walls hold them in easily.
   ========================================================================== */
module coin_bin() {
    slot_l = SLOT_HALF_L;
    ox = 2 * SLOT_ROLL_W + 3 * TRAY_WALL;
    oy = slot_l + 2 * TRAY_WALL;
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
                    rrect([SLOT_ROLL_W, slot_l], 2, center = true);
    }
}


/* ==========================================================================
   PART 9 — TIMING STICK STAND
   The dowel has to stand dead straight at the very front of the craft, with
   nothing on the craft in front of it.  The base glues to the deck with its
   front edge ON the deck edge; the arm with the tower hangs out over the
   skirt.  All the bracing points backwards.  Prints base down, no supports.
   ========================================================================== */
// +Y is the front, same as the deck.  y = STAND_Y / 2 is the deck edge.
function stand_tower_y() = STAND_Y / 2 + STAND_OVERHANG;

module stick_stand() {
    ty  = stand_tower_y();
    arm = STAND_OVERHANG + TOWER_D / 2;

    difference() {
        union() {
            translate([0, arm / 2])
                linear_extrude(STAND_T) rrect([STAND_X, STAND_Y + arm], 4, center = true);
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
        // from 6.0 to 6.35 mm and the stick must not wobble 24 cm up
        translate([0, ty, TOWER_H - 8]) rotate([90, 0, 0])
            cylinder(d = M3_TAP, h = TOWER_D);
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
        translate([SW_FACE_W / 2, -EPS, SW_HOLE_Z]) rotate([-90, 0, 0])
            cylinder(d = SW_HOLE, h = SW_FACE_T + 2 * EPS);
    }
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
   Four quarters, each about 165 x 160 mm, so each one fits the P1S bed.
   Modelled the way it sits on the craft: top face at z = 0, ribs hanging
   below.  deck_quarter() flips it for printing, top face on the bed.

   How the four pieces lock together:
   - Jigsaw tabs in the skin, out in the rib-free edge band where the skirt
     tape goes, lock the joints flat.
   - Each piece has a tall seam rib along its two inner edges.  The ribs of
     neighbouring pieces sit back to back and bolt together (M3 x 8 + nut)
     through the holes in them.
   - On top, the parts glued over the joints splice them: the fan tube
     flange covers the centre where all four meet, the nozzle flange the
     back joint, the stick stand the front joint, and the nickel trays the
     side joints.
   - A strip of clear packing tape along each joint on top and underneath
     makes it airtight.  The deck is the lid of the air cushion.

   Build order (ENGINEERING_CHECK §9): bolt the quarters upside down on a
   flat table (7x M3 x 8 + nut, snug), tape the joints underneath, glue the
   guard and tape the skirt on, flip it, glue the parts on their engraved
   outlines, tape any joint on top that no part covers.
   ========================================================================== */
function tray_size()  = [2 * SLOT_ROLL_W + 3 * TRAY_WALL, SLOT_ROLL_L + 2 * TRAY_WALL];
function bin_size()   = [2 * SLOT_ROLL_W + 3 * TRAY_WALL, SLOT_HALF_L + 2 * TRAY_WALL];
function deck_fan_clear() = GUARD_OD / 2 + 2;      // rib-free: guard glue ring
function slot_centre() = [0, -DECK_Y / 2 + SLOT_BACK];

// jigsaw tabs: position along the joint, and which side (+1 / -1) owns it
DECK_TABS_V = [[-(DECK_Y / 2 - DECK_BAND / 2), -1], [DECK_Y / 2 - DECK_BAND / 2, 1]];   // joint x = 0
DECK_TABS_H = [[-(DECK_X / 2 - DECK_BAND / 2), 1], [DECK_X / 2 - DECK_BAND / 2, -1]];   // joint y = 0
// bolt holes through the seam ribs, along each joint.  Each one sits where
// no grid rib meets the seam, so the head and the nut both seat flat on it
// (grid ribs reach the joints at multiples of 47.6 / 55 / 95.3 mm).
DECK_BOLTS_V = [-82, 82, 112];
DECK_BOLTS_H = [-118, -90, 90, 118];

module deck_outline_2d() {
    difference() {
        rrect([DECK_X, DECK_Y], 10, center = true);
        circle(d = DECK_HOLE_D);
        translate(slot_centre()) rrect([SLOT_X, SLOT_Y], 2, center = true);
    }
}

// one jigsaw tab on the joint line x = 0, sticking out towards -o * x
module deck_tab_2d(o) {
    r = DECK_TAB_D / 2;
    translate([-o * (r + 1.5), 0]) circle(r = r);                     // knob
    translate([o > 0 ? -(r + 1.5) : 0, -r * 0.5]) square([r + 1.5, r]); // neck
}

// side s of the joint x = 0 (axis "V") or y = 0 (axis "H"), tabs included
module deck_side_2d(axis, s) {
    tabs = (axis == "V") ? DECK_TABS_V : DECK_TABS_H;
    // H is V turned 90 degrees: x -> y.  Positions along it map to -x.
    rotate(axis == "V" ? 0 : 90)
        difference() {
            union() {
                translate([s > 0 ? 0 : -1000, -1000]) square([1000, 2000]);
                for (t = tabs) if (t[1] == s)
                    translate([0, axis == "V" ? t[0] : -t[0]]) deck_tab_2d(s);
            }
            for (t = tabs) if (t[1] == -s)
                translate([0, axis == "V" ? t[0] : -t[0]])
                    offset(delta = DECK_TAB_CLR) deck_tab_2d(-s);
        }
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
        offset(delta = -DECK_BAND) rrect([DECK_X, DECK_Y], 10, center = true);
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
    for (s = [-1, 1]) deck_mark_box_2d([s * TRAY_X, 0], tray_size());
    deck_mark_box_2d(BIN_POS, bin_size());
    deck_mark_box_2d(AA2_POS, AA2_SIZE);
    for (s = [-1, 1]) deck_mark_box_2d([s * AA4_POS[0], AA4_POS[1]], AA4_SIZE);
    deck_mark_box_2d([SW_POS[0], SW_POS[1] + (SW_BASE_D + SW_FACE_T) / 2],
                     [SW_FACE_W, SW_BASE_D + SW_FACE_T]);
    deck_mark_box_2d([0, DECK_Y / 2 - STAND_Y / 2], [STAND_X, STAND_Y]);
    deck_mark_box_2d(slot_centre(), [nz_out_x() + 2 * NZ_FLANGE, nz_out_y() + 2 * NZ_FLANGE]);
    difference() { circle(d = FLANGE_OD); circle(d = FLANGE_OD - 2 * DECK_MARK_W); }
}

// the quarter as it sits on the craft (top face at z = 0)
module deck_quarter_installed(sx, sy) {
    zr = -DECK_SKIN;                                    // underside of the skin
    zb = zr - DECK_SEAM_H / 2;                          // bolt height
    difference() {
        union() {
            // skin, thicker in the rib-free edge band
            translate([0, 0, -DECK_SKIN]) linear_extrude(DECK_SKIN) deck_quarter_2d(sx, sy);
            translate([0, 0, -DECK_BAND_SKIN]) linear_extrude(DECK_BAND_SKIN - DECK_SKIN + 0.01)
                intersection() {
                    deck_quarter_2d(sx, sy);
                    difference() {
                        rrect([DECK_X, DECK_Y], 10, center = true);
                        offset(delta = -DECK_BAND) rrect([DECK_X, DECK_Y], 10, center = true);
                    }
                }
            // grid ribs, this quarter only
            translate([0, 0, zr - DECK_RIB_H]) linear_extrude(DECK_RIB_H + 0.01, convexity = 10)
                intersection() {
                    deck_grid_2d();
                    translate([sx > 0 ? 0 : -1000, sy > 0 ? 0 : -1000]) square(1000);
                }
            // seam ribs along this quarter's two joints
            translate([0, 0, zr - DECK_SEAM_H]) linear_extrude(DECK_SEAM_H + 0.01, convexity = 4)
                intersection() {
                    deck_rib_zone_2d();
                    union() {
                        translate([sx > 0 ? 0 : -DECK_SEAM_W, sy > 0 ? 0 : -1000])
                            square([DECK_SEAM_W, 1000]);
                        translate([sx > 0 ? 0 : -1000, sy > 0 ? 0 : -DECK_SEAM_W])
                            square([1000, DECK_SEAM_W]);
                    }
                }
        }
        // bolt holes through the seam ribs
        for (p = DECK_BOLTS_V) if (p * sy > 0)
            translate([0, p, zb]) rotate([0, 90, 0]) cylinder(d = M3_CLEAR, h = 20, center = true);
        for (p = DECK_BOLTS_H) if (p * sx > 0)
            translate([p, 0, zb]) rotate([90, 0, 0]) cylinder(d = M3_CLEAR, h = 20, center = true);
        // engraved outlines on the top face
        if (DECK_MARKS)
            translate([0, 0, -DECK_MARK_D]) linear_extrude(DECK_MARK_D + 0.01) deck_marks_2d();
    }
}

// print orientation: flipped, top face on the bed, centred on the origin
module deck_quarter(sx, sy) {
    mirror([0, 0, 1])
        translate([-sx * DECK_X / 4, -sy * DECK_Y / 4, 0])
            deck_quarter_installed(sx, sy);
}

// all four, installed (preview)
module deck_printed() {
    for (sx = [-1, 1], sy = [-1, 1]) deck_quarter_installed(sx, sy);
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
    face     = TUBE_H + HUB_T;              // motor face height
    prop_top = face - PROP_DROP;
    dowel_y  = DECK_Y / 2 + STAND_OVERHANG;

    // ---- rule checks, printed to the Console
    echo(str("RULE 3a  craft with skirt: ", DECK_X + 2 * SKIRT_OVER, " x ",
             DECK_Y + 2 * SKIRT_OVER, " mm  (limit 400 x 400)",
             (max(DECK_X, DECK_Y) + 2 * SKIRT_OVER > 400) ? "  <<< TOO BIG" : "  ok"));
    echo(str("RULE 3e  dowel is ", SKIRT_OVER - STAND_OVERHANG,
             " mm behind the skirt's front edge  (limit 30)",
             (SKIRT_OVER - STAND_OVERHANG > 30) ? "  <<< TOO FAR BACK" : "  ok"));
    echo(str("FIT      propeller to cage underside: ", PROP_DROP - HUB_T,
             " mm", (PROP_DROP - HUB_T < 3) ? "  <<< TOO CLOSE, check PROP_DROP" : "  ok"));

    if (DECK_PRINTED) color("WhiteSmoke") deck_printed(); else deck_preview();
    under = DECK_PRINTED ? DECK_SKIN : DECK_T;          // underside of the deck

    // skirt, roughly as it looks inflated
    if (skirt) color("SkyBlue", 0.18)
        translate([0, 0, -DECK_T - 34])
            linear_extrude(34)
                rrect([DECK_X + 2 * SKIRT_OVER, DECK_Y + 2 * SKIRT_OVER], 24, center = true);

    color("DimGray")   translate([0, 0, -under]) mirror([0, 0, 1]) fan_guard();
    color("SteelBlue") fan_tube();
    color("Teal")      translate([0, 0, TUBE_H])
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
        translate([0, -DECK_Y / 2 + SLOT_BACK, 0]) nozzle();
    if (NOZZLE_V == 2)
        color("Gold")
            translate([-CARD_W / 2, -DECK_Y / 2 + SLOT_BACK + nz_wall_y() - CARD_CLEAR,
                       NZ_FLOOR + 0.5])
                rotate([90, 0, 0]) card(plate_hole(12), "12");
    else
        color("Gold")
            translate([0, -DECK_Y / 2 + SLOT_BACK - nz_out_y() / 2 - SOCKET_LEN
                          - PLATE_FLANGE_T, SOCKET_Z])
                rotate([-90, 0, 0]) rotate(180) speed_plate(plate_hole(12), "12");

    // cargo: rolls either side of the fan, bin off to one side at the front
    // (keep it clear of the fan tube flange and the stick stand)
    for (s = [-1, 1])
        color("SeaGreen") translate([s * TRAY_X, 0, 0]) nickel_tray();
    color("SeaGreen") translate(BIN_POS) coin_bin();

    // battery holders, not printed; shown so nothing else gets planned for
    // that space.  LampVPath 4 x AA is 62 x 57 x 16 (four cells side by
    // side), rear corners.  LampVPath 2 x AA is 58.5 x 32.4 x 14.6, front
    // left, opposite the coin bin.  Shuffle them to balance the craft.
    for (s = [-1, 1])
        color("Gray", 0.5) translate([s * AA4_POS[0], AA4_POS[1], 8])
            cube([AA4_SIZE[0], AA4_SIZE[1], 16], center = true);
    color("Gray", 0.5) translate([AA2_POS[0], AA2_POS[1], 7.3])
        cube([AA2_SIZE[0], AA2_SIZE[1], 14.6], center = true);

    // toggle switch on its bracket, right side, lever pointing backwards
    color("Crimson") translate([SW_POS[0] - SW_FACE_W / 2, SW_POS[1], 0]) switch_bracket();
    color("Silver") translate([SW_POS[0], SW_POS[1], SW_HOLE_Z]) rotate([90, 0, 0]) cylinder(d = 6, h = 18);

    // timing stick, hanging out past the front edge
    color("Crimson") translate([0, DECK_Y / 2 - STAND_Y / 2, 0]) stick_stand();
    color("Tan") translate([0, dowel_y, 1.5]) cylinder(d = DOWEL_D, h = 240);
}


/* ==========================================================================
   DISPATCH
   ========================================================================== */
if      (PART == "assembly")    assembly();
else if (PART == "mockup")      assembly(skirt = false);   // export as STL to view
else if (PART == "fan_tube")    fan_tube();
else if (PART == "fan_cage")    fan_cage();
else if (PART == "fan_cage_hs390") fan_cage_hs390();
else if (PART == "fan_guard")   fan_guard();
else if (PART == "nozzle")      nozzle();
else if (PART == "nozzle_v1")   nozzle_v1();
else if (PART == "nozzle_v2")   nozzle_v2();
else if (PART == "plate")       orifice(plate_hole(PLATE_TIME), plate_label(PLATE_TIME));
else if (PART == "plates")      orifice_set(PLATE_BATCH);
else if (PART == "plate_zero")  orifice(0, "0");
else if (PART == "plate_test")  orifice_test();
else if (PART == "plate_rack")  plate_rack();
else if (PART == "nickel_tray") nickel_tray();
else if (PART == "coin_bin")    coin_bin();
else if (PART == "stick_stand") stick_stand();
else if (PART == "switch_bracket") switch_bracket();
else if (PART == "deck_fl")     deck_quarter(-1,  1);     // front left
else if (PART == "deck_fr")     deck_quarter( 1,  1);     // front right
else if (PART == "deck_bl")     deck_quarter(-1, -1);     // back left
else if (PART == "deck_br")     deck_quarter( 1, -1);     // back right
else if (PART == "deck")        deck_printed();           // all four, preview
else if (PART == "templates")   templates();
else echo(str("Unknown PART: ", PART));
