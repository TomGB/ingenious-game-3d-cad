echo(version=version());

circleD = 1;
circleGap = 0.5;
baseMargin = 0.5;

cols = 4;
rows = 20;

bevelDepth = 0.1;

baseDepth = 1;

baseWidth = rows * circleD + (rows - 1) * circleGap + 2 * baseMargin;
baseHeight = cols * circleD + (cols - 1) * circleGap + 2 * baseMargin;

difference() {
    cube([baseWidth, baseHeight, baseDepth]);
    
    for ( i = [0 : cols - 1] ){
        for ( j = [0 : rows - 1] ){
            translate([
                (circleGap + circleD) * j + circleD / 2 + baseMargin,
                (circleGap + circleD) * i + circleD / 2 + baseMargin,
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