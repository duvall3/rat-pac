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
//position: [] // -- center of "world"
}


// CUBES

// -------- GEO[target_cube_array]
{
name: "GEO",
index: "target_cube_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [49.500, 49.500, 49.500], // mm
material: "air",
invisible: 0,
position: [0.0, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_0_0_0]
{
name: "GEO",
index: "target_cube_0_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_0_0_1]
{
name: "GEO",
index: "target_cube_0_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -44.000, -33.000] // mm
}


// -------- GEO[target_cube_0_0_2]
{
name: "GEO",
index: "target_cube_0_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_0_0_3]
{
name: "GEO",
index: "target_cube_0_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -44.000, -11.000] // mm
}


// -------- GEO[target_cube_0_0_4]
{
name: "GEO",
index: "target_cube_0_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_0_0_5]
{
name: "GEO",
index: "target_cube_0_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -44.000, 11.000] // mm
}


// -------- GEO[target_cube_0_0_6]
{
name: "GEO",
index: "target_cube_0_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_0_0_7]
{
name: "GEO",
index: "target_cube_0_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -44.000, 33.000] // mm
}


// -------- GEO[target_cube_0_0_8]
{
name: "GEO",
index: "target_cube_0_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_0_1_0]
{
name: "GEO",
index: "target_cube_0_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -33.000, -44.000] // mm
}


// -------- GEO[target_cube_0_1_1]
{
name: "GEO",
index: "target_cube_0_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -33.000, -33.000] // mm
}


// -------- GEO[target_cube_0_1_2]
{
name: "GEO",
index: "target_cube_0_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -33.000, -22.000] // mm
}


// -------- GEO[target_cube_0_1_3]
{
name: "GEO",
index: "target_cube_0_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -33.000, -11.000] // mm
}


// -------- GEO[target_cube_0_1_4]
{
name: "GEO",
index: "target_cube_0_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cube_0_1_5]
{
name: "GEO",
index: "target_cube_0_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -33.000, 11.000] // mm
}


// -------- GEO[target_cube_0_1_6]
{
name: "GEO",
index: "target_cube_0_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -33.000, 22.000] // mm
}


// -------- GEO[target_cube_0_1_7]
{
name: "GEO",
index: "target_cube_0_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -33.000, 33.000] // mm
}


// -------- GEO[target_cube_0_1_8]
{
name: "GEO",
index: "target_cube_0_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -33.000, 44.000] // mm
}


// -------- GEO[target_cube_0_2_0]
{
name: "GEO",
index: "target_cube_0_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_0_2_1]
{
name: "GEO",
index: "target_cube_0_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -22.000, -33.000] // mm
}


// -------- GEO[target_cube_0_2_2]
{
name: "GEO",
index: "target_cube_0_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_0_2_3]
{
name: "GEO",
index: "target_cube_0_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -22.000, -11.000] // mm
}


// -------- GEO[target_cube_0_2_4]
{
name: "GEO",
index: "target_cube_0_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_0_2_5]
{
name: "GEO",
index: "target_cube_0_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -22.000, 11.000] // mm
}


// -------- GEO[target_cube_0_2_6]
{
name: "GEO",
index: "target_cube_0_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_0_2_7]
{
name: "GEO",
index: "target_cube_0_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -22.000, 33.000] // mm
}


// -------- GEO[target_cube_0_2_8]
{
name: "GEO",
index: "target_cube_0_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_0_3_0]
{
name: "GEO",
index: "target_cube_0_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -11.000, -44.000] // mm
}


// -------- GEO[target_cube_0_3_1]
{
name: "GEO",
index: "target_cube_0_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -11.000, -33.000] // mm
}


// -------- GEO[target_cube_0_3_2]
{
name: "GEO",
index: "target_cube_0_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -11.000, -22.000] // mm
}


// -------- GEO[target_cube_0_3_3]
{
name: "GEO",
index: "target_cube_0_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -11.000, -11.000] // mm
}


// -------- GEO[target_cube_0_3_4]
{
name: "GEO",
index: "target_cube_0_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -11.000, 0.0] // mm
}


// -------- GEO[target_cube_0_3_5]
{
name: "GEO",
index: "target_cube_0_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -11.000, 11.000] // mm
}


// -------- GEO[target_cube_0_3_6]
{
name: "GEO",
index: "target_cube_0_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -11.000, 22.000] // mm
}


// -------- GEO[target_cube_0_3_7]
{
name: "GEO",
index: "target_cube_0_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -11.000, 33.000] // mm
}


// -------- GEO[target_cube_0_3_8]
{
name: "GEO",
index: "target_cube_0_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, -11.000, 44.000] // mm
}


// -------- GEO[target_cube_0_4_0]
{
name: "GEO",
index: "target_cube_0_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_0_4_1]
{
name: "GEO",
index: "target_cube_0_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 0.0, -33.000] // mm
}


// -------- GEO[target_cube_0_4_2]
{
name: "GEO",
index: "target_cube_0_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_0_4_3]
{
name: "GEO",
index: "target_cube_0_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 0.0, -11.000] // mm
}


// -------- GEO[target_cube_0_4_4]
{
name: "GEO",
index: "target_cube_0_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_0_4_5]
{
name: "GEO",
index: "target_cube_0_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 0.0, 11.000] // mm
}


// -------- GEO[target_cube_0_4_6]
{
name: "GEO",
index: "target_cube_0_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_0_4_7]
{
name: "GEO",
index: "target_cube_0_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 0.0, 33.000] // mm
}


// -------- GEO[target_cube_0_4_8]
{
name: "GEO",
index: "target_cube_0_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_0_5_0]
{
name: "GEO",
index: "target_cube_0_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 11.000, -44.000] // mm
}


// -------- GEO[target_cube_0_5_1]
{
name: "GEO",
index: "target_cube_0_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 11.000, -33.000] // mm
}


// -------- GEO[target_cube_0_5_2]
{
name: "GEO",
index: "target_cube_0_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 11.000, -22.000] // mm
}


// -------- GEO[target_cube_0_5_3]
{
name: "GEO",
index: "target_cube_0_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 11.000, -11.000] // mm
}


// -------- GEO[target_cube_0_5_4]
{
name: "GEO",
index: "target_cube_0_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 11.000, 0.0] // mm
}


// -------- GEO[target_cube_0_5_5]
{
name: "GEO",
index: "target_cube_0_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 11.000, 11.000] // mm
}


// -------- GEO[target_cube_0_5_6]
{
name: "GEO",
index: "target_cube_0_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 11.000, 22.000] // mm
}


// -------- GEO[target_cube_0_5_7]
{
name: "GEO",
index: "target_cube_0_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 11.000, 33.000] // mm
}


// -------- GEO[target_cube_0_5_8]
{
name: "GEO",
index: "target_cube_0_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 11.000, 44.000] // mm
}


// -------- GEO[target_cube_0_6_0]
{
name: "GEO",
index: "target_cube_0_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_0_6_1]
{
name: "GEO",
index: "target_cube_0_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 22.000, -33.000] // mm
}


// -------- GEO[target_cube_0_6_2]
{
name: "GEO",
index: "target_cube_0_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_0_6_3]
{
name: "GEO",
index: "target_cube_0_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 22.000, -11.000] // mm
}


// -------- GEO[target_cube_0_6_4]
{
name: "GEO",
index: "target_cube_0_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_0_6_5]
{
name: "GEO",
index: "target_cube_0_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 22.000, 11.000] // mm
}


// -------- GEO[target_cube_0_6_6]
{
name: "GEO",
index: "target_cube_0_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_0_6_7]
{
name: "GEO",
index: "target_cube_0_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 22.000, 33.000] // mm
}


// -------- GEO[target_cube_0_6_8]
{
name: "GEO",
index: "target_cube_0_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_0_7_0]
{
name: "GEO",
index: "target_cube_0_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 33.000, -44.000] // mm
}


// -------- GEO[target_cube_0_7_1]
{
name: "GEO",
index: "target_cube_0_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 33.000, -33.000] // mm
}


// -------- GEO[target_cube_0_7_2]
{
name: "GEO",
index: "target_cube_0_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 33.000, -22.000] // mm
}


// -------- GEO[target_cube_0_7_3]
{
name: "GEO",
index: "target_cube_0_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 33.000, -11.000] // mm
}


// -------- GEO[target_cube_0_7_4]
{
name: "GEO",
index: "target_cube_0_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cube_0_7_5]
{
name: "GEO",
index: "target_cube_0_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 33.000, 11.000] // mm
}


// -------- GEO[target_cube_0_7_6]
{
name: "GEO",
index: "target_cube_0_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 33.000, 22.000] // mm
}


// -------- GEO[target_cube_0_7_7]
{
name: "GEO",
index: "target_cube_0_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 33.000, 33.000] // mm
}


// -------- GEO[target_cube_0_7_8]
{
name: "GEO",
index: "target_cube_0_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 33.000, 44.000] // mm
}


// -------- GEO[target_cube_0_8_0]
{
name: "GEO",
index: "target_cube_0_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_0_8_1]
{
name: "GEO",
index: "target_cube_0_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 44.000, -33.000] // mm
}


// -------- GEO[target_cube_0_8_2]
{
name: "GEO",
index: "target_cube_0_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_0_8_3]
{
name: "GEO",
index: "target_cube_0_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 44.000, -11.000] // mm
}


// -------- GEO[target_cube_0_8_4]
{
name: "GEO",
index: "target_cube_0_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_0_8_5]
{
name: "GEO",
index: "target_cube_0_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 44.000, 11.000] // mm
}


// -------- GEO[target_cube_0_8_6]
{
name: "GEO",
index: "target_cube_0_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_0_8_7]
{
name: "GEO",
index: "target_cube_0_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-44.000, 44.000, 33.000] // mm
}


// -------- GEO[target_cube_0_8_8]
{
name: "GEO",
index: "target_cube_0_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-44.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_1_0_0]
{
name: "GEO",
index: "target_cube_1_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_1_0_1]
{
name: "GEO",
index: "target_cube_1_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -44.000, -33.000] // mm
}


// -------- GEO[target_cube_1_0_2]
{
name: "GEO",
index: "target_cube_1_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_1_0_3]
{
name: "GEO",
index: "target_cube_1_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -44.000, -11.000] // mm
}


// -------- GEO[target_cube_1_0_4]
{
name: "GEO",
index: "target_cube_1_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_1_0_5]
{
name: "GEO",
index: "target_cube_1_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -44.000, 11.000] // mm
}


// -------- GEO[target_cube_1_0_6]
{
name: "GEO",
index: "target_cube_1_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_1_0_7]
{
name: "GEO",
index: "target_cube_1_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -44.000, 33.000] // mm
}


// -------- GEO[target_cube_1_0_8]
{
name: "GEO",
index: "target_cube_1_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_1_1_0]
{
name: "GEO",
index: "target_cube_1_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -33.000, -44.000] // mm
}


// -------- GEO[target_cube_1_1_1]
{
name: "GEO",
index: "target_cube_1_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -33.000, -33.000] // mm
}


// -------- GEO[target_cube_1_1_2]
{
name: "GEO",
index: "target_cube_1_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -33.000, -22.000] // mm
}


// -------- GEO[target_cube_1_1_3]
{
name: "GEO",
index: "target_cube_1_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -33.000, -11.000] // mm
}


// -------- GEO[target_cube_1_1_4]
{
name: "GEO",
index: "target_cube_1_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cube_1_1_5]
{
name: "GEO",
index: "target_cube_1_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -33.000, 11.000] // mm
}


// -------- GEO[target_cube_1_1_6]
{
name: "GEO",
index: "target_cube_1_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -33.000, 22.000] // mm
}


// -------- GEO[target_cube_1_1_7]
{
name: "GEO",
index: "target_cube_1_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -33.000, 33.000] // mm
}


// -------- GEO[target_cube_1_1_8]
{
name: "GEO",
index: "target_cube_1_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -33.000, 44.000] // mm
}


// -------- GEO[target_cube_1_2_0]
{
name: "GEO",
index: "target_cube_1_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_1_2_1]
{
name: "GEO",
index: "target_cube_1_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -22.000, -33.000] // mm
}


// -------- GEO[target_cube_1_2_2]
{
name: "GEO",
index: "target_cube_1_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_1_2_3]
{
name: "GEO",
index: "target_cube_1_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -22.000, -11.000] // mm
}


// -------- GEO[target_cube_1_2_4]
{
name: "GEO",
index: "target_cube_1_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_1_2_5]
{
name: "GEO",
index: "target_cube_1_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -22.000, 11.000] // mm
}


// -------- GEO[target_cube_1_2_6]
{
name: "GEO",
index: "target_cube_1_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_1_2_7]
{
name: "GEO",
index: "target_cube_1_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -22.000, 33.000] // mm
}


// -------- GEO[target_cube_1_2_8]
{
name: "GEO",
index: "target_cube_1_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_1_3_0]
{
name: "GEO",
index: "target_cube_1_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -11.000, -44.000] // mm
}


// -------- GEO[target_cube_1_3_1]
{
name: "GEO",
index: "target_cube_1_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -11.000, -33.000] // mm
}


// -------- GEO[target_cube_1_3_2]
{
name: "GEO",
index: "target_cube_1_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -11.000, -22.000] // mm
}


// -------- GEO[target_cube_1_3_3]
{
name: "GEO",
index: "target_cube_1_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -11.000, -11.000] // mm
}


// -------- GEO[target_cube_1_3_4]
{
name: "GEO",
index: "target_cube_1_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -11.000, 0.0] // mm
}


// -------- GEO[target_cube_1_3_5]
{
name: "GEO",
index: "target_cube_1_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -11.000, 11.000] // mm
}


// -------- GEO[target_cube_1_3_6]
{
name: "GEO",
index: "target_cube_1_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -11.000, 22.000] // mm
}


// -------- GEO[target_cube_1_3_7]
{
name: "GEO",
index: "target_cube_1_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -11.000, 33.000] // mm
}


// -------- GEO[target_cube_1_3_8]
{
name: "GEO",
index: "target_cube_1_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, -11.000, 44.000] // mm
}


// -------- GEO[target_cube_1_4_0]
{
name: "GEO",
index: "target_cube_1_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_1_4_1]
{
name: "GEO",
index: "target_cube_1_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 0.0, -33.000] // mm
}


// -------- GEO[target_cube_1_4_2]
{
name: "GEO",
index: "target_cube_1_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_1_4_3]
{
name: "GEO",
index: "target_cube_1_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 0.0, -11.000] // mm
}


// -------- GEO[target_cube_1_4_4]
{
name: "GEO",
index: "target_cube_1_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_1_4_5]
{
name: "GEO",
index: "target_cube_1_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 0.0, 11.000] // mm
}


// -------- GEO[target_cube_1_4_6]
{
name: "GEO",
index: "target_cube_1_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_1_4_7]
{
name: "GEO",
index: "target_cube_1_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 0.0, 33.000] // mm
}


// -------- GEO[target_cube_1_4_8]
{
name: "GEO",
index: "target_cube_1_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_1_5_0]
{
name: "GEO",
index: "target_cube_1_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 11.000, -44.000] // mm
}


// -------- GEO[target_cube_1_5_1]
{
name: "GEO",
index: "target_cube_1_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 11.000, -33.000] // mm
}


// -------- GEO[target_cube_1_5_2]
{
name: "GEO",
index: "target_cube_1_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 11.000, -22.000] // mm
}


// -------- GEO[target_cube_1_5_3]
{
name: "GEO",
index: "target_cube_1_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 11.000, -11.000] // mm
}


// -------- GEO[target_cube_1_5_4]
{
name: "GEO",
index: "target_cube_1_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 11.000, 0.0] // mm
}


// -------- GEO[target_cube_1_5_5]
{
name: "GEO",
index: "target_cube_1_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 11.000, 11.000] // mm
}


// -------- GEO[target_cube_1_5_6]
{
name: "GEO",
index: "target_cube_1_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 11.000, 22.000] // mm
}


// -------- GEO[target_cube_1_5_7]
{
name: "GEO",
index: "target_cube_1_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 11.000, 33.000] // mm
}


// -------- GEO[target_cube_1_5_8]
{
name: "GEO",
index: "target_cube_1_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 11.000, 44.000] // mm
}


// -------- GEO[target_cube_1_6_0]
{
name: "GEO",
index: "target_cube_1_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_1_6_1]
{
name: "GEO",
index: "target_cube_1_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 22.000, -33.000] // mm
}


// -------- GEO[target_cube_1_6_2]
{
name: "GEO",
index: "target_cube_1_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_1_6_3]
{
name: "GEO",
index: "target_cube_1_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 22.000, -11.000] // mm
}


// -------- GEO[target_cube_1_6_4]
{
name: "GEO",
index: "target_cube_1_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_1_6_5]
{
name: "GEO",
index: "target_cube_1_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 22.000, 11.000] // mm
}


// -------- GEO[target_cube_1_6_6]
{
name: "GEO",
index: "target_cube_1_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_1_6_7]
{
name: "GEO",
index: "target_cube_1_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 22.000, 33.000] // mm
}


// -------- GEO[target_cube_1_6_8]
{
name: "GEO",
index: "target_cube_1_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_1_7_0]
{
name: "GEO",
index: "target_cube_1_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, -44.000] // mm
}


// -------- GEO[target_cube_1_7_1]
{
name: "GEO",
index: "target_cube_1_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, -33.000] // mm
}


// -------- GEO[target_cube_1_7_2]
{
name: "GEO",
index: "target_cube_1_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, -22.000] // mm
}


// -------- GEO[target_cube_1_7_3]
{
name: "GEO",
index: "target_cube_1_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, -11.000] // mm
}


// -------- GEO[target_cube_1_7_4]
{
name: "GEO",
index: "target_cube_1_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cube_1_7_5]
{
name: "GEO",
index: "target_cube_1_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, 11.000] // mm
}


// -------- GEO[target_cube_1_7_6]
{
name: "GEO",
index: "target_cube_1_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, 22.000] // mm
}


// -------- GEO[target_cube_1_7_7]
{
name: "GEO",
index: "target_cube_1_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, 33.000] // mm
}


// -------- GEO[target_cube_1_7_8]
{
name: "GEO",
index: "target_cube_1_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, 44.000] // mm
}


// -------- GEO[target_cube_1_8_0]
{
name: "GEO",
index: "target_cube_1_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_1_8_1]
{
name: "GEO",
index: "target_cube_1_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 44.000, -33.000] // mm
}


// -------- GEO[target_cube_1_8_2]
{
name: "GEO",
index: "target_cube_1_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_1_8_3]
{
name: "GEO",
index: "target_cube_1_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 44.000, -11.000] // mm
}


// -------- GEO[target_cube_1_8_4]
{
name: "GEO",
index: "target_cube_1_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_1_8_5]
{
name: "GEO",
index: "target_cube_1_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 44.000, 11.000] // mm
}


// -------- GEO[target_cube_1_8_6]
{
name: "GEO",
index: "target_cube_1_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_1_8_7]
{
name: "GEO",
index: "target_cube_1_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 44.000, 33.000] // mm
}


// -------- GEO[target_cube_1_8_8]
{
name: "GEO",
index: "target_cube_1_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-33.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_2_0_0]
{
name: "GEO",
index: "target_cube_2_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_2_0_1]
{
name: "GEO",
index: "target_cube_2_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -44.000, -33.000] // mm
}


// -------- GEO[target_cube_2_0_2]
{
name: "GEO",
index: "target_cube_2_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_2_0_3]
{
name: "GEO",
index: "target_cube_2_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -44.000, -11.000] // mm
}


// -------- GEO[target_cube_2_0_4]
{
name: "GEO",
index: "target_cube_2_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_2_0_5]
{
name: "GEO",
index: "target_cube_2_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -44.000, 11.000] // mm
}


// -------- GEO[target_cube_2_0_6]
{
name: "GEO",
index: "target_cube_2_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_2_0_7]
{
name: "GEO",
index: "target_cube_2_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -44.000, 33.000] // mm
}


// -------- GEO[target_cube_2_0_8]
{
name: "GEO",
index: "target_cube_2_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_2_1_0]
{
name: "GEO",
index: "target_cube_2_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -33.000, -44.000] // mm
}


// -------- GEO[target_cube_2_1_1]
{
name: "GEO",
index: "target_cube_2_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -33.000, -33.000] // mm
}


// -------- GEO[target_cube_2_1_2]
{
name: "GEO",
index: "target_cube_2_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -33.000, -22.000] // mm
}


// -------- GEO[target_cube_2_1_3]
{
name: "GEO",
index: "target_cube_2_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -33.000, -11.000] // mm
}


// -------- GEO[target_cube_2_1_4]
{
name: "GEO",
index: "target_cube_2_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cube_2_1_5]
{
name: "GEO",
index: "target_cube_2_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -33.000, 11.000] // mm
}


// -------- GEO[target_cube_2_1_6]
{
name: "GEO",
index: "target_cube_2_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -33.000, 22.000] // mm
}


// -------- GEO[target_cube_2_1_7]
{
name: "GEO",
index: "target_cube_2_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -33.000, 33.000] // mm
}


// -------- GEO[target_cube_2_1_8]
{
name: "GEO",
index: "target_cube_2_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -33.000, 44.000] // mm
}


// -------- GEO[target_cube_2_2_0]
{
name: "GEO",
index: "target_cube_2_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_2_2_1]
{
name: "GEO",
index: "target_cube_2_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -22.000, -33.000] // mm
}


// -------- GEO[target_cube_2_2_2]
{
name: "GEO",
index: "target_cube_2_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_2_2_3]
{
name: "GEO",
index: "target_cube_2_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -22.000, -11.000] // mm
}


// -------- GEO[target_cube_2_2_4]
{
name: "GEO",
index: "target_cube_2_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_2_2_5]
{
name: "GEO",
index: "target_cube_2_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -22.000, 11.000] // mm
}


// -------- GEO[target_cube_2_2_6]
{
name: "GEO",
index: "target_cube_2_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_2_2_7]
{
name: "GEO",
index: "target_cube_2_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -22.000, 33.000] // mm
}


// -------- GEO[target_cube_2_2_8]
{
name: "GEO",
index: "target_cube_2_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_2_3_0]
{
name: "GEO",
index: "target_cube_2_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -11.000, -44.000] // mm
}


// -------- GEO[target_cube_2_3_1]
{
name: "GEO",
index: "target_cube_2_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -11.000, -33.000] // mm
}


// -------- GEO[target_cube_2_3_2]
{
name: "GEO",
index: "target_cube_2_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -11.000, -22.000] // mm
}


// -------- GEO[target_cube_2_3_3]
{
name: "GEO",
index: "target_cube_2_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -11.000, -11.000] // mm
}


// -------- GEO[target_cube_2_3_4]
{
name: "GEO",
index: "target_cube_2_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -11.000, 0.0] // mm
}


// -------- GEO[target_cube_2_3_5]
{
name: "GEO",
index: "target_cube_2_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -11.000, 11.000] // mm
}


// -------- GEO[target_cube_2_3_6]
{
name: "GEO",
index: "target_cube_2_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -11.000, 22.000] // mm
}


// -------- GEO[target_cube_2_3_7]
{
name: "GEO",
index: "target_cube_2_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -11.000, 33.000] // mm
}


// -------- GEO[target_cube_2_3_8]
{
name: "GEO",
index: "target_cube_2_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, -11.000, 44.000] // mm
}


// -------- GEO[target_cube_2_4_0]
{
name: "GEO",
index: "target_cube_2_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_2_4_1]
{
name: "GEO",
index: "target_cube_2_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 0.0, -33.000] // mm
}


// -------- GEO[target_cube_2_4_2]
{
name: "GEO",
index: "target_cube_2_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_2_4_3]
{
name: "GEO",
index: "target_cube_2_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 0.0, -11.000] // mm
}


// -------- GEO[target_cube_2_4_4]
{
name: "GEO",
index: "target_cube_2_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_2_4_5]
{
name: "GEO",
index: "target_cube_2_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 0.0, 11.000] // mm
}


// -------- GEO[target_cube_2_4_6]
{
name: "GEO",
index: "target_cube_2_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_2_4_7]
{
name: "GEO",
index: "target_cube_2_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 0.0, 33.000] // mm
}


// -------- GEO[target_cube_2_4_8]
{
name: "GEO",
index: "target_cube_2_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_2_5_0]
{
name: "GEO",
index: "target_cube_2_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 11.000, -44.000] // mm
}


// -------- GEO[target_cube_2_5_1]
{
name: "GEO",
index: "target_cube_2_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 11.000, -33.000] // mm
}


// -------- GEO[target_cube_2_5_2]
{
name: "GEO",
index: "target_cube_2_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 11.000, -22.000] // mm
}


// -------- GEO[target_cube_2_5_3]
{
name: "GEO",
index: "target_cube_2_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 11.000, -11.000] // mm
}


// -------- GEO[target_cube_2_5_4]
{
name: "GEO",
index: "target_cube_2_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 11.000, 0.0] // mm
}


// -------- GEO[target_cube_2_5_5]
{
name: "GEO",
index: "target_cube_2_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 11.000, 11.000] // mm
}


// -------- GEO[target_cube_2_5_6]
{
name: "GEO",
index: "target_cube_2_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 11.000, 22.000] // mm
}


// -------- GEO[target_cube_2_5_7]
{
name: "GEO",
index: "target_cube_2_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 11.000, 33.000] // mm
}


// -------- GEO[target_cube_2_5_8]
{
name: "GEO",
index: "target_cube_2_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 11.000, 44.000] // mm
}


// -------- GEO[target_cube_2_6_0]
{
name: "GEO",
index: "target_cube_2_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_2_6_1]
{
name: "GEO",
index: "target_cube_2_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 22.000, -33.000] // mm
}


// -------- GEO[target_cube_2_6_2]
{
name: "GEO",
index: "target_cube_2_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_2_6_3]
{
name: "GEO",
index: "target_cube_2_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 22.000, -11.000] // mm
}


// -------- GEO[target_cube_2_6_4]
{
name: "GEO",
index: "target_cube_2_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_2_6_5]
{
name: "GEO",
index: "target_cube_2_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 22.000, 11.000] // mm
}


// -------- GEO[target_cube_2_6_6]
{
name: "GEO",
index: "target_cube_2_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_2_6_7]
{
name: "GEO",
index: "target_cube_2_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 22.000, 33.000] // mm
}


// -------- GEO[target_cube_2_6_8]
{
name: "GEO",
index: "target_cube_2_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_2_7_0]
{
name: "GEO",
index: "target_cube_2_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 33.000, -44.000] // mm
}


// -------- GEO[target_cube_2_7_1]
{
name: "GEO",
index: "target_cube_2_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 33.000, -33.000] // mm
}


// -------- GEO[target_cube_2_7_2]
{
name: "GEO",
index: "target_cube_2_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 33.000, -22.000] // mm
}


// -------- GEO[target_cube_2_7_3]
{
name: "GEO",
index: "target_cube_2_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 33.000, -11.000] // mm
}


// -------- GEO[target_cube_2_7_4]
{
name: "GEO",
index: "target_cube_2_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cube_2_7_5]
{
name: "GEO",
index: "target_cube_2_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 33.000, 11.000] // mm
}


// -------- GEO[target_cube_2_7_6]
{
name: "GEO",
index: "target_cube_2_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 33.000, 22.000] // mm
}


// -------- GEO[target_cube_2_7_7]
{
name: "GEO",
index: "target_cube_2_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 33.000, 33.000] // mm
}


// -------- GEO[target_cube_2_7_8]
{
name: "GEO",
index: "target_cube_2_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 33.000, 44.000] // mm
}


// -------- GEO[target_cube_2_8_0]
{
name: "GEO",
index: "target_cube_2_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_2_8_1]
{
name: "GEO",
index: "target_cube_2_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 44.000, -33.000] // mm
}


// -------- GEO[target_cube_2_8_2]
{
name: "GEO",
index: "target_cube_2_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_2_8_3]
{
name: "GEO",
index: "target_cube_2_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 44.000, -11.000] // mm
}


// -------- GEO[target_cube_2_8_4]
{
name: "GEO",
index: "target_cube_2_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_2_8_5]
{
name: "GEO",
index: "target_cube_2_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 44.000, 11.000] // mm
}


// -------- GEO[target_cube_2_8_6]
{
name: "GEO",
index: "target_cube_2_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_2_8_7]
{
name: "GEO",
index: "target_cube_2_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-22.000, 44.000, 33.000] // mm
}


// -------- GEO[target_cube_2_8_8]
{
name: "GEO",
index: "target_cube_2_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [-22.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_3_0_0]
{
name: "GEO",
index: "target_cube_3_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_3_0_1]
{
name: "GEO",
index: "target_cube_3_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -44.000, -33.000] // mm
}


// -------- GEO[target_cube_3_0_2]
{
name: "GEO",
index: "target_cube_3_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_3_0_3]
{
name: "GEO",
index: "target_cube_3_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -44.000, -11.000] // mm
}


// -------- GEO[target_cube_3_0_4]
{
name: "GEO",
index: "target_cube_3_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_3_0_5]
{
name: "GEO",
index: "target_cube_3_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -44.000, 11.000] // mm
}


// -------- GEO[target_cube_3_0_6]
{
name: "GEO",
index: "target_cube_3_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_3_0_7]
{
name: "GEO",
index: "target_cube_3_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -44.000, 33.000] // mm
}


// -------- GEO[target_cube_3_0_8]
{
name: "GEO",
index: "target_cube_3_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_3_1_0]
{
name: "GEO",
index: "target_cube_3_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -33.000, -44.000] // mm
}


// -------- GEO[target_cube_3_1_1]
{
name: "GEO",
index: "target_cube_3_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -33.000, -33.000] // mm
}


// -------- GEO[target_cube_3_1_2]
{
name: "GEO",
index: "target_cube_3_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -33.000, -22.000] // mm
}


// -------- GEO[target_cube_3_1_3]
{
name: "GEO",
index: "target_cube_3_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -33.000, -11.000] // mm
}


// -------- GEO[target_cube_3_1_4]
{
name: "GEO",
index: "target_cube_3_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cube_3_1_5]
{
name: "GEO",
index: "target_cube_3_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -33.000, 11.000] // mm
}


// -------- GEO[target_cube_3_1_6]
{
name: "GEO",
index: "target_cube_3_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -33.000, 22.000] // mm
}


// -------- GEO[target_cube_3_1_7]
{
name: "GEO",
index: "target_cube_3_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -33.000, 33.000] // mm
}


// -------- GEO[target_cube_3_1_8]
{
name: "GEO",
index: "target_cube_3_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -33.000, 44.000] // mm
}


// -------- GEO[target_cube_3_2_0]
{
name: "GEO",
index: "target_cube_3_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_3_2_1]
{
name: "GEO",
index: "target_cube_3_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -22.000, -33.000] // mm
}


// -------- GEO[target_cube_3_2_2]
{
name: "GEO",
index: "target_cube_3_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_3_2_3]
{
name: "GEO",
index: "target_cube_3_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -22.000, -11.000] // mm
}


// -------- GEO[target_cube_3_2_4]
{
name: "GEO",
index: "target_cube_3_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_3_2_5]
{
name: "GEO",
index: "target_cube_3_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -22.000, 11.000] // mm
}


// -------- GEO[target_cube_3_2_6]
{
name: "GEO",
index: "target_cube_3_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_3_2_7]
{
name: "GEO",
index: "target_cube_3_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -22.000, 33.000] // mm
}


// -------- GEO[target_cube_3_2_8]
{
name: "GEO",
index: "target_cube_3_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_3_3_0]
{
name: "GEO",
index: "target_cube_3_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -11.000, -44.000] // mm
}


// -------- GEO[target_cube_3_3_1]
{
name: "GEO",
index: "target_cube_3_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -11.000, -33.000] // mm
}


// -------- GEO[target_cube_3_3_2]
{
name: "GEO",
index: "target_cube_3_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -11.000, -22.000] // mm
}


// -------- GEO[target_cube_3_3_3]
{
name: "GEO",
index: "target_cube_3_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -11.000, -11.000] // mm
}


// -------- GEO[target_cube_3_3_4]
{
name: "GEO",
index: "target_cube_3_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -11.000, 0.0] // mm
}


// -------- GEO[target_cube_3_3_5]
{
name: "GEO",
index: "target_cube_3_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -11.000, 11.000] // mm
}


// -------- GEO[target_cube_3_3_6]
{
name: "GEO",
index: "target_cube_3_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -11.000, 22.000] // mm
}


// -------- GEO[target_cube_3_3_7]
{
name: "GEO",
index: "target_cube_3_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -11.000, 33.000] // mm
}


// -------- GEO[target_cube_3_3_8]
{
name: "GEO",
index: "target_cube_3_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, -11.000, 44.000] // mm
}


// -------- GEO[target_cube_3_4_0]
{
name: "GEO",
index: "target_cube_3_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_3_4_1]
{
name: "GEO",
index: "target_cube_3_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 0.0, -33.000] // mm
}


// -------- GEO[target_cube_3_4_2]
{
name: "GEO",
index: "target_cube_3_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_3_4_3]
{
name: "GEO",
index: "target_cube_3_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 0.0, -11.000] // mm
}


// -------- GEO[target_cube_3_4_4]
{
name: "GEO",
index: "target_cube_3_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_3_4_5]
{
name: "GEO",
index: "target_cube_3_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 0.0, 11.000] // mm
}


// -------- GEO[target_cube_3_4_6]
{
name: "GEO",
index: "target_cube_3_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_3_4_7]
{
name: "GEO",
index: "target_cube_3_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 0.0, 33.000] // mm
}


// -------- GEO[target_cube_3_4_8]
{
name: "GEO",
index: "target_cube_3_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_3_5_0]
{
name: "GEO",
index: "target_cube_3_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 11.000, -44.000] // mm
}


// -------- GEO[target_cube_3_5_1]
{
name: "GEO",
index: "target_cube_3_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 11.000, -33.000] // mm
}


// -------- GEO[target_cube_3_5_2]
{
name: "GEO",
index: "target_cube_3_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 11.000, -22.000] // mm
}


// -------- GEO[target_cube_3_5_3]
{
name: "GEO",
index: "target_cube_3_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 11.000, -11.000] // mm
}


// -------- GEO[target_cube_3_5_4]
{
name: "GEO",
index: "target_cube_3_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 11.000, 0.0] // mm
}


// -------- GEO[target_cube_3_5_5]
{
name: "GEO",
index: "target_cube_3_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 11.000, 11.000] // mm
}


// -------- GEO[target_cube_3_5_6]
{
name: "GEO",
index: "target_cube_3_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 11.000, 22.000] // mm
}


// -------- GEO[target_cube_3_5_7]
{
name: "GEO",
index: "target_cube_3_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 11.000, 33.000] // mm
}


// -------- GEO[target_cube_3_5_8]
{
name: "GEO",
index: "target_cube_3_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 11.000, 44.000] // mm
}


// -------- GEO[target_cube_3_6_0]
{
name: "GEO",
index: "target_cube_3_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_3_6_1]
{
name: "GEO",
index: "target_cube_3_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 22.000, -33.000] // mm
}


// -------- GEO[target_cube_3_6_2]
{
name: "GEO",
index: "target_cube_3_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_3_6_3]
{
name: "GEO",
index: "target_cube_3_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 22.000, -11.000] // mm
}


// -------- GEO[target_cube_3_6_4]
{
name: "GEO",
index: "target_cube_3_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_3_6_5]
{
name: "GEO",
index: "target_cube_3_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 22.000, 11.000] // mm
}


// -------- GEO[target_cube_3_6_6]
{
name: "GEO",
index: "target_cube_3_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_3_6_7]
{
name: "GEO",
index: "target_cube_3_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 22.000, 33.000] // mm
}


// -------- GEO[target_cube_3_6_8]
{
name: "GEO",
index: "target_cube_3_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_3_7_0]
{
name: "GEO",
index: "target_cube_3_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 33.000, -44.000] // mm
}


// -------- GEO[target_cube_3_7_1]
{
name: "GEO",
index: "target_cube_3_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 33.000, -33.000] // mm
}


// -------- GEO[target_cube_3_7_2]
{
name: "GEO",
index: "target_cube_3_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 33.000, -22.000] // mm
}


// -------- GEO[target_cube_3_7_3]
{
name: "GEO",
index: "target_cube_3_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 33.000, -11.000] // mm
}


// -------- GEO[target_cube_3_7_4]
{
name: "GEO",
index: "target_cube_3_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cube_3_7_5]
{
name: "GEO",
index: "target_cube_3_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 33.000, 11.000] // mm
}


// -------- GEO[target_cube_3_7_6]
{
name: "GEO",
index: "target_cube_3_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 33.000, 22.000] // mm
}


// -------- GEO[target_cube_3_7_7]
{
name: "GEO",
index: "target_cube_3_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 33.000, 33.000] // mm
}


// -------- GEO[target_cube_3_7_8]
{
name: "GEO",
index: "target_cube_3_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 33.000, 44.000] // mm
}


// -------- GEO[target_cube_3_8_0]
{
name: "GEO",
index: "target_cube_3_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_3_8_1]
{
name: "GEO",
index: "target_cube_3_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 44.000, -33.000] // mm
}


// -------- GEO[target_cube_3_8_2]
{
name: "GEO",
index: "target_cube_3_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_3_8_3]
{
name: "GEO",
index: "target_cube_3_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 44.000, -11.000] // mm
}


// -------- GEO[target_cube_3_8_4]
{
name: "GEO",
index: "target_cube_3_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_3_8_5]
{
name: "GEO",
index: "target_cube_3_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 44.000, 11.000] // mm
}


// -------- GEO[target_cube_3_8_6]
{
name: "GEO",
index: "target_cube_3_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_3_8_7]
{
name: "GEO",
index: "target_cube_3_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 44.000, 33.000] // mm
}


// -------- GEO[target_cube_3_8_8]
{
name: "GEO",
index: "target_cube_3_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [-11.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_4_0_0]
{
name: "GEO",
index: "target_cube_4_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_4_0_1]
{
name: "GEO",
index: "target_cube_4_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -44.000, -33.000] // mm
}


// -------- GEO[target_cube_4_0_2]
{
name: "GEO",
index: "target_cube_4_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_4_0_3]
{
name: "GEO",
index: "target_cube_4_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -44.000, -11.000] // mm
}


// -------- GEO[target_cube_4_0_4]
{
name: "GEO",
index: "target_cube_4_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_4_0_5]
{
name: "GEO",
index: "target_cube_4_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -44.000, 11.000] // mm
}


// -------- GEO[target_cube_4_0_6]
{
name: "GEO",
index: "target_cube_4_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_4_0_7]
{
name: "GEO",
index: "target_cube_4_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -44.000, 33.000] // mm
}


// -------- GEO[target_cube_4_0_8]
{
name: "GEO",
index: "target_cube_4_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_4_1_0]
{
name: "GEO",
index: "target_cube_4_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -33.000, -44.000] // mm
}


// -------- GEO[target_cube_4_1_1]
{
name: "GEO",
index: "target_cube_4_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -33.000, -33.000] // mm
}


// -------- GEO[target_cube_4_1_2]
{
name: "GEO",
index: "target_cube_4_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -33.000, -22.000] // mm
}


// -------- GEO[target_cube_4_1_3]
{
name: "GEO",
index: "target_cube_4_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -33.000, -11.000] // mm
}


// -------- GEO[target_cube_4_1_4]
{
name: "GEO",
index: "target_cube_4_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -33.000, 0.0] // mm
}


// -------- GEO[target_cube_4_1_5]
{
name: "GEO",
index: "target_cube_4_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -33.000, 11.000] // mm
}


// -------- GEO[target_cube_4_1_6]
{
name: "GEO",
index: "target_cube_4_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -33.000, 22.000] // mm
}


// -------- GEO[target_cube_4_1_7]
{
name: "GEO",
index: "target_cube_4_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -33.000, 33.000] // mm
}


// -------- GEO[target_cube_4_1_8]
{
name: "GEO",
index: "target_cube_4_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -33.000, 44.000] // mm
}


// -------- GEO[target_cube_4_2_0]
{
name: "GEO",
index: "target_cube_4_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_4_2_1]
{
name: "GEO",
index: "target_cube_4_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -22.000, -33.000] // mm
}


// -------- GEO[target_cube_4_2_2]
{
name: "GEO",
index: "target_cube_4_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_4_2_3]
{
name: "GEO",
index: "target_cube_4_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -22.000, -11.000] // mm
}


// -------- GEO[target_cube_4_2_4]
{
name: "GEO",
index: "target_cube_4_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_4_2_5]
{
name: "GEO",
index: "target_cube_4_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -22.000, 11.000] // mm
}


// -------- GEO[target_cube_4_2_6]
{
name: "GEO",
index: "target_cube_4_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_4_2_7]
{
name: "GEO",
index: "target_cube_4_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -22.000, 33.000] // mm
}


// -------- GEO[target_cube_4_2_8]
{
name: "GEO",
index: "target_cube_4_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_4_3_0]
{
name: "GEO",
index: "target_cube_4_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -11.000, -44.000] // mm
}


// -------- GEO[target_cube_4_3_1]
{
name: "GEO",
index: "target_cube_4_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -11.000, -33.000] // mm
}


// -------- GEO[target_cube_4_3_2]
{
name: "GEO",
index: "target_cube_4_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -11.000, -22.000] // mm
}


// -------- GEO[target_cube_4_3_3]
{
name: "GEO",
index: "target_cube_4_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -11.000, -11.000] // mm
}


// -------- GEO[target_cube_4_3_4]
{
name: "GEO",
index: "target_cube_4_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -11.000, 0.0] // mm
}


// -------- GEO[target_cube_4_3_5]
{
name: "GEO",
index: "target_cube_4_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -11.000, 11.000] // mm
}


// -------- GEO[target_cube_4_3_6]
{
name: "GEO",
index: "target_cube_4_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -11.000, 22.000] // mm
}


// -------- GEO[target_cube_4_3_7]
{
name: "GEO",
index: "target_cube_4_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -11.000, 33.000] // mm
}


// -------- GEO[target_cube_4_3_8]
{
name: "GEO",
index: "target_cube_4_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, -11.000, 44.000] // mm
}


// -------- GEO[target_cube_4_4_0]
{
name: "GEO",
index: "target_cube_4_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_4_4_1]
{
name: "GEO",
index: "target_cube_4_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 0.0, -33.000] // mm
}


// -------- GEO[target_cube_4_4_2]
{
name: "GEO",
index: "target_cube_4_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_4_4_3]
{
name: "GEO",
index: "target_cube_4_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 0.0, -11.000] // mm
}


// -------- GEO[target_cube_4_4_4]
{
name: "GEO",
index: "target_cube_4_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_4_4_5]
{
name: "GEO",
index: "target_cube_4_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 0.0, 11.000] // mm
}


// -------- GEO[target_cube_4_4_6]
{
name: "GEO",
index: "target_cube_4_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_4_4_7]
{
name: "GEO",
index: "target_cube_4_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 0.0, 33.000] // mm
}


// -------- GEO[target_cube_4_4_8]
{
name: "GEO",
index: "target_cube_4_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_4_5_0]
{
name: "GEO",
index: "target_cube_4_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 11.000, -44.000] // mm
}


// -------- GEO[target_cube_4_5_1]
{
name: "GEO",
index: "target_cube_4_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 11.000, -33.000] // mm
}


// -------- GEO[target_cube_4_5_2]
{
name: "GEO",
index: "target_cube_4_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 11.000, -22.000] // mm
}


// -------- GEO[target_cube_4_5_3]
{
name: "GEO",
index: "target_cube_4_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 11.000, -11.000] // mm
}


// -------- GEO[target_cube_4_5_4]
{
name: "GEO",
index: "target_cube_4_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 11.000, 0.0] // mm
}


// -------- GEO[target_cube_4_5_5]
{
name: "GEO",
index: "target_cube_4_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 11.000, 11.000] // mm
}


// -------- GEO[target_cube_4_5_6]
{
name: "GEO",
index: "target_cube_4_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 11.000, 22.000] // mm
}


// -------- GEO[target_cube_4_5_7]
{
name: "GEO",
index: "target_cube_4_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 11.000, 33.000] // mm
}


// -------- GEO[target_cube_4_5_8]
{
name: "GEO",
index: "target_cube_4_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 11.000, 44.000] // mm
}


// -------- GEO[target_cube_4_6_0]
{
name: "GEO",
index: "target_cube_4_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_4_6_1]
{
name: "GEO",
index: "target_cube_4_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 22.000, -33.000] // mm
}


// -------- GEO[target_cube_4_6_2]
{
name: "GEO",
index: "target_cube_4_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_4_6_3]
{
name: "GEO",
index: "target_cube_4_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 22.000, -11.000] // mm
}


// -------- GEO[target_cube_4_6_4]
{
name: "GEO",
index: "target_cube_4_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_4_6_5]
{
name: "GEO",
index: "target_cube_4_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 22.000, 11.000] // mm
}


// -------- GEO[target_cube_4_6_6]
{
name: "GEO",
index: "target_cube_4_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_4_6_7]
{
name: "GEO",
index: "target_cube_4_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 22.000, 33.000] // mm
}


// -------- GEO[target_cube_4_6_8]
{
name: "GEO",
index: "target_cube_4_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_4_7_0]
{
name: "GEO",
index: "target_cube_4_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 33.000, -44.000] // mm
}


// -------- GEO[target_cube_4_7_1]
{
name: "GEO",
index: "target_cube_4_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 33.000, -33.000] // mm
}


// -------- GEO[target_cube_4_7_2]
{
name: "GEO",
index: "target_cube_4_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 33.000, -22.000] // mm
}


// -------- GEO[target_cube_4_7_3]
{
name: "GEO",
index: "target_cube_4_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 33.000, -11.000] // mm
}


// -------- GEO[target_cube_4_7_4]
{
name: "GEO",
index: "target_cube_4_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 33.000, 0.0] // mm
}


// -------- GEO[target_cube_4_7_5]
{
name: "GEO",
index: "target_cube_4_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 33.000, 11.000] // mm
}


// -------- GEO[target_cube_4_7_6]
{
name: "GEO",
index: "target_cube_4_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 33.000, 22.000] // mm
}


// -------- GEO[target_cube_4_7_7]
{
name: "GEO",
index: "target_cube_4_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 33.000, 33.000] // mm
}


// -------- GEO[target_cube_4_7_8]
{
name: "GEO",
index: "target_cube_4_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 33.000, 44.000] // mm
}


// -------- GEO[target_cube_4_8_0]
{
name: "GEO",
index: "target_cube_4_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_4_8_1]
{
name: "GEO",
index: "target_cube_4_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 44.000, -33.000] // mm
}


// -------- GEO[target_cube_4_8_2]
{
name: "GEO",
index: "target_cube_4_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_4_8_3]
{
name: "GEO",
index: "target_cube_4_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 44.000, -11.000] // mm
}


// -------- GEO[target_cube_4_8_4]
{
name: "GEO",
index: "target_cube_4_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_4_8_5]
{
name: "GEO",
index: "target_cube_4_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 44.000, 11.000] // mm
}


// -------- GEO[target_cube_4_8_6]
{
name: "GEO",
index: "target_cube_4_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_4_8_7]
{
name: "GEO",
index: "target_cube_4_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [0.0, 44.000, 33.000] // mm
}


// -------- GEO[target_cube_4_8_8]
{
name: "GEO",
index: "target_cube_4_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [0.0, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_5_0_0]
{
name: "GEO",
index: "target_cube_5_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_5_0_1]
{
name: "GEO",
index: "target_cube_5_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -44.000, -33.000] // mm
}


// -------- GEO[target_cube_5_0_2]
{
name: "GEO",
index: "target_cube_5_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_5_0_3]
{
name: "GEO",
index: "target_cube_5_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -44.000, -11.000] // mm
}


// -------- GEO[target_cube_5_0_4]
{
name: "GEO",
index: "target_cube_5_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_5_0_5]
{
name: "GEO",
index: "target_cube_5_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -44.000, 11.000] // mm
}


// -------- GEO[target_cube_5_0_6]
{
name: "GEO",
index: "target_cube_5_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_5_0_7]
{
name: "GEO",
index: "target_cube_5_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -44.000, 33.000] // mm
}


// -------- GEO[target_cube_5_0_8]
{
name: "GEO",
index: "target_cube_5_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_5_1_0]
{
name: "GEO",
index: "target_cube_5_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -33.000, -44.000] // mm
}


// -------- GEO[target_cube_5_1_1]
{
name: "GEO",
index: "target_cube_5_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -33.000, -33.000] // mm
}


// -------- GEO[target_cube_5_1_2]
{
name: "GEO",
index: "target_cube_5_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -33.000, -22.000] // mm
}


// -------- GEO[target_cube_5_1_3]
{
name: "GEO",
index: "target_cube_5_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -33.000, -11.000] // mm
}


// -------- GEO[target_cube_5_1_4]
{
name: "GEO",
index: "target_cube_5_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cube_5_1_5]
{
name: "GEO",
index: "target_cube_5_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -33.000, 11.000] // mm
}


// -------- GEO[target_cube_5_1_6]
{
name: "GEO",
index: "target_cube_5_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -33.000, 22.000] // mm
}


// -------- GEO[target_cube_5_1_7]
{
name: "GEO",
index: "target_cube_5_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -33.000, 33.000] // mm
}


// -------- GEO[target_cube_5_1_8]
{
name: "GEO",
index: "target_cube_5_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -33.000, 44.000] // mm
}


// -------- GEO[target_cube_5_2_0]
{
name: "GEO",
index: "target_cube_5_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_5_2_1]
{
name: "GEO",
index: "target_cube_5_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -22.000, -33.000] // mm
}


// -------- GEO[target_cube_5_2_2]
{
name: "GEO",
index: "target_cube_5_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_5_2_3]
{
name: "GEO",
index: "target_cube_5_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -22.000, -11.000] // mm
}


// -------- GEO[target_cube_5_2_4]
{
name: "GEO",
index: "target_cube_5_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_5_2_5]
{
name: "GEO",
index: "target_cube_5_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -22.000, 11.000] // mm
}


// -------- GEO[target_cube_5_2_6]
{
name: "GEO",
index: "target_cube_5_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_5_2_7]
{
name: "GEO",
index: "target_cube_5_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -22.000, 33.000] // mm
}


// -------- GEO[target_cube_5_2_8]
{
name: "GEO",
index: "target_cube_5_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_5_3_0]
{
name: "GEO",
index: "target_cube_5_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -11.000, -44.000] // mm
}


// -------- GEO[target_cube_5_3_1]
{
name: "GEO",
index: "target_cube_5_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -11.000, -33.000] // mm
}


// -------- GEO[target_cube_5_3_2]
{
name: "GEO",
index: "target_cube_5_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -11.000, -22.000] // mm
}


// -------- GEO[target_cube_5_3_3]
{
name: "GEO",
index: "target_cube_5_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -11.000, -11.000] // mm
}


// -------- GEO[target_cube_5_3_4]
{
name: "GEO",
index: "target_cube_5_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -11.000, 0.0] // mm
}


// -------- GEO[target_cube_5_3_5]
{
name: "GEO",
index: "target_cube_5_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -11.000, 11.000] // mm
}


// -------- GEO[target_cube_5_3_6]
{
name: "GEO",
index: "target_cube_5_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -11.000, 22.000] // mm
}


// -------- GEO[target_cube_5_3_7]
{
name: "GEO",
index: "target_cube_5_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -11.000, 33.000] // mm
}


// -------- GEO[target_cube_5_3_8]
{
name: "GEO",
index: "target_cube_5_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, -11.000, 44.000] // mm
}


// -------- GEO[target_cube_5_4_0]
{
name: "GEO",
index: "target_cube_5_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_5_4_1]
{
name: "GEO",
index: "target_cube_5_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 0.0, -33.000] // mm
}


// -------- GEO[target_cube_5_4_2]
{
name: "GEO",
index: "target_cube_5_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_5_4_3]
{
name: "GEO",
index: "target_cube_5_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 0.0, -11.000] // mm
}


// -------- GEO[target_cube_5_4_4]
{
name: "GEO",
index: "target_cube_5_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_5_4_5]
{
name: "GEO",
index: "target_cube_5_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 0.0, 11.000] // mm
}


// -------- GEO[target_cube_5_4_6]
{
name: "GEO",
index: "target_cube_5_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_5_4_7]
{
name: "GEO",
index: "target_cube_5_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 0.0, 33.000] // mm
}


// -------- GEO[target_cube_5_4_8]
{
name: "GEO",
index: "target_cube_5_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_5_5_0]
{
name: "GEO",
index: "target_cube_5_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 11.000, -44.000] // mm
}


// -------- GEO[target_cube_5_5_1]
{
name: "GEO",
index: "target_cube_5_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 11.000, -33.000] // mm
}


// -------- GEO[target_cube_5_5_2]
{
name: "GEO",
index: "target_cube_5_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 11.000, -22.000] // mm
}


// -------- GEO[target_cube_5_5_3]
{
name: "GEO",
index: "target_cube_5_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 11.000, -11.000] // mm
}


// -------- GEO[target_cube_5_5_4]
{
name: "GEO",
index: "target_cube_5_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 11.000, 0.0] // mm
}


// -------- GEO[target_cube_5_5_5]
{
name: "GEO",
index: "target_cube_5_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 11.000, 11.000] // mm
}


// -------- GEO[target_cube_5_5_6]
{
name: "GEO",
index: "target_cube_5_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 11.000, 22.000] // mm
}


// -------- GEO[target_cube_5_5_7]
{
name: "GEO",
index: "target_cube_5_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 11.000, 33.000] // mm
}


// -------- GEO[target_cube_5_5_8]
{
name: "GEO",
index: "target_cube_5_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 11.000, 44.000] // mm
}


// -------- GEO[target_cube_5_6_0]
{
name: "GEO",
index: "target_cube_5_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_5_6_1]
{
name: "GEO",
index: "target_cube_5_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 22.000, -33.000] // mm
}


// -------- GEO[target_cube_5_6_2]
{
name: "GEO",
index: "target_cube_5_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_5_6_3]
{
name: "GEO",
index: "target_cube_5_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 22.000, -11.000] // mm
}


// -------- GEO[target_cube_5_6_4]
{
name: "GEO",
index: "target_cube_5_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_5_6_5]
{
name: "GEO",
index: "target_cube_5_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 22.000, 11.000] // mm
}


// -------- GEO[target_cube_5_6_6]
{
name: "GEO",
index: "target_cube_5_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_5_6_7]
{
name: "GEO",
index: "target_cube_5_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 22.000, 33.000] // mm
}


// -------- GEO[target_cube_5_6_8]
{
name: "GEO",
index: "target_cube_5_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_5_7_0]
{
name: "GEO",
index: "target_cube_5_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 33.000, -44.000] // mm
}


// -------- GEO[target_cube_5_7_1]
{
name: "GEO",
index: "target_cube_5_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 33.000, -33.000] // mm
}


// -------- GEO[target_cube_5_7_2]
{
name: "GEO",
index: "target_cube_5_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 33.000, -22.000] // mm
}


// -------- GEO[target_cube_5_7_3]
{
name: "GEO",
index: "target_cube_5_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 33.000, -11.000] // mm
}


// -------- GEO[target_cube_5_7_4]
{
name: "GEO",
index: "target_cube_5_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cube_5_7_5]
{
name: "GEO",
index: "target_cube_5_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 33.000, 11.000] // mm
}


// -------- GEO[target_cube_5_7_6]
{
name: "GEO",
index: "target_cube_5_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 33.000, 22.000] // mm
}


// -------- GEO[target_cube_5_7_7]
{
name: "GEO",
index: "target_cube_5_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 33.000, 33.000] // mm
}


// -------- GEO[target_cube_5_7_8]
{
name: "GEO",
index: "target_cube_5_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 33.000, 44.000] // mm
}


// -------- GEO[target_cube_5_8_0]
{
name: "GEO",
index: "target_cube_5_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_5_8_1]
{
name: "GEO",
index: "target_cube_5_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 44.000, -33.000] // mm
}


// -------- GEO[target_cube_5_8_2]
{
name: "GEO",
index: "target_cube_5_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_5_8_3]
{
name: "GEO",
index: "target_cube_5_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 44.000, -11.000] // mm
}


// -------- GEO[target_cube_5_8_4]
{
name: "GEO",
index: "target_cube_5_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_5_8_5]
{
name: "GEO",
index: "target_cube_5_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 44.000, 11.000] // mm
}


// -------- GEO[target_cube_5_8_6]
{
name: "GEO",
index: "target_cube_5_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_5_8_7]
{
name: "GEO",
index: "target_cube_5_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 44.000, 33.000] // mm
}


// -------- GEO[target_cube_5_8_8]
{
name: "GEO",
index: "target_cube_5_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [11.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_6_0_0]
{
name: "GEO",
index: "target_cube_6_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_6_0_1]
{
name: "GEO",
index: "target_cube_6_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -44.000, -33.000] // mm
}


// -------- GEO[target_cube_6_0_2]
{
name: "GEO",
index: "target_cube_6_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_6_0_3]
{
name: "GEO",
index: "target_cube_6_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -44.000, -11.000] // mm
}


// -------- GEO[target_cube_6_0_4]
{
name: "GEO",
index: "target_cube_6_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_6_0_5]
{
name: "GEO",
index: "target_cube_6_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -44.000, 11.000] // mm
}


// -------- GEO[target_cube_6_0_6]
{
name: "GEO",
index: "target_cube_6_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_6_0_7]
{
name: "GEO",
index: "target_cube_6_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -44.000, 33.000] // mm
}


// -------- GEO[target_cube_6_0_8]
{
name: "GEO",
index: "target_cube_6_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_6_1_0]
{
name: "GEO",
index: "target_cube_6_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -33.000, -44.000] // mm
}


// -------- GEO[target_cube_6_1_1]
{
name: "GEO",
index: "target_cube_6_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -33.000, -33.000] // mm
}


// -------- GEO[target_cube_6_1_2]
{
name: "GEO",
index: "target_cube_6_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -33.000, -22.000] // mm
}


// -------- GEO[target_cube_6_1_3]
{
name: "GEO",
index: "target_cube_6_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -33.000, -11.000] // mm
}


// -------- GEO[target_cube_6_1_4]
{
name: "GEO",
index: "target_cube_6_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cube_6_1_5]
{
name: "GEO",
index: "target_cube_6_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -33.000, 11.000] // mm
}


// -------- GEO[target_cube_6_1_6]
{
name: "GEO",
index: "target_cube_6_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -33.000, 22.000] // mm
}


// -------- GEO[target_cube_6_1_7]
{
name: "GEO",
index: "target_cube_6_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -33.000, 33.000] // mm
}


// -------- GEO[target_cube_6_1_8]
{
name: "GEO",
index: "target_cube_6_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -33.000, 44.000] // mm
}


// -------- GEO[target_cube_6_2_0]
{
name: "GEO",
index: "target_cube_6_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_6_2_1]
{
name: "GEO",
index: "target_cube_6_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -22.000, -33.000] // mm
}


// -------- GEO[target_cube_6_2_2]
{
name: "GEO",
index: "target_cube_6_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_6_2_3]
{
name: "GEO",
index: "target_cube_6_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -22.000, -11.000] // mm
}


// -------- GEO[target_cube_6_2_4]
{
name: "GEO",
index: "target_cube_6_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_6_2_5]
{
name: "GEO",
index: "target_cube_6_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -22.000, 11.000] // mm
}


// -------- GEO[target_cube_6_2_6]
{
name: "GEO",
index: "target_cube_6_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_6_2_7]
{
name: "GEO",
index: "target_cube_6_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -22.000, 33.000] // mm
}


// -------- GEO[target_cube_6_2_8]
{
name: "GEO",
index: "target_cube_6_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_6_3_0]
{
name: "GEO",
index: "target_cube_6_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -11.000, -44.000] // mm
}


// -------- GEO[target_cube_6_3_1]
{
name: "GEO",
index: "target_cube_6_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -11.000, -33.000] // mm
}


// -------- GEO[target_cube_6_3_2]
{
name: "GEO",
index: "target_cube_6_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -11.000, -22.000] // mm
}


// -------- GEO[target_cube_6_3_3]
{
name: "GEO",
index: "target_cube_6_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -11.000, -11.000] // mm
}


// -------- GEO[target_cube_6_3_4]
{
name: "GEO",
index: "target_cube_6_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -11.000, 0.0] // mm
}


// -------- GEO[target_cube_6_3_5]
{
name: "GEO",
index: "target_cube_6_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -11.000, 11.000] // mm
}


// -------- GEO[target_cube_6_3_6]
{
name: "GEO",
index: "target_cube_6_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -11.000, 22.000] // mm
}


// -------- GEO[target_cube_6_3_7]
{
name: "GEO",
index: "target_cube_6_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -11.000, 33.000] // mm
}


// -------- GEO[target_cube_6_3_8]
{
name: "GEO",
index: "target_cube_6_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, -11.000, 44.000] // mm
}


// -------- GEO[target_cube_6_4_0]
{
name: "GEO",
index: "target_cube_6_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_6_4_1]
{
name: "GEO",
index: "target_cube_6_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 0.0, -33.000] // mm
}


// -------- GEO[target_cube_6_4_2]
{
name: "GEO",
index: "target_cube_6_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_6_4_3]
{
name: "GEO",
index: "target_cube_6_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 0.0, -11.000] // mm
}


// -------- GEO[target_cube_6_4_4]
{
name: "GEO",
index: "target_cube_6_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_6_4_5]
{
name: "GEO",
index: "target_cube_6_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 0.0, 11.000] // mm
}


// -------- GEO[target_cube_6_4_6]
{
name: "GEO",
index: "target_cube_6_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_6_4_7]
{
name: "GEO",
index: "target_cube_6_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 0.0, 33.000] // mm
}


// -------- GEO[target_cube_6_4_8]
{
name: "GEO",
index: "target_cube_6_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_6_5_0]
{
name: "GEO",
index: "target_cube_6_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 11.000, -44.000] // mm
}


// -------- GEO[target_cube_6_5_1]
{
name: "GEO",
index: "target_cube_6_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 11.000, -33.000] // mm
}


// -------- GEO[target_cube_6_5_2]
{
name: "GEO",
index: "target_cube_6_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 11.000, -22.000] // mm
}


// -------- GEO[target_cube_6_5_3]
{
name: "GEO",
index: "target_cube_6_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 11.000, -11.000] // mm
}


// -------- GEO[target_cube_6_5_4]
{
name: "GEO",
index: "target_cube_6_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 11.000, 0.0] // mm
}


// -------- GEO[target_cube_6_5_5]
{
name: "GEO",
index: "target_cube_6_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 11.000, 11.000] // mm
}


// -------- GEO[target_cube_6_5_6]
{
name: "GEO",
index: "target_cube_6_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 11.000, 22.000] // mm
}


// -------- GEO[target_cube_6_5_7]
{
name: "GEO",
index: "target_cube_6_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 11.000, 33.000] // mm
}


// -------- GEO[target_cube_6_5_8]
{
name: "GEO",
index: "target_cube_6_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 11.000, 44.000] // mm
}


// -------- GEO[target_cube_6_6_0]
{
name: "GEO",
index: "target_cube_6_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_6_6_1]
{
name: "GEO",
index: "target_cube_6_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 22.000, -33.000] // mm
}


// -------- GEO[target_cube_6_6_2]
{
name: "GEO",
index: "target_cube_6_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_6_6_3]
{
name: "GEO",
index: "target_cube_6_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 22.000, -11.000] // mm
}


// -------- GEO[target_cube_6_6_4]
{
name: "GEO",
index: "target_cube_6_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_6_6_5]
{
name: "GEO",
index: "target_cube_6_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 22.000, 11.000] // mm
}


// -------- GEO[target_cube_6_6_6]
{
name: "GEO",
index: "target_cube_6_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_6_6_7]
{
name: "GEO",
index: "target_cube_6_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 22.000, 33.000] // mm
}


// -------- GEO[target_cube_6_6_8]
{
name: "GEO",
index: "target_cube_6_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_6_7_0]
{
name: "GEO",
index: "target_cube_6_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 33.000, -44.000] // mm
}


// -------- GEO[target_cube_6_7_1]
{
name: "GEO",
index: "target_cube_6_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 33.000, -33.000] // mm
}


// -------- GEO[target_cube_6_7_2]
{
name: "GEO",
index: "target_cube_6_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 33.000, -22.000] // mm
}


// -------- GEO[target_cube_6_7_3]
{
name: "GEO",
index: "target_cube_6_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 33.000, -11.000] // mm
}


// -------- GEO[target_cube_6_7_4]
{
name: "GEO",
index: "target_cube_6_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cube_6_7_5]
{
name: "GEO",
index: "target_cube_6_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 33.000, 11.000] // mm
}


// -------- GEO[target_cube_6_7_6]
{
name: "GEO",
index: "target_cube_6_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 33.000, 22.000] // mm
}


// -------- GEO[target_cube_6_7_7]
{
name: "GEO",
index: "target_cube_6_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 33.000, 33.000] // mm
}


// -------- GEO[target_cube_6_7_8]
{
name: "GEO",
index: "target_cube_6_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 33.000, 44.000] // mm
}


// -------- GEO[target_cube_6_8_0]
{
name: "GEO",
index: "target_cube_6_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_6_8_1]
{
name: "GEO",
index: "target_cube_6_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 44.000, -33.000] // mm
}


// -------- GEO[target_cube_6_8_2]
{
name: "GEO",
index: "target_cube_6_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_6_8_3]
{
name: "GEO",
index: "target_cube_6_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 44.000, -11.000] // mm
}


// -------- GEO[target_cube_6_8_4]
{
name: "GEO",
index: "target_cube_6_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_6_8_5]
{
name: "GEO",
index: "target_cube_6_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 44.000, 11.000] // mm
}


// -------- GEO[target_cube_6_8_6]
{
name: "GEO",
index: "target_cube_6_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_6_8_7]
{
name: "GEO",
index: "target_cube_6_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [22.000, 44.000, 33.000] // mm
}


// -------- GEO[target_cube_6_8_8]
{
name: "GEO",
index: "target_cube_6_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [22.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_7_0_0]
{
name: "GEO",
index: "target_cube_7_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_7_0_1]
{
name: "GEO",
index: "target_cube_7_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -44.000, -33.000] // mm
}


// -------- GEO[target_cube_7_0_2]
{
name: "GEO",
index: "target_cube_7_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_7_0_3]
{
name: "GEO",
index: "target_cube_7_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -44.000, -11.000] // mm
}


// -------- GEO[target_cube_7_0_4]
{
name: "GEO",
index: "target_cube_7_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_7_0_5]
{
name: "GEO",
index: "target_cube_7_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -44.000, 11.000] // mm
}


// -------- GEO[target_cube_7_0_6]
{
name: "GEO",
index: "target_cube_7_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_7_0_7]
{
name: "GEO",
index: "target_cube_7_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -44.000, 33.000] // mm
}


// -------- GEO[target_cube_7_0_8]
{
name: "GEO",
index: "target_cube_7_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_7_1_0]
{
name: "GEO",
index: "target_cube_7_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, -44.000] // mm
}


// -------- GEO[target_cube_7_1_1]
{
name: "GEO",
index: "target_cube_7_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, -33.000] // mm
}


// -------- GEO[target_cube_7_1_2]
{
name: "GEO",
index: "target_cube_7_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, -22.000] // mm
}


// -------- GEO[target_cube_7_1_3]
{
name: "GEO",
index: "target_cube_7_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, -11.000] // mm
}


// -------- GEO[target_cube_7_1_4]
{
name: "GEO",
index: "target_cube_7_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cube_7_1_5]
{
name: "GEO",
index: "target_cube_7_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, 11.000] // mm
}


// -------- GEO[target_cube_7_1_6]
{
name: "GEO",
index: "target_cube_7_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, 22.000] // mm
}


// -------- GEO[target_cube_7_1_7]
{
name: "GEO",
index: "target_cube_7_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, 33.000] // mm
}


// -------- GEO[target_cube_7_1_8]
{
name: "GEO",
index: "target_cube_7_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, 44.000] // mm
}


// -------- GEO[target_cube_7_2_0]
{
name: "GEO",
index: "target_cube_7_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_7_2_1]
{
name: "GEO",
index: "target_cube_7_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -22.000, -33.000] // mm
}


// -------- GEO[target_cube_7_2_2]
{
name: "GEO",
index: "target_cube_7_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_7_2_3]
{
name: "GEO",
index: "target_cube_7_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -22.000, -11.000] // mm
}


// -------- GEO[target_cube_7_2_4]
{
name: "GEO",
index: "target_cube_7_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_7_2_5]
{
name: "GEO",
index: "target_cube_7_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -22.000, 11.000] // mm
}


// -------- GEO[target_cube_7_2_6]
{
name: "GEO",
index: "target_cube_7_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_7_2_7]
{
name: "GEO",
index: "target_cube_7_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -22.000, 33.000] // mm
}


// -------- GEO[target_cube_7_2_8]
{
name: "GEO",
index: "target_cube_7_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_7_3_0]
{
name: "GEO",
index: "target_cube_7_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -11.000, -44.000] // mm
}


// -------- GEO[target_cube_7_3_1]
{
name: "GEO",
index: "target_cube_7_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -11.000, -33.000] // mm
}


// -------- GEO[target_cube_7_3_2]
{
name: "GEO",
index: "target_cube_7_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -11.000, -22.000] // mm
}


// -------- GEO[target_cube_7_3_3]
{
name: "GEO",
index: "target_cube_7_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -11.000, -11.000] // mm
}


// -------- GEO[target_cube_7_3_4]
{
name: "GEO",
index: "target_cube_7_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -11.000, 0.0] // mm
}


// -------- GEO[target_cube_7_3_5]
{
name: "GEO",
index: "target_cube_7_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -11.000, 11.000] // mm
}


// -------- GEO[target_cube_7_3_6]
{
name: "GEO",
index: "target_cube_7_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -11.000, 22.000] // mm
}


// -------- GEO[target_cube_7_3_7]
{
name: "GEO",
index: "target_cube_7_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -11.000, 33.000] // mm
}


// -------- GEO[target_cube_7_3_8]
{
name: "GEO",
index: "target_cube_7_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, -11.000, 44.000] // mm
}


// -------- GEO[target_cube_7_4_0]
{
name: "GEO",
index: "target_cube_7_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_7_4_1]
{
name: "GEO",
index: "target_cube_7_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 0.0, -33.000] // mm
}


// -------- GEO[target_cube_7_4_2]
{
name: "GEO",
index: "target_cube_7_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_7_4_3]
{
name: "GEO",
index: "target_cube_7_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 0.0, -11.000] // mm
}


// -------- GEO[target_cube_7_4_4]
{
name: "GEO",
index: "target_cube_7_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_7_4_5]
{
name: "GEO",
index: "target_cube_7_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 0.0, 11.000] // mm
}


// -------- GEO[target_cube_7_4_6]
{
name: "GEO",
index: "target_cube_7_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_7_4_7]
{
name: "GEO",
index: "target_cube_7_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 0.0, 33.000] // mm
}


// -------- GEO[target_cube_7_4_8]
{
name: "GEO",
index: "target_cube_7_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_7_5_0]
{
name: "GEO",
index: "target_cube_7_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 11.000, -44.000] // mm
}


// -------- GEO[target_cube_7_5_1]
{
name: "GEO",
index: "target_cube_7_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 11.000, -33.000] // mm
}


// -------- GEO[target_cube_7_5_2]
{
name: "GEO",
index: "target_cube_7_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 11.000, -22.000] // mm
}


// -------- GEO[target_cube_7_5_3]
{
name: "GEO",
index: "target_cube_7_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 11.000, -11.000] // mm
}


// -------- GEO[target_cube_7_5_4]
{
name: "GEO",
index: "target_cube_7_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 11.000, 0.0] // mm
}


// -------- GEO[target_cube_7_5_5]
{
name: "GEO",
index: "target_cube_7_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 11.000, 11.000] // mm
}


// -------- GEO[target_cube_7_5_6]
{
name: "GEO",
index: "target_cube_7_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 11.000, 22.000] // mm
}


// -------- GEO[target_cube_7_5_7]
{
name: "GEO",
index: "target_cube_7_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 11.000, 33.000] // mm
}


// -------- GEO[target_cube_7_5_8]
{
name: "GEO",
index: "target_cube_7_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 11.000, 44.000] // mm
}


// -------- GEO[target_cube_7_6_0]
{
name: "GEO",
index: "target_cube_7_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_7_6_1]
{
name: "GEO",
index: "target_cube_7_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 22.000, -33.000] // mm
}


// -------- GEO[target_cube_7_6_2]
{
name: "GEO",
index: "target_cube_7_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_7_6_3]
{
name: "GEO",
index: "target_cube_7_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 22.000, -11.000] // mm
}


// -------- GEO[target_cube_7_6_4]
{
name: "GEO",
index: "target_cube_7_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_7_6_5]
{
name: "GEO",
index: "target_cube_7_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 22.000, 11.000] // mm
}


// -------- GEO[target_cube_7_6_6]
{
name: "GEO",
index: "target_cube_7_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_7_6_7]
{
name: "GEO",
index: "target_cube_7_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 22.000, 33.000] // mm
}


// -------- GEO[target_cube_7_6_8]
{
name: "GEO",
index: "target_cube_7_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_7_7_0]
{
name: "GEO",
index: "target_cube_7_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 33.000, -44.000] // mm
}


// -------- GEO[target_cube_7_7_1]
{
name: "GEO",
index: "target_cube_7_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 33.000, -33.000] // mm
}


// -------- GEO[target_cube_7_7_2]
{
name: "GEO",
index: "target_cube_7_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 33.000, -22.000] // mm
}


// -------- GEO[target_cube_7_7_3]
{
name: "GEO",
index: "target_cube_7_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 33.000, -11.000] // mm
}


// -------- GEO[target_cube_7_7_4]
{
name: "GEO",
index: "target_cube_7_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cube_7_7_5]
{
name: "GEO",
index: "target_cube_7_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 33.000, 11.000] // mm
}


// -------- GEO[target_cube_7_7_6]
{
name: "GEO",
index: "target_cube_7_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 33.000, 22.000] // mm
}


// -------- GEO[target_cube_7_7_7]
{
name: "GEO",
index: "target_cube_7_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 33.000, 33.000] // mm
}


// -------- GEO[target_cube_7_7_8]
{
name: "GEO",
index: "target_cube_7_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 33.000, 44.000] // mm
}


// -------- GEO[target_cube_7_8_0]
{
name: "GEO",
index: "target_cube_7_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_7_8_1]
{
name: "GEO",
index: "target_cube_7_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 44.000, -33.000] // mm
}


// -------- GEO[target_cube_7_8_2]
{
name: "GEO",
index: "target_cube_7_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_7_8_3]
{
name: "GEO",
index: "target_cube_7_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 44.000, -11.000] // mm
}


// -------- GEO[target_cube_7_8_4]
{
name: "GEO",
index: "target_cube_7_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_7_8_5]
{
name: "GEO",
index: "target_cube_7_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 44.000, 11.000] // mm
}


// -------- GEO[target_cube_7_8_6]
{
name: "GEO",
index: "target_cube_7_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_7_8_7]
{
name: "GEO",
index: "target_cube_7_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 44.000, 33.000] // mm
}


// -------- GEO[target_cube_7_8_8]
{
name: "GEO",
index: "target_cube_7_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [33.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_8_0_0]
{
name: "GEO",
index: "target_cube_8_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_8_0_1]
{
name: "GEO",
index: "target_cube_8_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -44.000, -33.000] // mm
}


// -------- GEO[target_cube_8_0_2]
{
name: "GEO",
index: "target_cube_8_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_8_0_3]
{
name: "GEO",
index: "target_cube_8_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -44.000, -11.000] // mm
}


// -------- GEO[target_cube_8_0_4]
{
name: "GEO",
index: "target_cube_8_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_8_0_5]
{
name: "GEO",
index: "target_cube_8_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -44.000, 11.000] // mm
}


// -------- GEO[target_cube_8_0_6]
{
name: "GEO",
index: "target_cube_8_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_8_0_7]
{
name: "GEO",
index: "target_cube_8_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -44.000, 33.000] // mm
}


// -------- GEO[target_cube_8_0_8]
{
name: "GEO",
index: "target_cube_8_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_8_1_0]
{
name: "GEO",
index: "target_cube_8_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -33.000, -44.000] // mm
}


// -------- GEO[target_cube_8_1_1]
{
name: "GEO",
index: "target_cube_8_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -33.000, -33.000] // mm
}


// -------- GEO[target_cube_8_1_2]
{
name: "GEO",
index: "target_cube_8_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -33.000, -22.000] // mm
}


// -------- GEO[target_cube_8_1_3]
{
name: "GEO",
index: "target_cube_8_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -33.000, -11.000] // mm
}


// -------- GEO[target_cube_8_1_4]
{
name: "GEO",
index: "target_cube_8_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cube_8_1_5]
{
name: "GEO",
index: "target_cube_8_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -33.000, 11.000] // mm
}


// -------- GEO[target_cube_8_1_6]
{
name: "GEO",
index: "target_cube_8_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -33.000, 22.000] // mm
}


// -------- GEO[target_cube_8_1_7]
{
name: "GEO",
index: "target_cube_8_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -33.000, 33.000] // mm
}


// -------- GEO[target_cube_8_1_8]
{
name: "GEO",
index: "target_cube_8_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -33.000, 44.000] // mm
}


// -------- GEO[target_cube_8_2_0]
{
name: "GEO",
index: "target_cube_8_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_8_2_1]
{
name: "GEO",
index: "target_cube_8_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -22.000, -33.000] // mm
}


// -------- GEO[target_cube_8_2_2]
{
name: "GEO",
index: "target_cube_8_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_8_2_3]
{
name: "GEO",
index: "target_cube_8_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -22.000, -11.000] // mm
}


// -------- GEO[target_cube_8_2_4]
{
name: "GEO",
index: "target_cube_8_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_8_2_5]
{
name: "GEO",
index: "target_cube_8_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -22.000, 11.000] // mm
}


// -------- GEO[target_cube_8_2_6]
{
name: "GEO",
index: "target_cube_8_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_8_2_7]
{
name: "GEO",
index: "target_cube_8_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -22.000, 33.000] // mm
}


// -------- GEO[target_cube_8_2_8]
{
name: "GEO",
index: "target_cube_8_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_8_3_0]
{
name: "GEO",
index: "target_cube_8_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -11.000, -44.000] // mm
}


// -------- GEO[target_cube_8_3_1]
{
name: "GEO",
index: "target_cube_8_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -11.000, -33.000] // mm
}


// -------- GEO[target_cube_8_3_2]
{
name: "GEO",
index: "target_cube_8_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -11.000, -22.000] // mm
}


// -------- GEO[target_cube_8_3_3]
{
name: "GEO",
index: "target_cube_8_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -11.000, -11.000] // mm
}


// -------- GEO[target_cube_8_3_4]
{
name: "GEO",
index: "target_cube_8_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -11.000, 0.0] // mm
}


// -------- GEO[target_cube_8_3_5]
{
name: "GEO",
index: "target_cube_8_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -11.000, 11.000] // mm
}


// -------- GEO[target_cube_8_3_6]
{
name: "GEO",
index: "target_cube_8_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -11.000, 22.000] // mm
}


// -------- GEO[target_cube_8_3_7]
{
name: "GEO",
index: "target_cube_8_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -11.000, 33.000] // mm
}


// -------- GEO[target_cube_8_3_8]
{
name: "GEO",
index: "target_cube_8_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, -11.000, 44.000] // mm
}


// -------- GEO[target_cube_8_4_0]
{
name: "GEO",
index: "target_cube_8_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_8_4_1]
{
name: "GEO",
index: "target_cube_8_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 0.0, -33.000] // mm
}


// -------- GEO[target_cube_8_4_2]
{
name: "GEO",
index: "target_cube_8_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_8_4_3]
{
name: "GEO",
index: "target_cube_8_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 0.0, -11.000] // mm
}


// -------- GEO[target_cube_8_4_4]
{
name: "GEO",
index: "target_cube_8_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_8_4_5]
{
name: "GEO",
index: "target_cube_8_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 0.0, 11.000] // mm
}


// -------- GEO[target_cube_8_4_6]
{
name: "GEO",
index: "target_cube_8_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_8_4_7]
{
name: "GEO",
index: "target_cube_8_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 0.0, 33.000] // mm
}


// -------- GEO[target_cube_8_4_8]
{
name: "GEO",
index: "target_cube_8_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_8_5_0]
{
name: "GEO",
index: "target_cube_8_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 11.000, -44.000] // mm
}


// -------- GEO[target_cube_8_5_1]
{
name: "GEO",
index: "target_cube_8_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 11.000, -33.000] // mm
}


// -------- GEO[target_cube_8_5_2]
{
name: "GEO",
index: "target_cube_8_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 11.000, -22.000] // mm
}


// -------- GEO[target_cube_8_5_3]
{
name: "GEO",
index: "target_cube_8_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 11.000, -11.000] // mm
}


// -------- GEO[target_cube_8_5_4]
{
name: "GEO",
index: "target_cube_8_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 11.000, 0.0] // mm
}


// -------- GEO[target_cube_8_5_5]
{
name: "GEO",
index: "target_cube_8_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 11.000, 11.000] // mm
}


// -------- GEO[target_cube_8_5_6]
{
name: "GEO",
index: "target_cube_8_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 11.000, 22.000] // mm
}


// -------- GEO[target_cube_8_5_7]
{
name: "GEO",
index: "target_cube_8_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 11.000, 33.000] // mm
}


// -------- GEO[target_cube_8_5_8]
{
name: "GEO",
index: "target_cube_8_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 11.000, 44.000] // mm
}


// -------- GEO[target_cube_8_6_0]
{
name: "GEO",
index: "target_cube_8_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_8_6_1]
{
name: "GEO",
index: "target_cube_8_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 22.000, -33.000] // mm
}


// -------- GEO[target_cube_8_6_2]
{
name: "GEO",
index: "target_cube_8_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_8_6_3]
{
name: "GEO",
index: "target_cube_8_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 22.000, -11.000] // mm
}


// -------- GEO[target_cube_8_6_4]
{
name: "GEO",
index: "target_cube_8_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_8_6_5]
{
name: "GEO",
index: "target_cube_8_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 22.000, 11.000] // mm
}


// -------- GEO[target_cube_8_6_6]
{
name: "GEO",
index: "target_cube_8_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_8_6_7]
{
name: "GEO",
index: "target_cube_8_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 22.000, 33.000] // mm
}


// -------- GEO[target_cube_8_6_8]
{
name: "GEO",
index: "target_cube_8_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_8_7_0]
{
name: "GEO",
index: "target_cube_8_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 33.000, -44.000] // mm
}


// -------- GEO[target_cube_8_7_1]
{
name: "GEO",
index: "target_cube_8_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 33.000, -33.000] // mm
}


// -------- GEO[target_cube_8_7_2]
{
name: "GEO",
index: "target_cube_8_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 33.000, -22.000] // mm
}


// -------- GEO[target_cube_8_7_3]
{
name: "GEO",
index: "target_cube_8_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 33.000, -11.000] // mm
}


// -------- GEO[target_cube_8_7_4]
{
name: "GEO",
index: "target_cube_8_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cube_8_7_5]
{
name: "GEO",
index: "target_cube_8_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 33.000, 11.000] // mm
}


// -------- GEO[target_cube_8_7_6]
{
name: "GEO",
index: "target_cube_8_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 33.000, 22.000] // mm
}


// -------- GEO[target_cube_8_7_7]
{
name: "GEO",
index: "target_cube_8_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 33.000, 33.000] // mm
}


// -------- GEO[target_cube_8_7_8]
{
name: "GEO",
index: "target_cube_8_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 33.000, 44.000] // mm
}


// -------- GEO[target_cube_8_8_0]
{
name: "GEO",
index: "target_cube_8_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_8_8_1]
{
name: "GEO",
index: "target_cube_8_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 44.000, -33.000] // mm
}


// -------- GEO[target_cube_8_8_2]
{
name: "GEO",
index: "target_cube_8_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_8_8_3]
{
name: "GEO",
index: "target_cube_8_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 44.000, -11.000] // mm
}


// -------- GEO[target_cube_8_8_4]
{
name: "GEO",
index: "target_cube_8_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_8_8_5]
{
name: "GEO",
index: "target_cube_8_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 44.000, 11.000] // mm
}


// -------- GEO[target_cube_8_8_6]
{
name: "GEO",
index: "target_cube_8_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_8_8_7]
{
name: "GEO",
index: "target_cube_8_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 0, // inert cube
color: [0.5, 0.5, 0.5],
position: [44.000, 44.000, 33.000] // mm
}


// -------- GEO[target_cube_8_8_8]
{
name: "GEO",
index: "target_cube_8_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0],
position: [44.000, 44.000, 44.000] // mm
}


