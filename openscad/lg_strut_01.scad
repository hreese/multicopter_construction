$fn=50;

difference() {
    union() {
                            dxf_linear_extrude(file="lg_strut_01.dxf", height=3, convexity=1, center=false);
        translate([0,0,13]) dxf_linear_extrude(file="lg_strut_01.dxf", height=3, convexity=1, center=false);
        difference(){
            cube([16+10,30,16]);
            translate([16+10,-1,3+5]) scale([2,1,1]) rotate([-90,0,0]) cylinder(h=50, r=5, center=false);
        }
        translate([28,28,0]) cylinder(h=16, r=2.5);
        translate([46,37,0]) cylinder(h=16, r=2.5);
        translate([69,43,0]) cylinder(h=16, r=2.5);
    }
    union() {
        translate([3,-10,3]) cube([10,50,10]);
        translate([8,5,-10]) cylinder(h=30, r=1.5);
        translate([8,15,-10]) cylinder(h=30, r=1.5);
        translate([8,25,-10]) cylinder(h=30, r=1.5);
    }
}


