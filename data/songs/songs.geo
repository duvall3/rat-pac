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
size: [882.0, 882.0, 882.0], // mm
material: "air",
color: [0.8 0.1, 0.1],
invisible: 0,
//position: [] -- center of "world"
}


// -------- GEO[water_shield]
{
name: "GEO",
index: "water_shield",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [538.2, 538.2, 538.2], // mm
material: "water",
invisible: 0,
//position: [0.0, -4000.0, 0.0] // mm
}


// TARGET CUBE
// -------- GEO[target_cube]
{
name: "GEO",
index: "target_cube",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "world",
mother: "water_shield",
type: "box",
//size: [76.0, 76.0, 76.0], // mm
size: [382.0,382.0,382.0]
material: "gd_scintillator",
invisible: 0,
//position: [0.0, -9924.0, 0.0], // mm
//position: [0.0, -5000.0, 0.0]
}


