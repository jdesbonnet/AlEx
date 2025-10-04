//
// From https://www.thingiverse.com/thing:1100779
// License: Creative Commons - Attribution license.
// Owner: https://www.thingiverse.com/woodywong/designs
// Video: https://youtu.be/buerT5AKOCM
// Copied from thingiverse.com files repo on 2025-10-03.
//

$fn = 32;

2020end ();

module 2020end (){
 difference (){
  cube ([20,20,20],center = true);
translate ([])
  cutout();
  rotate ([0,90,0])
   cutout ();
    rotate ([90,0,0])
   cutout ();
  
 } 
}

module cutout(){
 translate ([0,0,-7])
  rotate ([180,0,0])
  union () { 
   cylinder (d1=12,d2=0,h=5.5);
   cylinder (d=6.5,h=10);
   rotate ([180,0,0])
   cylinder (d=12,h=30);
 }
}
