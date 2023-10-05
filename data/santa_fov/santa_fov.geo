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
color: [0.8, 0.1, 0.1],
invisible: 1,
//position: [] -- center of "world"
}

// -------- GEO[floor]
{
name: "GEO",
index: "floor",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [2500.0, 2500.0, 10.0], // mm
material: "air",
color: [0.8, 0.8, 0.8],
invisible: 0,
position: [0.0, 0.0, -1001.0 ] // mm
}


// DETECTOR ELEMENTS

// -------- GEO[capture_tube]
{
name: "GEO",
index: "capture_tube",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "tube",
r_min: 1900.0, // mm
r_max: 2000.0, // mm
size_z: 1000.0, // mm
material: "ej254_1b",
color: [0.3, 0.3, 1.0],
invisible: 0,
//position: [] -- center of "world"
}

// -------- GEO[target_tube]
{
name: "GEO",
index: "target_tube",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "capture_tube",
mother: "cave",
type: "tube",
r_min:  975.0, // mm
r_max: 1000.0, // mm
size_z: 1000.0, // mm
material: "ej254_undoped",
color: [1.0, 0.3, 0.3],
invisible: 0,
//position: [] -- center of "world"
}

