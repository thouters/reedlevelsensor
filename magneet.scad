$fn = 100;
include <dimensions.scad>;

module magnet2()
{
    difference()
    {
        cylinder(magnet2_length, d=magnet2_outerdia, center=true);
        cylinder(magnet2_length, d=magnet2_innerdia, center=true);
    }
}
magnet2();
