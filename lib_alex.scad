/** 
 * Library for aluminium extrusion joins and related parts.
 * Currently supports standard 1515 and 2020 extrusions.
 *
 * ALD:  Aluminium width mm (15 or 20, but no reason why other sizes won't work)
 * T:    Wall thickness
 * L:    Length of join arms.
 * M:    Screw diameter mm (eg 3 for M3).
 * 
 * Joe Desbonnet
 * 2025-03-28
 */
 
 
use <lib_screw.scad>; 
 
/**
 * Holes to allow T-nuts to be used to secure the aluminium extrusion to the join.
 **/ 
module AlEx_screw_holes(ALD=15,T=3,M=4,ex_center_screw_hole) {
    eps = 0.001;
    
    L = ALD + T*2 + eps*2;
    
    start = ex_center_screw_hole ? 0 : 1;
    
    for (o = [-1,1]) {
    for (i = [start : 3]) {

        
        //translate([0, 0, ALD*i]) rotate([0,90,0]) translate([0,0,-L]) cylinder(d=M,h=L*3);
        translate([0, 0, ALD*i]) rotate([0,90,0]) translate([0,0,-ALD/2 -T-eps]) m_screw(d=M,h=L,orientation=o,slot=0);

        //translate([0, ALD*i, 0]) rotate([0,90,0]) translate([0,0,-L]) cylinder(d=M,h=L*3);
        translate([0, ALD*i, 0]) rotate([0,90,0])  translate([0,0,-ALD/2 -T-eps]) m_screw(d=M,h=L,orientation=o,slot=0);

        
        //translate([0, 0, ALD*i]) rotate([-90,0,0]) translate([0,0,-L]) cylinder(d=M,h=L*3);
        translate([0, 0, ALD*i]) rotate([-90,0,0]) translate([0,0,-ALD/2 -T-eps]) m_screw(d=M,h=L,orientation=o,slot=0);

        //translate([ALD*i, 0, 0]) rotate([-90,0,0]) translate([0,0,-L]) cylinder(d=M,h=L*3);
        translate([ALD*i, 0, 0]) rotate([-90,0,0]) translate([0,0,-ALD/2 -T-eps]) m_screw(d=M,h=L,orientation=o,slot=0);

        //translate([0, ALD*i, 0]) rotate([0,0,0]) translate([0,0,-L]) cylinder(d=M,h=L*3);
        translate([0, ALD*i, 0]) rotate([0,0,0]) translate([0,0,-ALD/2 -T-eps]) m_screw(d=M,h=L,orientation=o,slot=0);


        //translate([ALD*i, 0, 0]) rotate([0,0,0]) translate([0,0,-L]) cylinder(d=M,h=L*3);
        translate([ALD*i, 0, 0]) rotate([0,0,0]) translate([0,0,-ALD/2 -T-eps]) m_screw(d=M,h=L,orientation=o,slot=0);
            
    }
}
}

/**
 * Subtract cavity in which the aluminium extrusion slots into.
 *
 * Observation: on first test print for 2020 extrusion, the cavity for the vertical (z axis) 
 * arm was perfect: 2020 extrusion slotted in with a little but not much friction. The other
 * two arms required chamfing the edges at the arm ends and it still required a lot of force
 * (enough to split on of the 3mm thick arms) to insert. Therefore it makes sense to add
 * a small extra clearance on those axes.
 **/
module AlEx_cavity(ALD=15,L=30,T=3) {
    eps = 0.001;
    rotate([0,0,0]) translate ([-ALD/2,-ALD/2,-ALD/2]) cube([ALD,ALD,L+eps]);
    
    // Extra clearance for X, Y axis (0.2mm)
    ALDX = ALD+0.2;
    rotate([-90, 0,0]) translate ([-ALDX/2,-ALDX/2,-ALD/2]) cube([ALDX,ALDX,L+eps]);
    rotate([  0,90,0]) translate ([-ALDX/2,-ALDX/2,-ALD/2]) cube([ALDX,ALDX,L+eps]);
}



/**
 * The sock material that forms each arm of the joint.
 */
module AlEx_corner_join_arm (ALD=15,L=30,T=2, label="?") {
	hull() {
		translate([-ALD/2,-ALD/2,0]) cylinder (r=T,h=L);
		translate([-ALD/2, ALD/2,0]) cylinder (r=T,h=L);
		translate([ ALD/2,-ALD/2,0]) cylinder (r=T,h=L);
		translate([ ALD/2, ALD/2,0]) cylinder (r=T,h=L);
	}
    
    //translate([-ALD/2-1.4, -ALD/4, ALD+T*6])  linear_extrude(400) rotate ([0,90,0]) offset(r=0.01) text (label,size=10,halign="center");
}


/**
 * 3 axis 90 degree join. One arm in each of x, y, z axis. For corner
 * of rectangular box.
 */
module AlEx_corner_join (ALD=15, L=30,M=4,T=3,ex_center_screw_hole=false) {
	eps = 0.001;
    
	difference() {
        
		// This is the stock from which we will subtract from
		union () {
			rotate ([0,0,0])   translate([0,0,-ALD/2]) AlEx_corner_join_arm(ALD,L,T,"Z");
			rotate ([-90,0,0]) translate([0,0,-ALD/2]) AlEx_corner_join_arm(ALD,L,T,"Y");
			rotate ([ 0,90,0]) translate([0,0,-ALD/2]) AlEx_corner_join_arm(ALD,L,T,"X");
			translate([-ALD/2,-ALD/2,-ALD/2]) sphere(r=T);// round the sharp corner
		}
        
		// Remove cavity for Al extrusion
		AlEx_cavity(ALD,L,T);

		// Drill out screw holes
		AlEx_screw_holes(ALD,T,M,ex_center_screw_hole);
	}

}
