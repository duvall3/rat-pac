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
size: [93.500, 93.500, 93.500], // mm
//material: "air",
material: "glass",
invisible: 0,
color: [0.8, 0.8, 0.8, 0.2],
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -88.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -88.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -88.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -88.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -88.000, 0.0] // mm
}


// -------- GEO[target_cube_0_0_10]
{
name: "GEO",
index: "target_cube_0_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -88.000, 22.000] // mm
}


// -------- GEO[target_cube_0_0_12]
{
name: "GEO",
index: "target_cube_0_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -88.000, 44.000] // mm
}


// -------- GEO[target_cube_0_0_14]
{
name: "GEO",
index: "target_cube_0_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -88.000, 66.000] // mm
}


// -------- GEO[target_cube_0_0_16]
{
name: "GEO",
index: "target_cube_0_0_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -88.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -66.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -66.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -66.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -66.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -66.000, 0.0] // mm
}


// -------- GEO[target_cube_0_2_10]
{
name: "GEO",
index: "target_cube_0_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -66.000, 22.000] // mm
}


// -------- GEO[target_cube_0_2_12]
{
name: "GEO",
index: "target_cube_0_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -66.000, 44.000] // mm
}


// -------- GEO[target_cube_0_2_14]
{
name: "GEO",
index: "target_cube_0_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -66.000, 66.000] // mm
}


// -------- GEO[target_cube_0_2_16]
{
name: "GEO",
index: "target_cube_0_2_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -66.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -44.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -44.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -44.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -44.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_0_4_10]
{
name: "GEO",
index: "target_cube_0_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_0_4_12]
{
name: "GEO",
index: "target_cube_0_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_0_4_14]
{
name: "GEO",
index: "target_cube_0_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -44.000, 66.000] // mm
}


// -------- GEO[target_cube_0_4_16]
{
name: "GEO",
index: "target_cube_0_4_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -44.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -22.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -22.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -22.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -22.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_0_6_10]
{
name: "GEO",
index: "target_cube_0_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_0_6_12]
{
name: "GEO",
index: "target_cube_0_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_0_6_14]
{
name: "GEO",
index: "target_cube_0_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -22.000, 66.000] // mm
}


// -------- GEO[target_cube_0_6_16]
{
name: "GEO",
index: "target_cube_0_6_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, -22.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 0.0, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 0.0, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 0.0, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 0.0, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_0_8_10]
{
name: "GEO",
index: "target_cube_0_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_0_8_12]
{
name: "GEO",
index: "target_cube_0_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_0_8_14]
{
name: "GEO",
index: "target_cube_0_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 0.0, 66.000] // mm
}


// -------- GEO[target_cube_0_8_16]
{
name: "GEO",
index: "target_cube_0_8_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 0.0, 88.000] // mm
}


// -------- GEO[target_cube_0_10_0]
{
name: "GEO",
index: "target_cube_0_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 22.000, -88.000] // mm
}


// -------- GEO[target_cube_0_10_2]
{
name: "GEO",
index: "target_cube_0_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 22.000, -66.000] // mm
}


// -------- GEO[target_cube_0_10_4]
{
name: "GEO",
index: "target_cube_0_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_0_10_6]
{
name: "GEO",
index: "target_cube_0_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_0_10_8]
{
name: "GEO",
index: "target_cube_0_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_0_10_10]
{
name: "GEO",
index: "target_cube_0_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_0_10_12]
{
name: "GEO",
index: "target_cube_0_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_0_10_14]
{
name: "GEO",
index: "target_cube_0_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 22.000, 66.000] // mm
}


// -------- GEO[target_cube_0_10_16]
{
name: "GEO",
index: "target_cube_0_10_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 22.000, 88.000] // mm
}


// -------- GEO[target_cube_0_12_0]
{
name: "GEO",
index: "target_cube_0_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 44.000, -88.000] // mm
}


// -------- GEO[target_cube_0_12_2]
{
name: "GEO",
index: "target_cube_0_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 44.000, -66.000] // mm
}


// -------- GEO[target_cube_0_12_4]
{
name: "GEO",
index: "target_cube_0_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_0_12_6]
{
name: "GEO",
index: "target_cube_0_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_0_12_8]
{
name: "GEO",
index: "target_cube_0_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_0_12_10]
{
name: "GEO",
index: "target_cube_0_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_0_12_12]
{
name: "GEO",
index: "target_cube_0_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_0_12_14]
{
name: "GEO",
index: "target_cube_0_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 44.000, 66.000] // mm
}


// -------- GEO[target_cube_0_12_16]
{
name: "GEO",
index: "target_cube_0_12_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 44.000, 88.000] // mm
}


// -------- GEO[target_cube_0_14_0]
{
name: "GEO",
index: "target_cube_0_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 66.000, -88.000] // mm
}


// -------- GEO[target_cube_0_14_2]
{
name: "GEO",
index: "target_cube_0_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 66.000, -66.000] // mm
}


// -------- GEO[target_cube_0_14_4]
{
name: "GEO",
index: "target_cube_0_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 66.000, -44.000] // mm
}


// -------- GEO[target_cube_0_14_6]
{
name: "GEO",
index: "target_cube_0_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 66.000, -22.000] // mm
}


// -------- GEO[target_cube_0_14_8]
{
name: "GEO",
index: "target_cube_0_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 66.000, 0.0] // mm
}


// -------- GEO[target_cube_0_14_10]
{
name: "GEO",
index: "target_cube_0_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 66.000, 22.000] // mm
}


// -------- GEO[target_cube_0_14_12]
{
name: "GEO",
index: "target_cube_0_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 66.000, 44.000] // mm
}


// -------- GEO[target_cube_0_14_14]
{
name: "GEO",
index: "target_cube_0_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 66.000, 66.000] // mm
}


// -------- GEO[target_cube_0_14_16]
{
name: "GEO",
index: "target_cube_0_14_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 66.000, 88.000] // mm
}


// -------- GEO[target_cube_0_16_0]
{
name: "GEO",
index: "target_cube_0_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 88.000, -88.000] // mm
}


// -------- GEO[target_cube_0_16_2]
{
name: "GEO",
index: "target_cube_0_16_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 88.000, -66.000] // mm
}


// -------- GEO[target_cube_0_16_4]
{
name: "GEO",
index: "target_cube_0_16_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 88.000, -44.000] // mm
}


// -------- GEO[target_cube_0_16_6]
{
name: "GEO",
index: "target_cube_0_16_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 88.000, -22.000] // mm
}


// -------- GEO[target_cube_0_16_8]
{
name: "GEO",
index: "target_cube_0_16_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 88.000, 0.0] // mm
}


// -------- GEO[target_cube_0_16_10]
{
name: "GEO",
index: "target_cube_0_16_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 88.000, 22.000] // mm
}


// -------- GEO[target_cube_0_16_12]
{
name: "GEO",
index: "target_cube_0_16_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 88.000, 44.000] // mm
}


// -------- GEO[target_cube_0_16_14]
{
name: "GEO",
index: "target_cube_0_16_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 88.000, 66.000] // mm
}


// -------- GEO[target_cube_0_16_16]
{
name: "GEO",
index: "target_cube_0_16_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-88.000, 88.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -88.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -88.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -88.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -88.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -88.000, 0.0] // mm
}


// -------- GEO[target_cube_2_0_10]
{
name: "GEO",
index: "target_cube_2_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -88.000, 22.000] // mm
}


// -------- GEO[target_cube_2_0_12]
{
name: "GEO",
index: "target_cube_2_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -88.000, 44.000] // mm
}


// -------- GEO[target_cube_2_0_14]
{
name: "GEO",
index: "target_cube_2_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -88.000, 66.000] // mm
}


// -------- GEO[target_cube_2_0_16]
{
name: "GEO",
index: "target_cube_2_0_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -88.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -66.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -66.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -66.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -66.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -66.000, 0.0] // mm
}


// -------- GEO[target_cube_2_2_10]
{
name: "GEO",
index: "target_cube_2_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -66.000, 22.000] // mm
}


// -------- GEO[target_cube_2_2_12]
{
name: "GEO",
index: "target_cube_2_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -66.000, 44.000] // mm
}


// -------- GEO[target_cube_2_2_14]
{
name: "GEO",
index: "target_cube_2_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -66.000, 66.000] // mm
}


// -------- GEO[target_cube_2_2_16]
{
name: "GEO",
index: "target_cube_2_2_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -66.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -44.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -44.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -44.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -44.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_2_4_10]
{
name: "GEO",
index: "target_cube_2_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_2_4_12]
{
name: "GEO",
index: "target_cube_2_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_2_4_14]
{
name: "GEO",
index: "target_cube_2_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -44.000, 66.000] // mm
}


// -------- GEO[target_cube_2_4_16]
{
name: "GEO",
index: "target_cube_2_4_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -44.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -22.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -22.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -22.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -22.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_2_6_10]
{
name: "GEO",
index: "target_cube_2_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_2_6_12]
{
name: "GEO",
index: "target_cube_2_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_2_6_14]
{
name: "GEO",
index: "target_cube_2_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -22.000, 66.000] // mm
}


// -------- GEO[target_cube_2_6_16]
{
name: "GEO",
index: "target_cube_2_6_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, -22.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 0.0, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 0.0, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 0.0, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 0.0, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_2_8_10]
{
name: "GEO",
index: "target_cube_2_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_2_8_12]
{
name: "GEO",
index: "target_cube_2_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_2_8_14]
{
name: "GEO",
index: "target_cube_2_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 0.0, 66.000] // mm
}


// -------- GEO[target_cube_2_8_16]
{
name: "GEO",
index: "target_cube_2_8_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 0.0, 88.000] // mm
}


// -------- GEO[target_cube_2_10_0]
{
name: "GEO",
index: "target_cube_2_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 22.000, -88.000] // mm
}


// -------- GEO[target_cube_2_10_2]
{
name: "GEO",
index: "target_cube_2_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 22.000, -66.000] // mm
}


// -------- GEO[target_cube_2_10_4]
{
name: "GEO",
index: "target_cube_2_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_2_10_6]
{
name: "GEO",
index: "target_cube_2_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_2_10_8]
{
name: "GEO",
index: "target_cube_2_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_2_10_10]
{
name: "GEO",
index: "target_cube_2_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_2_10_12]
{
name: "GEO",
index: "target_cube_2_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_2_10_14]
{
name: "GEO",
index: "target_cube_2_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 22.000, 66.000] // mm
}


// -------- GEO[target_cube_2_10_16]
{
name: "GEO",
index: "target_cube_2_10_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 22.000, 88.000] // mm
}


// -------- GEO[target_cube_2_12_0]
{
name: "GEO",
index: "target_cube_2_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 44.000, -88.000] // mm
}


// -------- GEO[target_cube_2_12_2]
{
name: "GEO",
index: "target_cube_2_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 44.000, -66.000] // mm
}


// -------- GEO[target_cube_2_12_4]
{
name: "GEO",
index: "target_cube_2_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_2_12_6]
{
name: "GEO",
index: "target_cube_2_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_2_12_8]
{
name: "GEO",
index: "target_cube_2_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_2_12_10]
{
name: "GEO",
index: "target_cube_2_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_2_12_12]
{
name: "GEO",
index: "target_cube_2_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_2_12_14]
{
name: "GEO",
index: "target_cube_2_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 44.000, 66.000] // mm
}


// -------- GEO[target_cube_2_12_16]
{
name: "GEO",
index: "target_cube_2_12_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 44.000, 88.000] // mm
}


// -------- GEO[target_cube_2_14_0]
{
name: "GEO",
index: "target_cube_2_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 66.000, -88.000] // mm
}


// -------- GEO[target_cube_2_14_2]
{
name: "GEO",
index: "target_cube_2_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 66.000, -66.000] // mm
}


// -------- GEO[target_cube_2_14_4]
{
name: "GEO",
index: "target_cube_2_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 66.000, -44.000] // mm
}


// -------- GEO[target_cube_2_14_6]
{
name: "GEO",
index: "target_cube_2_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 66.000, -22.000] // mm
}


// -------- GEO[target_cube_2_14_8]
{
name: "GEO",
index: "target_cube_2_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 66.000, 0.0] // mm
}


// -------- GEO[target_cube_2_14_10]
{
name: "GEO",
index: "target_cube_2_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 66.000, 22.000] // mm
}


// -------- GEO[target_cube_2_14_12]
{
name: "GEO",
index: "target_cube_2_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 66.000, 44.000] // mm
}


// -------- GEO[target_cube_2_14_14]
{
name: "GEO",
index: "target_cube_2_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 66.000, 66.000] // mm
}


// -------- GEO[target_cube_2_14_16]
{
name: "GEO",
index: "target_cube_2_14_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 66.000, 88.000] // mm
}


// -------- GEO[target_cube_2_16_0]
{
name: "GEO",
index: "target_cube_2_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 88.000, -88.000] // mm
}


// -------- GEO[target_cube_2_16_2]
{
name: "GEO",
index: "target_cube_2_16_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 88.000, -66.000] // mm
}


// -------- GEO[target_cube_2_16_4]
{
name: "GEO",
index: "target_cube_2_16_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 88.000, -44.000] // mm
}


// -------- GEO[target_cube_2_16_6]
{
name: "GEO",
index: "target_cube_2_16_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 88.000, -22.000] // mm
}


// -------- GEO[target_cube_2_16_8]
{
name: "GEO",
index: "target_cube_2_16_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 88.000, 0.0] // mm
}


// -------- GEO[target_cube_2_16_10]
{
name: "GEO",
index: "target_cube_2_16_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 88.000, 22.000] // mm
}


// -------- GEO[target_cube_2_16_12]
{
name: "GEO",
index: "target_cube_2_16_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 88.000, 44.000] // mm
}


// -------- GEO[target_cube_2_16_14]
{
name: "GEO",
index: "target_cube_2_16_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 88.000, 66.000] // mm
}


// -------- GEO[target_cube_2_16_16]
{
name: "GEO",
index: "target_cube_2_16_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-66.000, 88.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -88.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -88.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -88.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -88.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -88.000, 0.0] // mm
}


// -------- GEO[target_cube_4_0_10]
{
name: "GEO",
index: "target_cube_4_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -88.000, 22.000] // mm
}


// -------- GEO[target_cube_4_0_12]
{
name: "GEO",
index: "target_cube_4_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -88.000, 44.000] // mm
}


// -------- GEO[target_cube_4_0_14]
{
name: "GEO",
index: "target_cube_4_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -88.000, 66.000] // mm
}


// -------- GEO[target_cube_4_0_16]
{
name: "GEO",
index: "target_cube_4_0_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -88.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -66.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -66.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -66.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -66.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -66.000, 0.0] // mm
}


// -------- GEO[target_cube_4_2_10]
{
name: "GEO",
index: "target_cube_4_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -66.000, 22.000] // mm
}


// -------- GEO[target_cube_4_2_12]
{
name: "GEO",
index: "target_cube_4_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -66.000, 44.000] // mm
}


// -------- GEO[target_cube_4_2_14]
{
name: "GEO",
index: "target_cube_4_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -66.000, 66.000] // mm
}


// -------- GEO[target_cube_4_2_16]
{
name: "GEO",
index: "target_cube_4_2_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -66.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -44.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -44.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -44.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -44.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_4_4_10]
{
name: "GEO",
index: "target_cube_4_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_4_4_12]
{
name: "GEO",
index: "target_cube_4_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_4_4_14]
{
name: "GEO",
index: "target_cube_4_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -44.000, 66.000] // mm
}


// -------- GEO[target_cube_4_4_16]
{
name: "GEO",
index: "target_cube_4_4_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -44.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -22.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -22.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -22.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -22.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_4_6_10]
{
name: "GEO",
index: "target_cube_4_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_4_6_12]
{
name: "GEO",
index: "target_cube_4_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_4_6_14]
{
name: "GEO",
index: "target_cube_4_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -22.000, 66.000] // mm
}


// -------- GEO[target_cube_4_6_16]
{
name: "GEO",
index: "target_cube_4_6_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, -22.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 0.0, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 0.0, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 0.0, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 0.0, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_4_8_10]
{
name: "GEO",
index: "target_cube_4_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_4_8_12]
{
name: "GEO",
index: "target_cube_4_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_4_8_14]
{
name: "GEO",
index: "target_cube_4_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 0.0, 66.000] // mm
}


// -------- GEO[target_cube_4_8_16]
{
name: "GEO",
index: "target_cube_4_8_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 0.0, 88.000] // mm
}


// -------- GEO[target_cube_4_10_0]
{
name: "GEO",
index: "target_cube_4_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 22.000, -88.000] // mm
}


// -------- GEO[target_cube_4_10_2]
{
name: "GEO",
index: "target_cube_4_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 22.000, -66.000] // mm
}


// -------- GEO[target_cube_4_10_4]
{
name: "GEO",
index: "target_cube_4_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_4_10_6]
{
name: "GEO",
index: "target_cube_4_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_4_10_8]
{
name: "GEO",
index: "target_cube_4_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_4_10_10]
{
name: "GEO",
index: "target_cube_4_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_4_10_12]
{
name: "GEO",
index: "target_cube_4_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_4_10_14]
{
name: "GEO",
index: "target_cube_4_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 22.000, 66.000] // mm
}


// -------- GEO[target_cube_4_10_16]
{
name: "GEO",
index: "target_cube_4_10_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 22.000, 88.000] // mm
}


// -------- GEO[target_cube_4_12_0]
{
name: "GEO",
index: "target_cube_4_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 44.000, -88.000] // mm
}


// -------- GEO[target_cube_4_12_2]
{
name: "GEO",
index: "target_cube_4_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 44.000, -66.000] // mm
}


// -------- GEO[target_cube_4_12_4]
{
name: "GEO",
index: "target_cube_4_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_4_12_6]
{
name: "GEO",
index: "target_cube_4_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_4_12_8]
{
name: "GEO",
index: "target_cube_4_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_4_12_10]
{
name: "GEO",
index: "target_cube_4_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_4_12_12]
{
name: "GEO",
index: "target_cube_4_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_4_12_14]
{
name: "GEO",
index: "target_cube_4_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 44.000, 66.000] // mm
}


// -------- GEO[target_cube_4_12_16]
{
name: "GEO",
index: "target_cube_4_12_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 44.000, 88.000] // mm
}


// -------- GEO[target_cube_4_14_0]
{
name: "GEO",
index: "target_cube_4_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 66.000, -88.000] // mm
}


// -------- GEO[target_cube_4_14_2]
{
name: "GEO",
index: "target_cube_4_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 66.000, -66.000] // mm
}


// -------- GEO[target_cube_4_14_4]
{
name: "GEO",
index: "target_cube_4_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 66.000, -44.000] // mm
}


// -------- GEO[target_cube_4_14_6]
{
name: "GEO",
index: "target_cube_4_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 66.000, -22.000] // mm
}


// -------- GEO[target_cube_4_14_8]
{
name: "GEO",
index: "target_cube_4_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 66.000, 0.0] // mm
}


// -------- GEO[target_cube_4_14_10]
{
name: "GEO",
index: "target_cube_4_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 66.000, 22.000] // mm
}


// -------- GEO[target_cube_4_14_12]
{
name: "GEO",
index: "target_cube_4_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 66.000, 44.000] // mm
}


// -------- GEO[target_cube_4_14_14]
{
name: "GEO",
index: "target_cube_4_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 66.000, 66.000] // mm
}


// -------- GEO[target_cube_4_14_16]
{
name: "GEO",
index: "target_cube_4_14_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 66.000, 88.000] // mm
}


// -------- GEO[target_cube_4_16_0]
{
name: "GEO",
index: "target_cube_4_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 88.000, -88.000] // mm
}


// -------- GEO[target_cube_4_16_2]
{
name: "GEO",
index: "target_cube_4_16_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 88.000, -66.000] // mm
}


// -------- GEO[target_cube_4_16_4]
{
name: "GEO",
index: "target_cube_4_16_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 88.000, -44.000] // mm
}


// -------- GEO[target_cube_4_16_6]
{
name: "GEO",
index: "target_cube_4_16_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 88.000, -22.000] // mm
}


// -------- GEO[target_cube_4_16_8]
{
name: "GEO",
index: "target_cube_4_16_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 88.000, 0.0] // mm
}


// -------- GEO[target_cube_4_16_10]
{
name: "GEO",
index: "target_cube_4_16_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 88.000, 22.000] // mm
}


// -------- GEO[target_cube_4_16_12]
{
name: "GEO",
index: "target_cube_4_16_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 88.000, 44.000] // mm
}


// -------- GEO[target_cube_4_16_14]
{
name: "GEO",
index: "target_cube_4_16_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 88.000, 66.000] // mm
}


// -------- GEO[target_cube_4_16_16]
{
name: "GEO",
index: "target_cube_4_16_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-44.000, 88.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -88.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -88.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -88.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -88.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -88.000, 0.0] // mm
}


// -------- GEO[target_cube_6_0_10]
{
name: "GEO",
index: "target_cube_6_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -88.000, 22.000] // mm
}


// -------- GEO[target_cube_6_0_12]
{
name: "GEO",
index: "target_cube_6_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -88.000, 44.000] // mm
}


// -------- GEO[target_cube_6_0_14]
{
name: "GEO",
index: "target_cube_6_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -88.000, 66.000] // mm
}


// -------- GEO[target_cube_6_0_16]
{
name: "GEO",
index: "target_cube_6_0_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -88.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -66.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -66.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -66.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -66.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -66.000, 0.0] // mm
}


// -------- GEO[target_cube_6_2_10]
{
name: "GEO",
index: "target_cube_6_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -66.000, 22.000] // mm
}


// -------- GEO[target_cube_6_2_12]
{
name: "GEO",
index: "target_cube_6_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -66.000, 44.000] // mm
}


// -------- GEO[target_cube_6_2_14]
{
name: "GEO",
index: "target_cube_6_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -66.000, 66.000] // mm
}


// -------- GEO[target_cube_6_2_16]
{
name: "GEO",
index: "target_cube_6_2_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -66.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -44.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -44.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -44.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -44.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_6_4_10]
{
name: "GEO",
index: "target_cube_6_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_6_4_12]
{
name: "GEO",
index: "target_cube_6_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_6_4_14]
{
name: "GEO",
index: "target_cube_6_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -44.000, 66.000] // mm
}


// -------- GEO[target_cube_6_4_16]
{
name: "GEO",
index: "target_cube_6_4_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -44.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -22.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -22.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -22.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -22.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_6_6_10]
{
name: "GEO",
index: "target_cube_6_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_6_6_12]
{
name: "GEO",
index: "target_cube_6_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_6_6_14]
{
name: "GEO",
index: "target_cube_6_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -22.000, 66.000] // mm
}


// -------- GEO[target_cube_6_6_16]
{
name: "GEO",
index: "target_cube_6_6_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, -22.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 0.0, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 0.0, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 0.0, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 0.0, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_6_8_10]
{
name: "GEO",
index: "target_cube_6_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_6_8_12]
{
name: "GEO",
index: "target_cube_6_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_6_8_14]
{
name: "GEO",
index: "target_cube_6_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 0.0, 66.000] // mm
}


// -------- GEO[target_cube_6_8_16]
{
name: "GEO",
index: "target_cube_6_8_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 0.0, 88.000] // mm
}


// -------- GEO[target_cube_6_10_0]
{
name: "GEO",
index: "target_cube_6_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 22.000, -88.000] // mm
}


// -------- GEO[target_cube_6_10_2]
{
name: "GEO",
index: "target_cube_6_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 22.000, -66.000] // mm
}


// -------- GEO[target_cube_6_10_4]
{
name: "GEO",
index: "target_cube_6_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_6_10_6]
{
name: "GEO",
index: "target_cube_6_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_6_10_8]
{
name: "GEO",
index: "target_cube_6_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_6_10_10]
{
name: "GEO",
index: "target_cube_6_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_6_10_12]
{
name: "GEO",
index: "target_cube_6_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_6_10_14]
{
name: "GEO",
index: "target_cube_6_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 22.000, 66.000] // mm
}


// -------- GEO[target_cube_6_10_16]
{
name: "GEO",
index: "target_cube_6_10_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 22.000, 88.000] // mm
}


// -------- GEO[target_cube_6_12_0]
{
name: "GEO",
index: "target_cube_6_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 44.000, -88.000] // mm
}


// -------- GEO[target_cube_6_12_2]
{
name: "GEO",
index: "target_cube_6_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 44.000, -66.000] // mm
}


// -------- GEO[target_cube_6_12_4]
{
name: "GEO",
index: "target_cube_6_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_6_12_6]
{
name: "GEO",
index: "target_cube_6_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_6_12_8]
{
name: "GEO",
index: "target_cube_6_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_6_12_10]
{
name: "GEO",
index: "target_cube_6_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_6_12_12]
{
name: "GEO",
index: "target_cube_6_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_6_12_14]
{
name: "GEO",
index: "target_cube_6_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 44.000, 66.000] // mm
}


// -------- GEO[target_cube_6_12_16]
{
name: "GEO",
index: "target_cube_6_12_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 44.000, 88.000] // mm
}


// -------- GEO[target_cube_6_14_0]
{
name: "GEO",
index: "target_cube_6_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 66.000, -88.000] // mm
}


// -------- GEO[target_cube_6_14_2]
{
name: "GEO",
index: "target_cube_6_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 66.000, -66.000] // mm
}


// -------- GEO[target_cube_6_14_4]
{
name: "GEO",
index: "target_cube_6_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 66.000, -44.000] // mm
}


// -------- GEO[target_cube_6_14_6]
{
name: "GEO",
index: "target_cube_6_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 66.000, -22.000] // mm
}


// -------- GEO[target_cube_6_14_8]
{
name: "GEO",
index: "target_cube_6_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 66.000, 0.0] // mm
}


// -------- GEO[target_cube_6_14_10]
{
name: "GEO",
index: "target_cube_6_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 66.000, 22.000] // mm
}


// -------- GEO[target_cube_6_14_12]
{
name: "GEO",
index: "target_cube_6_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 66.000, 44.000] // mm
}


// -------- GEO[target_cube_6_14_14]
{
name: "GEO",
index: "target_cube_6_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 66.000, 66.000] // mm
}


// -------- GEO[target_cube_6_14_16]
{
name: "GEO",
index: "target_cube_6_14_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 66.000, 88.000] // mm
}


// -------- GEO[target_cube_6_16_0]
{
name: "GEO",
index: "target_cube_6_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 88.000, -88.000] // mm
}


// -------- GEO[target_cube_6_16_2]
{
name: "GEO",
index: "target_cube_6_16_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 88.000, -66.000] // mm
}


// -------- GEO[target_cube_6_16_4]
{
name: "GEO",
index: "target_cube_6_16_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 88.000, -44.000] // mm
}


// -------- GEO[target_cube_6_16_6]
{
name: "GEO",
index: "target_cube_6_16_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 88.000, -22.000] // mm
}


// -------- GEO[target_cube_6_16_8]
{
name: "GEO",
index: "target_cube_6_16_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 88.000, 0.0] // mm
}


// -------- GEO[target_cube_6_16_10]
{
name: "GEO",
index: "target_cube_6_16_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 88.000, 22.000] // mm
}


// -------- GEO[target_cube_6_16_12]
{
name: "GEO",
index: "target_cube_6_16_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 88.000, 44.000] // mm
}


// -------- GEO[target_cube_6_16_14]
{
name: "GEO",
index: "target_cube_6_16_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 88.000, 66.000] // mm
}


// -------- GEO[target_cube_6_16_16]
{
name: "GEO",
index: "target_cube_6_16_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [-22.000, 88.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -88.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -88.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -88.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -88.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -88.000, 0.0] // mm
}


// -------- GEO[target_cube_8_0_10]
{
name: "GEO",
index: "target_cube_8_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -88.000, 22.000] // mm
}


// -------- GEO[target_cube_8_0_12]
{
name: "GEO",
index: "target_cube_8_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -88.000, 44.000] // mm
}


// -------- GEO[target_cube_8_0_14]
{
name: "GEO",
index: "target_cube_8_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -88.000, 66.000] // mm
}


// -------- GEO[target_cube_8_0_16]
{
name: "GEO",
index: "target_cube_8_0_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -88.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -66.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -66.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -66.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -66.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -66.000, 0.0] // mm
}


// -------- GEO[target_cube_8_2_10]
{
name: "GEO",
index: "target_cube_8_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -66.000, 22.000] // mm
}


// -------- GEO[target_cube_8_2_12]
{
name: "GEO",
index: "target_cube_8_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -66.000, 44.000] // mm
}


// -------- GEO[target_cube_8_2_14]
{
name: "GEO",
index: "target_cube_8_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -66.000, 66.000] // mm
}


// -------- GEO[target_cube_8_2_16]
{
name: "GEO",
index: "target_cube_8_2_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -66.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -44.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -44.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -44.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -44.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_8_4_10]
{
name: "GEO",
index: "target_cube_8_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_8_4_12]
{
name: "GEO",
index: "target_cube_8_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_8_4_14]
{
name: "GEO",
index: "target_cube_8_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -44.000, 66.000] // mm
}


// -------- GEO[target_cube_8_4_16]
{
name: "GEO",
index: "target_cube_8_4_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -44.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -22.000, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -22.000, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -22.000, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -22.000, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_8_6_10]
{
name: "GEO",
index: "target_cube_8_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_8_6_12]
{
name: "GEO",
index: "target_cube_8_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_8_6_14]
{
name: "GEO",
index: "target_cube_8_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -22.000, 66.000] // mm
}


// -------- GEO[target_cube_8_6_16]
{
name: "GEO",
index: "target_cube_8_6_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, -22.000, 88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 0.0, -88.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 0.0, -66.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 0.0, -44.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 0.0, -22.000] // mm
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
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_8_8_10]
{
name: "GEO",
index: "target_cube_8_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_8_8_12]
{
name: "GEO",
index: "target_cube_8_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_8_8_14]
{
name: "GEO",
index: "target_cube_8_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 0.0, 66.000] // mm
}


// -------- GEO[target_cube_8_8_16]
{
name: "GEO",
index: "target_cube_8_8_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 0.0, 88.000] // mm
}


// -------- GEO[target_cube_8_10_0]
{
name: "GEO",
index: "target_cube_8_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 22.000, -88.000] // mm
}


// -------- GEO[target_cube_8_10_2]
{
name: "GEO",
index: "target_cube_8_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 22.000, -66.000] // mm
}


// -------- GEO[target_cube_8_10_4]
{
name: "GEO",
index: "target_cube_8_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_8_10_6]
{
name: "GEO",
index: "target_cube_8_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_8_10_8]
{
name: "GEO",
index: "target_cube_8_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_8_10_10]
{
name: "GEO",
index: "target_cube_8_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_8_10_12]
{
name: "GEO",
index: "target_cube_8_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_8_10_14]
{
name: "GEO",
index: "target_cube_8_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 22.000, 66.000] // mm
}


// -------- GEO[target_cube_8_10_16]
{
name: "GEO",
index: "target_cube_8_10_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 22.000, 88.000] // mm
}


// -------- GEO[target_cube_8_12_0]
{
name: "GEO",
index: "target_cube_8_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 44.000, -88.000] // mm
}


// -------- GEO[target_cube_8_12_2]
{
name: "GEO",
index: "target_cube_8_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 44.000, -66.000] // mm
}


// -------- GEO[target_cube_8_12_4]
{
name: "GEO",
index: "target_cube_8_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_8_12_6]
{
name: "GEO",
index: "target_cube_8_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_8_12_8]
{
name: "GEO",
index: "target_cube_8_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_8_12_10]
{
name: "GEO",
index: "target_cube_8_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_8_12_12]
{
name: "GEO",
index: "target_cube_8_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_8_12_14]
{
name: "GEO",
index: "target_cube_8_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 44.000, 66.000] // mm
}


// -------- GEO[target_cube_8_12_16]
{
name: "GEO",
index: "target_cube_8_12_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 44.000, 88.000] // mm
}


// -------- GEO[target_cube_8_14_0]
{
name: "GEO",
index: "target_cube_8_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 66.000, -88.000] // mm
}


// -------- GEO[target_cube_8_14_2]
{
name: "GEO",
index: "target_cube_8_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 66.000, -66.000] // mm
}


// -------- GEO[target_cube_8_14_4]
{
name: "GEO",
index: "target_cube_8_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 66.000, -44.000] // mm
}


// -------- GEO[target_cube_8_14_6]
{
name: "GEO",
index: "target_cube_8_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 66.000, -22.000] // mm
}


// -------- GEO[target_cube_8_14_8]
{
name: "GEO",
index: "target_cube_8_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 66.000, 0.0] // mm
}


// -------- GEO[target_cube_8_14_10]
{
name: "GEO",
index: "target_cube_8_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 66.000, 22.000] // mm
}


// -------- GEO[target_cube_8_14_12]
{
name: "GEO",
index: "target_cube_8_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 66.000, 44.000] // mm
}


// -------- GEO[target_cube_8_14_14]
{
name: "GEO",
index: "target_cube_8_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 66.000, 66.000] // mm
}


// -------- GEO[target_cube_8_14_16]
{
name: "GEO",
index: "target_cube_8_14_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 66.000, 88.000] // mm
}


// -------- GEO[target_cube_8_16_0]
{
name: "GEO",
index: "target_cube_8_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 88.000, -88.000] // mm
}


// -------- GEO[target_cube_8_16_2]
{
name: "GEO",
index: "target_cube_8_16_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 88.000, -66.000] // mm
}


// -------- GEO[target_cube_8_16_4]
{
name: "GEO",
index: "target_cube_8_16_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 88.000, -44.000] // mm
}


// -------- GEO[target_cube_8_16_6]
{
name: "GEO",
index: "target_cube_8_16_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 88.000, -22.000] // mm
}


// -------- GEO[target_cube_8_16_8]
{
name: "GEO",
index: "target_cube_8_16_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 88.000, 0.0] // mm
}


// -------- GEO[target_cube_8_16_10]
{
name: "GEO",
index: "target_cube_8_16_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 88.000, 22.000] // mm
}


// -------- GEO[target_cube_8_16_12]
{
name: "GEO",
index: "target_cube_8_16_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 88.000, 44.000] // mm
}


// -------- GEO[target_cube_8_16_14]
{
name: "GEO",
index: "target_cube_8_16_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 88.000, 66.000] // mm
}


// -------- GEO[target_cube_8_16_16]
{
name: "GEO",
index: "target_cube_8_16_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [0.0, 88.000, 88.000] // mm
}


// -------- GEO[target_cube_10_0_0]
{
name: "GEO",
index: "target_cube_10_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -88.000, -88.000] // mm
}


// -------- GEO[target_cube_10_0_2]
{
name: "GEO",
index: "target_cube_10_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -88.000, -66.000] // mm
}


// -------- GEO[target_cube_10_0_4]
{
name: "GEO",
index: "target_cube_10_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -88.000, -44.000] // mm
}


// -------- GEO[target_cube_10_0_6]
{
name: "GEO",
index: "target_cube_10_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -88.000, -22.000] // mm
}


// -------- GEO[target_cube_10_0_8]
{
name: "GEO",
index: "target_cube_10_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -88.000, 0.0] // mm
}


// -------- GEO[target_cube_10_0_10]
{
name: "GEO",
index: "target_cube_10_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -88.000, 22.000] // mm
}


// -------- GEO[target_cube_10_0_12]
{
name: "GEO",
index: "target_cube_10_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -88.000, 44.000] // mm
}


// -------- GEO[target_cube_10_0_14]
{
name: "GEO",
index: "target_cube_10_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -88.000, 66.000] // mm
}


// -------- GEO[target_cube_10_0_16]
{
name: "GEO",
index: "target_cube_10_0_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -88.000, 88.000] // mm
}


// -------- GEO[target_cube_10_2_0]
{
name: "GEO",
index: "target_cube_10_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -66.000, -88.000] // mm
}


// -------- GEO[target_cube_10_2_2]
{
name: "GEO",
index: "target_cube_10_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -66.000, -66.000] // mm
}


// -------- GEO[target_cube_10_2_4]
{
name: "GEO",
index: "target_cube_10_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -66.000, -44.000] // mm
}


// -------- GEO[target_cube_10_2_6]
{
name: "GEO",
index: "target_cube_10_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -66.000, -22.000] // mm
}


// -------- GEO[target_cube_10_2_8]
{
name: "GEO",
index: "target_cube_10_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -66.000, 0.0] // mm
}


// -------- GEO[target_cube_10_2_10]
{
name: "GEO",
index: "target_cube_10_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -66.000, 22.000] // mm
}


// -------- GEO[target_cube_10_2_12]
{
name: "GEO",
index: "target_cube_10_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -66.000, 44.000] // mm
}


// -------- GEO[target_cube_10_2_14]
{
name: "GEO",
index: "target_cube_10_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -66.000, 66.000] // mm
}


// -------- GEO[target_cube_10_2_16]
{
name: "GEO",
index: "target_cube_10_2_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -66.000, 88.000] // mm
}


// -------- GEO[target_cube_10_4_0]
{
name: "GEO",
index: "target_cube_10_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -44.000, -88.000] // mm
}


// -------- GEO[target_cube_10_4_2]
{
name: "GEO",
index: "target_cube_10_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -44.000, -66.000] // mm
}


// -------- GEO[target_cube_10_4_4]
{
name: "GEO",
index: "target_cube_10_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_10_4_6]
{
name: "GEO",
index: "target_cube_10_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_10_4_8]
{
name: "GEO",
index: "target_cube_10_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_10_4_10]
{
name: "GEO",
index: "target_cube_10_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_10_4_12]
{
name: "GEO",
index: "target_cube_10_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_10_4_14]
{
name: "GEO",
index: "target_cube_10_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -44.000, 66.000] // mm
}


// -------- GEO[target_cube_10_4_16]
{
name: "GEO",
index: "target_cube_10_4_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -44.000, 88.000] // mm
}


// -------- GEO[target_cube_10_6_0]
{
name: "GEO",
index: "target_cube_10_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -22.000, -88.000] // mm
}


// -------- GEO[target_cube_10_6_2]
{
name: "GEO",
index: "target_cube_10_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -22.000, -66.000] // mm
}


// -------- GEO[target_cube_10_6_4]
{
name: "GEO",
index: "target_cube_10_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_10_6_6]
{
name: "GEO",
index: "target_cube_10_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_10_6_8]
{
name: "GEO",
index: "target_cube_10_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_10_6_10]
{
name: "GEO",
index: "target_cube_10_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_10_6_12]
{
name: "GEO",
index: "target_cube_10_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_10_6_14]
{
name: "GEO",
index: "target_cube_10_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -22.000, 66.000] // mm
}


// -------- GEO[target_cube_10_6_16]
{
name: "GEO",
index: "target_cube_10_6_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, -22.000, 88.000] // mm
}


// -------- GEO[target_cube_10_8_0]
{
name: "GEO",
index: "target_cube_10_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 0.0, -88.000] // mm
}


// -------- GEO[target_cube_10_8_2]
{
name: "GEO",
index: "target_cube_10_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 0.0, -66.000] // mm
}


// -------- GEO[target_cube_10_8_4]
{
name: "GEO",
index: "target_cube_10_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_10_8_6]
{
name: "GEO",
index: "target_cube_10_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_10_8_8]
{
name: "GEO",
index: "target_cube_10_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_10_8_10]
{
name: "GEO",
index: "target_cube_10_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_10_8_12]
{
name: "GEO",
index: "target_cube_10_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_10_8_14]
{
name: "GEO",
index: "target_cube_10_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 0.0, 66.000] // mm
}


// -------- GEO[target_cube_10_8_16]
{
name: "GEO",
index: "target_cube_10_8_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 0.0, 88.000] // mm
}


// -------- GEO[target_cube_10_10_0]
{
name: "GEO",
index: "target_cube_10_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 22.000, -88.000] // mm
}


// -------- GEO[target_cube_10_10_2]
{
name: "GEO",
index: "target_cube_10_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 22.000, -66.000] // mm
}


// -------- GEO[target_cube_10_10_4]
{
name: "GEO",
index: "target_cube_10_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_10_10_6]
{
name: "GEO",
index: "target_cube_10_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_10_10_8]
{
name: "GEO",
index: "target_cube_10_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_10_10_10]
{
name: "GEO",
index: "target_cube_10_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_10_10_12]
{
name: "GEO",
index: "target_cube_10_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_10_10_14]
{
name: "GEO",
index: "target_cube_10_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 22.000, 66.000] // mm
}


// -------- GEO[target_cube_10_10_16]
{
name: "GEO",
index: "target_cube_10_10_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 22.000, 88.000] // mm
}


// -------- GEO[target_cube_10_12_0]
{
name: "GEO",
index: "target_cube_10_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 44.000, -88.000] // mm
}


// -------- GEO[target_cube_10_12_2]
{
name: "GEO",
index: "target_cube_10_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 44.000, -66.000] // mm
}


// -------- GEO[target_cube_10_12_4]
{
name: "GEO",
index: "target_cube_10_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_10_12_6]
{
name: "GEO",
index: "target_cube_10_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_10_12_8]
{
name: "GEO",
index: "target_cube_10_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_10_12_10]
{
name: "GEO",
index: "target_cube_10_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_10_12_12]
{
name: "GEO",
index: "target_cube_10_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_10_12_14]
{
name: "GEO",
index: "target_cube_10_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 44.000, 66.000] // mm
}


// -------- GEO[target_cube_10_12_16]
{
name: "GEO",
index: "target_cube_10_12_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 44.000, 88.000] // mm
}


// -------- GEO[target_cube_10_14_0]
{
name: "GEO",
index: "target_cube_10_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 66.000, -88.000] // mm
}


// -------- GEO[target_cube_10_14_2]
{
name: "GEO",
index: "target_cube_10_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 66.000, -66.000] // mm
}


// -------- GEO[target_cube_10_14_4]
{
name: "GEO",
index: "target_cube_10_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 66.000, -44.000] // mm
}


// -------- GEO[target_cube_10_14_6]
{
name: "GEO",
index: "target_cube_10_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 66.000, -22.000] // mm
}


// -------- GEO[target_cube_10_14_8]
{
name: "GEO",
index: "target_cube_10_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 66.000, 0.0] // mm
}


// -------- GEO[target_cube_10_14_10]
{
name: "GEO",
index: "target_cube_10_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 66.000, 22.000] // mm
}


// -------- GEO[target_cube_10_14_12]
{
name: "GEO",
index: "target_cube_10_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 66.000, 44.000] // mm
}


// -------- GEO[target_cube_10_14_14]
{
name: "GEO",
index: "target_cube_10_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 66.000, 66.000] // mm
}


// -------- GEO[target_cube_10_14_16]
{
name: "GEO",
index: "target_cube_10_14_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 66.000, 88.000] // mm
}


// -------- GEO[target_cube_10_16_0]
{
name: "GEO",
index: "target_cube_10_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 88.000, -88.000] // mm
}


// -------- GEO[target_cube_10_16_2]
{
name: "GEO",
index: "target_cube_10_16_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 88.000, -66.000] // mm
}


// -------- GEO[target_cube_10_16_4]
{
name: "GEO",
index: "target_cube_10_16_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 88.000, -44.000] // mm
}


// -------- GEO[target_cube_10_16_6]
{
name: "GEO",
index: "target_cube_10_16_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 88.000, -22.000] // mm
}


// -------- GEO[target_cube_10_16_8]
{
name: "GEO",
index: "target_cube_10_16_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 88.000, 0.0] // mm
}


// -------- GEO[target_cube_10_16_10]
{
name: "GEO",
index: "target_cube_10_16_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 88.000, 22.000] // mm
}


// -------- GEO[target_cube_10_16_12]
{
name: "GEO",
index: "target_cube_10_16_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 88.000, 44.000] // mm
}


// -------- GEO[target_cube_10_16_14]
{
name: "GEO",
index: "target_cube_10_16_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 88.000, 66.000] // mm
}


// -------- GEO[target_cube_10_16_16]
{
name: "GEO",
index: "target_cube_10_16_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [22.000, 88.000, 88.000] // mm
}


// -------- GEO[target_cube_12_0_0]
{
name: "GEO",
index: "target_cube_12_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -88.000, -88.000] // mm
}


// -------- GEO[target_cube_12_0_2]
{
name: "GEO",
index: "target_cube_12_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -88.000, -66.000] // mm
}


// -------- GEO[target_cube_12_0_4]
{
name: "GEO",
index: "target_cube_12_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -88.000, -44.000] // mm
}


// -------- GEO[target_cube_12_0_6]
{
name: "GEO",
index: "target_cube_12_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -88.000, -22.000] // mm
}


// -------- GEO[target_cube_12_0_8]
{
name: "GEO",
index: "target_cube_12_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -88.000, 0.0] // mm
}


// -------- GEO[target_cube_12_0_10]
{
name: "GEO",
index: "target_cube_12_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -88.000, 22.000] // mm
}


// -------- GEO[target_cube_12_0_12]
{
name: "GEO",
index: "target_cube_12_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -88.000, 44.000] // mm
}


// -------- GEO[target_cube_12_0_14]
{
name: "GEO",
index: "target_cube_12_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -88.000, 66.000] // mm
}


// -------- GEO[target_cube_12_0_16]
{
name: "GEO",
index: "target_cube_12_0_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -88.000, 88.000] // mm
}


// -------- GEO[target_cube_12_2_0]
{
name: "GEO",
index: "target_cube_12_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -66.000, -88.000] // mm
}


// -------- GEO[target_cube_12_2_2]
{
name: "GEO",
index: "target_cube_12_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -66.000, -66.000] // mm
}


// -------- GEO[target_cube_12_2_4]
{
name: "GEO",
index: "target_cube_12_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -66.000, -44.000] // mm
}


// -------- GEO[target_cube_12_2_6]
{
name: "GEO",
index: "target_cube_12_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -66.000, -22.000] // mm
}


// -------- GEO[target_cube_12_2_8]
{
name: "GEO",
index: "target_cube_12_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -66.000, 0.0] // mm
}


// -------- GEO[target_cube_12_2_10]
{
name: "GEO",
index: "target_cube_12_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -66.000, 22.000] // mm
}


// -------- GEO[target_cube_12_2_12]
{
name: "GEO",
index: "target_cube_12_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -66.000, 44.000] // mm
}


// -------- GEO[target_cube_12_2_14]
{
name: "GEO",
index: "target_cube_12_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -66.000, 66.000] // mm
}


// -------- GEO[target_cube_12_2_16]
{
name: "GEO",
index: "target_cube_12_2_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -66.000, 88.000] // mm
}


// -------- GEO[target_cube_12_4_0]
{
name: "GEO",
index: "target_cube_12_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -44.000, -88.000] // mm
}


// -------- GEO[target_cube_12_4_2]
{
name: "GEO",
index: "target_cube_12_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -44.000, -66.000] // mm
}


// -------- GEO[target_cube_12_4_4]
{
name: "GEO",
index: "target_cube_12_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_12_4_6]
{
name: "GEO",
index: "target_cube_12_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_12_4_8]
{
name: "GEO",
index: "target_cube_12_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_12_4_10]
{
name: "GEO",
index: "target_cube_12_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_12_4_12]
{
name: "GEO",
index: "target_cube_12_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_12_4_14]
{
name: "GEO",
index: "target_cube_12_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -44.000, 66.000] // mm
}


// -------- GEO[target_cube_12_4_16]
{
name: "GEO",
index: "target_cube_12_4_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -44.000, 88.000] // mm
}


// -------- GEO[target_cube_12_6_0]
{
name: "GEO",
index: "target_cube_12_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -22.000, -88.000] // mm
}


// -------- GEO[target_cube_12_6_2]
{
name: "GEO",
index: "target_cube_12_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -22.000, -66.000] // mm
}


// -------- GEO[target_cube_12_6_4]
{
name: "GEO",
index: "target_cube_12_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_12_6_6]
{
name: "GEO",
index: "target_cube_12_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_12_6_8]
{
name: "GEO",
index: "target_cube_12_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_12_6_10]
{
name: "GEO",
index: "target_cube_12_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_12_6_12]
{
name: "GEO",
index: "target_cube_12_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_12_6_14]
{
name: "GEO",
index: "target_cube_12_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -22.000, 66.000] // mm
}


// -------- GEO[target_cube_12_6_16]
{
name: "GEO",
index: "target_cube_12_6_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, -22.000, 88.000] // mm
}


// -------- GEO[target_cube_12_8_0]
{
name: "GEO",
index: "target_cube_12_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 0.0, -88.000] // mm
}


// -------- GEO[target_cube_12_8_2]
{
name: "GEO",
index: "target_cube_12_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 0.0, -66.000] // mm
}


// -------- GEO[target_cube_12_8_4]
{
name: "GEO",
index: "target_cube_12_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_12_8_6]
{
name: "GEO",
index: "target_cube_12_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_12_8_8]
{
name: "GEO",
index: "target_cube_12_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_12_8_10]
{
name: "GEO",
index: "target_cube_12_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_12_8_12]
{
name: "GEO",
index: "target_cube_12_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_12_8_14]
{
name: "GEO",
index: "target_cube_12_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 0.0, 66.000] // mm
}


// -------- GEO[target_cube_12_8_16]
{
name: "GEO",
index: "target_cube_12_8_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 0.0, 88.000] // mm
}


// -------- GEO[target_cube_12_10_0]
{
name: "GEO",
index: "target_cube_12_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 22.000, -88.000] // mm
}


// -------- GEO[target_cube_12_10_2]
{
name: "GEO",
index: "target_cube_12_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 22.000, -66.000] // mm
}


// -------- GEO[target_cube_12_10_4]
{
name: "GEO",
index: "target_cube_12_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_12_10_6]
{
name: "GEO",
index: "target_cube_12_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_12_10_8]
{
name: "GEO",
index: "target_cube_12_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_12_10_10]
{
name: "GEO",
index: "target_cube_12_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_12_10_12]
{
name: "GEO",
index: "target_cube_12_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_12_10_14]
{
name: "GEO",
index: "target_cube_12_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 22.000, 66.000] // mm
}


// -------- GEO[target_cube_12_10_16]
{
name: "GEO",
index: "target_cube_12_10_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 22.000, 88.000] // mm
}


// -------- GEO[target_cube_12_12_0]
{
name: "GEO",
index: "target_cube_12_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 44.000, -88.000] // mm
}


// -------- GEO[target_cube_12_12_2]
{
name: "GEO",
index: "target_cube_12_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 44.000, -66.000] // mm
}


// -------- GEO[target_cube_12_12_4]
{
name: "GEO",
index: "target_cube_12_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_12_12_6]
{
name: "GEO",
index: "target_cube_12_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_12_12_8]
{
name: "GEO",
index: "target_cube_12_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_12_12_10]
{
name: "GEO",
index: "target_cube_12_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_12_12_12]
{
name: "GEO",
index: "target_cube_12_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_12_12_14]
{
name: "GEO",
index: "target_cube_12_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 44.000, 66.000] // mm
}


// -------- GEO[target_cube_12_12_16]
{
name: "GEO",
index: "target_cube_12_12_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 44.000, 88.000] // mm
}


// -------- GEO[target_cube_12_14_0]
{
name: "GEO",
index: "target_cube_12_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 66.000, -88.000] // mm
}


// -------- GEO[target_cube_12_14_2]
{
name: "GEO",
index: "target_cube_12_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 66.000, -66.000] // mm
}


// -------- GEO[target_cube_12_14_4]
{
name: "GEO",
index: "target_cube_12_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 66.000, -44.000] // mm
}


// -------- GEO[target_cube_12_14_6]
{
name: "GEO",
index: "target_cube_12_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 66.000, -22.000] // mm
}


// -------- GEO[target_cube_12_14_8]
{
name: "GEO",
index: "target_cube_12_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 66.000, 0.0] // mm
}


// -------- GEO[target_cube_12_14_10]
{
name: "GEO",
index: "target_cube_12_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 66.000, 22.000] // mm
}


// -------- GEO[target_cube_12_14_12]
{
name: "GEO",
index: "target_cube_12_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 66.000, 44.000] // mm
}


// -------- GEO[target_cube_12_14_14]
{
name: "GEO",
index: "target_cube_12_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 66.000, 66.000] // mm
}


// -------- GEO[target_cube_12_14_16]
{
name: "GEO",
index: "target_cube_12_14_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 66.000, 88.000] // mm
}


// -------- GEO[target_cube_12_16_0]
{
name: "GEO",
index: "target_cube_12_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 88.000, -88.000] // mm
}


// -------- GEO[target_cube_12_16_2]
{
name: "GEO",
index: "target_cube_12_16_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 88.000, -66.000] // mm
}


// -------- GEO[target_cube_12_16_4]
{
name: "GEO",
index: "target_cube_12_16_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 88.000, -44.000] // mm
}


// -------- GEO[target_cube_12_16_6]
{
name: "GEO",
index: "target_cube_12_16_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 88.000, -22.000] // mm
}


// -------- GEO[target_cube_12_16_8]
{
name: "GEO",
index: "target_cube_12_16_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 88.000, 0.0] // mm
}


// -------- GEO[target_cube_12_16_10]
{
name: "GEO",
index: "target_cube_12_16_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 88.000, 22.000] // mm
}


// -------- GEO[target_cube_12_16_12]
{
name: "GEO",
index: "target_cube_12_16_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 88.000, 44.000] // mm
}


// -------- GEO[target_cube_12_16_14]
{
name: "GEO",
index: "target_cube_12_16_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 88.000, 66.000] // mm
}


// -------- GEO[target_cube_12_16_16]
{
name: "GEO",
index: "target_cube_12_16_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [44.000, 88.000, 88.000] // mm
}


// -------- GEO[target_cube_14_0_0]
{
name: "GEO",
index: "target_cube_14_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -88.000, -88.000] // mm
}


// -------- GEO[target_cube_14_0_2]
{
name: "GEO",
index: "target_cube_14_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -88.000, -66.000] // mm
}


// -------- GEO[target_cube_14_0_4]
{
name: "GEO",
index: "target_cube_14_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -88.000, -44.000] // mm
}


// -------- GEO[target_cube_14_0_6]
{
name: "GEO",
index: "target_cube_14_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -88.000, -22.000] // mm
}


// -------- GEO[target_cube_14_0_8]
{
name: "GEO",
index: "target_cube_14_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -88.000, 0.0] // mm
}


// -------- GEO[target_cube_14_0_10]
{
name: "GEO",
index: "target_cube_14_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -88.000, 22.000] // mm
}


// -------- GEO[target_cube_14_0_12]
{
name: "GEO",
index: "target_cube_14_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -88.000, 44.000] // mm
}


// -------- GEO[target_cube_14_0_14]
{
name: "GEO",
index: "target_cube_14_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -88.000, 66.000] // mm
}


// -------- GEO[target_cube_14_0_16]
{
name: "GEO",
index: "target_cube_14_0_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -88.000, 88.000] // mm
}


// -------- GEO[target_cube_14_2_0]
{
name: "GEO",
index: "target_cube_14_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -66.000, -88.000] // mm
}


// -------- GEO[target_cube_14_2_2]
{
name: "GEO",
index: "target_cube_14_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -66.000, -66.000] // mm
}


// -------- GEO[target_cube_14_2_4]
{
name: "GEO",
index: "target_cube_14_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -66.000, -44.000] // mm
}


// -------- GEO[target_cube_14_2_6]
{
name: "GEO",
index: "target_cube_14_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -66.000, -22.000] // mm
}


// -------- GEO[target_cube_14_2_8]
{
name: "GEO",
index: "target_cube_14_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -66.000, 0.0] // mm
}


// -------- GEO[target_cube_14_2_10]
{
name: "GEO",
index: "target_cube_14_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -66.000, 22.000] // mm
}


// -------- GEO[target_cube_14_2_12]
{
name: "GEO",
index: "target_cube_14_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -66.000, 44.000] // mm
}


// -------- GEO[target_cube_14_2_14]
{
name: "GEO",
index: "target_cube_14_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -66.000, 66.000] // mm
}


// -------- GEO[target_cube_14_2_16]
{
name: "GEO",
index: "target_cube_14_2_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -66.000, 88.000] // mm
}


// -------- GEO[target_cube_14_4_0]
{
name: "GEO",
index: "target_cube_14_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -44.000, -88.000] // mm
}


// -------- GEO[target_cube_14_4_2]
{
name: "GEO",
index: "target_cube_14_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -44.000, -66.000] // mm
}


// -------- GEO[target_cube_14_4_4]
{
name: "GEO",
index: "target_cube_14_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_14_4_6]
{
name: "GEO",
index: "target_cube_14_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_14_4_8]
{
name: "GEO",
index: "target_cube_14_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_14_4_10]
{
name: "GEO",
index: "target_cube_14_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_14_4_12]
{
name: "GEO",
index: "target_cube_14_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_14_4_14]
{
name: "GEO",
index: "target_cube_14_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -44.000, 66.000] // mm
}


// -------- GEO[target_cube_14_4_16]
{
name: "GEO",
index: "target_cube_14_4_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -44.000, 88.000] // mm
}


// -------- GEO[target_cube_14_6_0]
{
name: "GEO",
index: "target_cube_14_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -22.000, -88.000] // mm
}


// -------- GEO[target_cube_14_6_2]
{
name: "GEO",
index: "target_cube_14_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -22.000, -66.000] // mm
}


// -------- GEO[target_cube_14_6_4]
{
name: "GEO",
index: "target_cube_14_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_14_6_6]
{
name: "GEO",
index: "target_cube_14_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_14_6_8]
{
name: "GEO",
index: "target_cube_14_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_14_6_10]
{
name: "GEO",
index: "target_cube_14_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_14_6_12]
{
name: "GEO",
index: "target_cube_14_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_14_6_14]
{
name: "GEO",
index: "target_cube_14_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -22.000, 66.000] // mm
}


// -------- GEO[target_cube_14_6_16]
{
name: "GEO",
index: "target_cube_14_6_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, -22.000, 88.000] // mm
}


// -------- GEO[target_cube_14_8_0]
{
name: "GEO",
index: "target_cube_14_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 0.0, -88.000] // mm
}


// -------- GEO[target_cube_14_8_2]
{
name: "GEO",
index: "target_cube_14_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 0.0, -66.000] // mm
}


// -------- GEO[target_cube_14_8_4]
{
name: "GEO",
index: "target_cube_14_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_14_8_6]
{
name: "GEO",
index: "target_cube_14_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_14_8_8]
{
name: "GEO",
index: "target_cube_14_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_14_8_10]
{
name: "GEO",
index: "target_cube_14_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_14_8_12]
{
name: "GEO",
index: "target_cube_14_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_14_8_14]
{
name: "GEO",
index: "target_cube_14_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 0.0, 66.000] // mm
}


// -------- GEO[target_cube_14_8_16]
{
name: "GEO",
index: "target_cube_14_8_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 0.0, 88.000] // mm
}


// -------- GEO[target_cube_14_10_0]
{
name: "GEO",
index: "target_cube_14_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 22.000, -88.000] // mm
}


// -------- GEO[target_cube_14_10_2]
{
name: "GEO",
index: "target_cube_14_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 22.000, -66.000] // mm
}


// -------- GEO[target_cube_14_10_4]
{
name: "GEO",
index: "target_cube_14_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_14_10_6]
{
name: "GEO",
index: "target_cube_14_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_14_10_8]
{
name: "GEO",
index: "target_cube_14_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_14_10_10]
{
name: "GEO",
index: "target_cube_14_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_14_10_12]
{
name: "GEO",
index: "target_cube_14_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_14_10_14]
{
name: "GEO",
index: "target_cube_14_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 22.000, 66.000] // mm
}


// -------- GEO[target_cube_14_10_16]
{
name: "GEO",
index: "target_cube_14_10_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 22.000, 88.000] // mm
}


// -------- GEO[target_cube_14_12_0]
{
name: "GEO",
index: "target_cube_14_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 44.000, -88.000] // mm
}


// -------- GEO[target_cube_14_12_2]
{
name: "GEO",
index: "target_cube_14_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 44.000, -66.000] // mm
}


// -------- GEO[target_cube_14_12_4]
{
name: "GEO",
index: "target_cube_14_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_14_12_6]
{
name: "GEO",
index: "target_cube_14_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_14_12_8]
{
name: "GEO",
index: "target_cube_14_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_14_12_10]
{
name: "GEO",
index: "target_cube_14_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_14_12_12]
{
name: "GEO",
index: "target_cube_14_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_14_12_14]
{
name: "GEO",
index: "target_cube_14_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 44.000, 66.000] // mm
}


// -------- GEO[target_cube_14_12_16]
{
name: "GEO",
index: "target_cube_14_12_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 44.000, 88.000] // mm
}


// -------- GEO[target_cube_14_14_0]
{
name: "GEO",
index: "target_cube_14_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 66.000, -88.000] // mm
}


// -------- GEO[target_cube_14_14_2]
{
name: "GEO",
index: "target_cube_14_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 66.000, -66.000] // mm
}


// -------- GEO[target_cube_14_14_4]
{
name: "GEO",
index: "target_cube_14_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 66.000, -44.000] // mm
}


// -------- GEO[target_cube_14_14_6]
{
name: "GEO",
index: "target_cube_14_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 66.000, -22.000] // mm
}


// -------- GEO[target_cube_14_14_8]
{
name: "GEO",
index: "target_cube_14_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 66.000, 0.0] // mm
}


// -------- GEO[target_cube_14_14_10]
{
name: "GEO",
index: "target_cube_14_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 66.000, 22.000] // mm
}


// -------- GEO[target_cube_14_14_12]
{
name: "GEO",
index: "target_cube_14_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 66.000, 44.000] // mm
}


// -------- GEO[target_cube_14_14_14]
{
name: "GEO",
index: "target_cube_14_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 66.000, 66.000] // mm
}


// -------- GEO[target_cube_14_14_16]
{
name: "GEO",
index: "target_cube_14_14_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 66.000, 88.000] // mm
}


// -------- GEO[target_cube_14_16_0]
{
name: "GEO",
index: "target_cube_14_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 88.000, -88.000] // mm
}


// -------- GEO[target_cube_14_16_2]
{
name: "GEO",
index: "target_cube_14_16_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 88.000, -66.000] // mm
}


// -------- GEO[target_cube_14_16_4]
{
name: "GEO",
index: "target_cube_14_16_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 88.000, -44.000] // mm
}


// -------- GEO[target_cube_14_16_6]
{
name: "GEO",
index: "target_cube_14_16_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 88.000, -22.000] // mm
}


// -------- GEO[target_cube_14_16_8]
{
name: "GEO",
index: "target_cube_14_16_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 88.000, 0.0] // mm
}


// -------- GEO[target_cube_14_16_10]
{
name: "GEO",
index: "target_cube_14_16_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 88.000, 22.000] // mm
}


// -------- GEO[target_cube_14_16_12]
{
name: "GEO",
index: "target_cube_14_16_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 88.000, 44.000] // mm
}


// -------- GEO[target_cube_14_16_14]
{
name: "GEO",
index: "target_cube_14_16_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 88.000, 66.000] // mm
}


// -------- GEO[target_cube_14_16_16]
{
name: "GEO",
index: "target_cube_14_16_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [66.000, 88.000, 88.000] // mm
}


// -------- GEO[target_cube_16_0_0]
{
name: "GEO",
index: "target_cube_16_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -88.000, -88.000] // mm
}


// -------- GEO[target_cube_16_0_2]
{
name: "GEO",
index: "target_cube_16_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -88.000, -66.000] // mm
}


// -------- GEO[target_cube_16_0_4]
{
name: "GEO",
index: "target_cube_16_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -88.000, -44.000] // mm
}


// -------- GEO[target_cube_16_0_6]
{
name: "GEO",
index: "target_cube_16_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -88.000, -22.000] // mm
}


// -------- GEO[target_cube_16_0_8]
{
name: "GEO",
index: "target_cube_16_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -88.000, 0.0] // mm
}


// -------- GEO[target_cube_16_0_10]
{
name: "GEO",
index: "target_cube_16_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -88.000, 22.000] // mm
}


// -------- GEO[target_cube_16_0_12]
{
name: "GEO",
index: "target_cube_16_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -88.000, 44.000] // mm
}


// -------- GEO[target_cube_16_0_14]
{
name: "GEO",
index: "target_cube_16_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -88.000, 66.000] // mm
}


// -------- GEO[target_cube_16_0_16]
{
name: "GEO",
index: "target_cube_16_0_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -88.000, 88.000] // mm
}


// -------- GEO[target_cube_16_2_0]
{
name: "GEO",
index: "target_cube_16_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -66.000, -88.000] // mm
}


// -------- GEO[target_cube_16_2_2]
{
name: "GEO",
index: "target_cube_16_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -66.000, -66.000] // mm
}


// -------- GEO[target_cube_16_2_4]
{
name: "GEO",
index: "target_cube_16_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -66.000, -44.000] // mm
}


// -------- GEO[target_cube_16_2_6]
{
name: "GEO",
index: "target_cube_16_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -66.000, -22.000] // mm
}


// -------- GEO[target_cube_16_2_8]
{
name: "GEO",
index: "target_cube_16_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -66.000, 0.0] // mm
}


// -------- GEO[target_cube_16_2_10]
{
name: "GEO",
index: "target_cube_16_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -66.000, 22.000] // mm
}


// -------- GEO[target_cube_16_2_12]
{
name: "GEO",
index: "target_cube_16_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -66.000, 44.000] // mm
}


// -------- GEO[target_cube_16_2_14]
{
name: "GEO",
index: "target_cube_16_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -66.000, 66.000] // mm
}


// -------- GEO[target_cube_16_2_16]
{
name: "GEO",
index: "target_cube_16_2_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -66.000, 88.000] // mm
}


// -------- GEO[target_cube_16_4_0]
{
name: "GEO",
index: "target_cube_16_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -44.000, -88.000] // mm
}


// -------- GEO[target_cube_16_4_2]
{
name: "GEO",
index: "target_cube_16_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -44.000, -66.000] // mm
}


// -------- GEO[target_cube_16_4_4]
{
name: "GEO",
index: "target_cube_16_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -44.000, -44.000] // mm
}


// -------- GEO[target_cube_16_4_6]
{
name: "GEO",
index: "target_cube_16_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -44.000, -22.000] // mm
}


// -------- GEO[target_cube_16_4_8]
{
name: "GEO",
index: "target_cube_16_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -44.000, 0.0] // mm
}


// -------- GEO[target_cube_16_4_10]
{
name: "GEO",
index: "target_cube_16_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -44.000, 22.000] // mm
}


// -------- GEO[target_cube_16_4_12]
{
name: "GEO",
index: "target_cube_16_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -44.000, 44.000] // mm
}


// -------- GEO[target_cube_16_4_14]
{
name: "GEO",
index: "target_cube_16_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -44.000, 66.000] // mm
}


// -------- GEO[target_cube_16_4_16]
{
name: "GEO",
index: "target_cube_16_4_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -44.000, 88.000] // mm
}


// -------- GEO[target_cube_16_6_0]
{
name: "GEO",
index: "target_cube_16_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -22.000, -88.000] // mm
}


// -------- GEO[target_cube_16_6_2]
{
name: "GEO",
index: "target_cube_16_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -22.000, -66.000] // mm
}


// -------- GEO[target_cube_16_6_4]
{
name: "GEO",
index: "target_cube_16_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -22.000, -44.000] // mm
}


// -------- GEO[target_cube_16_6_6]
{
name: "GEO",
index: "target_cube_16_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -22.000, -22.000] // mm
}


// -------- GEO[target_cube_16_6_8]
{
name: "GEO",
index: "target_cube_16_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -22.000, 0.0] // mm
}


// -------- GEO[target_cube_16_6_10]
{
name: "GEO",
index: "target_cube_16_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -22.000, 22.000] // mm
}


// -------- GEO[target_cube_16_6_12]
{
name: "GEO",
index: "target_cube_16_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -22.000, 44.000] // mm
}


// -------- GEO[target_cube_16_6_14]
{
name: "GEO",
index: "target_cube_16_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -22.000, 66.000] // mm
}


// -------- GEO[target_cube_16_6_16]
{
name: "GEO",
index: "target_cube_16_6_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, -22.000, 88.000] // mm
}


// -------- GEO[target_cube_16_8_0]
{
name: "GEO",
index: "target_cube_16_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 0.0, -88.000] // mm
}


// -------- GEO[target_cube_16_8_2]
{
name: "GEO",
index: "target_cube_16_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 0.0, -66.000] // mm
}


// -------- GEO[target_cube_16_8_4]
{
name: "GEO",
index: "target_cube_16_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 0.0, -44.000] // mm
}


// -------- GEO[target_cube_16_8_6]
{
name: "GEO",
index: "target_cube_16_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 0.0, -22.000] // mm
}


// -------- GEO[target_cube_16_8_8]
{
name: "GEO",
index: "target_cube_16_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_16_8_10]
{
name: "GEO",
index: "target_cube_16_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 0.0, 22.000] // mm
}


// -------- GEO[target_cube_16_8_12]
{
name: "GEO",
index: "target_cube_16_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 0.0, 44.000] // mm
}


// -------- GEO[target_cube_16_8_14]
{
name: "GEO",
index: "target_cube_16_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 0.0, 66.000] // mm
}


// -------- GEO[target_cube_16_8_16]
{
name: "GEO",
index: "target_cube_16_8_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 0.0, 88.000] // mm
}


// -------- GEO[target_cube_16_10_0]
{
name: "GEO",
index: "target_cube_16_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 22.000, -88.000] // mm
}


// -------- GEO[target_cube_16_10_2]
{
name: "GEO",
index: "target_cube_16_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 22.000, -66.000] // mm
}


// -------- GEO[target_cube_16_10_4]
{
name: "GEO",
index: "target_cube_16_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 22.000, -44.000] // mm
}


// -------- GEO[target_cube_16_10_6]
{
name: "GEO",
index: "target_cube_16_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 22.000, -22.000] // mm
}


// -------- GEO[target_cube_16_10_8]
{
name: "GEO",
index: "target_cube_16_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 22.000, 0.0] // mm
}


// -------- GEO[target_cube_16_10_10]
{
name: "GEO",
index: "target_cube_16_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 22.000, 22.000] // mm
}


// -------- GEO[target_cube_16_10_12]
{
name: "GEO",
index: "target_cube_16_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 22.000, 44.000] // mm
}


// -------- GEO[target_cube_16_10_14]
{
name: "GEO",
index: "target_cube_16_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 22.000, 66.000] // mm
}


// -------- GEO[target_cube_16_10_16]
{
name: "GEO",
index: "target_cube_16_10_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 22.000, 88.000] // mm
}


// -------- GEO[target_cube_16_12_0]
{
name: "GEO",
index: "target_cube_16_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 44.000, -88.000] // mm
}


// -------- GEO[target_cube_16_12_2]
{
name: "GEO",
index: "target_cube_16_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 44.000, -66.000] // mm
}


// -------- GEO[target_cube_16_12_4]
{
name: "GEO",
index: "target_cube_16_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 44.000, -44.000] // mm
}


// -------- GEO[target_cube_16_12_6]
{
name: "GEO",
index: "target_cube_16_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 44.000, -22.000] // mm
}


// -------- GEO[target_cube_16_12_8]
{
name: "GEO",
index: "target_cube_16_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 44.000, 0.0] // mm
}


// -------- GEO[target_cube_16_12_10]
{
name: "GEO",
index: "target_cube_16_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 44.000, 22.000] // mm
}


// -------- GEO[target_cube_16_12_12]
{
name: "GEO",
index: "target_cube_16_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 44.000, 44.000] // mm
}


// -------- GEO[target_cube_16_12_14]
{
name: "GEO",
index: "target_cube_16_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 44.000, 66.000] // mm
}


// -------- GEO[target_cube_16_12_16]
{
name: "GEO",
index: "target_cube_16_12_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 44.000, 88.000] // mm
}


// -------- GEO[target_cube_16_14_0]
{
name: "GEO",
index: "target_cube_16_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 66.000, -88.000] // mm
}


// -------- GEO[target_cube_16_14_2]
{
name: "GEO",
index: "target_cube_16_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 66.000, -66.000] // mm
}


// -------- GEO[target_cube_16_14_4]
{
name: "GEO",
index: "target_cube_16_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 66.000, -44.000] // mm
}


// -------- GEO[target_cube_16_14_6]
{
name: "GEO",
index: "target_cube_16_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 66.000, -22.000] // mm
}


// -------- GEO[target_cube_16_14_8]
{
name: "GEO",
index: "target_cube_16_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 66.000, 0.0] // mm
}


// -------- GEO[target_cube_16_14_10]
{
name: "GEO",
index: "target_cube_16_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 66.000, 22.000] // mm
}


// -------- GEO[target_cube_16_14_12]
{
name: "GEO",
index: "target_cube_16_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 66.000, 44.000] // mm
}


// -------- GEO[target_cube_16_14_14]
{
name: "GEO",
index: "target_cube_16_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 66.000, 66.000] // mm
}


// -------- GEO[target_cube_16_14_16]
{
name: "GEO",
index: "target_cube_16_14_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 66.000, 88.000] // mm
}


// -------- GEO[target_cube_16_16_0]
{
name: "GEO",
index: "target_cube_16_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 88.000, -88.000] // mm
}


// -------- GEO[target_cube_16_16_2]
{
name: "GEO",
index: "target_cube_16_16_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 88.000, -66.000] // mm
}


// -------- GEO[target_cube_16_16_4]
{
name: "GEO",
index: "target_cube_16_16_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 88.000, -44.000] // mm
}


// -------- GEO[target_cube_16_16_6]
{
name: "GEO",
index: "target_cube_16_16_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 88.000, -22.000] // mm
}


// -------- GEO[target_cube_16_16_8]
{
name: "GEO",
index: "target_cube_16_16_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 88.000, 0.0] // mm
}


// -------- GEO[target_cube_16_16_10]
{
name: "GEO",
index: "target_cube_16_16_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 88.000, 22.000] // mm
}


// -------- GEO[target_cube_16_16_12]
{
name: "GEO",
index: "target_cube_16_16_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 88.000, 44.000] // mm
}


// -------- GEO[target_cube_16_16_14]
{
name: "GEO",
index: "target_cube_16_16_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 88.000, 66.000] // mm
}


// -------- GEO[target_cube_16_16_16]
{
name: "GEO",
index: "target_cube_16_16_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cube_array",
type: "box",
size: [5.0, 5.0, 5.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cube
color: [0.0, 1.0, 1.0, 1.0], // active cube
position: [88.000, 88.000, 88.000] // mm
}


