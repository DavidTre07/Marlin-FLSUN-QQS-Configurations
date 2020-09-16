//http://github.com/DavidTre07
//Dice size in mm
size=10;

//Do not modify under this line
letterSize=size/1.5;
letterThin=1;
$fn=300;
epsilon=0.01;

difference(){
   cube(size=size);
   translate([-epsilon,(size-letterSize)/2,(size-letterSize)/2])rotate([90,0,90])
      linear_extrude(height=letterThin)text("X",size=letterSize);
   translate([(size-letterSize)/2,letterThin-epsilon,(size-letterSize)/2])rotate([90,0,0])
      linear_extrude(height=letterThin)text("Y",size=letterSize);
   translate([(size-letterSize)/2,(size-letterSize)/2,size-letterThin+epsilon])rotate([0,0,0])
      linear_extrude(height=letterThin)text("Z",size=letterSize);
}