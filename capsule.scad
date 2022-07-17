$fn = 100;
include <dimensions.scad>;

module capsule()
{
difference()
{
    // main body
    cylinder(capsule_length, d=capsule_dia, center=true);

    for (mir = [0,1])
    {
        mirror([mir,0,0])
        {
            // remove sides to leave a beam in the middle
            translate([middle_stud_width/2, -100/2,-(capsule_length - 2*outer_stud_width)/2])
            cube([100, 100, capsule_length - 2*outer_stud_width]);
        }

        rotate([0,0,90])
        {
            mirror([mir,0,0])
            {
                // flatting ends to improve printability
                translate([capsule_dia/2 -capsule_flat_y, -100/2,-100/2])
                cube([100, 100, 100]);
            }
        }
    }

    // two holes for signal wires
    for (mir = [0,1])
    {
        mirror([mir,0,0])
        translate([3,0,0])
           cylinder(capsule_length+2, d=1, center=true);
    }
   // opening for reed in the middle
   translate([-reed_dia/2,-reed_dia/2,-reed_length/2])
        cube([reed_dia,reed_dia,reed_length]);

   // female mating end
   translate([-connector_x/2 ,capsule_dia/2 -capsule_flat_y-connector_y, capsule_length/2-connector_gap_mill_z])
   {

       cube([connector_x, 10, connector_gap_mill_z]);
       translate([0,-2,-mating_tolerance])
           cube([connector_x, 10, outer_stud_width+mating_tolerance]);
   }

}

// male mating end
translate([-connector_x/2 ,-capsule_dia/2 +capsule_flat_y, -capsule_length/2-connector_gap_mill_z])
{
    cube([connector_x, connector_y, connector_gap_mill_z]);
       translate([0,2,0])
           cube([connector_x, 2, outer_stud_width-mating_tolerance]);

}

}

capsule();
