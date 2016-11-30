outerWidth = 18.56;
outerHeight = 11.49;

innerWidth = 14.90;
innerHeight = 7.57;

widthDiff = (outerWidth - innerWidth)/2;
heightDiff = (outerHeight - innerHeight)/2;

radius = 1;

plugDepth = 1.75; 

translate([0,outerHeight,.85])
rotate([90,0,0])
cover();

module cover(){
difference() {
  $fn=50;
  translate([radius,0,radius])
  minkowski() {
   cube([outerWidth-(radius * 2),1.70, outerHeight- (radius * 2)], 0);

   rotate([90,0,0])
   cylinder(r=radius,h=1.70, center=true);
  }

  translate([(outerWidth-1)/2,2.10,outerHeight/2])
  rotate([-3.8,0,0])
  cube([outerWidth+2,3.65, outerHeight+10], center=true);
}

translate([widthDiff-.5,plugDepth,(outerHeight/2)])
clip();

translate([-widthDiff+.5+outerWidth,plugDepth,(outerHeight/2)])
rotate([0,180,0])
clip();

difference() {
  octogon();
    
  translate([outerWidth/8,0,outerHeight/8])
  scale(0.75)
  resize([0,10,0])
  octogon();
 
  translate([outerWidth/2,1.75,outerHeight/2])
  cube([13.2, 5, 3.5], center=true);
    
  translate([outerWidth/2,1.75,(outerHeight/2)+1.935])
  cube([16, 5, .625], center=true);
    
  translate([outerWidth/2,1.75,(outerHeight/2)-1.935])
  cube([16, 5, .625], center=true);
}


}

module octogon(){
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

module clip(){
  difference(){
    resize([2,1.5,3.25])
    rotate([90,0,90])
    polyhedron ( points = [[0, -1, 3], [0, 1, 3], [0, 1, 0], [0, -1, 0], [3, -1, 3], [3, 1, 3]], 
    faces = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3], ]);
  
    translate([3.35,0,0])
    cube([4, 4, 10], center=true);  
  }
}
