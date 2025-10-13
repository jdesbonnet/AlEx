$fn = 60;
eps = 0.001;

//translate([1,0,0]) rotate ([0,0,   0]) translate([-15,-15,0]) CA42();
translate([-1,0,0]) rotate ([0,0,  180]) translate([-15,-15,0]) CA42();


//translate([34,0,0]) rotate ([0,0,   0]) translate([-15,-15,0]) CA42();
//translate([32,0,0]) rotate ([0,0,  180]) translate([-15,-15,0]) CA42();

/**
 * C - corner join 
 * A - type A
 * 4 - M4 screws
 * 2 - 20mm slot 6 aluminium profile
 */
module CA42 () {
    difference() {
    
        cube ([30,30,20]);
        translate([0,0,-eps]) rotate([0,0,45]) cube ([50,30,20+eps*3]);

        // Holes for M4 DIN965 10mm bolts d2 (head dia) = 7.5mm; k (head surface to thread start) = 2.2mm
        translate ([10,0-eps,10]) rotate([-90,0,0]) screwhole();
        translate ([20,0-eps,10]) rotate([-90,0,0]) screwhole();
        translate ([30,10-eps,10]) rotate([0,-90,0]) screwhole();
        translate ([30,20-eps,10]) rotate([0,-90,0]) screwhole();

        // Part number 'etched' on top surface
        translate([7.5,2,0]) translate([0,0,20-0.3]) linear_extrude(0.6) text("CA42", size=6);

    }

    // Experimental: alignment: these should squeeze into the Al grooves (deliberate tight fit).
    // This I hope will reduce wiggle.
    // Groove width measured at 6.27mm, setting at 6.30. When screws tighten this should sqeeze
    // these notches in.
    translate ([0,-1,(20-6.3)/2]) cube ([4,1,6.3]);
    translate ([26,-1,(20-6.3)/2]) cube ([4,1,6.3]);

    translate ([30,0,(20-6.3)/2]) cube ([1,4,6.3]);
    translate ([30,26,(20-6.3)/2]) cube ([1,4,6.3]);


module screwhole() {
	translate([0,0,0]) cylinder (d=4.6,h=3+eps);
	translate([0,0,3]) cylinder (d1=4.6, d2=7.5, ,h=2.2);
	translate([0,0,5.2]) cylinder (d=7.5, ,h=20);
}


}

