module strip () {
    cube([15, 100, 10], center=true);
    }


difference () {
    cube([127,127,127], center=true);
    cube([101.6,101.6,101.6], center=true);
    translate([0, 0, 0]) rotate([0, 0, 0]) cube([200,100,100], center=true);    
    translate([0, 0, 0]) rotate([0, 0, 0]) cube([100,200,100], center=true);    
    translate([0, 0, 0]) rotate([0, 0, 0]) cube([100,100,200], center=true);  
  
    translate([53.5, 0, 53.5]) rotate([0, 45, 0])  strip();
    translate([-53.5, 0, 53.5]) rotate([0, -45, 0]) strip();
    translate([53, 0, -53]) rotate([0,  -45, 0]) strip();
    translate([-53, 0, -53]) rotate([0,  45, 0]) strip();
    
    translate([0, 53.5, 53.5]) rotate([0, 45, 90])  strip();
    translate([0, -53.5, -53.5]) rotate([0, 45, 90])  strip();
    
    translate([0, 53.5, -53.5]) rotate([0, -45, 90])  strip();
    translate([0, -53.5, 53.5]) rotate([0, -45, 90])  strip();

    translate([-53.5, 53.5, 0]) rotate([90, 0, 45])  strip();
    translate([53.5, -53.5, 0]) rotate([90, 0, 45])  strip();

    translate([53.5, 53.5, 0]) rotate([90, 0, -45])  strip();
    translate([-53.5, -53.5, 0]) rotate([90, 0, -45])  strip();
    }


