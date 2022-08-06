
$fn = 100;
include <dimensions.scad>;

floater_z = 1*capsule_length;
floater_dia = 100;

module floater()
{
    difference()
    {
        union()
        {
            cylinder(floater_z, d=floater_dia, center=true);
            translate([0,0,floater_z/2])
            difference()
            {
                sphere(d=floater_dia);
                translate([-floater_dia/2,-floater_dia/2,-floater_dia/2])
                cube([floater_dia,floater_dia,floater_dia/2/2]);
            }
        }
        magnet_from_top=10;
        color("blue")
            translate([0,0,floater_dia/2/2])
            cylinder(floater_z+floater_dia/2+2, d=magnet2_innerdia, center=true);

            color("red")
            translate([0,0,-(floater_z)/2+magnet_from_top/2-1])
            cylinder(magnet_from_top+1, d=magnet2_outerdia+0.5, center=true);

    }
}
floater();
