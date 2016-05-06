outerWidth = 18.56;
outerHeight = 11.49;

innerWidth = 14.90;
innerHeight = 7.57;

radius = 0.5;

plugDepth = 1.75; 

difference() {
  $fn=50;
  translate([radius,0,radius])
  minkowski() {
   cube([outerWidth-(radius * 2),1.70, outerHeight- (radius * 2)], 0);

   rotate([90,0,0])
   cylinder(r=radius,h=1.70, center=true);
  }

  translate([(outerWidth-1)/2,2.10,outerHeight/2])
  rotate([-3.65,0,0])
  cube([outerWidth+2,3.65, outerHeight+10], center=true);
}


difference() {
  octogon();
    
  translate([outerWidth/8,1.25,outerHeight/8])
  scale(0.75)
  octogon();
}


module octogon(){
  widthDiff = (outerWidth - innerWidth)/2;
  heightDiff = (outerHeight - innerHeight)/2;
  
  difference() {
    translate([widthDiff,0,heightDiff])
    cube([innerWidth,plugDepth, innerHeight], 0);

    len = 2.18;

    translate([widthDiff,0,heightDiff])
    rotate([0,45,0])
    cube([len, 25, len], center=true);

    translate([widthDiff,0,heightDiff+innerHeight])
    rotate([0,45,0])
    cube([len, 25, len], center=true);

    translate([widthDiff+innerWidth,0,heightDiff+innerHeight])
    rotate([0,45,0])
    cube([len, 25, len], center=true);

    translate([widthDiff+innerWidth,0,heightDiff])
    rotate([0,45,0])
    cube([len, 25, len], center=true);
  }
}