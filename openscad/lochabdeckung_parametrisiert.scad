$fn=100;

/*
diam=6; // lochdurchmesser
thickness_w=1; // wanddurchmesser
thickness_c=2; // durchmesser teil
h1=1; // abdeckung aussen durchgehend gerade
h2=1; // abdeckung aussen rund
h3=2; // halterung innen
excess=2; // überstand oben

difference() {
  cylinder(h=h3+thickness_w, r=diam, , $fn=100);
  translate([0,0,-1]) cylinder(h=h3+thickness_w+2, r=diam - thickness_c, , $fn=100);
}

//translate([0,0,h3+thickness_w]) { cylinder(h=h1+h2, r1=diam+excess, r2=0); }

*/