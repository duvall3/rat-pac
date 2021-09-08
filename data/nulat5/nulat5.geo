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


// CELLS
// -------- GEO[cell_array]
{
name: "GEO",
index: "cell_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [75.0, 75.0, 75.0], // mm
material: "air",
invisible: 0,
position: [0.0, -9925.0, 0.0], // mm
}


// -------- GEO[target_cell_array]
{
name: "GEO",
index: "target_cell_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [127.500, 127.500, 127.500], // mm
material: "air",
invisible: 0,
position: [0.0, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_0_0_0]
{
name: "GEO",
index: "target_cell_0_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -102.000, -102.000] // mm
}


// -------- GEO[target_cell_0_0_1]
{
name: "GEO",
index: "target_cell_0_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -102.000, -51.000] // mm
}


// -------- GEO[target_cell_0_0_2]
{
name: "GEO",
index: "target_cell_0_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -102.000, 0.0] // mm
}


// -------- GEO[target_cell_0_0_3]
{
name: "GEO",
index: "target_cell_0_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -102.000, 51.000] // mm
}


// -------- GEO[target_cell_0_0_4]
{
name: "GEO",
index: "target_cell_0_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -102.000, 102.000] // mm
}


// -------- GEO[target_cell_0_1_0]
{
name: "GEO",
index: "target_cell_0_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -51.000, -102.000] // mm
}


// -------- GEO[target_cell_0_1_1]
{
name: "GEO",
index: "target_cell_0_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -51.000, -51.000] // mm
}


// -------- GEO[target_cell_0_1_2]
{
name: "GEO",
index: "target_cell_0_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_0_1_3]
{
name: "GEO",
index: "target_cell_0_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -51.000, 51.000] // mm
}


// -------- GEO[target_cell_0_1_4]
{
name: "GEO",
index: "target_cell_0_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, -51.000, 102.000] // mm
}


// -------- GEO[target_cell_0_2_0]
{
name: "GEO",
index: "target_cell_0_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 0.0, -102.000] // mm
}


// -------- GEO[target_cell_0_2_1]
{
name: "GEO",
index: "target_cell_0_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 0.0, -51.000] // mm
}


// -------- GEO[target_cell_0_2_2]
{
name: "GEO",
index: "target_cell_0_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_0_2_3]
{
name: "GEO",
index: "target_cell_0_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 0.0, 51.000] // mm
}


// -------- GEO[target_cell_0_2_4]
{
name: "GEO",
index: "target_cell_0_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 0.0, 102.000] // mm
}


// -------- GEO[target_cell_0_3_0]
{
name: "GEO",
index: "target_cell_0_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 51.000, -102.000] // mm
}


// -------- GEO[target_cell_0_3_1]
{
name: "GEO",
index: "target_cell_0_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 51.000, -51.000] // mm
}


// -------- GEO[target_cell_0_3_2]
{
name: "GEO",
index: "target_cell_0_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_0_3_3]
{
name: "GEO",
index: "target_cell_0_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 51.000, 51.000] // mm
}


// -------- GEO[target_cell_0_3_4]
{
name: "GEO",
index: "target_cell_0_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 51.000, 102.000] // mm
}


// -------- GEO[target_cell_0_4_0]
{
name: "GEO",
index: "target_cell_0_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 102.000, -102.000] // mm
}


// -------- GEO[target_cell_0_4_1]
{
name: "GEO",
index: "target_cell_0_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 102.000, -51.000] // mm
}


// -------- GEO[target_cell_0_4_2]
{
name: "GEO",
index: "target_cell_0_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 102.000, 0.0] // mm
}


// -------- GEO[target_cell_0_4_3]
{
name: "GEO",
index: "target_cell_0_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 102.000, 51.000] // mm
}


// -------- GEO[target_cell_0_4_4]
{
name: "GEO",
index: "target_cell_0_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-102.000, 102.000, 102.000] // mm
}


// -------- GEO[target_cell_1_0_0]
{
name: "GEO",
index: "target_cell_1_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -102.000, -102.000] // mm
}


// -------- GEO[target_cell_1_0_1]
{
name: "GEO",
index: "target_cell_1_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -102.000, -51.000] // mm
}


// -------- GEO[target_cell_1_0_2]
{
name: "GEO",
index: "target_cell_1_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -102.000, 0.0] // mm
}


// -------- GEO[target_cell_1_0_3]
{
name: "GEO",
index: "target_cell_1_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -102.000, 51.000] // mm
}


// -------- GEO[target_cell_1_0_4]
{
name: "GEO",
index: "target_cell_1_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -102.000, 102.000] // mm
}


// -------- GEO[target_cell_1_1_0]
{
name: "GEO",
index: "target_cell_1_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -51.000, -102.000] // mm
}


// -------- GEO[target_cell_1_1_1]
{
name: "GEO",
index: "target_cell_1_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -51.000, -51.000] // mm
}


// -------- GEO[target_cell_1_1_2]
{
name: "GEO",
index: "target_cell_1_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_1_1_3]
{
name: "GEO",
index: "target_cell_1_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -51.000, 51.000] // mm
}


// -------- GEO[target_cell_1_1_4]
{
name: "GEO",
index: "target_cell_1_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, -51.000, 102.000] // mm
}


// -------- GEO[target_cell_1_2_0]
{
name: "GEO",
index: "target_cell_1_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 0.0, -102.000] // mm
}


// -------- GEO[target_cell_1_2_1]
{
name: "GEO",
index: "target_cell_1_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 0.0, -51.000] // mm
}


// -------- GEO[target_cell_1_2_2]
{
name: "GEO",
index: "target_cell_1_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_1_2_3]
{
name: "GEO",
index: "target_cell_1_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 0.0, 51.000] // mm
}


// -------- GEO[target_cell_1_2_4]
{
name: "GEO",
index: "target_cell_1_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 0.0, 102.000] // mm
}


// -------- GEO[target_cell_1_3_0]
{
name: "GEO",
index: "target_cell_1_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 51.000, -102.000] // mm
}


// -------- GEO[target_cell_1_3_1]
{
name: "GEO",
index: "target_cell_1_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 51.000, -51.000] // mm
}


// -------- GEO[target_cell_1_3_2]
{
name: "GEO",
index: "target_cell_1_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_1_3_3]
{
name: "GEO",
index: "target_cell_1_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 51.000, 51.000] // mm
}


// -------- GEO[target_cell_1_3_4]
{
name: "GEO",
index: "target_cell_1_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 51.000, 102.000] // mm
}


// -------- GEO[target_cell_1_4_0]
{
name: "GEO",
index: "target_cell_1_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 102.000, -102.000] // mm
}


// -------- GEO[target_cell_1_4_1]
{
name: "GEO",
index: "target_cell_1_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 102.000, -51.000] // mm
}


// -------- GEO[target_cell_1_4_2]
{
name: "GEO",
index: "target_cell_1_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 102.000, 0.0] // mm
}


// -------- GEO[target_cell_1_4_3]
{
name: "GEO",
index: "target_cell_1_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 102.000, 51.000] // mm
}


// -------- GEO[target_cell_1_4_4]
{
name: "GEO",
index: "target_cell_1_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-51.000, 102.000, 102.000] // mm
}


// -------- GEO[target_cell_2_0_0]
{
name: "GEO",
index: "target_cell_2_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -102.000, -102.000] // mm
}


// -------- GEO[target_cell_2_0_1]
{
name: "GEO",
index: "target_cell_2_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -102.000, -51.000] // mm
}


// -------- GEO[target_cell_2_0_2]
{
name: "GEO",
index: "target_cell_2_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -102.000, 0.0] // mm
}


// -------- GEO[target_cell_2_0_3]
{
name: "GEO",
index: "target_cell_2_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -102.000, 51.000] // mm
}


// -------- GEO[target_cell_2_0_4]
{
name: "GEO",
index: "target_cell_2_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -102.000, 102.000] // mm
}


// -------- GEO[target_cell_2_1_0]
{
name: "GEO",
index: "target_cell_2_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -51.000, -102.000] // mm
}


// -------- GEO[target_cell_2_1_1]
{
name: "GEO",
index: "target_cell_2_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -51.000, -51.000] // mm
}


// -------- GEO[target_cell_2_1_2]
{
name: "GEO",
index: "target_cell_2_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_2_1_3]
{
name: "GEO",
index: "target_cell_2_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -51.000, 51.000] // mm
}


// -------- GEO[target_cell_2_1_4]
{
name: "GEO",
index: "target_cell_2_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, -51.000, 102.000] // mm
}


// -------- GEO[target_cell_2_2_0]
{
name: "GEO",
index: "target_cell_2_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 0.0, -102.000] // mm
}


// -------- GEO[target_cell_2_2_1]
{
name: "GEO",
index: "target_cell_2_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 0.0, -51.000] // mm
}


// -------- GEO[target_cell_2_2_2]
{
name: "GEO",
index: "target_cell_2_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_2_2_3]
{
name: "GEO",
index: "target_cell_2_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 0.0, 51.000] // mm
}


// -------- GEO[target_cell_2_2_4]
{
name: "GEO",
index: "target_cell_2_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 0.0, 102.000] // mm
}


// -------- GEO[target_cell_2_3_0]
{
name: "GEO",
index: "target_cell_2_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 51.000, -102.000] // mm
}


// -------- GEO[target_cell_2_3_1]
{
name: "GEO",
index: "target_cell_2_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 51.000, -51.000] // mm
}


// -------- GEO[target_cell_2_3_2]
{
name: "GEO",
index: "target_cell_2_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_2_3_3]
{
name: "GEO",
index: "target_cell_2_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 51.000, 51.000] // mm
}


// -------- GEO[target_cell_2_3_4]
{
name: "GEO",
index: "target_cell_2_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 51.000, 102.000] // mm
}


// -------- GEO[target_cell_2_4_0]
{
name: "GEO",
index: "target_cell_2_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 102.000, -102.000] // mm
}


// -------- GEO[target_cell_2_4_1]
{
name: "GEO",
index: "target_cell_2_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 102.000, -51.000] // mm
}


// -------- GEO[target_cell_2_4_2]
{
name: "GEO",
index: "target_cell_2_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 102.000, 0.0] // mm
}


// -------- GEO[target_cell_2_4_3]
{
name: "GEO",
index: "target_cell_2_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 102.000, 51.000] // mm
}


// -------- GEO[target_cell_2_4_4]
{
name: "GEO",
index: "target_cell_2_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 102.000, 102.000] // mm
}


// -------- GEO[target_cell_3_0_0]
{
name: "GEO",
index: "target_cell_3_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -102.000, -102.000] // mm
}


// -------- GEO[target_cell_3_0_1]
{
name: "GEO",
index: "target_cell_3_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -102.000, -51.000] // mm
}


// -------- GEO[target_cell_3_0_2]
{
name: "GEO",
index: "target_cell_3_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -102.000, 0.0] // mm
}


// -------- GEO[target_cell_3_0_3]
{
name: "GEO",
index: "target_cell_3_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -102.000, 51.000] // mm
}


// -------- GEO[target_cell_3_0_4]
{
name: "GEO",
index: "target_cell_3_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -102.000, 102.000] // mm
}


// -------- GEO[target_cell_3_1_0]
{
name: "GEO",
index: "target_cell_3_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -51.000, -102.000] // mm
}


// -------- GEO[target_cell_3_1_1]
{
name: "GEO",
index: "target_cell_3_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -51.000, -51.000] // mm
}


// -------- GEO[target_cell_3_1_2]
{
name: "GEO",
index: "target_cell_3_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_3_1_3]
{
name: "GEO",
index: "target_cell_3_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -51.000, 51.000] // mm
}


// -------- GEO[target_cell_3_1_4]
{
name: "GEO",
index: "target_cell_3_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, -51.000, 102.000] // mm
}


// -------- GEO[target_cell_3_2_0]
{
name: "GEO",
index: "target_cell_3_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 0.0, -102.000] // mm
}


// -------- GEO[target_cell_3_2_1]
{
name: "GEO",
index: "target_cell_3_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 0.0, -51.000] // mm
}


// -------- GEO[target_cell_3_2_2]
{
name: "GEO",
index: "target_cell_3_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_3_2_3]
{
name: "GEO",
index: "target_cell_3_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 0.0, 51.000] // mm
}


// -------- GEO[target_cell_3_2_4]
{
name: "GEO",
index: "target_cell_3_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 0.0, 102.000] // mm
}


// -------- GEO[target_cell_3_3_0]
{
name: "GEO",
index: "target_cell_3_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 51.000, -102.000] // mm
}


// -------- GEO[target_cell_3_3_1]
{
name: "GEO",
index: "target_cell_3_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 51.000, -51.000] // mm
}


// -------- GEO[target_cell_3_3_2]
{
name: "GEO",
index: "target_cell_3_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_3_3_3]
{
name: "GEO",
index: "target_cell_3_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 51.000, 51.000] // mm
}


// -------- GEO[target_cell_3_3_4]
{
name: "GEO",
index: "target_cell_3_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 51.000, 102.000] // mm
}


// -------- GEO[target_cell_3_4_0]
{
name: "GEO",
index: "target_cell_3_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 102.000, -102.000] // mm
}


// -------- GEO[target_cell_3_4_1]
{
name: "GEO",
index: "target_cell_3_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 102.000, -51.000] // mm
}


// -------- GEO[target_cell_3_4_2]
{
name: "GEO",
index: "target_cell_3_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 102.000, 0.0] // mm
}


// -------- GEO[target_cell_3_4_3]
{
name: "GEO",
index: "target_cell_3_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 102.000, 51.000] // mm
}


// -------- GEO[target_cell_3_4_4]
{
name: "GEO",
index: "target_cell_3_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [51.000, 102.000, 102.000] // mm
}


// -------- GEO[target_cell_4_0_0]
{
name: "GEO",
index: "target_cell_4_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -102.000, -102.000] // mm
}


// -------- GEO[target_cell_4_0_1]
{
name: "GEO",
index: "target_cell_4_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -102.000, -51.000] // mm
}


// -------- GEO[target_cell_4_0_2]
{
name: "GEO",
index: "target_cell_4_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -102.000, 0.0] // mm
}


// -------- GEO[target_cell_4_0_3]
{
name: "GEO",
index: "target_cell_4_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -102.000, 51.000] // mm
}


// -------- GEO[target_cell_4_0_4]
{
name: "GEO",
index: "target_cell_4_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -102.000, 102.000] // mm
}


// -------- GEO[target_cell_4_1_0]
{
name: "GEO",
index: "target_cell_4_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -51.000, -102.000] // mm
}


// -------- GEO[target_cell_4_1_1]
{
name: "GEO",
index: "target_cell_4_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -51.000, -51.000] // mm
}


// -------- GEO[target_cell_4_1_2]
{
name: "GEO",
index: "target_cell_4_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_4_1_3]
{
name: "GEO",
index: "target_cell_4_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -51.000, 51.000] // mm
}


// -------- GEO[target_cell_4_1_4]
{
name: "GEO",
index: "target_cell_4_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, -51.000, 102.000] // mm
}


// -------- GEO[target_cell_4_2_0]
{
name: "GEO",
index: "target_cell_4_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 0.0, -102.000] // mm
}


// -------- GEO[target_cell_4_2_1]
{
name: "GEO",
index: "target_cell_4_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 0.0, -51.000] // mm
}


// -------- GEO[target_cell_4_2_2]
{
name: "GEO",
index: "target_cell_4_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_4_2_3]
{
name: "GEO",
index: "target_cell_4_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 0.0, 51.000] // mm
}


// -------- GEO[target_cell_4_2_4]
{
name: "GEO",
index: "target_cell_4_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 0.0, 102.000] // mm
}


// -------- GEO[target_cell_4_3_0]
{
name: "GEO",
index: "target_cell_4_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 51.000, -102.000] // mm
}


// -------- GEO[target_cell_4_3_1]
{
name: "GEO",
index: "target_cell_4_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 51.000, -51.000] // mm
}


// -------- GEO[target_cell_4_3_2]
{
name: "GEO",
index: "target_cell_4_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_4_3_3]
{
name: "GEO",
index: "target_cell_4_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 51.000, 51.000] // mm
}


// -------- GEO[target_cell_4_3_4]
{
name: "GEO",
index: "target_cell_4_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 51.000, 102.000] // mm
}


// -------- GEO[target_cell_4_4_0]
{
name: "GEO",
index: "target_cell_4_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 102.000, -102.000] // mm
}


// -------- GEO[target_cell_4_4_1]
{
name: "GEO",
index: "target_cell_4_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 102.000, -51.000] // mm
}


// -------- GEO[target_cell_4_4_2]
{
name: "GEO",
index: "target_cell_4_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 102.000, 0.0] // mm
}


// -------- GEO[target_cell_4_4_3]
{
name: "GEO",
index: "target_cell_4_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 102.000, 51.000] // mm
}


// -------- GEO[target_cell_4_4_4]
{
name: "GEO",
index: "target_cell_4_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [102.000, 102.000, 102.000] // mm
}


