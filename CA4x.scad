$fn = 60;
eps = 0.001;

CB42();

//translate([1,0,0]) rotate ([0,0,   0]) translate([-15,-15,0]) CB42();
//translate([-1,0,0]) rotate ([0,0,  180]) translate([-15,-15,0]) CA42();

//translate([36,0,0]) rotate ([0,0,   0]) translate([-15,-15,0]) CA42();
//translate([34,0,0]) rotate ([0,0,  180]) translate([-15,-15,0]) CA42();

     //translate([-6,6,6]) cube ([30,30,8]);
    
/**
 *
 * Right-angle corner join for 2020 aluminium extrusion (Bosch standard profile
 * with 6mm groove). 
 *
 * The join requires 4 x countersuck flat head DIN965 M4 bolts length 10mm. 
 * Other standards might work provided the space for the bolt head is compatible
 * (ie a cone with d1=4.6mm to d2=7.5mm with head height 2.2mm).
 *
 * Also required are 4 x M4 T-nuts compatible with 6mm groove 2020 extrusions.
 *
 * Use instruction: I
 * 
 * Insert 4 x M4 bolts into the join until the tread protrudes
 * out the far side. Twist a T-nut onto the protruded thread and tighten so that
 * the bolt head sits snugly in the countersunk cavity (this is necessary to 
 * allow bolts in the orthogonal direction to be inserted). Now align the
 * T-nuts so that that long axis of the nut can be directly inserted into the
 * 2020 groove. 
 *
 * Once the join is in place, with the bolts slightly tighted, before fully tightning 
 * the bolts, first loosen the bolt by 3 turns. This will almost (but not fully) 
 * retract the bolt from the T-nut allowing it to rotate in the groove. Now fully
 * tighten. The T-nut should now rotate until its axis is perpendicular to the groove 
 * - this provides the optimum grip. Note: the T-nut is designed with rounded corners
 * to allow it to rotate to this orientation but not beyond.
 *
 * If possible visually inspect the T-nut to ensure that rotation has taken place.
 *
 * Alternativly if you have access to an open end of the 2020
 * extrusion you can align the T-nuts so that the long axis is perpendicular
 * to the groove. Before insertion tighten bolt/nut to 'finger tight'. Slide the
 * join to where it's needed and then fully tighten the bolts.
 *
 * 
 * Notes about the slicing for 3D printer: 
 * This is tested with 0.6mm nozzel with 0.3mm layer height on
 * Prusa Mini+. Printed with PLA. Set vertical shells to 4 or more.
 * Since bolt heads / T-nuts will be applying significant compressive force along 
 * the direction of the bolt holes these structures should be made as strong
 * as possible for compression.
 *
 * TODO: current version is designed for DIN965 bolts. This may not be the best
 * choice for use with PLA 3D print. Considering DIN912 with a flat cylinder head
 * as alternative. If using DIN912, a 10mm bolt is too long. Maybe 
 
 * Part number:
 * C - corner join 
 * A - type A
 * 4 - M4 bolts
 * 2 - 20mm slot 6 aluminium profile
 */
module CA42 () {
    difference() {
    
        cube ([30,30,20]);
        translate([0,0,-eps]) rotate([0,0,45]) cube ([50,30,20+eps*3]);


        // Clear out material to make screw insertion easier (optional)
        // but likely to require support material.
        // Experimental. Use curved cutout to reduce need for support material.
        translate([30,0,10]) rotate([-90,0,45]) translate([0,0,20]) scale([2.2,1,1]) sphere (d=12);


        // Holes for M4 DIN965 10mm bolts d2 (head dia) = 7.5mm; k (head surface to thread start) = 2.2mm
        //translate ([10,0-eps,10]) rotate([-90,0,0]) screwhole_DIN965();
        //translate ([20,0-eps,10]) rotate([-90,0,0]) screwhole_DIN965();
        //translate ([30,10-eps,10]) rotate([0,-90,0]) screwhole_DIN965();
        //translate ([30,20-eps,10]) rotate([0,-90,0]) screwhole_DIN965();

        translate ([10,0-eps,10]) rotate([-90,0,0]) screwhole_DIN912();
        translate ([20,0-eps,10]) rotate([-90,0,0]) screwhole_DIN912();
        translate ([30,10-eps,10]) rotate([0,-90,0]) screwhole_DIN912();
        translate ([30,20-eps,10]) rotate([0,-90,0]) screwhole_DIN912();
        
        
        // Part number 'etched' on top surface
        translate([7.5,2,0]) translate([0,0,20-0.3]) linear_extrude(0.6) text("CA42", size=6);

    }
    


    // Slot notches: these should squeeze into the aluminium grooves and provide extra
    // ridgitity of the joint in out-of-plane forces/torques. Ie forces where there is a 
    // 'z' component (if you consider the two struts being joing being on the x and y axis).
    //
    // Groove width measured at 6.27mm, setting at 6.30. When screws tighten this should sqeeze
    // these notches in. I'm hoping to get away with printing this without hoverhang supports.
    // Update: these notches work. Works well at nw=6.3mm wide, but I think it can be slightly wider.
    // Update: no at 6.6mm it prevented the join from being flush with the aluminium surface. Stick
    // with 6.3mm.
    nw = 6.3;
    translate ([0,-1,(20-nw)/2]) cube ([4,1,nw]);
    translate ([26,-1,(20-nw)/2]) cube ([4,1,nw]);

    translate ([30,0,(20-nw)/2]) cube ([1,4,nw]);
    translate ([30,26,(20-nw)/2]) cube ([1,4,nw]);





    // Cavity for DIN965 M4 bolt including the conical head. 
    module screwhole_DIN965() {
        // Bolt shaft
        translate([0,0,0]) cylinder (d=4.6,h=3+eps);
        
        // Conical counter-sink head
        translate([0,0,3]) cylinder (d1=4.6, d2=7.5, ,h=2.2);
        translate([0,0,5.2]) cylinder (d=7.5, ,h=20);
    }

    // Cavity for DIN912 M4 bolt. M4 bolt head height is 4mm.
    module screwhole_DIN912() {
        // Bolt shaft
        translate([0,0,0]) cylinder (d=4.6,h=5+eps);
        translate([0,0,3]) cylinder (d=7.2, ,h=40);
    }
}
module CB42 () {
    

        //translate([0,0,10]) rotate([-90,0,45]) translate([20*sqrt(2),0,00]) scale([30*sqrt(2) * 1.0,12,10]) sphere (d=1);

    difference() {
    
        cube ([40,40,20]);
        translate([0,0,-eps]) rotate([0,0,45]) cube ([60,30,20+eps*3]);


        // Clear out material to make screw insertion easier (optional)
        // but likely to require support material.
        // Experimental. Use curved cutout to reduce need for support material.
        translate([0,0,10]) rotate([-90,0,45]) translate([20*sqrt(2),0,00]) scale([24*sqrt(2) * 1.0,14,20]) sphere (d=1);


        // Holes for M4 DIN965 10mm bolts d2 (head dia) = 7.5mm; k (head surface to thread start) = 2.2mm
        //translate ([10,0-eps,10]) rotate([-90,0,0]) screwhole_DIN965();
        //translate ([20,0-eps,10]) rotate([-90,0,0]) screwhole_DIN965();
        //translate ([30,10-eps,10]) rotate([0,-90,0]) screwhole_DIN965();
        //translate ([30,20-eps,10]) rotate([0,-90,0]) screwhole_DIN965();

        translate ([40-15,0-eps,10]) rotate([-90,0,0]) screwhole_DIN912();
        translate ([40-30,0-eps,10]) rotate([-90,0,0]) screwhole_DIN912();
        
        translate ([40,15-eps,10]) rotate([0,-90,0]) screwhole_DIN912();
        translate ([40,30-eps,10]) rotate([0,-90,0]) screwhole_DIN912();
        
        
        // Part number 'etched' on top surface
        translate([10,2,0]) translate([0,0,20-0.3]) linear_extrude(0.6) text("CB42", size=6);

    }
    
    // Show bolts
    //translate ([40-15,6,10])   rotate([-90,0,0]) bolt_DIN912(m=4,h=10);
    //translate ([40-30,6,10])   rotate([-90,0,0]) bolt_DIN912(m=4,h=10);


    // Slot notches: these should squeeze into the aluminium grooves and provide extra
    // ridgitity of the joint in out-of-plane forces/torques. Ie forces where there is a 
    // 'z' component (if you consider the two struts being joing being on the x and y axis).
    //
    // Groove width measured at 6.27mm, setting at 6.30. When screws tighten this should sqeeze
    // these notches in. I'm hoping to get away with printing this without hoverhang supports.
    // Update: these notches work. Works well at nw=6.3mm wide, but I think it can be slightly wider.
    // Update: no at 6.6mm it prevented the join from being flush with the aluminium surface. Stick
    // with 6.3mm.
    nw = 6.3;
    translate ([0,-1,(20-nw)/2]) cube ([4,1,nw]);
    translate ([36,-1,(20-nw)/2]) cube ([4,1,nw]);

    translate ([40,0,(20-nw)/2]) cube ([1,4,nw]);
    translate ([40,36,(20-nw)/2]) cube ([1,4,nw]);


    // Cavity for DIN912 M4 bolt. M4 bolt head height is 4mm.
    module screwhole_DIN912() {
        // Bolt shaft
        translate([0,0,0]) cylinder (d=4.6,h=15+eps);
        translate([0,0,6]) cylinder (d=7.2, ,h=40);
    }
    
    module bolt_DIN912(m=4,h=10) {
        dk=7;
        k=4;
        ds=m;
        color([0.4,0.4,0.4]) {
        cylinder(d=dk,h=k);
        translate([0,0,-h]) cylinder(d=ds,h=h);
        }
    }
    
}
