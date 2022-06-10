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


//// CAVE FACES -- for visualization purposes
//// -------- GEO[cave_floor]
//{
//name: "GEO",
//index: "cave_floor",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//mother: "world",
//type: "box",
//size: [10000.0, 1.0, 10000.0], // mm
//material: "rock",
//invisible: 1,
//position: [0.0, -10000.0, 0.0] // mm
//}

//// -------- GEO[cave_ceiling]
//{
//name: "GEO",
//index: "cave_ceiling",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//mother: "world",
//type: "box",
//size: [10000.0, 1.0, 10000.0], // mm
//material: "rock",
//invisible: 1,
//position: [0.0, 10000.0, 0.0] // mm
//}
//

//// -------- GEO[cave_back]
//{
//name: "GEO",
//index: "cave_back",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//mother: "world",
//type: "box",
//size: [10000.0, 10000.0, 1.0], // mm
//material: "rock",
//invisible: 1,
//position: [0.0, 0.0, 10000.0] // mm
//}
//

//// -------- GEO[cave_lwall]
//{
//name: "GEO",
//index: "cave_lwall",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//mother: "world",
//type: "box",
//size: [1.0, 10000.0, 10000.0], // mm
//material: "rock",
//invisible: 1,
//position: [-10000.0, 0.0, 0.0] // mm
//}
//

//// -------- GEO[cave_rwall]
//{
//name: "GEO",
//index: "cave_rwall",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//mother: "world",
//type: "box",
//size: [1.0, 10000.0, 10000.0], // mm
//material: "rock",
//invisible: 1,
//position: [10000.0, 0.0, 0.0] // mm
//}

//// -------- GEO[source]
//{
//name: "GEO",
//index: "source",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//mother: "world",
//type: "box",
//size: [1.0, 27.0, 200.0], // mm
//material: "air",
//invisible: 1,
//position: [-100.0, 0.0, 0.0] // mm
//}

// DETECTOR ELEMENTS

// -------- GEO[target_cell_array]
{
name: "GEO",
index: "target_cell_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [96.000, 96.000, 400.500], // mm
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
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_0_1_0]
{
name: "GEO",
index: "target_cell_0_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_0_2_0]
{
name: "GEO",
index: "target_cell_0_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_0_3_0]
{
name: "GEO",
index: "target_cell_0_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_0_4_0]
{
name: "GEO",
index: "target_cell_0_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_0_5_0]
{
name: "GEO",
index: "target_cell_0_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_0_6_0]
{
name: "GEO",
index: "target_cell_0_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_0_7_0]
{
name: "GEO",
index: "target_cell_0_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_0_8_0]
{
name: "GEO",
index: "target_cell_0_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_0_9_0]
{
name: "GEO",
index: "target_cell_0_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_0_10_0]
{
name: "GEO",
index: "target_cell_0_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_0_11_0]
{
name: "GEO",
index: "target_cell_0_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_0_12_0]
{
name: "GEO",
index: "target_cell_0_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_0_13_0]
{
name: "GEO",
index: "target_cell_0_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_0_14_0]
{
name: "GEO",
index: "target_cell_0_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_0_15_0]
{
name: "GEO",
index: "target_cell_0_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_0_16_0]
{
name: "GEO",
index: "target_cell_0_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_0_17_0]
{
name: "GEO",
index: "target_cell_0_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_0_18_0]
{
name: "GEO",
index: "target_cell_0_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_0_19_0]
{
name: "GEO",
index: "target_cell_0_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_0_20_0]
{
name: "GEO",
index: "target_cell_0_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_0_21_0]
{
name: "GEO",
index: "target_cell_0_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_0_22_0]
{
name: "GEO",
index: "target_cell_0_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_0_23_0]
{
name: "GEO",
index: "target_cell_0_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_0_24_0]
{
name: "GEO",
index: "target_cell_0_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_0_25_0]
{
name: "GEO",
index: "target_cell_0_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_0_26_0]
{
name: "GEO",
index: "target_cell_0_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_0_27_0]
{
name: "GEO",
index: "target_cell_0_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_0_28_0]
{
name: "GEO",
index: "target_cell_0_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_0_29_0]
{
name: "GEO",
index: "target_cell_0_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_0_30_0]
{
name: "GEO",
index: "target_cell_0_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-93.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_0_31_0]
{
name: "GEO",
index: "target_cell_0_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-93.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_1_0_0]
{
name: "GEO",
index: "target_cell_1_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_1_1_0]
{
name: "GEO",
index: "target_cell_1_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_1_2_0]
{
name: "GEO",
index: "target_cell_1_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_1_3_0]
{
name: "GEO",
index: "target_cell_1_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_1_4_0]
{
name: "GEO",
index: "target_cell_1_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_1_5_0]
{
name: "GEO",
index: "target_cell_1_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_1_6_0]
{
name: "GEO",
index: "target_cell_1_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_1_7_0]
{
name: "GEO",
index: "target_cell_1_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_1_8_0]
{
name: "GEO",
index: "target_cell_1_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_1_9_0]
{
name: "GEO",
index: "target_cell_1_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_1_10_0]
{
name: "GEO",
index: "target_cell_1_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_1_11_0]
{
name: "GEO",
index: "target_cell_1_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_1_12_0]
{
name: "GEO",
index: "target_cell_1_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_1_13_0]
{
name: "GEO",
index: "target_cell_1_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_1_14_0]
{
name: "GEO",
index: "target_cell_1_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_1_15_0]
{
name: "GEO",
index: "target_cell_1_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_1_16_0]
{
name: "GEO",
index: "target_cell_1_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_1_17_0]
{
name: "GEO",
index: "target_cell_1_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_1_18_0]
{
name: "GEO",
index: "target_cell_1_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_1_19_0]
{
name: "GEO",
index: "target_cell_1_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_1_20_0]
{
name: "GEO",
index: "target_cell_1_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_1_21_0]
{
name: "GEO",
index: "target_cell_1_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_1_22_0]
{
name: "GEO",
index: "target_cell_1_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_1_23_0]
{
name: "GEO",
index: "target_cell_1_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_1_24_0]
{
name: "GEO",
index: "target_cell_1_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_1_25_0]
{
name: "GEO",
index: "target_cell_1_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_1_26_0]
{
name: "GEO",
index: "target_cell_1_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_1_27_0]
{
name: "GEO",
index: "target_cell_1_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_1_28_0]
{
name: "GEO",
index: "target_cell_1_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_1_29_0]
{
name: "GEO",
index: "target_cell_1_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_1_30_0]
{
name: "GEO",
index: "target_cell_1_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-87.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_1_31_0]
{
name: "GEO",
index: "target_cell_1_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-87.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_2_0_0]
{
name: "GEO",
index: "target_cell_2_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_2_1_0]
{
name: "GEO",
index: "target_cell_2_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_2_2_0]
{
name: "GEO",
index: "target_cell_2_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_2_3_0]
{
name: "GEO",
index: "target_cell_2_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_2_4_0]
{
name: "GEO",
index: "target_cell_2_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_2_5_0]
{
name: "GEO",
index: "target_cell_2_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_2_6_0]
{
name: "GEO",
index: "target_cell_2_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_2_7_0]
{
name: "GEO",
index: "target_cell_2_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_2_8_0]
{
name: "GEO",
index: "target_cell_2_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_2_9_0]
{
name: "GEO",
index: "target_cell_2_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_2_10_0]
{
name: "GEO",
index: "target_cell_2_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_2_11_0]
{
name: "GEO",
index: "target_cell_2_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_2_12_0]
{
name: "GEO",
index: "target_cell_2_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_2_13_0]
{
name: "GEO",
index: "target_cell_2_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_2_14_0]
{
name: "GEO",
index: "target_cell_2_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_2_15_0]
{
name: "GEO",
index: "target_cell_2_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_2_16_0]
{
name: "GEO",
index: "target_cell_2_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_2_17_0]
{
name: "GEO",
index: "target_cell_2_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_2_18_0]
{
name: "GEO",
index: "target_cell_2_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_2_19_0]
{
name: "GEO",
index: "target_cell_2_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_2_20_0]
{
name: "GEO",
index: "target_cell_2_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_2_21_0]
{
name: "GEO",
index: "target_cell_2_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_2_22_0]
{
name: "GEO",
index: "target_cell_2_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_2_23_0]
{
name: "GEO",
index: "target_cell_2_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_2_24_0]
{
name: "GEO",
index: "target_cell_2_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_2_25_0]
{
name: "GEO",
index: "target_cell_2_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_2_26_0]
{
name: "GEO",
index: "target_cell_2_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_2_27_0]
{
name: "GEO",
index: "target_cell_2_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_2_28_0]
{
name: "GEO",
index: "target_cell_2_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_2_29_0]
{
name: "GEO",
index: "target_cell_2_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_2_30_0]
{
name: "GEO",
index: "target_cell_2_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-81.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_2_31_0]
{
name: "GEO",
index: "target_cell_2_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-81.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_3_0_0]
{
name: "GEO",
index: "target_cell_3_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_3_1_0]
{
name: "GEO",
index: "target_cell_3_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_3_2_0]
{
name: "GEO",
index: "target_cell_3_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_3_3_0]
{
name: "GEO",
index: "target_cell_3_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_3_4_0]
{
name: "GEO",
index: "target_cell_3_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_3_5_0]
{
name: "GEO",
index: "target_cell_3_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_3_6_0]
{
name: "GEO",
index: "target_cell_3_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_3_7_0]
{
name: "GEO",
index: "target_cell_3_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_3_8_0]
{
name: "GEO",
index: "target_cell_3_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_3_9_0]
{
name: "GEO",
index: "target_cell_3_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_3_10_0]
{
name: "GEO",
index: "target_cell_3_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_3_11_0]
{
name: "GEO",
index: "target_cell_3_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_3_12_0]
{
name: "GEO",
index: "target_cell_3_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_3_13_0]
{
name: "GEO",
index: "target_cell_3_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_3_14_0]
{
name: "GEO",
index: "target_cell_3_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_3_15_0]
{
name: "GEO",
index: "target_cell_3_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_3_16_0]
{
name: "GEO",
index: "target_cell_3_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_3_17_0]
{
name: "GEO",
index: "target_cell_3_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_3_18_0]
{
name: "GEO",
index: "target_cell_3_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_3_19_0]
{
name: "GEO",
index: "target_cell_3_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_3_20_0]
{
name: "GEO",
index: "target_cell_3_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_3_21_0]
{
name: "GEO",
index: "target_cell_3_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_3_22_0]
{
name: "GEO",
index: "target_cell_3_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_3_23_0]
{
name: "GEO",
index: "target_cell_3_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_3_24_0]
{
name: "GEO",
index: "target_cell_3_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_3_25_0]
{
name: "GEO",
index: "target_cell_3_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_3_26_0]
{
name: "GEO",
index: "target_cell_3_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_3_27_0]
{
name: "GEO",
index: "target_cell_3_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_3_28_0]
{
name: "GEO",
index: "target_cell_3_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_3_29_0]
{
name: "GEO",
index: "target_cell_3_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_3_30_0]
{
name: "GEO",
index: "target_cell_3_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-75.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_3_31_0]
{
name: "GEO",
index: "target_cell_3_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-75.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_4_0_0]
{
name: "GEO",
index: "target_cell_4_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_4_1_0]
{
name: "GEO",
index: "target_cell_4_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_4_2_0]
{
name: "GEO",
index: "target_cell_4_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_4_3_0]
{
name: "GEO",
index: "target_cell_4_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_4_4_0]
{
name: "GEO",
index: "target_cell_4_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_4_5_0]
{
name: "GEO",
index: "target_cell_4_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_4_6_0]
{
name: "GEO",
index: "target_cell_4_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_4_7_0]
{
name: "GEO",
index: "target_cell_4_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_4_8_0]
{
name: "GEO",
index: "target_cell_4_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_4_9_0]
{
name: "GEO",
index: "target_cell_4_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_4_10_0]
{
name: "GEO",
index: "target_cell_4_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_4_11_0]
{
name: "GEO",
index: "target_cell_4_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_4_12_0]
{
name: "GEO",
index: "target_cell_4_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_4_13_0]
{
name: "GEO",
index: "target_cell_4_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_4_14_0]
{
name: "GEO",
index: "target_cell_4_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_4_15_0]
{
name: "GEO",
index: "target_cell_4_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_4_16_0]
{
name: "GEO",
index: "target_cell_4_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_4_17_0]
{
name: "GEO",
index: "target_cell_4_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_4_18_0]
{
name: "GEO",
index: "target_cell_4_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_4_19_0]
{
name: "GEO",
index: "target_cell_4_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_4_20_0]
{
name: "GEO",
index: "target_cell_4_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_4_21_0]
{
name: "GEO",
index: "target_cell_4_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_4_22_0]
{
name: "GEO",
index: "target_cell_4_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_4_23_0]
{
name: "GEO",
index: "target_cell_4_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_4_24_0]
{
name: "GEO",
index: "target_cell_4_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_4_25_0]
{
name: "GEO",
index: "target_cell_4_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_4_26_0]
{
name: "GEO",
index: "target_cell_4_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_4_27_0]
{
name: "GEO",
index: "target_cell_4_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_4_28_0]
{
name: "GEO",
index: "target_cell_4_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_4_29_0]
{
name: "GEO",
index: "target_cell_4_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_4_30_0]
{
name: "GEO",
index: "target_cell_4_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-69.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_4_31_0]
{
name: "GEO",
index: "target_cell_4_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-69.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_5_0_0]
{
name: "GEO",
index: "target_cell_5_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_5_1_0]
{
name: "GEO",
index: "target_cell_5_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_5_2_0]
{
name: "GEO",
index: "target_cell_5_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_5_3_0]
{
name: "GEO",
index: "target_cell_5_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_5_4_0]
{
name: "GEO",
index: "target_cell_5_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_5_5_0]
{
name: "GEO",
index: "target_cell_5_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_5_6_0]
{
name: "GEO",
index: "target_cell_5_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_5_7_0]
{
name: "GEO",
index: "target_cell_5_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_5_8_0]
{
name: "GEO",
index: "target_cell_5_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_5_9_0]
{
name: "GEO",
index: "target_cell_5_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_5_10_0]
{
name: "GEO",
index: "target_cell_5_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_5_11_0]
{
name: "GEO",
index: "target_cell_5_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_5_12_0]
{
name: "GEO",
index: "target_cell_5_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_5_13_0]
{
name: "GEO",
index: "target_cell_5_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_5_14_0]
{
name: "GEO",
index: "target_cell_5_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_5_15_0]
{
name: "GEO",
index: "target_cell_5_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_5_16_0]
{
name: "GEO",
index: "target_cell_5_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_5_17_0]
{
name: "GEO",
index: "target_cell_5_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_5_18_0]
{
name: "GEO",
index: "target_cell_5_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_5_19_0]
{
name: "GEO",
index: "target_cell_5_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_5_20_0]
{
name: "GEO",
index: "target_cell_5_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_5_21_0]
{
name: "GEO",
index: "target_cell_5_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_5_22_0]
{
name: "GEO",
index: "target_cell_5_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_5_23_0]
{
name: "GEO",
index: "target_cell_5_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_5_24_0]
{
name: "GEO",
index: "target_cell_5_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_5_25_0]
{
name: "GEO",
index: "target_cell_5_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_5_26_0]
{
name: "GEO",
index: "target_cell_5_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_5_27_0]
{
name: "GEO",
index: "target_cell_5_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_5_28_0]
{
name: "GEO",
index: "target_cell_5_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_5_29_0]
{
name: "GEO",
index: "target_cell_5_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_5_30_0]
{
name: "GEO",
index: "target_cell_5_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-63.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_5_31_0]
{
name: "GEO",
index: "target_cell_5_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-63.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_6_0_0]
{
name: "GEO",
index: "target_cell_6_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_6_1_0]
{
name: "GEO",
index: "target_cell_6_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_6_2_0]
{
name: "GEO",
index: "target_cell_6_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_6_3_0]
{
name: "GEO",
index: "target_cell_6_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_6_4_0]
{
name: "GEO",
index: "target_cell_6_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_6_5_0]
{
name: "GEO",
index: "target_cell_6_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_6_6_0]
{
name: "GEO",
index: "target_cell_6_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_6_7_0]
{
name: "GEO",
index: "target_cell_6_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_6_8_0]
{
name: "GEO",
index: "target_cell_6_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_6_9_0]
{
name: "GEO",
index: "target_cell_6_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_6_10_0]
{
name: "GEO",
index: "target_cell_6_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_6_11_0]
{
name: "GEO",
index: "target_cell_6_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_6_12_0]
{
name: "GEO",
index: "target_cell_6_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_6_13_0]
{
name: "GEO",
index: "target_cell_6_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_6_14_0]
{
name: "GEO",
index: "target_cell_6_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_6_15_0]
{
name: "GEO",
index: "target_cell_6_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_6_16_0]
{
name: "GEO",
index: "target_cell_6_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_6_17_0]
{
name: "GEO",
index: "target_cell_6_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_6_18_0]
{
name: "GEO",
index: "target_cell_6_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_6_19_0]
{
name: "GEO",
index: "target_cell_6_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_6_20_0]
{
name: "GEO",
index: "target_cell_6_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_6_21_0]
{
name: "GEO",
index: "target_cell_6_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_6_22_0]
{
name: "GEO",
index: "target_cell_6_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_6_23_0]
{
name: "GEO",
index: "target_cell_6_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_6_24_0]
{
name: "GEO",
index: "target_cell_6_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_6_25_0]
{
name: "GEO",
index: "target_cell_6_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_6_26_0]
{
name: "GEO",
index: "target_cell_6_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_6_27_0]
{
name: "GEO",
index: "target_cell_6_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_6_28_0]
{
name: "GEO",
index: "target_cell_6_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_6_29_0]
{
name: "GEO",
index: "target_cell_6_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_6_30_0]
{
name: "GEO",
index: "target_cell_6_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-57.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_6_31_0]
{
name: "GEO",
index: "target_cell_6_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-57.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_7_0_0]
{
name: "GEO",
index: "target_cell_7_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_7_1_0]
{
name: "GEO",
index: "target_cell_7_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_7_2_0]
{
name: "GEO",
index: "target_cell_7_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_7_3_0]
{
name: "GEO",
index: "target_cell_7_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_7_4_0]
{
name: "GEO",
index: "target_cell_7_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_7_5_0]
{
name: "GEO",
index: "target_cell_7_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_7_6_0]
{
name: "GEO",
index: "target_cell_7_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_7_7_0]
{
name: "GEO",
index: "target_cell_7_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_7_8_0]
{
name: "GEO",
index: "target_cell_7_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_7_9_0]
{
name: "GEO",
index: "target_cell_7_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_7_10_0]
{
name: "GEO",
index: "target_cell_7_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_7_11_0]
{
name: "GEO",
index: "target_cell_7_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_7_12_0]
{
name: "GEO",
index: "target_cell_7_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_7_13_0]
{
name: "GEO",
index: "target_cell_7_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_7_14_0]
{
name: "GEO",
index: "target_cell_7_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_7_15_0]
{
name: "GEO",
index: "target_cell_7_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_7_16_0]
{
name: "GEO",
index: "target_cell_7_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_7_17_0]
{
name: "GEO",
index: "target_cell_7_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_7_18_0]
{
name: "GEO",
index: "target_cell_7_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_7_19_0]
{
name: "GEO",
index: "target_cell_7_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_7_20_0]
{
name: "GEO",
index: "target_cell_7_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_7_21_0]
{
name: "GEO",
index: "target_cell_7_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_7_22_0]
{
name: "GEO",
index: "target_cell_7_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_7_23_0]
{
name: "GEO",
index: "target_cell_7_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_7_24_0]
{
name: "GEO",
index: "target_cell_7_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_7_25_0]
{
name: "GEO",
index: "target_cell_7_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_7_26_0]
{
name: "GEO",
index: "target_cell_7_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_7_27_0]
{
name: "GEO",
index: "target_cell_7_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_7_28_0]
{
name: "GEO",
index: "target_cell_7_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_7_29_0]
{
name: "GEO",
index: "target_cell_7_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_7_30_0]
{
name: "GEO",
index: "target_cell_7_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-51.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_7_31_0]
{
name: "GEO",
index: "target_cell_7_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-51.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_8_0_0]
{
name: "GEO",
index: "target_cell_8_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_8_1_0]
{
name: "GEO",
index: "target_cell_8_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_8_2_0]
{
name: "GEO",
index: "target_cell_8_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_8_3_0]
{
name: "GEO",
index: "target_cell_8_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_8_4_0]
{
name: "GEO",
index: "target_cell_8_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_8_5_0]
{
name: "GEO",
index: "target_cell_8_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_8_6_0]
{
name: "GEO",
index: "target_cell_8_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_8_7_0]
{
name: "GEO",
index: "target_cell_8_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_8_8_0]
{
name: "GEO",
index: "target_cell_8_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_8_9_0]
{
name: "GEO",
index: "target_cell_8_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_8_10_0]
{
name: "GEO",
index: "target_cell_8_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_8_11_0]
{
name: "GEO",
index: "target_cell_8_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_8_12_0]
{
name: "GEO",
index: "target_cell_8_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_8_13_0]
{
name: "GEO",
index: "target_cell_8_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_8_14_0]
{
name: "GEO",
index: "target_cell_8_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_8_15_0]
{
name: "GEO",
index: "target_cell_8_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_8_16_0]
{
name: "GEO",
index: "target_cell_8_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_8_17_0]
{
name: "GEO",
index: "target_cell_8_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_8_18_0]
{
name: "GEO",
index: "target_cell_8_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_8_19_0]
{
name: "GEO",
index: "target_cell_8_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_8_20_0]
{
name: "GEO",
index: "target_cell_8_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_8_21_0]
{
name: "GEO",
index: "target_cell_8_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_8_22_0]
{
name: "GEO",
index: "target_cell_8_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_8_23_0]
{
name: "GEO",
index: "target_cell_8_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_8_24_0]
{
name: "GEO",
index: "target_cell_8_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_8_25_0]
{
name: "GEO",
index: "target_cell_8_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_8_26_0]
{
name: "GEO",
index: "target_cell_8_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_8_27_0]
{
name: "GEO",
index: "target_cell_8_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_8_28_0]
{
name: "GEO",
index: "target_cell_8_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_8_29_0]
{
name: "GEO",
index: "target_cell_8_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_8_30_0]
{
name: "GEO",
index: "target_cell_8_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-45.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_8_31_0]
{
name: "GEO",
index: "target_cell_8_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-45.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_9_0_0]
{
name: "GEO",
index: "target_cell_9_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_9_1_0]
{
name: "GEO",
index: "target_cell_9_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_9_2_0]
{
name: "GEO",
index: "target_cell_9_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_9_3_0]
{
name: "GEO",
index: "target_cell_9_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_9_4_0]
{
name: "GEO",
index: "target_cell_9_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_9_5_0]
{
name: "GEO",
index: "target_cell_9_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_9_6_0]
{
name: "GEO",
index: "target_cell_9_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_9_7_0]
{
name: "GEO",
index: "target_cell_9_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_9_8_0]
{
name: "GEO",
index: "target_cell_9_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_9_9_0]
{
name: "GEO",
index: "target_cell_9_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_9_10_0]
{
name: "GEO",
index: "target_cell_9_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_9_11_0]
{
name: "GEO",
index: "target_cell_9_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_9_12_0]
{
name: "GEO",
index: "target_cell_9_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_9_13_0]
{
name: "GEO",
index: "target_cell_9_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_9_14_0]
{
name: "GEO",
index: "target_cell_9_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_9_15_0]
{
name: "GEO",
index: "target_cell_9_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_9_16_0]
{
name: "GEO",
index: "target_cell_9_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_9_17_0]
{
name: "GEO",
index: "target_cell_9_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_9_18_0]
{
name: "GEO",
index: "target_cell_9_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_9_19_0]
{
name: "GEO",
index: "target_cell_9_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_9_20_0]
{
name: "GEO",
index: "target_cell_9_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_9_21_0]
{
name: "GEO",
index: "target_cell_9_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_9_22_0]
{
name: "GEO",
index: "target_cell_9_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_9_23_0]
{
name: "GEO",
index: "target_cell_9_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_9_24_0]
{
name: "GEO",
index: "target_cell_9_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_9_25_0]
{
name: "GEO",
index: "target_cell_9_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_9_26_0]
{
name: "GEO",
index: "target_cell_9_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_9_27_0]
{
name: "GEO",
index: "target_cell_9_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_9_28_0]
{
name: "GEO",
index: "target_cell_9_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_9_29_0]
{
name: "GEO",
index: "target_cell_9_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_9_30_0]
{
name: "GEO",
index: "target_cell_9_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-39.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_9_31_0]
{
name: "GEO",
index: "target_cell_9_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-39.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_10_0_0]
{
name: "GEO",
index: "target_cell_10_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_10_1_0]
{
name: "GEO",
index: "target_cell_10_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_10_2_0]
{
name: "GEO",
index: "target_cell_10_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_10_3_0]
{
name: "GEO",
index: "target_cell_10_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_10_4_0]
{
name: "GEO",
index: "target_cell_10_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_10_5_0]
{
name: "GEO",
index: "target_cell_10_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_10_6_0]
{
name: "GEO",
index: "target_cell_10_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_10_7_0]
{
name: "GEO",
index: "target_cell_10_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_10_8_0]
{
name: "GEO",
index: "target_cell_10_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_10_9_0]
{
name: "GEO",
index: "target_cell_10_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_10_10_0]
{
name: "GEO",
index: "target_cell_10_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_10_11_0]
{
name: "GEO",
index: "target_cell_10_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_10_12_0]
{
name: "GEO",
index: "target_cell_10_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_10_13_0]
{
name: "GEO",
index: "target_cell_10_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_10_14_0]
{
name: "GEO",
index: "target_cell_10_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_10_15_0]
{
name: "GEO",
index: "target_cell_10_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_10_16_0]
{
name: "GEO",
index: "target_cell_10_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_10_17_0]
{
name: "GEO",
index: "target_cell_10_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_10_18_0]
{
name: "GEO",
index: "target_cell_10_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_10_19_0]
{
name: "GEO",
index: "target_cell_10_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_10_20_0]
{
name: "GEO",
index: "target_cell_10_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_10_21_0]
{
name: "GEO",
index: "target_cell_10_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_10_22_0]
{
name: "GEO",
index: "target_cell_10_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_10_23_0]
{
name: "GEO",
index: "target_cell_10_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_10_24_0]
{
name: "GEO",
index: "target_cell_10_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_10_25_0]
{
name: "GEO",
index: "target_cell_10_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_10_26_0]
{
name: "GEO",
index: "target_cell_10_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_10_27_0]
{
name: "GEO",
index: "target_cell_10_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_10_28_0]
{
name: "GEO",
index: "target_cell_10_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_10_29_0]
{
name: "GEO",
index: "target_cell_10_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_10_30_0]
{
name: "GEO",
index: "target_cell_10_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-33.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_10_31_0]
{
name: "GEO",
index: "target_cell_10_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-33.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_11_0_0]
{
name: "GEO",
index: "target_cell_11_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_11_1_0]
{
name: "GEO",
index: "target_cell_11_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_11_2_0]
{
name: "GEO",
index: "target_cell_11_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_11_3_0]
{
name: "GEO",
index: "target_cell_11_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_11_4_0]
{
name: "GEO",
index: "target_cell_11_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_11_5_0]
{
name: "GEO",
index: "target_cell_11_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_11_6_0]
{
name: "GEO",
index: "target_cell_11_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_11_7_0]
{
name: "GEO",
index: "target_cell_11_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_11_8_0]
{
name: "GEO",
index: "target_cell_11_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_11_9_0]
{
name: "GEO",
index: "target_cell_11_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_11_10_0]
{
name: "GEO",
index: "target_cell_11_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_11_11_0]
{
name: "GEO",
index: "target_cell_11_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_11_12_0]
{
name: "GEO",
index: "target_cell_11_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_11_13_0]
{
name: "GEO",
index: "target_cell_11_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_11_14_0]
{
name: "GEO",
index: "target_cell_11_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_11_15_0]
{
name: "GEO",
index: "target_cell_11_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_11_16_0]
{
name: "GEO",
index: "target_cell_11_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_11_17_0]
{
name: "GEO",
index: "target_cell_11_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_11_18_0]
{
name: "GEO",
index: "target_cell_11_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_11_19_0]
{
name: "GEO",
index: "target_cell_11_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_11_20_0]
{
name: "GEO",
index: "target_cell_11_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_11_21_0]
{
name: "GEO",
index: "target_cell_11_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_11_22_0]
{
name: "GEO",
index: "target_cell_11_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_11_23_0]
{
name: "GEO",
index: "target_cell_11_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_11_24_0]
{
name: "GEO",
index: "target_cell_11_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_11_25_0]
{
name: "GEO",
index: "target_cell_11_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_11_26_0]
{
name: "GEO",
index: "target_cell_11_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_11_27_0]
{
name: "GEO",
index: "target_cell_11_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_11_28_0]
{
name: "GEO",
index: "target_cell_11_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_11_29_0]
{
name: "GEO",
index: "target_cell_11_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_11_30_0]
{
name: "GEO",
index: "target_cell_11_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-27.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_11_31_0]
{
name: "GEO",
index: "target_cell_11_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-27.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_12_0_0]
{
name: "GEO",
index: "target_cell_12_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_12_1_0]
{
name: "GEO",
index: "target_cell_12_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_12_2_0]
{
name: "GEO",
index: "target_cell_12_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_12_3_0]
{
name: "GEO",
index: "target_cell_12_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_12_4_0]
{
name: "GEO",
index: "target_cell_12_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_12_5_0]
{
name: "GEO",
index: "target_cell_12_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_12_6_0]
{
name: "GEO",
index: "target_cell_12_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_12_7_0]
{
name: "GEO",
index: "target_cell_12_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_12_8_0]
{
name: "GEO",
index: "target_cell_12_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_12_9_0]
{
name: "GEO",
index: "target_cell_12_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_12_10_0]
{
name: "GEO",
index: "target_cell_12_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_12_11_0]
{
name: "GEO",
index: "target_cell_12_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_12_12_0]
{
name: "GEO",
index: "target_cell_12_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_12_13_0]
{
name: "GEO",
index: "target_cell_12_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_12_14_0]
{
name: "GEO",
index: "target_cell_12_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_12_15_0]
{
name: "GEO",
index: "target_cell_12_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_12_16_0]
{
name: "GEO",
index: "target_cell_12_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_12_17_0]
{
name: "GEO",
index: "target_cell_12_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_12_18_0]
{
name: "GEO",
index: "target_cell_12_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_12_19_0]
{
name: "GEO",
index: "target_cell_12_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_12_20_0]
{
name: "GEO",
index: "target_cell_12_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_12_21_0]
{
name: "GEO",
index: "target_cell_12_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_12_22_0]
{
name: "GEO",
index: "target_cell_12_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_12_23_0]
{
name: "GEO",
index: "target_cell_12_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_12_24_0]
{
name: "GEO",
index: "target_cell_12_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_12_25_0]
{
name: "GEO",
index: "target_cell_12_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_12_26_0]
{
name: "GEO",
index: "target_cell_12_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_12_27_0]
{
name: "GEO",
index: "target_cell_12_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_12_28_0]
{
name: "GEO",
index: "target_cell_12_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_12_29_0]
{
name: "GEO",
index: "target_cell_12_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_12_30_0]
{
name: "GEO",
index: "target_cell_12_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-21.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_12_31_0]
{
name: "GEO",
index: "target_cell_12_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-21.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_13_0_0]
{
name: "GEO",
index: "target_cell_13_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_13_1_0]
{
name: "GEO",
index: "target_cell_13_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_13_2_0]
{
name: "GEO",
index: "target_cell_13_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_13_3_0]
{
name: "GEO",
index: "target_cell_13_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_13_4_0]
{
name: "GEO",
index: "target_cell_13_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_13_5_0]
{
name: "GEO",
index: "target_cell_13_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_13_6_0]
{
name: "GEO",
index: "target_cell_13_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_13_7_0]
{
name: "GEO",
index: "target_cell_13_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_13_8_0]
{
name: "GEO",
index: "target_cell_13_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_13_9_0]
{
name: "GEO",
index: "target_cell_13_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_13_10_0]
{
name: "GEO",
index: "target_cell_13_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_13_11_0]
{
name: "GEO",
index: "target_cell_13_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_13_12_0]
{
name: "GEO",
index: "target_cell_13_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_13_13_0]
{
name: "GEO",
index: "target_cell_13_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_13_14_0]
{
name: "GEO",
index: "target_cell_13_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_13_15_0]
{
name: "GEO",
index: "target_cell_13_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_13_16_0]
{
name: "GEO",
index: "target_cell_13_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_13_17_0]
{
name: "GEO",
index: "target_cell_13_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_13_18_0]
{
name: "GEO",
index: "target_cell_13_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_13_19_0]
{
name: "GEO",
index: "target_cell_13_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_13_20_0]
{
name: "GEO",
index: "target_cell_13_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_13_21_0]
{
name: "GEO",
index: "target_cell_13_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_13_22_0]
{
name: "GEO",
index: "target_cell_13_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_13_23_0]
{
name: "GEO",
index: "target_cell_13_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_13_24_0]
{
name: "GEO",
index: "target_cell_13_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_13_25_0]
{
name: "GEO",
index: "target_cell_13_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_13_26_0]
{
name: "GEO",
index: "target_cell_13_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_13_27_0]
{
name: "GEO",
index: "target_cell_13_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_13_28_0]
{
name: "GEO",
index: "target_cell_13_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_13_29_0]
{
name: "GEO",
index: "target_cell_13_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_13_30_0]
{
name: "GEO",
index: "target_cell_13_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-15.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_13_31_0]
{
name: "GEO",
index: "target_cell_13_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-15.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_14_0_0]
{
name: "GEO",
index: "target_cell_14_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_14_1_0]
{
name: "GEO",
index: "target_cell_14_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_14_2_0]
{
name: "GEO",
index: "target_cell_14_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_14_3_0]
{
name: "GEO",
index: "target_cell_14_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_14_4_0]
{
name: "GEO",
index: "target_cell_14_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_14_5_0]
{
name: "GEO",
index: "target_cell_14_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_14_6_0]
{
name: "GEO",
index: "target_cell_14_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_14_7_0]
{
name: "GEO",
index: "target_cell_14_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_14_8_0]
{
name: "GEO",
index: "target_cell_14_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_14_9_0]
{
name: "GEO",
index: "target_cell_14_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_14_10_0]
{
name: "GEO",
index: "target_cell_14_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_14_11_0]
{
name: "GEO",
index: "target_cell_14_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_14_12_0]
{
name: "GEO",
index: "target_cell_14_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_14_13_0]
{
name: "GEO",
index: "target_cell_14_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_14_14_0]
{
name: "GEO",
index: "target_cell_14_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_14_15_0]
{
name: "GEO",
index: "target_cell_14_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_14_16_0]
{
name: "GEO",
index: "target_cell_14_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_14_17_0]
{
name: "GEO",
index: "target_cell_14_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_14_18_0]
{
name: "GEO",
index: "target_cell_14_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_14_19_0]
{
name: "GEO",
index: "target_cell_14_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_14_20_0]
{
name: "GEO",
index: "target_cell_14_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_14_21_0]
{
name: "GEO",
index: "target_cell_14_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_14_22_0]
{
name: "GEO",
index: "target_cell_14_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_14_23_0]
{
name: "GEO",
index: "target_cell_14_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_14_24_0]
{
name: "GEO",
index: "target_cell_14_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_14_25_0]
{
name: "GEO",
index: "target_cell_14_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_14_26_0]
{
name: "GEO",
index: "target_cell_14_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_14_27_0]
{
name: "GEO",
index: "target_cell_14_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_14_28_0]
{
name: "GEO",
index: "target_cell_14_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_14_29_0]
{
name: "GEO",
index: "target_cell_14_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_14_30_0]
{
name: "GEO",
index: "target_cell_14_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-9.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_14_31_0]
{
name: "GEO",
index: "target_cell_14_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-9.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_15_0_0]
{
name: "GEO",
index: "target_cell_15_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_15_1_0]
{
name: "GEO",
index: "target_cell_15_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_15_2_0]
{
name: "GEO",
index: "target_cell_15_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_15_3_0]
{
name: "GEO",
index: "target_cell_15_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_15_4_0]
{
name: "GEO",
index: "target_cell_15_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_15_5_0]
{
name: "GEO",
index: "target_cell_15_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_15_6_0]
{
name: "GEO",
index: "target_cell_15_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_15_7_0]
{
name: "GEO",
index: "target_cell_15_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_15_8_0]
{
name: "GEO",
index: "target_cell_15_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_15_9_0]
{
name: "GEO",
index: "target_cell_15_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_15_10_0]
{
name: "GEO",
index: "target_cell_15_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_15_11_0]
{
name: "GEO",
index: "target_cell_15_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_15_12_0]
{
name: "GEO",
index: "target_cell_15_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_15_13_0]
{
name: "GEO",
index: "target_cell_15_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_15_14_0]
{
name: "GEO",
index: "target_cell_15_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_15_15_0]
{
name: "GEO",
index: "target_cell_15_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_15_16_0]
{
name: "GEO",
index: "target_cell_15_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_15_17_0]
{
name: "GEO",
index: "target_cell_15_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_15_18_0]
{
name: "GEO",
index: "target_cell_15_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_15_19_0]
{
name: "GEO",
index: "target_cell_15_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_15_20_0]
{
name: "GEO",
index: "target_cell_15_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_15_21_0]
{
name: "GEO",
index: "target_cell_15_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_15_22_0]
{
name: "GEO",
index: "target_cell_15_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_15_23_0]
{
name: "GEO",
index: "target_cell_15_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_15_24_0]
{
name: "GEO",
index: "target_cell_15_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_15_25_0]
{
name: "GEO",
index: "target_cell_15_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_15_26_0]
{
name: "GEO",
index: "target_cell_15_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_15_27_0]
{
name: "GEO",
index: "target_cell_15_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_15_28_0]
{
name: "GEO",
index: "target_cell_15_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_15_29_0]
{
name: "GEO",
index: "target_cell_15_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_15_30_0]
{
name: "GEO",
index: "target_cell_15_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [-3.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_15_31_0]
{
name: "GEO",
index: "target_cell_15_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [-3.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_16_0_0]
{
name: "GEO",
index: "target_cell_16_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_16_1_0]
{
name: "GEO",
index: "target_cell_16_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_16_2_0]
{
name: "GEO",
index: "target_cell_16_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_16_3_0]
{
name: "GEO",
index: "target_cell_16_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_16_4_0]
{
name: "GEO",
index: "target_cell_16_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_16_5_0]
{
name: "GEO",
index: "target_cell_16_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_16_6_0]
{
name: "GEO",
index: "target_cell_16_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_16_7_0]
{
name: "GEO",
index: "target_cell_16_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_16_8_0]
{
name: "GEO",
index: "target_cell_16_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_16_9_0]
{
name: "GEO",
index: "target_cell_16_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_16_10_0]
{
name: "GEO",
index: "target_cell_16_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_16_11_0]
{
name: "GEO",
index: "target_cell_16_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_16_12_0]
{
name: "GEO",
index: "target_cell_16_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_16_13_0]
{
name: "GEO",
index: "target_cell_16_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_16_14_0]
{
name: "GEO",
index: "target_cell_16_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_16_15_0]
{
name: "GEO",
index: "target_cell_16_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_16_16_0]
{
name: "GEO",
index: "target_cell_16_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_16_17_0]
{
name: "GEO",
index: "target_cell_16_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_16_18_0]
{
name: "GEO",
index: "target_cell_16_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_16_19_0]
{
name: "GEO",
index: "target_cell_16_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_16_20_0]
{
name: "GEO",
index: "target_cell_16_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_16_21_0]
{
name: "GEO",
index: "target_cell_16_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_16_22_0]
{
name: "GEO",
index: "target_cell_16_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_16_23_0]
{
name: "GEO",
index: "target_cell_16_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_16_24_0]
{
name: "GEO",
index: "target_cell_16_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_16_25_0]
{
name: "GEO",
index: "target_cell_16_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_16_26_0]
{
name: "GEO",
index: "target_cell_16_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_16_27_0]
{
name: "GEO",
index: "target_cell_16_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_16_28_0]
{
name: "GEO",
index: "target_cell_16_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_16_29_0]
{
name: "GEO",
index: "target_cell_16_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_16_30_0]
{
name: "GEO",
index: "target_cell_16_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [3.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_16_31_0]
{
name: "GEO",
index: "target_cell_16_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [3.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_17_0_0]
{
name: "GEO",
index: "target_cell_17_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_17_1_0]
{
name: "GEO",
index: "target_cell_17_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_17_2_0]
{
name: "GEO",
index: "target_cell_17_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_17_3_0]
{
name: "GEO",
index: "target_cell_17_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_17_4_0]
{
name: "GEO",
index: "target_cell_17_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_17_5_0]
{
name: "GEO",
index: "target_cell_17_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_17_6_0]
{
name: "GEO",
index: "target_cell_17_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_17_7_0]
{
name: "GEO",
index: "target_cell_17_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_17_8_0]
{
name: "GEO",
index: "target_cell_17_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_17_9_0]
{
name: "GEO",
index: "target_cell_17_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_17_10_0]
{
name: "GEO",
index: "target_cell_17_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_17_11_0]
{
name: "GEO",
index: "target_cell_17_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_17_12_0]
{
name: "GEO",
index: "target_cell_17_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_17_13_0]
{
name: "GEO",
index: "target_cell_17_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_17_14_0]
{
name: "GEO",
index: "target_cell_17_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_17_15_0]
{
name: "GEO",
index: "target_cell_17_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_17_16_0]
{
name: "GEO",
index: "target_cell_17_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_17_17_0]
{
name: "GEO",
index: "target_cell_17_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_17_18_0]
{
name: "GEO",
index: "target_cell_17_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_17_19_0]
{
name: "GEO",
index: "target_cell_17_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_17_20_0]
{
name: "GEO",
index: "target_cell_17_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_17_21_0]
{
name: "GEO",
index: "target_cell_17_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_17_22_0]
{
name: "GEO",
index: "target_cell_17_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_17_23_0]
{
name: "GEO",
index: "target_cell_17_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_17_24_0]
{
name: "GEO",
index: "target_cell_17_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_17_25_0]
{
name: "GEO",
index: "target_cell_17_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_17_26_0]
{
name: "GEO",
index: "target_cell_17_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_17_27_0]
{
name: "GEO",
index: "target_cell_17_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_17_28_0]
{
name: "GEO",
index: "target_cell_17_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_17_29_0]
{
name: "GEO",
index: "target_cell_17_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_17_30_0]
{
name: "GEO",
index: "target_cell_17_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [9.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_17_31_0]
{
name: "GEO",
index: "target_cell_17_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [9.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_18_0_0]
{
name: "GEO",
index: "target_cell_18_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_18_1_0]
{
name: "GEO",
index: "target_cell_18_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_18_2_0]
{
name: "GEO",
index: "target_cell_18_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_18_3_0]
{
name: "GEO",
index: "target_cell_18_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_18_4_0]
{
name: "GEO",
index: "target_cell_18_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_18_5_0]
{
name: "GEO",
index: "target_cell_18_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_18_6_0]
{
name: "GEO",
index: "target_cell_18_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_18_7_0]
{
name: "GEO",
index: "target_cell_18_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_18_8_0]
{
name: "GEO",
index: "target_cell_18_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_18_9_0]
{
name: "GEO",
index: "target_cell_18_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_18_10_0]
{
name: "GEO",
index: "target_cell_18_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_18_11_0]
{
name: "GEO",
index: "target_cell_18_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_18_12_0]
{
name: "GEO",
index: "target_cell_18_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_18_13_0]
{
name: "GEO",
index: "target_cell_18_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_18_14_0]
{
name: "GEO",
index: "target_cell_18_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_18_15_0]
{
name: "GEO",
index: "target_cell_18_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_18_16_0]
{
name: "GEO",
index: "target_cell_18_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_18_17_0]
{
name: "GEO",
index: "target_cell_18_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_18_18_0]
{
name: "GEO",
index: "target_cell_18_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_18_19_0]
{
name: "GEO",
index: "target_cell_18_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_18_20_0]
{
name: "GEO",
index: "target_cell_18_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_18_21_0]
{
name: "GEO",
index: "target_cell_18_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_18_22_0]
{
name: "GEO",
index: "target_cell_18_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_18_23_0]
{
name: "GEO",
index: "target_cell_18_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_18_24_0]
{
name: "GEO",
index: "target_cell_18_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_18_25_0]
{
name: "GEO",
index: "target_cell_18_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_18_26_0]
{
name: "GEO",
index: "target_cell_18_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_18_27_0]
{
name: "GEO",
index: "target_cell_18_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_18_28_0]
{
name: "GEO",
index: "target_cell_18_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_18_29_0]
{
name: "GEO",
index: "target_cell_18_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_18_30_0]
{
name: "GEO",
index: "target_cell_18_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [15.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_18_31_0]
{
name: "GEO",
index: "target_cell_18_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [15.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_19_0_0]
{
name: "GEO",
index: "target_cell_19_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_19_1_0]
{
name: "GEO",
index: "target_cell_19_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_19_2_0]
{
name: "GEO",
index: "target_cell_19_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_19_3_0]
{
name: "GEO",
index: "target_cell_19_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_19_4_0]
{
name: "GEO",
index: "target_cell_19_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_19_5_0]
{
name: "GEO",
index: "target_cell_19_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_19_6_0]
{
name: "GEO",
index: "target_cell_19_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_19_7_0]
{
name: "GEO",
index: "target_cell_19_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_19_8_0]
{
name: "GEO",
index: "target_cell_19_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_19_9_0]
{
name: "GEO",
index: "target_cell_19_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_19_10_0]
{
name: "GEO",
index: "target_cell_19_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_19_11_0]
{
name: "GEO",
index: "target_cell_19_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_19_12_0]
{
name: "GEO",
index: "target_cell_19_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_19_13_0]
{
name: "GEO",
index: "target_cell_19_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_19_14_0]
{
name: "GEO",
index: "target_cell_19_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_19_15_0]
{
name: "GEO",
index: "target_cell_19_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_19_16_0]
{
name: "GEO",
index: "target_cell_19_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_19_17_0]
{
name: "GEO",
index: "target_cell_19_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_19_18_0]
{
name: "GEO",
index: "target_cell_19_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_19_19_0]
{
name: "GEO",
index: "target_cell_19_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_19_20_0]
{
name: "GEO",
index: "target_cell_19_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_19_21_0]
{
name: "GEO",
index: "target_cell_19_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_19_22_0]
{
name: "GEO",
index: "target_cell_19_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_19_23_0]
{
name: "GEO",
index: "target_cell_19_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_19_24_0]
{
name: "GEO",
index: "target_cell_19_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_19_25_0]
{
name: "GEO",
index: "target_cell_19_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_19_26_0]
{
name: "GEO",
index: "target_cell_19_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_19_27_0]
{
name: "GEO",
index: "target_cell_19_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_19_28_0]
{
name: "GEO",
index: "target_cell_19_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_19_29_0]
{
name: "GEO",
index: "target_cell_19_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_19_30_0]
{
name: "GEO",
index: "target_cell_19_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [21.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_19_31_0]
{
name: "GEO",
index: "target_cell_19_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [21.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_20_0_0]
{
name: "GEO",
index: "target_cell_20_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_20_1_0]
{
name: "GEO",
index: "target_cell_20_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_20_2_0]
{
name: "GEO",
index: "target_cell_20_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_20_3_0]
{
name: "GEO",
index: "target_cell_20_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_20_4_0]
{
name: "GEO",
index: "target_cell_20_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_20_5_0]
{
name: "GEO",
index: "target_cell_20_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_20_6_0]
{
name: "GEO",
index: "target_cell_20_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_20_7_0]
{
name: "GEO",
index: "target_cell_20_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_20_8_0]
{
name: "GEO",
index: "target_cell_20_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_20_9_0]
{
name: "GEO",
index: "target_cell_20_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_20_10_0]
{
name: "GEO",
index: "target_cell_20_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_20_11_0]
{
name: "GEO",
index: "target_cell_20_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_20_12_0]
{
name: "GEO",
index: "target_cell_20_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_20_13_0]
{
name: "GEO",
index: "target_cell_20_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_20_14_0]
{
name: "GEO",
index: "target_cell_20_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_20_15_0]
{
name: "GEO",
index: "target_cell_20_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_20_16_0]
{
name: "GEO",
index: "target_cell_20_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_20_17_0]
{
name: "GEO",
index: "target_cell_20_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_20_18_0]
{
name: "GEO",
index: "target_cell_20_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_20_19_0]
{
name: "GEO",
index: "target_cell_20_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_20_20_0]
{
name: "GEO",
index: "target_cell_20_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_20_21_0]
{
name: "GEO",
index: "target_cell_20_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_20_22_0]
{
name: "GEO",
index: "target_cell_20_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_20_23_0]
{
name: "GEO",
index: "target_cell_20_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_20_24_0]
{
name: "GEO",
index: "target_cell_20_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_20_25_0]
{
name: "GEO",
index: "target_cell_20_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_20_26_0]
{
name: "GEO",
index: "target_cell_20_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_20_27_0]
{
name: "GEO",
index: "target_cell_20_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_20_28_0]
{
name: "GEO",
index: "target_cell_20_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_20_29_0]
{
name: "GEO",
index: "target_cell_20_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_20_30_0]
{
name: "GEO",
index: "target_cell_20_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [27.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_20_31_0]
{
name: "GEO",
index: "target_cell_20_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [27.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_21_0_0]
{
name: "GEO",
index: "target_cell_21_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_21_1_0]
{
name: "GEO",
index: "target_cell_21_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_21_2_0]
{
name: "GEO",
index: "target_cell_21_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_21_3_0]
{
name: "GEO",
index: "target_cell_21_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_21_4_0]
{
name: "GEO",
index: "target_cell_21_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_21_5_0]
{
name: "GEO",
index: "target_cell_21_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_21_6_0]
{
name: "GEO",
index: "target_cell_21_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_21_7_0]
{
name: "GEO",
index: "target_cell_21_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_21_8_0]
{
name: "GEO",
index: "target_cell_21_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_21_9_0]
{
name: "GEO",
index: "target_cell_21_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_21_10_0]
{
name: "GEO",
index: "target_cell_21_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_21_11_0]
{
name: "GEO",
index: "target_cell_21_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_21_12_0]
{
name: "GEO",
index: "target_cell_21_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_21_13_0]
{
name: "GEO",
index: "target_cell_21_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_21_14_0]
{
name: "GEO",
index: "target_cell_21_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_21_15_0]
{
name: "GEO",
index: "target_cell_21_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_21_16_0]
{
name: "GEO",
index: "target_cell_21_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_21_17_0]
{
name: "GEO",
index: "target_cell_21_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_21_18_0]
{
name: "GEO",
index: "target_cell_21_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_21_19_0]
{
name: "GEO",
index: "target_cell_21_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_21_20_0]
{
name: "GEO",
index: "target_cell_21_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_21_21_0]
{
name: "GEO",
index: "target_cell_21_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_21_22_0]
{
name: "GEO",
index: "target_cell_21_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_21_23_0]
{
name: "GEO",
index: "target_cell_21_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_21_24_0]
{
name: "GEO",
index: "target_cell_21_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_21_25_0]
{
name: "GEO",
index: "target_cell_21_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_21_26_0]
{
name: "GEO",
index: "target_cell_21_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_21_27_0]
{
name: "GEO",
index: "target_cell_21_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_21_28_0]
{
name: "GEO",
index: "target_cell_21_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_21_29_0]
{
name: "GEO",
index: "target_cell_21_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_21_30_0]
{
name: "GEO",
index: "target_cell_21_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [33.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_21_31_0]
{
name: "GEO",
index: "target_cell_21_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [33.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_22_0_0]
{
name: "GEO",
index: "target_cell_22_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_22_1_0]
{
name: "GEO",
index: "target_cell_22_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_22_2_0]
{
name: "GEO",
index: "target_cell_22_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_22_3_0]
{
name: "GEO",
index: "target_cell_22_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_22_4_0]
{
name: "GEO",
index: "target_cell_22_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_22_5_0]
{
name: "GEO",
index: "target_cell_22_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_22_6_0]
{
name: "GEO",
index: "target_cell_22_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_22_7_0]
{
name: "GEO",
index: "target_cell_22_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_22_8_0]
{
name: "GEO",
index: "target_cell_22_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_22_9_0]
{
name: "GEO",
index: "target_cell_22_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_22_10_0]
{
name: "GEO",
index: "target_cell_22_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_22_11_0]
{
name: "GEO",
index: "target_cell_22_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_22_12_0]
{
name: "GEO",
index: "target_cell_22_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_22_13_0]
{
name: "GEO",
index: "target_cell_22_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_22_14_0]
{
name: "GEO",
index: "target_cell_22_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_22_15_0]
{
name: "GEO",
index: "target_cell_22_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_22_16_0]
{
name: "GEO",
index: "target_cell_22_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_22_17_0]
{
name: "GEO",
index: "target_cell_22_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_22_18_0]
{
name: "GEO",
index: "target_cell_22_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_22_19_0]
{
name: "GEO",
index: "target_cell_22_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_22_20_0]
{
name: "GEO",
index: "target_cell_22_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_22_21_0]
{
name: "GEO",
index: "target_cell_22_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_22_22_0]
{
name: "GEO",
index: "target_cell_22_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_22_23_0]
{
name: "GEO",
index: "target_cell_22_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_22_24_0]
{
name: "GEO",
index: "target_cell_22_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_22_25_0]
{
name: "GEO",
index: "target_cell_22_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_22_26_0]
{
name: "GEO",
index: "target_cell_22_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_22_27_0]
{
name: "GEO",
index: "target_cell_22_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_22_28_0]
{
name: "GEO",
index: "target_cell_22_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_22_29_0]
{
name: "GEO",
index: "target_cell_22_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_22_30_0]
{
name: "GEO",
index: "target_cell_22_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [39.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_22_31_0]
{
name: "GEO",
index: "target_cell_22_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [39.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_23_0_0]
{
name: "GEO",
index: "target_cell_23_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_23_1_0]
{
name: "GEO",
index: "target_cell_23_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_23_2_0]
{
name: "GEO",
index: "target_cell_23_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_23_3_0]
{
name: "GEO",
index: "target_cell_23_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_23_4_0]
{
name: "GEO",
index: "target_cell_23_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_23_5_0]
{
name: "GEO",
index: "target_cell_23_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_23_6_0]
{
name: "GEO",
index: "target_cell_23_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_23_7_0]
{
name: "GEO",
index: "target_cell_23_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_23_8_0]
{
name: "GEO",
index: "target_cell_23_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_23_9_0]
{
name: "GEO",
index: "target_cell_23_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_23_10_0]
{
name: "GEO",
index: "target_cell_23_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_23_11_0]
{
name: "GEO",
index: "target_cell_23_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_23_12_0]
{
name: "GEO",
index: "target_cell_23_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_23_13_0]
{
name: "GEO",
index: "target_cell_23_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_23_14_0]
{
name: "GEO",
index: "target_cell_23_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_23_15_0]
{
name: "GEO",
index: "target_cell_23_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_23_16_0]
{
name: "GEO",
index: "target_cell_23_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_23_17_0]
{
name: "GEO",
index: "target_cell_23_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_23_18_0]
{
name: "GEO",
index: "target_cell_23_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_23_19_0]
{
name: "GEO",
index: "target_cell_23_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_23_20_0]
{
name: "GEO",
index: "target_cell_23_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_23_21_0]
{
name: "GEO",
index: "target_cell_23_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_23_22_0]
{
name: "GEO",
index: "target_cell_23_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_23_23_0]
{
name: "GEO",
index: "target_cell_23_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_23_24_0]
{
name: "GEO",
index: "target_cell_23_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_23_25_0]
{
name: "GEO",
index: "target_cell_23_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_23_26_0]
{
name: "GEO",
index: "target_cell_23_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_23_27_0]
{
name: "GEO",
index: "target_cell_23_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_23_28_0]
{
name: "GEO",
index: "target_cell_23_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_23_29_0]
{
name: "GEO",
index: "target_cell_23_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_23_30_0]
{
name: "GEO",
index: "target_cell_23_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [45.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_23_31_0]
{
name: "GEO",
index: "target_cell_23_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [45.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_24_0_0]
{
name: "GEO",
index: "target_cell_24_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_24_1_0]
{
name: "GEO",
index: "target_cell_24_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_24_2_0]
{
name: "GEO",
index: "target_cell_24_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_24_3_0]
{
name: "GEO",
index: "target_cell_24_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_24_4_0]
{
name: "GEO",
index: "target_cell_24_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_24_5_0]
{
name: "GEO",
index: "target_cell_24_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_24_6_0]
{
name: "GEO",
index: "target_cell_24_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_24_7_0]
{
name: "GEO",
index: "target_cell_24_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_24_8_0]
{
name: "GEO",
index: "target_cell_24_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_24_9_0]
{
name: "GEO",
index: "target_cell_24_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_24_10_0]
{
name: "GEO",
index: "target_cell_24_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_24_11_0]
{
name: "GEO",
index: "target_cell_24_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_24_12_0]
{
name: "GEO",
index: "target_cell_24_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_24_13_0]
{
name: "GEO",
index: "target_cell_24_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_24_14_0]
{
name: "GEO",
index: "target_cell_24_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_24_15_0]
{
name: "GEO",
index: "target_cell_24_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_24_16_0]
{
name: "GEO",
index: "target_cell_24_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_24_17_0]
{
name: "GEO",
index: "target_cell_24_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_24_18_0]
{
name: "GEO",
index: "target_cell_24_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_24_19_0]
{
name: "GEO",
index: "target_cell_24_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_24_20_0]
{
name: "GEO",
index: "target_cell_24_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_24_21_0]
{
name: "GEO",
index: "target_cell_24_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_24_22_0]
{
name: "GEO",
index: "target_cell_24_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_24_23_0]
{
name: "GEO",
index: "target_cell_24_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_24_24_0]
{
name: "GEO",
index: "target_cell_24_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_24_25_0]
{
name: "GEO",
index: "target_cell_24_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_24_26_0]
{
name: "GEO",
index: "target_cell_24_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_24_27_0]
{
name: "GEO",
index: "target_cell_24_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_24_28_0]
{
name: "GEO",
index: "target_cell_24_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_24_29_0]
{
name: "GEO",
index: "target_cell_24_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_24_30_0]
{
name: "GEO",
index: "target_cell_24_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [51.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_24_31_0]
{
name: "GEO",
index: "target_cell_24_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [51.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_25_0_0]
{
name: "GEO",
index: "target_cell_25_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_25_1_0]
{
name: "GEO",
index: "target_cell_25_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_25_2_0]
{
name: "GEO",
index: "target_cell_25_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_25_3_0]
{
name: "GEO",
index: "target_cell_25_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_25_4_0]
{
name: "GEO",
index: "target_cell_25_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_25_5_0]
{
name: "GEO",
index: "target_cell_25_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_25_6_0]
{
name: "GEO",
index: "target_cell_25_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_25_7_0]
{
name: "GEO",
index: "target_cell_25_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_25_8_0]
{
name: "GEO",
index: "target_cell_25_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_25_9_0]
{
name: "GEO",
index: "target_cell_25_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_25_10_0]
{
name: "GEO",
index: "target_cell_25_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_25_11_0]
{
name: "GEO",
index: "target_cell_25_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_25_12_0]
{
name: "GEO",
index: "target_cell_25_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_25_13_0]
{
name: "GEO",
index: "target_cell_25_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_25_14_0]
{
name: "GEO",
index: "target_cell_25_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_25_15_0]
{
name: "GEO",
index: "target_cell_25_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_25_16_0]
{
name: "GEO",
index: "target_cell_25_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_25_17_0]
{
name: "GEO",
index: "target_cell_25_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_25_18_0]
{
name: "GEO",
index: "target_cell_25_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_25_19_0]
{
name: "GEO",
index: "target_cell_25_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_25_20_0]
{
name: "GEO",
index: "target_cell_25_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_25_21_0]
{
name: "GEO",
index: "target_cell_25_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_25_22_0]
{
name: "GEO",
index: "target_cell_25_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_25_23_0]
{
name: "GEO",
index: "target_cell_25_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_25_24_0]
{
name: "GEO",
index: "target_cell_25_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_25_25_0]
{
name: "GEO",
index: "target_cell_25_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_25_26_0]
{
name: "GEO",
index: "target_cell_25_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_25_27_0]
{
name: "GEO",
index: "target_cell_25_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_25_28_0]
{
name: "GEO",
index: "target_cell_25_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_25_29_0]
{
name: "GEO",
index: "target_cell_25_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_25_30_0]
{
name: "GEO",
index: "target_cell_25_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [57.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_25_31_0]
{
name: "GEO",
index: "target_cell_25_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [57.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_26_0_0]
{
name: "GEO",
index: "target_cell_26_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_26_1_0]
{
name: "GEO",
index: "target_cell_26_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_26_2_0]
{
name: "GEO",
index: "target_cell_26_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_26_3_0]
{
name: "GEO",
index: "target_cell_26_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_26_4_0]
{
name: "GEO",
index: "target_cell_26_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_26_5_0]
{
name: "GEO",
index: "target_cell_26_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_26_6_0]
{
name: "GEO",
index: "target_cell_26_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_26_7_0]
{
name: "GEO",
index: "target_cell_26_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_26_8_0]
{
name: "GEO",
index: "target_cell_26_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_26_9_0]
{
name: "GEO",
index: "target_cell_26_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_26_10_0]
{
name: "GEO",
index: "target_cell_26_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_26_11_0]
{
name: "GEO",
index: "target_cell_26_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_26_12_0]
{
name: "GEO",
index: "target_cell_26_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_26_13_0]
{
name: "GEO",
index: "target_cell_26_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_26_14_0]
{
name: "GEO",
index: "target_cell_26_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_26_15_0]
{
name: "GEO",
index: "target_cell_26_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_26_16_0]
{
name: "GEO",
index: "target_cell_26_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_26_17_0]
{
name: "GEO",
index: "target_cell_26_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_26_18_0]
{
name: "GEO",
index: "target_cell_26_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_26_19_0]
{
name: "GEO",
index: "target_cell_26_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_26_20_0]
{
name: "GEO",
index: "target_cell_26_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_26_21_0]
{
name: "GEO",
index: "target_cell_26_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_26_22_0]
{
name: "GEO",
index: "target_cell_26_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_26_23_0]
{
name: "GEO",
index: "target_cell_26_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_26_24_0]
{
name: "GEO",
index: "target_cell_26_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_26_25_0]
{
name: "GEO",
index: "target_cell_26_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_26_26_0]
{
name: "GEO",
index: "target_cell_26_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_26_27_0]
{
name: "GEO",
index: "target_cell_26_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_26_28_0]
{
name: "GEO",
index: "target_cell_26_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_26_29_0]
{
name: "GEO",
index: "target_cell_26_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_26_30_0]
{
name: "GEO",
index: "target_cell_26_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [63.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_26_31_0]
{
name: "GEO",
index: "target_cell_26_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [63.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_27_0_0]
{
name: "GEO",
index: "target_cell_27_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_27_1_0]
{
name: "GEO",
index: "target_cell_27_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_27_2_0]
{
name: "GEO",
index: "target_cell_27_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_27_3_0]
{
name: "GEO",
index: "target_cell_27_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_27_4_0]
{
name: "GEO",
index: "target_cell_27_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_27_5_0]
{
name: "GEO",
index: "target_cell_27_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_27_6_0]
{
name: "GEO",
index: "target_cell_27_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_27_7_0]
{
name: "GEO",
index: "target_cell_27_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_27_8_0]
{
name: "GEO",
index: "target_cell_27_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_27_9_0]
{
name: "GEO",
index: "target_cell_27_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_27_10_0]
{
name: "GEO",
index: "target_cell_27_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_27_11_0]
{
name: "GEO",
index: "target_cell_27_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_27_12_0]
{
name: "GEO",
index: "target_cell_27_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_27_13_0]
{
name: "GEO",
index: "target_cell_27_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_27_14_0]
{
name: "GEO",
index: "target_cell_27_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_27_15_0]
{
name: "GEO",
index: "target_cell_27_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_27_16_0]
{
name: "GEO",
index: "target_cell_27_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_27_17_0]
{
name: "GEO",
index: "target_cell_27_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_27_18_0]
{
name: "GEO",
index: "target_cell_27_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_27_19_0]
{
name: "GEO",
index: "target_cell_27_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_27_20_0]
{
name: "GEO",
index: "target_cell_27_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_27_21_0]
{
name: "GEO",
index: "target_cell_27_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_27_22_0]
{
name: "GEO",
index: "target_cell_27_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_27_23_0]
{
name: "GEO",
index: "target_cell_27_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_27_24_0]
{
name: "GEO",
index: "target_cell_27_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_27_25_0]
{
name: "GEO",
index: "target_cell_27_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_27_26_0]
{
name: "GEO",
index: "target_cell_27_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_27_27_0]
{
name: "GEO",
index: "target_cell_27_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_27_28_0]
{
name: "GEO",
index: "target_cell_27_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_27_29_0]
{
name: "GEO",
index: "target_cell_27_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_27_30_0]
{
name: "GEO",
index: "target_cell_27_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [69.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_27_31_0]
{
name: "GEO",
index: "target_cell_27_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [69.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_28_0_0]
{
name: "GEO",
index: "target_cell_28_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_28_1_0]
{
name: "GEO",
index: "target_cell_28_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_28_2_0]
{
name: "GEO",
index: "target_cell_28_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_28_3_0]
{
name: "GEO",
index: "target_cell_28_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_28_4_0]
{
name: "GEO",
index: "target_cell_28_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_28_5_0]
{
name: "GEO",
index: "target_cell_28_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_28_6_0]
{
name: "GEO",
index: "target_cell_28_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_28_7_0]
{
name: "GEO",
index: "target_cell_28_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_28_8_0]
{
name: "GEO",
index: "target_cell_28_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_28_9_0]
{
name: "GEO",
index: "target_cell_28_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_28_10_0]
{
name: "GEO",
index: "target_cell_28_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_28_11_0]
{
name: "GEO",
index: "target_cell_28_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_28_12_0]
{
name: "GEO",
index: "target_cell_28_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_28_13_0]
{
name: "GEO",
index: "target_cell_28_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_28_14_0]
{
name: "GEO",
index: "target_cell_28_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_28_15_0]
{
name: "GEO",
index: "target_cell_28_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_28_16_0]
{
name: "GEO",
index: "target_cell_28_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_28_17_0]
{
name: "GEO",
index: "target_cell_28_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_28_18_0]
{
name: "GEO",
index: "target_cell_28_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_28_19_0]
{
name: "GEO",
index: "target_cell_28_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_28_20_0]
{
name: "GEO",
index: "target_cell_28_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_28_21_0]
{
name: "GEO",
index: "target_cell_28_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_28_22_0]
{
name: "GEO",
index: "target_cell_28_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_28_23_0]
{
name: "GEO",
index: "target_cell_28_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_28_24_0]
{
name: "GEO",
index: "target_cell_28_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_28_25_0]
{
name: "GEO",
index: "target_cell_28_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_28_26_0]
{
name: "GEO",
index: "target_cell_28_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_28_27_0]
{
name: "GEO",
index: "target_cell_28_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_28_28_0]
{
name: "GEO",
index: "target_cell_28_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_28_29_0]
{
name: "GEO",
index: "target_cell_28_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_28_30_0]
{
name: "GEO",
index: "target_cell_28_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [75.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_28_31_0]
{
name: "GEO",
index: "target_cell_28_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [75.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_29_0_0]
{
name: "GEO",
index: "target_cell_29_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_29_1_0]
{
name: "GEO",
index: "target_cell_29_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_29_2_0]
{
name: "GEO",
index: "target_cell_29_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_29_3_0]
{
name: "GEO",
index: "target_cell_29_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_29_4_0]
{
name: "GEO",
index: "target_cell_29_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_29_5_0]
{
name: "GEO",
index: "target_cell_29_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_29_6_0]
{
name: "GEO",
index: "target_cell_29_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_29_7_0]
{
name: "GEO",
index: "target_cell_29_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_29_8_0]
{
name: "GEO",
index: "target_cell_29_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_29_9_0]
{
name: "GEO",
index: "target_cell_29_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_29_10_0]
{
name: "GEO",
index: "target_cell_29_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_29_11_0]
{
name: "GEO",
index: "target_cell_29_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_29_12_0]
{
name: "GEO",
index: "target_cell_29_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_29_13_0]
{
name: "GEO",
index: "target_cell_29_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_29_14_0]
{
name: "GEO",
index: "target_cell_29_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_29_15_0]
{
name: "GEO",
index: "target_cell_29_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_29_16_0]
{
name: "GEO",
index: "target_cell_29_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_29_17_0]
{
name: "GEO",
index: "target_cell_29_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_29_18_0]
{
name: "GEO",
index: "target_cell_29_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_29_19_0]
{
name: "GEO",
index: "target_cell_29_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_29_20_0]
{
name: "GEO",
index: "target_cell_29_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_29_21_0]
{
name: "GEO",
index: "target_cell_29_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_29_22_0]
{
name: "GEO",
index: "target_cell_29_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_29_23_0]
{
name: "GEO",
index: "target_cell_29_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_29_24_0]
{
name: "GEO",
index: "target_cell_29_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_29_25_0]
{
name: "GEO",
index: "target_cell_29_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_29_26_0]
{
name: "GEO",
index: "target_cell_29_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_29_27_0]
{
name: "GEO",
index: "target_cell_29_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_29_28_0]
{
name: "GEO",
index: "target_cell_29_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_29_29_0]
{
name: "GEO",
index: "target_cell_29_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_29_30_0]
{
name: "GEO",
index: "target_cell_29_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [81.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_29_31_0]
{
name: "GEO",
index: "target_cell_29_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [81.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_30_0_0]
{
name: "GEO",
index: "target_cell_30_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_30_1_0]
{
name: "GEO",
index: "target_cell_30_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_30_2_0]
{
name: "GEO",
index: "target_cell_30_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_30_3_0]
{
name: "GEO",
index: "target_cell_30_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_30_4_0]
{
name: "GEO",
index: "target_cell_30_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_30_5_0]
{
name: "GEO",
index: "target_cell_30_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_30_6_0]
{
name: "GEO",
index: "target_cell_30_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_30_7_0]
{
name: "GEO",
index: "target_cell_30_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_30_8_0]
{
name: "GEO",
index: "target_cell_30_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_30_9_0]
{
name: "GEO",
index: "target_cell_30_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_30_10_0]
{
name: "GEO",
index: "target_cell_30_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_30_11_0]
{
name: "GEO",
index: "target_cell_30_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_30_12_0]
{
name: "GEO",
index: "target_cell_30_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_30_13_0]
{
name: "GEO",
index: "target_cell_30_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_30_14_0]
{
name: "GEO",
index: "target_cell_30_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_30_15_0]
{
name: "GEO",
index: "target_cell_30_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_30_16_0]
{
name: "GEO",
index: "target_cell_30_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_30_17_0]
{
name: "GEO",
index: "target_cell_30_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_30_18_0]
{
name: "GEO",
index: "target_cell_30_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_30_19_0]
{
name: "GEO",
index: "target_cell_30_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_30_20_0]
{
name: "GEO",
index: "target_cell_30_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_30_21_0]
{
name: "GEO",
index: "target_cell_30_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_30_22_0]
{
name: "GEO",
index: "target_cell_30_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_30_23_0]
{
name: "GEO",
index: "target_cell_30_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_30_24_0]
{
name: "GEO",
index: "target_cell_30_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_30_25_0]
{
name: "GEO",
index: "target_cell_30_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_30_26_0]
{
name: "GEO",
index: "target_cell_30_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_30_27_0]
{
name: "GEO",
index: "target_cell_30_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_30_28_0]
{
name: "GEO",
index: "target_cell_30_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_30_29_0]
{
name: "GEO",
index: "target_cell_30_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_30_30_0]
{
name: "GEO",
index: "target_cell_30_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [87.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_30_31_0]
{
name: "GEO",
index: "target_cell_30_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [87.000, 93.000, 0.0] // mm
}


// -------- GEO[target_cell_31_0_0]
{
name: "GEO",
index: "target_cell_31_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, -93.000, 0.0] // mm
}


// -------- GEO[target_cell_31_1_0]
{
name: "GEO",
index: "target_cell_31_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, -87.000, 0.0] // mm
}


// -------- GEO[target_cell_31_2_0]
{
name: "GEO",
index: "target_cell_31_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, -81.000, 0.0] // mm
}


// -------- GEO[target_cell_31_3_0]
{
name: "GEO",
index: "target_cell_31_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, -75.000, 0.0] // mm
}


// -------- GEO[target_cell_31_4_0]
{
name: "GEO",
index: "target_cell_31_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, -69.000, 0.0] // mm
}


// -------- GEO[target_cell_31_5_0]
{
name: "GEO",
index: "target_cell_31_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, -63.000, 0.0] // mm
}


// -------- GEO[target_cell_31_6_0]
{
name: "GEO",
index: "target_cell_31_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, -57.000, 0.0] // mm
}


// -------- GEO[target_cell_31_7_0]
{
name: "GEO",
index: "target_cell_31_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, -51.000, 0.0] // mm
}


// -------- GEO[target_cell_31_8_0]
{
name: "GEO",
index: "target_cell_31_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, -45.000, 0.0] // mm
}


// -------- GEO[target_cell_31_9_0]
{
name: "GEO",
index: "target_cell_31_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, -39.000, 0.0] // mm
}


// -------- GEO[target_cell_31_10_0]
{
name: "GEO",
index: "target_cell_31_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, -33.000, 0.0] // mm
}


// -------- GEO[target_cell_31_11_0]
{
name: "GEO",
index: "target_cell_31_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, -27.000, 0.0] // mm
}


// -------- GEO[target_cell_31_12_0]
{
name: "GEO",
index: "target_cell_31_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, -21.000, 0.0] // mm
}


// -------- GEO[target_cell_31_13_0]
{
name: "GEO",
index: "target_cell_31_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, -15.000, 0.0] // mm
}


// -------- GEO[target_cell_31_14_0]
{
name: "GEO",
index: "target_cell_31_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, -9.000, 0.0] // mm
}


// -------- GEO[target_cell_31_15_0]
{
name: "GEO",
index: "target_cell_31_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, -3.000, 0.0] // mm
}


// -------- GEO[target_cell_31_16_0]
{
name: "GEO",
index: "target_cell_31_16_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, 3.000, 0.0] // mm
}


// -------- GEO[target_cell_31_17_0]
{
name: "GEO",
index: "target_cell_31_17_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, 9.000, 0.0] // mm
}


// -------- GEO[target_cell_31_18_0]
{
name: "GEO",
index: "target_cell_31_18_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, 15.000, 0.0] // mm
}


// -------- GEO[target_cell_31_19_0]
{
name: "GEO",
index: "target_cell_31_19_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, 21.000, 0.0] // mm
}


// -------- GEO[target_cell_31_20_0]
{
name: "GEO",
index: "target_cell_31_20_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, 27.000, 0.0] // mm
}


// -------- GEO[target_cell_31_21_0]
{
name: "GEO",
index: "target_cell_31_21_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, 33.000, 0.0] // mm
}


// -------- GEO[target_cell_31_22_0]
{
name: "GEO",
index: "target_cell_31_22_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, 39.000, 0.0] // mm
}


// -------- GEO[target_cell_31_23_0]
{
name: "GEO",
index: "target_cell_31_23_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, 45.000, 0.0] // mm
}


// -------- GEO[target_cell_31_24_0]
{
name: "GEO",
index: "target_cell_31_24_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, 51.000, 0.0] // mm
}


// -------- GEO[target_cell_31_25_0]
{
name: "GEO",
index: "target_cell_31_25_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, 57.000, 0.0] // mm
}


// -------- GEO[target_cell_31_26_0]
{
name: "GEO",
index: "target_cell_31_26_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, 63.000, 0.0] // mm
}


// -------- GEO[target_cell_31_27_0]
{
name: "GEO",
index: "target_cell_31_27_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, 69.000, 0.0] // mm
}


// -------- GEO[target_cell_31_28_0]
{
name: "GEO",
index: "target_cell_31_28_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, 75.000, 0.0] // mm
}


// -------- GEO[target_cell_31_29_0]
{
name: "GEO",
index: "target_cell_31_29_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, 81.000, 0.0] // mm
}


// -------- GEO[target_cell_31_30_0]
{
name: "GEO",
index: "target_cell_31_30_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "glass",
invisible: 1, // inert cell
color: [0.5, 0.5, 0.5],
position: [93.000, 87.000, 0.0] // mm
}


// -------- GEO[target_cell_31_31_0]
{
name: "GEO",
index: "target_cell_31_31_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [2.50, 2.50, 400.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0, // active cell
color: [0.0, 1.0, 1.0],
position: [93.000, 93.000, 0.0] // mm
}


