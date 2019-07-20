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


// CAVE FACES -- for visualization purposes
// -------- GEO[cave_floor]
{
name: "GEO",
index: "cave_floor",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [10000.0, 1.0, 10000.0], // mm
material: "rock",
invisible: 0,
position: [0.0, -10000.0, 0.0] // mm
}

// -------- GEO[cave_ceiling]
{
name: "GEO",
index: "cave_ceiling",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [10000.0, 1.0, 10000.0], // mm
material: "rock",
invisible: 0,
position: [0.0, 10000.0, 0.0] // mm
}


// -------- GEO[cave_back]
{
name: "GEO",
index: "cave_back",
valid_begin: [0, 0],
valid_end: [0, 0], mother: "world", type: "box",
size: [10000.0, 10000.0, 1.0], // mm
material: "rock",
invisible: 0,
position: [0.0, 0.0, 10000.0] // mm
}


// -------- GEO[cave_lwall]
{
name: "GEO",
index: "cave_lwall",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [1.0, 10000.0, 10000.0], // mm
material: "rock",
invisible: 0,
position: [-10000.0, 0.0, 0.0] // mm
}


// -------- GEO[cave_rwall]
{
name: "GEO",
index: "cave_rwall",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [1.0, 10000.0, 10000.0], // mm
material: "rock",
invisible: 0,
position: [10000.0, 0.0, 0.0] // mm
}

// -------- GEO[generator]
{
name: "GEO",
index: "generator",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [1.0, 27.0, 100.0], // mm
material: "air",
invisible: 0,
position: [-100.0, 0.0, 0.0] // mm
}
// DETECTOR ELEMENTS

