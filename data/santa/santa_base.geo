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


// -------- GEO[target_plane]
{
name: "GEO",
index: "target_plane",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
//size: [1000.0, 1020.0, 2.5] // mm
size: [3.0, 1005.0, 1025.0] // mm
//position: [0.0, -8980.0, -500.0] // mm
position: [-500.0, 0.0, -8980.0] // mm
material: "air",   // this volume will contain scintillator bars
color: [0, 0, 1],
}


// -------- GEO[ibd_vertex]
{
name: "GEO",
index: "ibd_vertex",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_bar_21", // just above center (even number of bars)
type: "box",
//size: [.125, 25.0, 2.5] // mm
size: [2.5, .125, 25.0] // mm
material: "air",
color: [0, 0, 1],
}


// -------- GEO[capture_plane]
{
name: "GEO",
index: "capture_plane",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
//size: [1000.0, 1020.0, 30.0], // mm
size: [35.0, 1005.0, 1025.0], // mm
//position: [0.0, -8980.0, 500.0] // mm
position: [500.0, 0.0, -8980.0] // mm
material: "air", // this volume will contain the bar stack
color: [0, .1, 0],
}


