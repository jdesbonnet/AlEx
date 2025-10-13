$fn = 60;
eps = 0.001;

difference() {
cube ([30,30,20]);


translate([0,0,-eps]) rotate([0,0,45]) cube ([50,30,20+eps*3]);


// Holes for M4 DIN965 bolts d2 (head dia) = 7.5mm; k (head surface to thread start) = 2.2mm
/*
translate ([10,0,10]) rotate([90,0,0]) translate([0,0,-50]) cylinder (d=4.6,h=100);
translate ([20,0,10]) rotate([90,0,0]) translate([0,0,-50]) cylinder (d=4.6,h=100);

translate ([0,10,10]) rotate([0,90,0]) translate([0,0,-50]) cylinder (d=4.6,h=100);
translate ([0,20,10]) rotate([0,90,0]) translate([0,0,-50]) cylinder (d=4.6,h=100);
*/

translate ([10,0-eps,10]) rotate([-90,0,0]) screwhole();
translate ([20,0-eps,10]) rotate([-90,0,0]) screwhole();



translate ([30,10-eps,10]) rotate([0,-90,0]) screwhole();
translate ([30,20-eps,10]) rotate([0,-90,0]) screwhole();

}




module screwhole() {
 {
	translate([0,0,0]) cylinder (d=4.6,h=4);
	translate([0,0,4]) cylinder (d1=4.5, d2=7.5, ,h=2.2);
	translate([0,0,6.2]) cylinder (d=7.5, ,h=20);
}
}
