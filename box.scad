//Copyright (C) 2022 E.C.O
//Licenced under GPL-2.0-only
//see LICENCE file for more details

$fn=100;
BoxLength=60;
BoxWidth=30;
BoxHight=20;
Wall=1.5;
Round=1;
z=0.01;
LidClip=5;
LidClipThick=2.5;
LidThick=2.5;
PlugWidth=13;
PlugHight=9.5;
HoleDiameter=4;
CableHole=4;


2Wall=2*Wall;

box();
//lid();

module box() {
  difference() {
    minkowski() {
          cube([BoxLength-Round,BoxWidth-Round,BoxHight-Round],center=true);
          sphere(d=Round);
    }
    translate([0, 0, Wall/2+z]) {
      cube([BoxLength-2Wall,BoxWidth-2Wall,BoxHight-Wall],center=true);
    }
    translate([BoxLength/2, 0, 0]) {
      cube([Wall*4,PlugWidth,PlugHight],center=true);
    }
    translate([BoxLength/4, 0, -BoxHight/2]) {
      cylinder(d=HoleDiameter, h=Wall*4, center=true);
    }
    translate([-BoxLength/4, 0, -BoxHight/2]) {
      cylinder(d=HoleDiameter, h=Wall*4, center=true);
    }
    translate([0, 0, -BoxHight/2]) {
      cylinder(d=HoleDiameter, h=Wall*4, center=true);
    }
    translate([-BoxLength/2, 0, BoxHight/3]) {
      cube([Wall*4,CableHole,BoxHight],center=true);

    }
    translate([-BoxLength/2, 0, -BoxHight/6]) {
      rotate([0, 90, 0]) {
        cylinder(d=CableHole, h=Wall*4, center=true);
      }
    }
  }
}

module lid() {
  translate([0, 0, BoxHight/2-LidClip/2]) {
    difference() {
      cube([BoxLength-2Wall,BoxWidth-2Wall,LidClip],center=true);
      cube([BoxLength-2Wall+z-LidClipThick*2,BoxWidth-2Wall-LidClipThick*2,LidClip+z],center=true);
    }
  }
}
translate([0, 0, BoxHight/2+LidThick/2]) {
  minkowski() {
        cube([BoxLength-Round,BoxWidth-Round,LidThick],center=true);
        sphere(d=Round);
  }
}
