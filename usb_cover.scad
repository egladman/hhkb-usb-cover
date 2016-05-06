outerWidth = 18.63;
outerHeight = 11.50;

difference() {
  $fn=50;
  translate([0.5,0,0.5])
  minkowski() {
   cube([outerWidth-1,1.70, outerHeight-1], 0);

   rotate([90,0,0])
   cylinder(r=0.5,h=1.70, center=true);
  }

  translate([(outerWidth-1)/2,2.3,outerHeight/2])
  rotate([-3.65,0,0])
  cube([outerWidth+2,3.65, outerHeight+10], center=true);
}



innerWidth = 14.90;
innerHeight = 7.57;

widthDiff = (outerWidth - innerWidth)/2;
heightDiff = (outerHeight - innerHeight)/2;

plugDepth = 2.5;

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