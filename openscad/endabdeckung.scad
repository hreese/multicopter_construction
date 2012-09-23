module endabdeckung(ueberstand=0.35, d=8){
    // deckel
    translate([-5,-5,0]) cube([10,10,2]);

    // innenteil
    translate([0,0,2])
    intersection(){
        difference() {
            union() {
                // aussenwand innenteil
                translate([0,0,2.5]) cube([d,d,5], center=true);
                // Riffel
                for( i = [0:30] ) {
                    assign( height = 1.2+i*2.6*ueberstand )
                    if ( height-ueberstand < 4.5) {
                        for (angle = [0 : 90 : 270]) {
                            translate([0,0,height]) rotate([0,0,angle]) translate([d/2,0,0]) rotate([90,0,0])
                                scale([1,1,1]) cylinder(h=8, r=ueberstand, center=true, $fn=30);
                        }
                    }
                }
            }
            // hohlraum innen
            cube([6,6,30], center=true);
        }
        // überstehende kanten an den ecken des innenteils entfernen
        // rotate([0,0,45]) cube([sqrt(2)*8,sqrt(2)*8,30], center=true);
        cylinder(h=30, r=sqrt(2)*8/2-0.8, $fn=200);
    }
}

gridsize=0;

//%translate([0,0,0]) cube([8,8,20], center=true);

for ( y = [0 : gridsize] )
    for ( x = [0 : gridsize] )
        translate([x*15,y*15,0]) endabdeckung(ueberstand=0.3,d=7.7);
