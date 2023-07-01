$fn = 300;
include <dimensions.scad>;

tube_envelope=2;
stand_dia = 40;
stand_axis=20;
stand_thickness = tube_outer_dia+tube_envelope*2;
module standedge()
{
    difference()
    {
        cube([stand_dia,stand_axis, stand_thickness], center=true);

        translate([0,stand_axis/2-tube_envelope, 0])
        rotate([90,0,0])
        cylinder(d=tube_outer_dia, 40);
    }
}

standedge();
