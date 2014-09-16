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

/*
intersection() {
	translate([-150,-150,0]) cube([300, 300, 4]);
	scale([1,1,1.5]) union() {
		rsquare2(basew, 120);
		translate([0, 120/2]) rotate([0,0,90]) rsquare2(basew, 40);
		translate([0,-120/2]) rotate([0,0,90]) rsquare2(basew, 40);

		rotate([0,0, 45]) rsquare2(8, 55);
		rotate([0,0, 45+90]) rsquare2(8, 55);
	}
}
*/

scale([6, 6, 35]) polyhedron(
	points = [
		[-1,0,0],
		[1,0,0],
		[0,-1,0],
		[0,0,1]
	],
	faces  = [
		[0,1,2],
		[1,2,3],
		[0,2,3],
		[0,1,3]
	]
);
