$fn=100;

module lochstoepsel() {
    difference() {
        difference() {
            union() {
                /*
                // halbkugel oben
                translate([0,0,3])
                    difference() {
                        sphere(r=4);
                        translate([0,0,-5]) { cube(size = 10, center = true); }
                    }
                */
                // Abdeckung oben
                
                translate([0,0,3])
                union() {
                    cylinder(h=3, r=3.5);
                    // unterer zylinder
                    cylinder(h=1.5, r=5.0);
                    // torus
                    translate([0,0,1.5])
                        rotate_extrude(convexity = 10, $fn = 100)
                        translate([3.5, 0, 0]) circle(r = 1.5, $fn = 100);
                }
                
                // Schaft
                cylinder(h=3, r=3);
                // Haltekegel unten
                cylinder(h=2, r1=3, r2=4);
            }
            // hohlraum in der mitte
            translate([0,0,-2]) cylinder(h=4, r=1.6);
        }
        /*
        // ausschneidekreuz
        union() {
            rotate([0,0,0])   translate([0,0,1]) cube(size=[20,1,4], center=true);
            rotate([0,0,90])  translate([0,0,1]) cube(size=[20,1,4], center=true);
            rotate([0,0,45])  translate([0,0,1]) cube(size=[20,1,4], center=true);
            rotate([0,0,135]) translate([0,0,1]) cube(size=[20,1,4], center=true);
        }
        */
        // ausschneidekreuz
        union() {
		for ( rot = [0 : 90 : 90 ] ) {
            rotate([0,0,rot]) translate([0,0,0.05]) cube(size=[20,2,4], center=true);
            }
        }
    }
}

gridsize=0;

for ( y = [0 : gridsize] )
    for ( x = [0 : gridsize] )
        translate([x*15,y*15,6]) rotate([180,0,0]) lochstoepsel();
