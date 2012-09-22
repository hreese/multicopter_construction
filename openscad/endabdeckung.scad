module endabdeckung(ueberstand=0.5){
    // deckel
    translate([-5,-5,0]) cube([10,10,2]);

    // innenteil
    translate([0,0,2])
    intersection(){
        difference() {
            union() {
                // aussenwand innenteil
                translate([0,0,2.5]) cube([7.8,7.8,5], center=true);
                // riffel; 4 stück
                for( i = [0:2] ) {
                    //translate([0,0,1.5+i*1.75]) cube([8+2*ueberstand,8+2*ueberstand,1], center=true);
                    for (angle = [0 : 90 : 270]) {
                        translate([0,0,1.2+i*1.35]) rotate([0,0,angle]) translate([4,0,0]) rotate([90,0,0])
                            scale([0.30,1,1]) cylinder(h=8, r=ueberstand, center=true, $fn=30);
                    }
                }
            }
            // hohlraum innen
            cube([6,6,30], center=true);
        }
        // überstehende kanten an den ecken des innenteils entfernen
        // rotate([0,0,45]) cube([sqrt(2)*8,sqrt(2)*8,30], center=true);
        cylinder(h=30, r=sqrt(2)*8/2-0.5, $fn=200);
    }
}

gridsize=0;

for ( y = [0 : gridsize] )
    for ( x = [0 : gridsize] )
        translate([x*15,y*15,0]) endabdeckung();
