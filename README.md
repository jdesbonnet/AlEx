# AlEx - Aluminium Extrusion related 3D printed parts library.

Library of 3D printed parts to aid construction projects using Aluminium (Aluminum) extrusions.

Status: this library is in early development (pre 1.0), so things are going to be in flux for 
months 2025-03 and 2025-04. This library is being developed with OpenSCAD software with the
Prusa Slicer to convert the STL output from OpenSCAD into gcode for my Prusa Mini+ printer.
I'm prining with PLA polymer.


Example of a 3 axis orthogonal corner join:

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

For example if using 2020 extrusion with 10mm DIN 965 M4 screws, then the wall
thickness (T) must be 4mm. If you get this wrong the screw will either protrude 
or will not be able to sink deep enough to engage with the T-nut thread. 

Tip: print one part first and check that the extrusion slots in snuggly and that the 
screws properly engage with the T-nut and are flush with the surface when 
tightened.

Tip: you will need to use support structure (eneabled in the slicer software) and 
thoroughly clean out that material before slotting in the extrusions.



## Corner join (3 axis orthogonal)

Print 8 of these to create a box structure.

![Corner join (3 axis orthogonal)](./image/join_corner.png)


