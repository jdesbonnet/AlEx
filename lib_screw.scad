/**
 * Generic metric M series counter sunck screw (flat head).
 * Length (h) is from the flat head surface to the tip of the
 * threaded shaft.
 *
 * With counter sunk screws (flat head intended to be flush with surface) length of screw
 * includes the head. Lengh of head (k) in this table:
 * https://www.fasteners.eu/standards/din/965/
 *
 * Threads are not rendered.
 *
 * For M3 k=1.65mm
 *
 * orientation =  1    : head at z=0
 * orientation = -1    : orientated so that head at z=h
 *
 * Joe Desbonnet
 * 2025-03-28
 */
module m_screw(d=3,h=10,orientation=1,slot=1) {
	
	// Screw head and screw driver slot
	color([0.8,0.8,0.8]) {

		if (orientation == 1) {
			difference () {
				union() {
					cylinder (d=d,h=h);           // Main screw shaft
					cylinder (d1=d*2,d2=d,h=1.65);   // Conical screw head
				}
				if (slot) {
					translate ([-d,-0.5,-0.1]) cube([d*2,1,1.1]); // Screw driver slot
				}
			}
		} else {
			difference () {
				union() {
					cylinder (d=d,h=h);           // Main screw shaft
					translate ([0,0,h-2]) cylinder (d1=d,d2=d*2,h=2);   // Conical screw head
				}
				if (slot) {
					translate ([-d,-0.5,h-1]) cube([d*2,1,1.1]); // Screw driver slot
				}
			}
		}

	}

	// Label screw
	if (slot) {
	color([0.8,0.8,0.8]) translate ([0,-1.2,0.4]) text(str("M",d,"x",h),size=0.5,halign="center");
	}
}


/**
 * Spacer or washer
 * id = inner diameter
 * od = outer diameter
 * h = thickness
 */
module spacer (od,id,h) {
	difference() {
		cylinder(d=od,h=h);
		translate([0,0,-1]) cylinder(d=id,h=h+2);
	}
}

module spacer_square (od=8,id=6,h=5) {
	r=1;
	difference () {
		//translate([-od/2,-od/2,0]) cube ([od,od,h]);
		hull() {
			translate([-od/2+r,-od/2+r,0]) cylinder(d=r*2,h=h);
			translate([ od/2-r,-od/2+r,0]) cylinder(d=r*2,h=h);
			translate([ od/2-r, od/2-r,0]) cylinder(d=r*2,h=h);
			translate([-od/2+r, od/2-r,0]) cylinder(d=r*2,h=h);
		}
		translate([-id/2,-id/2,-1]) cube ([id,id,h+2]);
	}
}
