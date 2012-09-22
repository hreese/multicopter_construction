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
                union() {
                    translate([0,0,3]) 
                        cylinder(h=3, r=4);
                    translate([0,0,3]) 
                        cylinder(h=1.5, r=5.5);
                    translate([0,0,4.5]) 
                        rotate_extrude(convexity = 10, $fn = 100)
                            translate([4, 0, 0]) circle(r = 1.5, $fn = 100);
                }
                // Schaft
                difference() {
                    cylinder(h=3, r=3);
                }
                // Haltekegel unten
                cylinder(h=2, r1=3, r2=4);
            }
            translate([0,0,-1]) cylinder(h=5, r=2);
        }
        /*
        // ausschneidekreuz
        union() {
            translate([0,0,1]) cube(size=[20,1,4], center=true);
            rotate([0,0,90])  translate([0,0,1]) cube(size=[20,1,4], center=true);
            rotate([0,0,45])  translate([0,0,1]) cube(size=[20,1,4], center=true);
            rotate([0,0,135]) translate([0,0,1]) cube(size=[20,1,4], center=true);
        }
        */
        // ausschneidekreuz
        union() {
            translate([0,0,1]) cube(size=[20,2,4], center=true);
            rotate([0,0,90])  translate([0,0,1]) cube(size=[20,2,4], center=true);
        }
    }
}

for ( y = [0 : 0] )
    for ( x = [0 : 0] )
        translate([x*10,y*10,0]) lochstoepsel();
