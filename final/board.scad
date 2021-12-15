echo(version=version());

circleD = 6;
circleDSmall = 5;
circleGap = 3;

bevelDepth = 1;

baseDepth = 2;

baseMargin = 4;

cols = 6;
rows = 19;

// cols = 1;
// rows = 1;

extraTextAreaWidth = 5;

textDepth = 0.8;

baseLength = rows * circleD + (rows - 1) * circleGap + 2 * baseMargin;
baseWidth = cols * circleD + (cols - 1) * circleGap + 2 * baseMargin + extraTextAreaWidth;

echo("base width");
echo(baseWidth);
echo("base length");
echo(baseLength);

module hole() {
    translate([
        (circleGap + circleD) / 2,
        (circleGap + circleD) / 2,
    ])
    color("red")
    // cylinder(h=baseDepth,d=circleD, $fn=50);
    // translate([0,0,baseDepth])
    cylinder(baseDepth, d1=circleDSmall, d2=circleD, $fn=50);
}

module holes() {
    for ( j = [0 : rows - 1] ){
        for ( i = [0 : cols - 1] ){
            translate([
                (circleGap + circleD) * j + circleD / 2,
                (circleGap + circleD) * i + circleD / 2 + extraTextAreaWidth,
            ])
            // difference() {
            //     cube([circleD + circleGap, circleD + circleGap, baseDepth]);
                hole();
            // }
        }
    }
}

module holeNumbers() {
     for ( j = [0 : rows - 2] ){ 
        translate([
            (circleGap + circleD) * j + circleD / 2 + baseMargin + 0.5,
            5,
            baseDepth
        ])
        rotate([0, 0, 90])
        linear_extrude(textDepth)
        text(
            str(rows - j - 1),
            font="tahoma:style=Bold",
            size = 3,
            halign= "center",
            valign="center"
        );
    }
}

module cutOut() {
    translate([(baseLength / 2) - 10,0,0]) {
        cube([baseLength, baseWidth, baseDepth * 2]);
    }
}

holeNumbers();

difference() {
    cube([baseLength, baseWidth, baseDepth]);
    holes();
}
