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
valid_end: [0, 0],
mother: "world",
type: "box",
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

// -------- GEO[source]
{
name: "GEO",
index: "source",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [1.0, 27.0, 200.0], // mm
material: "air",
invisible: 0,
position: [-100.0, 0.0, 0.0] // mm
}

// DETECTOR ELEMENTS

// -------- GEO[target_cell_array]
{
name: "GEO",
index: "target_cell_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [24.000, 24.000, 200.500], // mm
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
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-21.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_0_1_0]
{
name: "GEO",
index: "target_cell_0_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-21.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_0_2_0]
{
name: "GEO",
index: "target_cell_0_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-21.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_0_3_0]
{
name: "GEO",
index: "target_cell_0_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-21.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_0_4_0]
{
name: "GEO",
index: "target_cell_0_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-21.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_0_5_0]
{
name: "GEO",
index: "target_cell_0_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-21.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_0_6_0]
{
name: "GEO",
index: "target_cell_0_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-21.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_0_7_0]
{
name: "GEO",
index: "target_cell_0_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-21.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_1_0_0]
{
name: "GEO",
index: "target_cell_1_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-15.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_1_1_0]
{
name: "GEO",
index: "target_cell_1_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-15.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_1_2_0]
{
name: "GEO",
index: "target_cell_1_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-15.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_1_3_0]
{
name: "GEO",
index: "target_cell_1_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-15.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_1_4_0]
{
name: "GEO",
index: "target_cell_1_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-15.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_1_5_0]
{
name: "GEO",
index: "target_cell_1_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-15.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_1_6_0]
{
name: "GEO",
index: "target_cell_1_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-15.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_1_7_0]
{
name: "GEO",
index: "target_cell_1_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-15.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_2_0_0]
{
name: "GEO",
index: "target_cell_2_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-9.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_2_1_0]
{
name: "GEO",
index: "target_cell_2_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-9.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_2_2_0]
{
name: "GEO",
index: "target_cell_2_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-9.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_2_3_0]
{
name: "GEO",
index: "target_cell_2_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-9.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_2_4_0]
{
name: "GEO",
index: "target_cell_2_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-9.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_2_5_0]
{
name: "GEO",
index: "target_cell_2_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-9.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_2_6_0]
{
name: "GEO",
index: "target_cell_2_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-9.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_2_7_0]
{
name: "GEO",
index: "target_cell_2_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-9.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_3_0_0]
{
name: "GEO",
index: "target_cell_3_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-3.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_3_1_0]
{
name: "GEO",
index: "target_cell_3_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-3.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_3_2_0]
{
name: "GEO",
index: "target_cell_3_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-3.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_3_3_0]
{
name: "GEO",
index: "target_cell_3_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-3.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_3_4_0]
{
name: "GEO",
index: "target_cell_3_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-3.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_3_5_0]
{
name: "GEO",
index: "target_cell_3_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-3.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_3_6_0]
{
name: "GEO",
index: "target_cell_3_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-3.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_3_7_0]
{
name: "GEO",
index: "target_cell_3_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [-3.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_4_0_0]
{
name: "GEO",
index: "target_cell_4_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [3.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_4_1_0]
{
name: "GEO",
index: "target_cell_4_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [3.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_4_2_0]
{
name: "GEO",
index: "target_cell_4_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [3.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_4_3_0]
{
name: "GEO",
index: "target_cell_4_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [3.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_4_4_0]
{
name: "GEO",
index: "target_cell_4_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [3.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_4_5_0]
{
name: "GEO",
index: "target_cell_4_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [3.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_4_6_0]
{
name: "GEO",
index: "target_cell_4_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [3.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_4_7_0]
{
name: "GEO",
index: "target_cell_4_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [3.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_5_0_0]
{
name: "GEO",
index: "target_cell_5_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [9.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_5_1_0]
{
name: "GEO",
index: "target_cell_5_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [9.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_5_2_0]
{
name: "GEO",
index: "target_cell_5_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [9.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_5_3_0]
{
name: "GEO",
index: "target_cell_5_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [9.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_5_4_0]
{
name: "GEO",
index: "target_cell_5_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [9.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_5_5_0]
{
name: "GEO",
index: "target_cell_5_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [9.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_5_6_0]
{
name: "GEO",
index: "target_cell_5_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [9.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_5_7_0]
{
name: "GEO",
index: "target_cell_5_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [9.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_6_0_0]
{
name: "GEO",
index: "target_cell_6_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [15.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_6_1_0]
{
name: "GEO",
index: "target_cell_6_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [15.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_6_2_0]
{
name: "GEO",
index: "target_cell_6_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [15.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_6_3_0]
{
name: "GEO",
index: "target_cell_6_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [15.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_6_4_0]
{
name: "GEO",
index: "target_cell_6_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [15.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_6_5_0]
{
name: "GEO",
index: "target_cell_6_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [15.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_6_6_0]
{
name: "GEO",
index: "target_cell_6_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [15.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_6_7_0]
{
name: "GEO",
index: "target_cell_6_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [15.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_7_0_0]
{
name: "GEO",
index: "target_cell_7_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [21.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_7_1_0]
{
name: "GEO",
index: "target_cell_7_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [21.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_7_2_0]
{
name: "GEO",
index: "target_cell_7_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [21.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_7_3_0]
{
name: "GEO",
index: "target_cell_7_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [21.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_7_4_0]
{
name: "GEO",
index: "target_cell_7_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [21.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_7_5_0]
{
name: "GEO",
index: "target_cell_7_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [21.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_7_6_0]
{
name: "GEO",
index: "target_cell_7_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [21.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_7_7_0]
{
name: "GEO",
index: "target_cell_7_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 200.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [21.000, 21.000, 0.0] // mm
}


