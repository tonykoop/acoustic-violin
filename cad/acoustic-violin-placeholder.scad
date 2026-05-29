// Acoustic violin parametric placeholder geometry.
// NOT fabrication authority. Scaffold for future CAD authoring.
// All dimensions sourced from acoustic-violin-design-table.xlsx (baseline).
// Authority: pending_measurement — do not use for fabrication without
// review against family-spec.csv and a measured template.

scale_length_in     = 12.9;   // L2 scaffold; verify with luthier reference
body_length_in      = 14.0;
upper_bout_in       = 6.6;
lower_bout_in       = 8.2;
rib_height_in       = 1.25;
top_thickness_in    = 0.12;
back_thickness_in   = 0.16;
f_hole_spacing_in   = 4.2;
neck_angle_deg      = 4.0;
string_count        = 4;

module body_outline() {
  hull() {
    translate([-upper_bout_in/2, body_length_in * 0.75, 0])
      circle(d=upper_bout_in, $fn=64);
    translate([-lower_bout_in/2, body_length_in * 0.20, 0])
      circle(d=lower_bout_in, $fn=64);
  }
}

linear_extrude(height=rib_height_in)
  body_outline();
