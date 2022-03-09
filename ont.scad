//Copyright (C) 2022 E.C.O
//Licenced under GPL-2.0-only
//see LICENCE file for more details

$fn=100;

//Change me if you have multiple ONT's
DoYouWant2=false;

//Do not change stuff below this line

//Size of the main ONT box
Length=124;
Width=178+3;
Hight=20; //33
WallThickness=1.5;
Roundness=10;


//Cutout for the clips
ClipX=16;
ClipY=1.8;
ClipZ=17;
Offset=-7;

//Locking feature on the clip
ClipFeatureX=16;
ClipFeatureY=1.5;
ClipFeatureZ=5;
ClipFeatureOffsetZ=3;

//Size of the SC connector change me if you use LC or some other connector
PlugWidth=13;
PlugHight=9.5;


main();

module main() {
  difference() {
    minkowski() {
      cube([Length-Roundness,Width-Roundness,Hight],center=true);
      cylinder(d=Roundness);
    }
    translate([0, 0, -WallThickness/2]) {
      cube([Length-WallThickness*2,Width-2*(ClipFeatureY+ClipY)-2*WallThickness,Hight-WallThickness],center=true);
    }
  translate([Offset, 0, 0]) {
    union(){
      translate([0, -ClipFeatureY/2+Width/2-ClipY, ClipFeatureZ/2-Hight/2+ClipFeatureOffsetZ]) {
        cube([ClipFeatureX,ClipFeatureY,ClipFeatureZ],center=true);
      }
      translate([0, -Width/2+ClipY/2, (ClipZ/2)-Hight/2]) {
        cube([ClipX,ClipY,ClipZ],center=true);
      }
    }
  union(){
    translate([0, ClipFeatureY/2-Width/2+ClipY, ClipFeatureZ/2-Hight/2+ClipFeatureOffsetZ]) {
      cube([ClipFeatureX,ClipFeatureY,ClipFeatureZ],center=true);
    }
    translate([0, Width/2-ClipY/2, (ClipZ/2)-Hight/2]) {
      cube([ClipX,ClipY,ClipZ],center=true);
    }
  }
}

    if(DoYouWant2) {
      translate([Length/2,PlugWidth*2.5, 0]) {
        cube([WallThickness*4,PlugWidth,PlugHight],center=true);
      }
      translate([Length/2,-PlugWidth*2.5, 0]) {
        cube([WallThickness*4,PlugWidth,PlugHight],center=true);
      }
    } else {
      translate([Length/2, 0, 0]) {
        cube([WallThickness*4,PlugWidth,PlugHight],center=true);
      }
    }
  }
}
