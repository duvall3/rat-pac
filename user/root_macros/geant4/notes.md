Development Notes
================================

` ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 08/2022 ~ `

# Geometry

## Individual Volumes

Required Steps:
- Material
- Position
- Shape
- Logical Volume
- Placement

Example -- `Vol1` in mother `world`
- Material = air
- Position = origin
- Shape = 100-cm cube
- Logical Volume = logicVol1
- Placement = plain / default

```cpp
// example volume "Vol1":

// material
G4Material *Vol1_mat = nist->FindOrBuildMaterial("G4_AIR");

// position
G4ThreeVector pos1 = G4ThreeVector(0,0,0);

// shape and size
G4Double vol1_length = 100.0*cm;
G4Box * solidVol1 = new G4Box( "Vol1", vol1_length, vol1_length, vol1_length );

// logical volume
G4LogicalVolume *logicVol1 = new G4LogicalVolume( solidVol1, Vol1_mat, "Vol1" );

// placement
new G4PVPlacement( 0, pos1, logicVol1, "Vol1", logicWorld, false, 0, checkOverlaps );

// all pau!   )
```




