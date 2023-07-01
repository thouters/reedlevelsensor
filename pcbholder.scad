$fn = 100;
include <dimensions.scad>;
pcb_thickness=1.8;
component_thickness = 2;
pcb_clamp = 2;
pcbhole_length = 32;
pinholegap_dia=3;

module pcbholder()
{
    pcbholder_length=54;
difference()
{
    // main body
    cylinder(pcbholder_length, d=capsule_dia, center=true);

    for (mir = [0,1])
    {
        mirror([mir,0,0])
        {
            // remove sides to leave a beam in the middle
            translate([middle_stud_width/2, -100/2,-(pcbholder_length - 2*outer_stud_width)/2])
            cube([100, 100, pcbholder_length - 2*outer_stud_width]);
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
           cylinder(pcbholder_length+2, d=2, center=true);
    }
    rotate([90,0,0])
        cube([12,32,pcb_thickness],center=true);

    translate([0,-component_thickness/2-pcb_thickness/2,0])
        rotate([90,0,0])
            cube([12,pcbhole_length,component_thickness],center=true);

    // holes for through hole soldering
    for (mir = [0,1])
    {
        mirror([0,0,mir])
        {
            translate([
            0,
            component_thickness/2,
            pcbhole_length/2-pinholegap_dia/2-1
            ])
            rotate([0,90,0])
                cylinder(pcbholder_length+2, d=pinholegap_dia, center=true);
       }
    }

    for (mir=[0,1])
    {
        mirror([0,0,mir])

        // female mating end
        translate([-connector_x/2 ,capsule_dia/2 -capsule_flat_y-connector_y, pcbholder_length/2-connector_gap_mill_z])
        {

            cube([connector_x, 10, connector_gap_mill_z]);
            translate([0,-2,-mating_tolerance])
                cube([connector_x, 10, outer_stud_width+mating_tolerance]);
        }
    }

}
    for (mir=[0,1])
    {
        mirror([0,0,mir])
        {
            // male mating end
            translate([-connector_x/2 ,-capsule_dia/2 +capsule_flat_y, -pcbholder_length/2-connector_gap_mill_z])
            {
                cube([connector_x, connector_y, connector_gap_mill_z]);
                   translate([0,2,0])
                       cube([connector_x, 2, outer_stud_width-mating_tolerance]);

            }
        }
    }

support_thickness=2;
    translate([0,+support_thickness/2+pcb_thickness/2,0])
        rotate([90,0,0])
            cube([8,16,support_thickness],center=true);

}

pcbholder();
