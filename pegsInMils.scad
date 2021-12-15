include <Star.scad>;

pegBaseHeight = 0.6;
pegTopHeight = 1;
symbolHeight = 0.1;

pegBaseD = 0.5;
pegTopD = 0.8;
symbolD = 0.65;

pegSpacing = 2;

module Peg(pegColor, topSymbol){
    color(pegColor)
    linear_extrude(pegBaseHeight)
    circle(d=pegBaseD, $fn=50);

    color(pegColor)
    translate([0,0,pegBaseHeight])
    linear_extrude(pegTopHeight)
    circle(d=pegTopD, $fn=50);
}

scale (10){
translate([pegSpacing * 0,0]){
    pegColor = "green";
    Peg(pegColor);
    color(pegColor)
    translate([0,0,pegBaseHeight + pegTopHeight])
    linear_extrude(symbolHeight)
    circle (d=symbolD, $fn=50);
}


translate([pegSpacing,0]){
    pegColor = "orange";
    Peg(pegColor);

    color(pegColor)
    translate([0,0,pegBaseHeight + pegTopHeight])
    linear_extrude(symbolHeight)
    circle (d=symbolD, $fn=6);
}

translate([pegSpacing * 2,0]){
    pegColor = "#f0f";
    Peg(pegColor);

    color(pegColor)
    translate([0,0,pegBaseHeight + pegTopHeight])
    linear_extrude(symbolHeight)
    difference(){
        circle (d=symbolD, $fn=50);
        circle (d=symbolD - symbolD / 5, $fn=50);
    }
}

translate([pegSpacing * 3,0]){
    pegColor = "#55f";
    Peg(pegColor);

    color(pegColor)
    translate([0,0,pegBaseHeight + pegTopHeight])
    linear_extrude(symbolHeight)
    Star(6, symbolD/2, symbolD/2 - symbolD/4.5);
}

translate([pegSpacing * 4,0]){
    pegColor = "yellow";
    Peg(pegColor);

    color(pegColor)
    translate([0,0,pegBaseHeight + pegTopHeight])
    linear_extrude(symbolHeight)
    Star(24, symbolD/2, symbolD/2 - symbolD/12);
}
translate([pegSpacing * 5,0]){
    pegColor = "#f33";
    Peg(pegColor);

    color(pegColor)
    translate([0,0,pegBaseHeight + pegTopHeight])
    linear_extrude(symbolHeight)
    Star(12, symbolD/2, symbolD/2 - symbolD/6);
}
}