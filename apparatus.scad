// ============================================================
//  Cheerios-Effect Experiment — TABLE + VIBRATION ASSEMBLY
//  OpenSCAD source  (v8)
//
//  Units: mm
//  X = width (left→right), Y = depth (front→back), Z = up
//
//  Vertical stacking (bottom to top):
//    0           floor
//    TIER1_Z     bottom of mid crossmembers
//    TIER1_Z+BW  top of mid crossmembers  = bottom of H-bars
//    HB_Z+BW     top of H-bars            = base for sub-legs & cage
//    CAGE_Z0     bottom of cage frame
//    CAGE_Z1     top of cage  (must be <= LEG_H)
//    LEG_H       underside of slab
//    TH          top of slab
// ============================================================

$fn = 48;

// ── Profile dims (all bars identical) ────────────────────────
BW = 30;    // bar face height
BT = 8;     // bar thickness
LW = 35;    // leg cross-section (square)

// ── Table ────────────────────────────────────────────────────
TW     = 1500;
TD     = 1250;
LEG_H  = 670;
SLAB_T = 30;
TH     = LEG_H + SLAB_T;

// ── Crossmember tiers ────────────────────────────────────────
TIER1_Z = 330;              // mid-height bars, bottom face
TIER2_Z = LEG_H - BW;      // under-slab bars, top face flush with legs

// ── H-bracket ────────────────────────────────────────────────
// Two bars running full table width (X direction)
// Sit on top of the front/back TIER1 bars
HB_Z    = TIER1_Z + BW;    // bottom face of H-bars
HB_TOP  = HB_Z + BW;       // top face of H-bars  ← base level

// ── Cage (roughly cubic, centred, sits on H-bar top) ─────────
CAGE_W  = 400;
CAGE_D  = 380;
// Height: fill the space from H-bar top to just below slab
CAGE_H  = LEG_H - HB_TOP - 20;   // leaves 20 mm gap at top
CAGE_Z0 = HB_TOP;                 // cage bottom ON TOP of H-bars
CAGE_Z1 = CAGE_Z0 + CAGE_H;      // must be < LEG_H  ✓
CAGE_X0 = (TW - CAGE_W) / 2;
CAGE_X1 = CAGE_X0 + CAGE_W;
CAGE_Y0 = (TD - CAGE_D) / 2;
CAGE_Y1 = CAGE_Y0 + CAGE_D;
PANEL_T = 6;
HOLE_R  = 13;
HOLE_SP = 44;

// ── Eccentric disc (inside cage, at half height) ─────────────
DISC_R  = CAGE_H * 0.38;
DISC_T  = 25;
DISC_XC = (CAGE_X0 + CAGE_X1) / 2;
DISC_YC = (CAGE_Y0 + CAGE_Y1) / 2;
DISC_ZC = CAGE_Z0 + CAGE_H / 2;   // mid-height of cage

// ── Connecting rod (disc top → through slab) ─────────────────
ROD_R   = 10;
ROD_Z0  = DISC_ZC + DISC_R;
ROD_Z1  = TH + 8;

// ── Motor (cylinder along X) ─────────────────────────────────
MOT_R   = 45;
MOT_L   = 150;
MOT_YC  = TD / 2;
// Shaft must align with disc centre height → motor centre = DISC_ZC
MOT_ZC  = DISC_ZC;

// ── Shelf: work backwards from motor centre ───────────────────
// Motor centre = shelf_bottom + shelf_T + MOT_R + 5
// → shelf_bottom = MOT_ZC - MOT_R - 5 - SHELF_T
SHELF_T  = 20;
SHELF_Z  = MOT_ZC - MOT_R - 5 - SHELF_T;  // board bottom face
// Sub-legs height = shelf_bottom - HB_TOP - BW (one rail at top)
SUB_Z0   = HB_TOP;
SUB_H    = SHELF_Z - BW - HB_TOP;  // computed so legs reach shelf

// Shelf size and position: left of cage, Y-centred
SHELF_W  = 450;
SHELF_D  = 360;
SHELF_X0 = CAGE_X0 - SHELF_W - 50;
SHELF_X1 = SHELF_X0 + SHELF_W;
SHELF_Y0 = (TD - SHELF_D) / 2;
SHELF_Y1 = SHELF_Y0 + SHELF_D;

// Motor X position (on shelf)
MOT_X0   = SHELF_X0 + 15;

// ── Gearbox (box, right end of motor) ────────────────────────
GB_W = 55;  GB_H = 62;  GB_D = 55;
GB_X  = MOT_X0 + MOT_L;
GB_YC = MOT_YC;
GB_Z  = MOT_ZC - GB_H / 2;

// ── Shaft (gearbox right → disc centre) ──────────────────────
SHAFT_R  = 7;
SHAFT_X0 = GB_X + GB_W;
SHAFT_X1 = DISC_XC - DISC_T / 2;

// ── Pillow block ──────────────────────────────────────────────
PB_W = 52;  PB_H = 48;  PB_D = 42;
PB_X = SHAFT_X0;

// ── Pool ─────────────────────────────────────────────────────
POOL_W  = 1300;
POOL_D  = 1100;
POOL_H  = 50;
WALL_T  = 15;
WATER_D = 30;

// ── Colours ──────────────────────────────────────────────────
COL_LEG   = [0.60, 0.60, 0.60];
COL_BLACK = [0.10, 0.10, 0.10];
COL_SLAB  = [0.95, 0.93, 0.88];
COL_PLEXI = [0.80, 0.92, 1.00];
COL_WATER = [0.55, 0.80, 0.95];
COL_WOOD  = [0.72, 0.52, 0.22];
COL_WTOP  = [0.60, 0.40, 0.14];
COL_MOTOR = [0.12, 0.12, 0.12];
COL_METAL = [0.72, 0.72, 0.72];
COL_DISC  = [0.99, 0.1, 0.1];

// ═════════════════════════════════════════════════════════════
//  BAR PRIMITIVES  (all same BW×BT profile, slotted both faces)
// ═════════════════════════════════════════════════════════════
SLW = 15;  SLH = 6;  SLD = 2;  SLP = 46;

module _slotsX(len) {
    n = max(1, floor(len/SLP)-1);
    for (i=[0:n-1])
        translate([SLP/2+i*SLP-SLW/2, -0.1, BW/2-SLH/2])
            cube([SLW, SLD+0.2, SLH]);
}
module _slotsY(len) {
    n = max(1, floor(len/SLP)-1);
    for (i=[0:n-1])
        translate([-0.1, SLP/2+i*SLP-SLW/2, BW/2-SLH/2])
            cube([SLD+0.2, SLW, SLH]);
}
module _slotsZ(len, w) {
    n = max(1, floor(len/SLP)-1);
    for (i=[0:n-1])
        translate([-0.1, w/2-SLH/2, SLP/2+i*SLP-SLW/2])
            cube([SLD+0.2, SLH, SLW]);
}

// Flat bar along X:  [len × BT × BW]  face BW tall, BT deep
module bar_x(len, col) {
    color(col) difference() {
        cube([len, BT, BW]);
        _slotsX(len);
        translate([0,BT,0]) mirror([0,1,0]) _slotsX(len);
    }
}
// Flat bar along Y:  [BT × len × BW]
module bar_y(len, col) {
    color(col) difference() {
        cube([BT, len, BW]);
        _slotsY(len);
        translate([BT,0,0]) mirror([1,0,0]) _slotsY(len);
    }
}
// Square leg along Z:  [LW × LW × len]
module leg_z(len, col) {
    color(col) difference() {
        cube([LW, LW, len]);
        _slotsZ(len, LW);
        translate([LW,0,0]) mirror([1,0,0]) _slotsZ(len, LW);
    }
}
// Thin sub-leg along Z:  [BT × BT × len]
module sub_leg_z(len, col) {
    color(col) difference() {
        cube([BT, BT, len]);
        _slotsZ(len, BT);
    }
}

// ═════════════════════════════════════════════════════════════
//  TABLE FRAME
// ═════════════════════════════════════════════════════════════
module table_frame() {
    // 4 grey corner legs
    for (lx=[0, TW-LW], ly=[0, TD-LW])
        translate([lx, ly, 0]) leg_z(LEG_H, COL_LEG);

    iw = TW - 2*LW;
    id = TD - 2*LW;

    // TIER1 (mid-height) and TIER2 (under-slab) — same perimeter rect
    for (tz=[TIER1_Z, TIER2_Z]) {
        translate([LW,     0,      tz]) bar_x(iw, COL_BLACK);
        translate([LW,     TD-BT,  tz]) bar_x(iw, COL_BLACK);
        translate([0,      LW,     tz]) bar_y(id, COL_BLACK);
        translate([TW-BT,  LW,     tz]) bar_y(id, COL_BLACK);
    }
}

module desk_slab() {
    color(COL_SLAB)
        translate([0, 0, LEG_H]) cube([TW, TD, SLAB_T]);
}

// ═════════════════════════════════════════════════════════════
//  POOL
// ═════════════════════════════════════════════════════════════
module pool() {
    W=POOL_W; D=POOL_D; H=POOL_H; T=WALL_T;
    ox=(TW-W)/2; oy=(TD-D)/2;
    translate([ox, oy, TH]) {
        color(COL_PLEXI, 0.45) {
            cube([W, T, H]);
            translate([0,D-T,0])  cube([W, T, H]);
            translate([0,T,0])    cube([T, D-2*T, H]);
            translate([W-T,T,0])  cube([T, D-2*T, H]);
            translate([T,T,0])    cube([W-2*T, D-2*T, T]);
        }
        color(COL_WATER, 0.70)
            translate([T,T,T]) cube([W-2*T, D-2*T, WATER_D]);
    }
}

// ═════════════════════════════════════════════════════════════
//  H-BRACKET  — true H shape as seen from above
//
//  From photo:
//   - Left Y-rail:  runs full depth (Y), under/beside the shelf
//   - Right Y-rail: runs full depth (Y), beside/under the cage
//   - One X cross-bar connecting the two rails, positioned
//     between shelf and cage (the middle stroke of the H)
//
//  Shelf sub-legs rest on the LEFT rail.
//  Cage bottom frame rests on the RIGHT rail.
//  The X cross-bar ties them together.
//
//  Viewed from above:
//     |          |
//     |----X-----|
//     |          |
//   left       right
//  (shelf)    (cage)
// ═════════════════════════════════════════════════════════════
// ═════════════════════════════════════════════════════════════
//  H-BRACKET — H shape as seen from above
//
//  Two X-rails (front + back, spanning shelf-to-cage width)
//  One Y cross-bar connecting them, between shelf and cage
//
//  Viewed from above:
//    ←————————————→   front X-rail
//         |            Y cross-bar
//    ←————————————→   back X-rail
//
//  Shelf sub-legs rest on LEFT portion of X-rails.
//  Cage bottom frame rests on RIGHT portion of X-rails.
// ═════════════════════════════════════════════════════════════
// ═════════════════════════════════════════════════════════════
//  H-BRACKET — H shape as seen from above
//
//  Two Y-rails running FRONT-TO-BACK (full table depth):
//    - left rail: centred under the shelf
//    - right rail: centred under the cage
//  One X cross-bar running LEFT-RIGHT connecting the two rails,
//    positioned between shelf and cage (the H stroke)
//
//  Top view:
//     |    |       ← Y-rails (front-to-back)
//     |----| cage
//  shelf
// ═════════════════════════════════════════════════════════════
// ═════════════════════════════════════════════════════════════
//  H-BRACKET — H shape as seen from above
//
//  Two X-bars running LEFT-RIGHT, one through shelf, one through cage
//  (front-of-shelf Y and back-of-shelf/cage Y positions)
//  One Y cross-bar connecting them, between shelf and cage
//
//  Top view (Y is up in this diagram):
//
//   shelf    cage
//  ←————————————→   X-bar at front
//        |           Y cross-bar (between shelf and cage)
//  ←————————————→   X-bar at back
// ═════════════════════════════════════════════════════════════
module h_bracket() {
    // X-bars span full table WIDTH (left leg to right leg)
    x0  = 0;
    len = TW;

    // Front X-bar: at Y = front of shelf/cage footprint
    front_y = SHELF_Y0;
    translate([x0, front_y, HB_Z]) bar_x(len, COL_BLACK);

    // Back X-bar: at Y = back of shelf/cage footprint
    back_y = SHELF_Y1 - BT;
    translate([x0, back_y, HB_Z]) bar_x(len, COL_BLACK);

    // Y cross-bar: between shelf and cage, spanning between the two X-bars
    cross_x = (SHELF_X1 + CAGE_X0) / 2 - BT/2;
    translate([cross_x, front_y, HB_Z]) bar_y(back_y - front_y + BT, COL_BLACK);
}

// ═════════════════════════════════════════════════════════════
//  SHELF SUB-FRAME
//  4 thin legs rise from H-bar top (SUB_Z0) by SUB_H
//  Two connecting rails at top of sub-legs
//  Wooden board sits on top of rails
// ═════════════════════════════════════════════════════════════
module shelf_subframe() {
    for (sx=[SHELF_X0, SHELF_X1-BT], sy=[SHELF_Y0, SHELF_Y1-BT])
        translate([sx, sy, SUB_Z0])
            sub_leg_z(SUB_H, COL_BLACK);

    rail_z = SUB_Z0 + SUB_H - BW;   // rails sit at top of legs
    translate([SHELF_X0, SHELF_Y0,    rail_z]) bar_x(SHELF_W, COL_BLACK);
    translate([SHELF_X0, SHELF_Y1-BT, rail_z]) bar_x(SHELF_W, COL_BLACK);
}

// ═════════════════════════════════════════════════════════════
//  SHELF SUB-LEGS
//  4 thin vertical legs from H-bar top (SUB_Z0) up to shelf bottom
// ═════════════════════════════════════════════════════════════
module shelf_subframe() {
    for (sx=[SHELF_X0, SHELF_X1-BT], sy=[SHELF_Y0, SHELF_Y1-BT])
        translate([sx, sy, SUB_Z0])
            sub_leg_z(2*SUB_H, COL_BLACK);
}

module wooden_shelf() {
    translate([SHELF_X0, SHELF_Y0, SHELF_Z]) {
        color(COL_WOOD) cube([SHELF_W, SHELF_D, SHELF_T]);
        color(COL_WTOP) translate([0,0,SHELF_T-1]) cube([SHELF_W, SHELF_D, 1]);
    }
}

// ═════════════════════════════════════════════════════════════
//  MOTOR ASSEMBLY
// ═════════════════════════════════════════════════════════════
module dc_motor() {
    color(COL_MOTOR)
    translate([MOT_X0, MOT_YC, MOT_ZC]) rotate([0,90,0]) {
        cylinder(r=MOT_R, h=MOT_L);
        cylinder(r=MOT_R+4, h=10);
        translate([0,0,MOT_L-10]) cylinder(r=MOT_R+4, h=10);
    }
    // label band
    color([0.93,0.93,0.88])
    translate([MOT_X0+25, MOT_YC-MOT_R*0.95, MOT_ZC-MOT_R*0.95])
        cube([MOT_L-50, MOT_R*1.90, MOT_R*1.90]);
}

module gearbox() {
    color(COL_METAL)
        translate([GB_X, GB_YC-GB_D/2, GB_Z])
            cube([GB_W, GB_D, GB_H]);
}

module shaft_and_bearing() {
    // Shaft from gearbox to disc
    color(COL_METAL, alpha = 0.5)
    translate([SHAFT_X0, MOT_YC, MOT_ZC]) rotate([0,90,0])
        cylinder(r=SHAFT_R, h=SHAFT_X1-SHAFT_X0);

    // Pillow block housing
    color(COL_METAL)
        translate([PB_X, MOT_YC-PB_D/2, MOT_ZC-PB_H/2])
            cube([PB_W, PB_D, PB_H]);

    // Bearing ring face
    color([0.78,0.78,0.78])
    translate([PB_X-1, MOT_YC, MOT_ZC]) rotate([0,90,0])
        difference() {
            cylinder(r=17, h=8);
            cylinder(r=8,  h=9);
        }
}

// ═════════════════════════════════════════════════════════════
//  PERFORATED CAGE
//  Bottom sits on H-bar top (CAGE_Z0 = HB_TOP)
//  Roughly cubic, centred in table X and Y
// ═════════════════════════════════════════════════════════════
module perf_xz(w, h, t) {
    difference() {
        cube([w, t, h]);
        cols = floor((w - HOLE_SP) / HOLE_SP);
        rows = floor((h - HOLE_SP) / HOLE_SP);
        for (c=[0:cols], r=[0:rows])
            translate([HOLE_SP/2+c*HOLE_SP, -0.1, HOLE_SP/2+r*HOLE_SP])
                rotate([-90,0,0]) cylinder(r=HOLE_R, h=t+0.2);
    }
}
module perf_yz(d, h, t) {
    difference() {
        cube([t, d, h]);
        cols = floor((d - HOLE_SP) / HOLE_SP);
        rows = floor((h - HOLE_SP) / HOLE_SP);
        for (c=[0:cols], r=[0:rows])
            translate([-0.1, HOLE_SP/2+c*HOLE_SP, HOLE_SP/2+r*HOLE_SP])
                rotate([0,90,0]) cylinder(r=HOLE_R, h=t+0.2);
    }
}

module perf_cage() {
    color(COL_BLACK, alpha = 0.3) {
        // ── Bottom frame (sits on H-bars) ──────────────────
        translate([CAGE_X0,     CAGE_Y0,     CAGE_Z0]) bar_x(CAGE_W, COL_BLACK);
        translate([CAGE_X0,     CAGE_Y1-BT,  CAGE_Z0]) bar_x(CAGE_W, COL_BLACK);
        translate([CAGE_X0,     CAGE_Y0,     CAGE_Z0]) bar_y(CAGE_D, COL_BLACK);
        translate([CAGE_X1-BT,  CAGE_Y0,     CAGE_Z0]) bar_y(CAGE_D, COL_BLACK);

        // ── Top frame (near slab underside) ───────────────
        translate([CAGE_X0,     CAGE_Y0,     CAGE_Z1-BW]) bar_x(CAGE_W, COL_BLACK);
        translate([CAGE_X0,     CAGE_Y1-BT,  CAGE_Z1-BW]) bar_x(CAGE_W, COL_BLACK);
        translate([CAGE_X0,     CAGE_Y0,     CAGE_Z1-BW]) bar_y(CAGE_D, COL_BLACK);
        translate([CAGE_X1-BT,  CAGE_Y0,     CAGE_Z1-BW]) bar_y(CAGE_D, COL_BLACK);

        // ── Mid-height stiffener ring ──────────────────────
        MZ = CAGE_Z0 + CAGE_H/2 - BW/2;
        translate([CAGE_X0,     CAGE_Y0,     MZ]) bar_x(CAGE_W, COL_BLACK);
        translate([CAGE_X0,     CAGE_Y1-BT,  MZ]) bar_x(CAGE_W, COL_BLACK);
        translate([CAGE_X0,     CAGE_Y0,     MZ]) bar_y(CAGE_D, COL_BLACK);
        translate([CAGE_X1-BT,  CAGE_Y0,     MZ]) bar_y(CAGE_D, COL_BLACK);

        // ── Vertical corner struts ─────────────────────────
        for (cx=[CAGE_X0, CAGE_X1-BT], cy=[CAGE_Y0, CAGE_Y1-BT])
            translate([cx, cy, CAGE_Z0]) cube([BT, BT, CAGE_H]);

        // ── Perforated panels (front, back, left, right) ──
        translate([CAGE_X0,          CAGE_Y0,         CAGE_Z0])
            perf_xz(CAGE_W, CAGE_H, PANEL_T);
        translate([CAGE_X0,          CAGE_Y1-PANEL_T, CAGE_Z0])
            perf_xz(CAGE_W, CAGE_H, PANEL_T);
        translate([CAGE_X0,          CAGE_Y0,         CAGE_Z0])
            perf_yz(CAGE_D, CAGE_H, PANEL_T);
        translate([CAGE_X1-PANEL_T,  CAGE_Y0,         CAGE_Z0])
            perf_yz(CAGE_D, CAGE_H, PANEL_T);
    }
}

// ── Eccentric disc ───────────────────────────────────────────
module eccentric_disc() {
    color(COL_DISC)
    translate([DISC_XC-DISC_T/2, DISC_YC, DISC_ZC])
        rotate([0,90,0]) cylinder(r=DISC_R, h=DISC_T);
    // off-centre crank pin
    color(COL_METAL)
    translate([DISC_XC-DISC_T/2, DISC_YC+DISC_R*0.4, DISC_ZC+DISC_R*0.4])
        rotate([0,90,0]) cylinder(r=5, h=DISC_T);
}


// ═════════════════════════════════════════════════════════════
//  ASSEMBLY
// ═════════════════════════════════════════════════════════════
table_frame();
desk_slab();
pool();
h_bracket();

// Sub-assembly: cage + motor shelf both rest on H-bar top
shelf_subframe();
wooden_shelf();
dc_motor();
gearbox();
shaft_and_bearing();
perf_cage();
eccentric_disc();
