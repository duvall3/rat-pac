// RATDB file describing simple detector geometry

// -------- GEO[world]
{
name: "GEO",
index: "world",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "", // world volume has no mother
type: "box",
size: [50000.0, 50000.0, 50000.0], // mm
material: "rock",
color: [0.67, 0.29, 0.0],
invisible: 1,
}

// -------- GEO[cave]
{
name: "GEO",
index: "cave",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [10000.0, 10000.0, 10000.0], // mm
material: "air",
color: [0.8 0.1, 0.1],
invisible: 0,
//position: [] -- center of "world"
}


// -------- GEO[tank]
{
name: "GEO",
index: "tank",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "tube",
r_max: 550.0, // mm
size_z: 550.0, // mm
material: "steel",
color: [0.5, 0.5, 0.5],
position: [0.0, -9450.0, 0.0] // mm
rotation: [90.0, 0.0, 0.0] // degrees
}


// -------- GEO[target]
{
name: "GEO",
index: "target",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "tank",
type: "tube",
r_max: 500.0, // mm
size_z: 500.0, // mm
material: "gd_scintillator", // CHOOZ target
//material: "doped_water", // WATCHMAN target
color: [0, 0, 1],
}



