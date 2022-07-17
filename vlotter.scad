
$fn = 100;
include <dimensions.scad>;

vlotter_z = 3*capsule_length;
vlotter_dia = 50;

difference(
cylinder(vlotter_z, d=vlotter_dia, center=true);
