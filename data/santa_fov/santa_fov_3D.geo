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
invisible: 1,
//position: [] -- center of "world"
}


// DETECTOR ELEMENTS

// -------- GEO[capture_sphere]
{
name: "GEO",
index: "capture_sphere",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "sphere",
r_max: 2000.0, // mm
material: "ej254_1b",
color: [0.3, 0.3, 1.0],
invisible: 0,
//position: [] -- center of "world"
}

// -------- GEO[target_sphere]
{
name: "GEO",
index: "target_sphere",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "sphere",
r_max: 1000.0, // mm
material: "ej254_undoped",
color: [1.0, 0.3, 0.3],
invisible: 0,
//position: [] -- center of "world"
}

