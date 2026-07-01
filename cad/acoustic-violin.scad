// Acoustic violin parametric master — bowed-string reference envelope.
//
// Authority: pending_measurement. NOT fabrication authority until reviewed
// against a measured template / luthier reference (see
// visual-output-register.csv CAD-001, validation.csv, and design.md gaps).
//
// Dimension sources (do not edit values without updating the source record):
//   - scale length, body length, bouts, rib height, plate thicknesses,
//     f-hole spacing, neck angle: family-spec.csv (acoustic-violin-baseline row),
//     itself derived from acoustic-violin-design-table.xlsx.
//   - tuning G3-D4-A4-E5, ~45-55 lbf total tension: design.md "Baseline
//     Assumptions".
//   - open-string model f = (1/2L)*sqrt(T/mu): design.md "Governing Model".
//
// BOWED-STRING geometry that is FUNCTION-CRITICAL but NOT in this repo's design
// table is modeled generically and flagged `TBD_measurement`. These parameters
// (bridge crown radius, afterlength, string spacing at bridge, fingerboard
// scoop, neck projection) MUST come from a measured setup drawing before this
// master can carry fabrication authority — see README "Build Review Checklist".
//
// Units: inches.

/* [Member — family-spec.csv] */
// 0 = acoustic-violin-baseline, 1 = acoustic-violin-variant
member = 0;

// family-spec.csv columns, per member row.
scale_lengths_in  = [12.9, 13.9];   // vibrating string length (nut->bridge)
body_lengths_in   = [14.0, 15.1];
upper_bouts_in    = [6.6, 7.13];
lower_bouts_in    = [8.2, 8.86];
rib_heights_in    = [1.25, 1.35];
top_thicks_in     = [0.12, 0.12];
back_thicks_in    = [0.16, 0.16];
f_hole_spacing_in = [4.2, 4.54];
neck_angles_deg   = [4.0, 4.32];

scale_length_in   = scale_lengths_in[member];
body_length_in    = body_lengths_in[member];
upper_bout_in     = upper_bouts_in[member];
lower_bout_in     = lower_bouts_in[member];
rib_height_in     = rib_heights_in[member];
top_thickness_in  = top_thicks_in[member];
back_thickness_in = back_thicks_in[member];
f_hole_gap_in     = f_hole_spacing_in[member];
neck_angle_deg    = neck_angles_deg[member];

/* [Strings — design.md] */
string_count      = 4;      // G3-D4-A4-E5 (design.md tuning)

/* [Bowed setup — TBD_measurement: NOT in design table] */
// Standard violin working ranges shown only as modeling placeholders; every
// value here is a measurement gate, not a design-table dimension.
waist_width_in       = 4.1;    // TBD_measurement (C-bout minimum width)
bridge_crown_r_in    = 1.65;   // TBD_measurement (bridge top arc radius)
bridge_height_in     = 1.30;   // TBD_measurement (set by neck projection)
string_spacing_br_in = 1.34;   // TBD_measurement (E->G span at bridge)
afterlength_in       = scale_length_in / 6;  // TBD_measurement (bridge->tailpiece)
fingerboard_len_in   = 10.6;   // TBD_measurement
fingerboard_thick_in = 0.28;   // TBD_measurement
neck_thick_in        = 0.80;   // TBD_measurement

// ---------------------------------------------------------------------------
// Derived geometry (formulas, not baked values)
// ---------------------------------------------------------------------------

// Body centerline runs along +y; bridge sits at the lower-bout acoustic center.
bridge_y_in   = body_length_in * 0.38;   // TBD_measurement (stop-length driven)
nut_y_in      = bridge_y_in + scale_length_in;   // nut = bridge + vibrating len
tailpiece_y   = bridge_y_in - afterlength_in;

// Violin outline: upper bout, C-bout waist, lower bout via a hull of three
// circle pairs. Cosmetic curve only; not a fabrication outline.
module body_outline() {
  hull() {
    translate([0, body_length_in * 0.72, 0]) circle(d = upper_bout_in, $fn = 96);
    translate([0, body_length_in * 0.50, 0]) circle(d = waist_width_in, $fn = 96);
  }
  hull() {
    translate([0, body_length_in * 0.50, 0]) circle(d = waist_width_in, $fn = 96);
    translate([0, body_length_in * 0.24, 0]) circle(d = lower_bout_in, $fn = 96);
  }
}

module body_shell() {
  // Ribs as an extruded outline; top/back are thin plates capping it.
  linear_extrude(height = rib_height_in) body_outline();
  color("bisque") translate([0, 0, rib_height_in])
    linear_extrude(height = top_thickness_in) body_outline();
  color("tan") translate([0, 0, -back_thickness_in])
    linear_extrude(height = back_thickness_in) body_outline();
}

module f_holes() {
  // Two f-hole placeholders flanking the centerline at +/- half the spacing.
  for (s = [-1, 1])
    translate([s * f_hole_gap_in / 2, bridge_y_in, rib_height_in])
      cylinder(h = top_thickness_in * 4, d = 0.28, center = true, $fn = 24);
}

module bridge() {
  // Blank width from string span; crown is a shallow arc (TBD_measurement).
  translate([0, bridge_y_in, rib_height_in + top_thickness_in])
    difference() {
      translate([-string_spacing_br_in / 2, -0.06, 0])
        cube([string_spacing_br_in, 0.12, bridge_height_in]);
      // Crown radius cut across the top edge.
      translate([0, 0, bridge_height_in + bridge_crown_r_in - 0.10])
        rotate([90, 0, 0])
          cylinder(h = 0.4, r = bridge_crown_r_in, center = true, $fn = 96);
    }
}

module tailpiece() {
  translate([-0.9, tailpiece_y - 1.6, rib_height_in + top_thickness_in])
    cube([1.8, 1.6, 0.20]);
}

module neck_and_fingerboard() {
  // Neck root at the upper-bout body joint, tilted by neck_angle_deg so the
  // fingerboard clears the top toward the bridge (projection = TBD_measurement).
  joint_y = body_length_in * 0.86;
  translate([0, joint_y, rib_height_in])
    rotate([neck_angle_deg, 0, 0]) {
      // Neck blank.
      color("burlywood") translate([-0.6, 0, -neck_thick_in])
        cube([1.2, fingerboard_len_in, neck_thick_in]);
      // Fingerboard on top of the neck.
      color("dimgray") translate([-0.55, 0, 0])
        cube([1.1, fingerboard_len_in, fingerboard_thick_in]);
    }
}

module string_paths() {
  // Straight open-string paths, nut -> bridge, spaced across the bridge span.
  for (i = [0 : string_count - 1]) {
    x = -string_spacing_br_in / 2
        + (string_count > 1 ? i * string_spacing_br_in / (string_count - 1) : 0);
    z_bridge = rig_top() + bridge_height_in;
    hull() {
      translate([x, bridge_y_in, z_bridge]) sphere(r = 0.01, $fn = 8);
      translate([x, nut_y_in, z_bridge]) sphere(r = 0.01, $fn = 8);
    }
  }
}

function rig_top() = rib_height_in + top_thickness_in;

module acoustic_violin_assembly() {
  difference() { body_shell(); f_holes(); }
  bridge();
  tailpiece();
  neck_and_fingerboard();
  string_paths();
}

acoustic_violin_assembly();

// Echo the open-string setup so `openscad` runs double as a geometry check.
echo(str("member=", member, " scale_length_in=", scale_length_in));
echo(str("stop_bridge_y_in=", bridge_y_in, " nut_y_in=", nut_y_in));
echo(str("afterlength_in(TBD)=", afterlength_in));
