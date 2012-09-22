//$fn=50;
ueberstand=0.5;

// deckel
translate([-5,-5,0]) cube([10,10,2]);

// innenteil
translate([0,0,2])
intersection(){
    difference() {
        union() {
            // aussenwand innenteil
            translate([0,0,4]) cube([8,8,8], center=true);
            // riffel
            for( i = [0:3] ) {
                //translate([0,0,1.5+i*1.75]) cube([8+2*ueberstand,8+2*ueberstand,1], center=true);
                for (angle = [0 : 90 : 270]) {
                     translate([0,0,1.5+i*1.75]) rotate([0,0,angle]) translate([4,0,0]) rotate([90,0,0])
                        cylinder(h=8, r=ueberstand, center=true, $fn=10);
                }
            }
        }
        // hohlraum innen
        cube([6,6,30], center=true);
    }
    // überstehende kanten an den ecken des innenteils entfernen
    rotate([0,0,45]) cube([sqrt(2)*8,sqrt(2)*8,30], center=true);
}

