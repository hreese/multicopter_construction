$fn=64;

basew = 12;

/*
module rsquare(w, l) {
	square([w, l], center=true);
	translate([0,  l/2]) circle(r=w/2, center=true);
	translate([0, -l/2]) circle(r=w/2, center=true);
}

rsquare(10, 120);

rotate([0,0, 45]) rsquare(8, 55);
rotate([0,0, 45+90]) rsquare(8, 55);

*/

module rsquare2(w=basew, l=120) {
	union() {
		rotate([90,0,0]) cylinder(r=w/2, h=l, center=true);
		translate([0,  l/2]) sphere(r=w/2, center=true);
		translate([0, -l/2]) sphere(r=w/2, center=true);
	}
}

difference() {
	union() {
		intersection() {
			translate([-150,-150,0]) cube([300, 300, 3]);
			scale([1,1,1.5]) union() {
				rsquare2(basew, 120);
				translate([0, 120/2]) rotate([0,0,90]) rsquare2(basew, 40);
				translate([0,-120/2]) rotate([0,0,90]) rsquare2(basew, 40);
		
				rotate([0,0, 45   ]) rsquare2(10, 65);
				rotate([0,0, 45+90]) rsquare2(10, 65);
			}
		}
		
		translate([ 13,-120/2,0]) union() { cylinder(r=basew/5, h=25); translate([0,0,25]) sphere(r=basew/5); }
		translate([  0,-120/2,0]) union() { cylinder(r=basew/5, h=25); translate([0,0,25]) sphere(r=basew/5); }
		translate([-13,-120/2,0]) union() { cylinder(r=basew/5, h=25); translate([0,0,25]) sphere(r=basew/5); }
		
		translate([ 13,120/2,0]) union() { cylinder(r=basew/5, h=25); translate([0,0,25]) sphere(r=basew/5); }
		translate([  0,120/2,0]) union() { cylinder(r=basew/5, h=25); translate([0,0,25]) sphere(r=basew/5); }
		translate([-13,120/2,0]) union() { cylinder(r=basew/5, h=25); translate([0,0,25]) sphere(r=basew/5); }
	}
	translate([ 35.5/2, 35.5/2,0]) cylinder(r=3/2, h=20, center=true);
	translate([ 35.5/2,-35.5/2,0]) cylinder(r=3/2, h=20, center=true);
	translate([-35.5/2, 35.5/2,0]) cylinder(r=3/2, h=20, center=true);
	translate([-35.5/2,-35.5/2,0]) cylinder(r=3/2, h=20, center=true);

	translate([ 45/2, 45/2,0]) cylinder(r=3/2, h=20, center=true);
	translate([ 45/2,-45/2,0]) cylinder(r=3/2, h=20, center=true);
	translate([-45/2, 45/2,0]) cylinder(r=3/2, h=20, center=true);
	translate([-45/2,-45/2,0]) cylinder(r=3/2, h=20, center=true);
}