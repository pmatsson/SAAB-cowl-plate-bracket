bp_z = 5;
bp_x = 29;
bp_y = 27;

tail_x = 2;
tail_y = 3;
tail_z = bp_z;

tail_b_x = 27;
tail_b_y = 2;
tail_b_z = bp_z;


difference() {
    cube([bp_x, bp_y, bp_z]);
    
    translate([0, bp_y , -0.5])
    cylinder(bp_z + 1, d=20); 
    
    translate([bp_x, bp_y , -0.5])
    cylinder(bp_z + 1, d=20); 

}


translate([bp_x/2 - tail_x/2, bp_y, 0]) {
    color([0,0,1])
    cube([tail_x, tail_y, tail_z]); 

}


translate([bp_x/2 - tail_b_x/2, bp_y + tail_y, 0]) {
    color([0,0,1])
    cube([tail_b_x, tail_b_y, tail_b_z]); 
    
    big_knob = 2.2;
    knob_rad = 1.5;
    translate([0, tail_y/2 - knob_rad/2, 0])
    cylinder(bp_z, r=knob_rad, $fn = 15);
    
    translate([tail_b_x, knob_rad/2, 0])
    cylinder(bp_z, r=knob_rad, $fn = 15);
    
    translate([tail_b_x/2, tail_y/2  - big_knob/4 , 0])
    cylinder(bp_z, r=big_knob, $fn = 15);
    
    translate([tail_b_x/2, -tail_y - knob_rad/2, 0])
    cylinder(bp_z, r=knob_rad, $fn = 15);
    
}




hook_x = 9;
hook_y = 22;
hook_z = 10;
hook_overlap = 8;

translate([bp_x/2 - hook_x/2, hook_overlap-hook_y, bp_z]) {
    
    difference() {
        difference() {
            color([1,0,0])
            cube([hook_x, hook_y, hook_z]);
            rotate([55, 0,0])
            translate([-0.5, -0.5, -0.5])
            cube([hook_x + 1, hook_y + 1, hook_z + 1]);
            

            translate([-0.5, hook_y/2 - 0.5, 15-0.5])
            rotate([-55, 0,0])
            cube([hook_x + 1, hook_y + 1, hook_z + 1]);
        }
        
        color([0,1,0])
        translate([2, hook_y/2 + 1, 0])
        cube([hook_x-4, hook_y+1, hook_z+1]);
        
        translate([2, -hook_y/2 + 1, 2])
        cube([hook_x-4, hook_y-2, hook_z+1]);
    
    }
    
    translate([0,hook_y/4, 0])
    cube([hook_x, 1, hook_z/2]);
    
    translate([0, hook_y - hook_y/2, 0])
    cube([hook_x, 7, hook_z/4]);
}