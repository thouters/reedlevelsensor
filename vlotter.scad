
$fn = 100;
include <dimensions.scad>;

floater_dia = 90;
hole_dia = 16+2;

module floater()
{
    difference()
    {
        union()
        {
        handle_z=floater_dia/2;
        join_z=10;
//            translate([0,0,handle_z/2+floater_dia/2-join_z/2])
//                cylinder(handle_z+join_z, d=hole_dia+5, center=true);
            difference()
            {
                sphere(d=floater_dia);
                translate([0,0,-floater_dia/4])
               cube([floater_dia,floater_dia,floater_dia/2], center=true);
            }
        }
        magnet_from_top=10;
        color("blue")
            translate([0,0,120/2-2])
            cylinder(120, d=hole_dia, center=true);


        magnet_depth_extra = 1;
        translate([0,0,(magnet2_length+magnet_depth_extra)/2-1])
        difference()
        {
            cylinder((magnet2_length+magnet_depth_extra), d=magnet2_outerdia,center=true);
            cylinder((magnet2_length+magnet_depth_extra), d=magnet2_innerdia,center=true);
        }

    }
}
floater();
