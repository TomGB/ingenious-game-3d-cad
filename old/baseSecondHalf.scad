echo(version=version());

circleD = 0.6;
circleGap = 0.6;
baseMargin = 0.5;

cols = 6;
rows = 19;

bevelDepth = 0.1;

baseDepth = 0.7;

extraTextAreaWidth = 1.5;

baseLength = rows * circleD + (rows - 1) * circleGap + 2 * baseMargin;
baseWidth = cols * circleD + (cols - 1) * circleGap + 2 * baseMargin + extraTextAreaWidth;

echo("base width")
echo(baseWidth)
echo("base length")
echo(baseLength)

scale(10) {
  difference() {
difference() {
    cube([baseLength, baseWidth, baseDepth]);
    
    for ( j = [0 : rows - 1] ){
        for ( i = [0 : cols - 1] ){
            translate([
                (circleGap + circleD) * j + circleD / 2 + baseMargin,
                (circleGap + circleD) * i + circleD / 2 + baseMargin + extraTextAreaWidth,
            ]) {
                color("red")
                cylinder(h=baseDepth,d=circleD, $fn=50);
                
                color("red")
                translate([0,0,baseDepth - bevelDepth])
                cylinder(bevelDepth, d1=circleD, d2=circleD + bevelDepth, $fn=50);
            }
        }
    }
}

for ( j = [0 : rows - 2] ){ 
    translate([
        (circleGap + circleD) * j + circleD / 2 + baseMargin,
        0.9,
        baseDepth
    ]) {
        rotate([0, 0, 90]) {
            linear_extrude(height = 0.1) {
                text(
                    str(rows - j - 1),
                    font="tahoma",
                    size = 0.5,
                    halign= "center",
                    valign="center"
                );
            }
        }
    }
}
translate([(baseLength / 2) - 1.8,0,0]) {
    cube([baseLength, baseWidth, baseDepth * 2]);
}
}
}