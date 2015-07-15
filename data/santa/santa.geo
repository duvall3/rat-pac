// RATDB file describing simple detector geometry

// !!! B-DOPED SCINTILLATOR NOT YET IMPLEMENTED !!!

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
size: [1000.0, 1000.0, 2.5] // mm
position: [0.0, -9000.0, -500.0] // mm
material: "scintillator",
color: [0, 0, 1],
}


// -------- GEO[ibd_vertex]
{
name: "GEO",
index: "ibd_vertex",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [10.0, 10.0, 2.5] // mm
//position: [0.0, -9000.0, -500.0] // mm -- now in mother "target_plane"
material: "scintillator",
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
size: [1000.0, 1000.0, 30.0], // mm
position: [0.0, -9000.0, 500.0] // mm
//material: "b_scintillator",
material: "gd_scintillator", // PLACEHOLDER!!! -- still implementing B-doped scintillator
color: [0, .1, 0],
}
