$fn = 100;
capsule_length = 37.5;
capsule_dia = 12.5; // 13 - 0.5

reed_length=14;
reed_dia = 2;


outer_stud_width = 2;
middle_stud_width = 2;

difference()
{
    cylinder(capsule_length, d=capsule_dia, center=true);
for (mir = [0,1])
{
    mirror([mir,0,0])
    {
        translate([middle_stud_width/2, -100/2,-(capsule_length - 2*outer_stud_width)/2])
        cube([100, 100, capsule_length - 2*outer_stud_width]);
        }
        rotate([0,0,90])
    mirror([mir,0,0])
    {

        // flatting ends
        translate([capsule_dia/2 -1.5, -100/2,-100/2])
        cube([100, 100, 100]);

    }
}

    for (mir = [0,1])
    {
    mirror([mir,0,0])
    translate([3,0,0])
       cylinder(capsule_length+2, d=1, center=true);
   }
   //////////////// wip
    for (mir = [0,1])
    {
    mirror([mir,0,0])
    {
    translate([3,0,0])
       cylinder(capsule_length+2, d=1, center=true);
       }
   }
   //////
    translate([-3/2,-3/2,-reed_length/2])
    cube([3,3,reed_length]);

    translate([-3/2,-3/2,-reed_length/2])
    cube([3,3,reed_length]);
}
