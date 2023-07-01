$fn = 300;
include <dimensions.scad>;

tube_envelope=2;
stand_dia = 60;
stand_thickness = tube_outer_dia+tube_envelope*2;
module standcenter()
{
    difference()
    {
        cylinder(d=stand_dia,stand_thickness, center=true);

        translate([0,0,-stand_thickness/2+tube_envelope])
        cylinder(d=tube_outer_dia, 40);

        for(y=[0,90, 180, 270])
        rotate([0,0,y])

        translate([0,-tube_outer_dia/2-tube_envelope,0])
        rotate([90,0,0])
        cylinder(d=tube_outer_dia, 40);
    }
}

standcenter();
