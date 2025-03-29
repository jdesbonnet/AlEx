# AlEx

Library of 3D printed parts to aid construction projects using Aluminium (Aluminum) extrusions.


Example of a 3 axis orthonogal corner join:

```
use <lib_alex.scad>
use <lib_screw.scad>
$fn = 60;

AlEx_corner_join(ALD=20, L=60, M=4, T=4);
```

Parameters: 

 * ALD:  Aluminium width mm (15 or 20, but no reason why other sizes won't work)
 * T:    Wall thickness mm
 * L:    Length of join arms mm.
 * M:    Screw diameter mm (eg 3 for M3).


These joins are designed to be used with DIN 965 (cross recessed countersunk flat head) screws together 
with aluminium extrusion T-nuts.

The screw length and/or join fitting wall thickness (T) must be chosen carefully so that the screw head is flush
with the outer surface. 

For example if using 2020 extrusion with 10mm DIN965 M4 screws, then the wall
thickness (T) must be 4mm. If you get this wrong the screw will either protrude 
or will not be able to sink deep enough to engage with the T-nut thread. 

## Corner join (3 axis orthonogal)

![Corner join (3 axis orthogonal)](./image/join_corner.png)


