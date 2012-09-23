difference() {
    union() {
        dxf_linear_extrude(file="lg_strut_01.dxf", height=3, convexity=1, center=false);
        translate([0,0,13]) dxf_linear_extrude(file="lg_strut_01.dxf", height=3, convexity=1, center=false);
        cube([16,30,16]);
        #cylinder(h=16, r=4);
    }
    translate([3,-10,3]) cube([10,50,10]);
}
