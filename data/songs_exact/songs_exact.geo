// RATDB file describing simple detector geometry
// songs_exact -- a specific recreation of the SONGS geometry (rather than the generic SONGS-type detector in "songs.geo")

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
//size: [680., 740., 680.], // mm
size: [680., 680., 740.], // mm
material: "water",
invisible: 0,
}


// DETECTOR SPACE -- to be shared by all detectors
// -------- GEO[detector_space]
{
name: "GEO",
index: "detector_space",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "water_shield",
type: "box",
//size: [430., 490., 430.]
size: [430., 430., 490.]
material: "air"
invisible: 0,
position: [0., 0., 0.]
}


// CELL ARRAY
// -------- GEO[cell_array]
{
name: "GEO",
index: "cell_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "detector_space",
type: "box",
size: [430., 430., 490.]
material: "air"
invisible: 0,
position: [0., 0., 0.]
}


// TARGET CELL
// -------- GEO[target_cell]
{
name: "GEO",
index: "target_cell",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [215., 215., 490.]
material: "gd_scintillator",
invisible: 0,
position: [215., 215., 0.]
}

// INERT CELL 1
// -------- GEO[inert_cell_1]
{
name: "GEO",
index: "inert_cell_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [215., 215., 490.]
material: "gd_scintillator_OFF",
invisible: 0,
position: [-215., 215., 0.]
}

// INERT CELL 2
// -------- GEO[inert_cell_1]
{
name: "GEO",
index: "inert_cell_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [215., 215., 490.]
material: "gd_scintillator_OFF",
invisible: 0,
position: [-215., -215., 0.]
}

// INERT CELL 3
// -------- GEO[inert_cell_3]
{
name: "GEO",
index: "inert_cell_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [215., 215., 490.]
material: "gd_scintillator_OFF",
invisible: 0,
position: [215., -215., 0.]
}


