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
//size: [10000.0, 10000.0, 10000.0], // mm
size: [1600.0, 1600.0, 1600.0], // mm
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
size: [1557.000, 1000.500, 1330.500], // mm
material: "water",
invisible: 0,
position: [0.0, 0.0, 0.0] // mm
}

// CELLS

// -------- GEO[target_cell_array]
{
name: "GEO",
index: "target_cell_array",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "cave",
mother: "water_shield",
type: "box",
size: [1057.000, 500.500, 830.500], // mm
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
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_0_0_1]
{
name: "GEO",
index: "target_cell_0_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_0_0_2]
{
name: "GEO",
index: "target_cell_0_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_0_0_3]
{
name: "GEO",
index: "target_cell_0_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_0_0_4]
{
name: "GEO",
index: "target_cell_0_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_0_0_5]
{
name: "GEO",
index: "target_cell_0_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_0_0_6]
{
name: "GEO",
index: "target_cell_0_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_0_0_7]
{
name: "GEO",
index: "target_cell_0_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_0_0_8]
{
name: "GEO",
index: "target_cell_0_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_0_0_9]
{
name: "GEO",
index: "target_cell_0_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_0_0_10]
{
name: "GEO",
index: "target_cell_0_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-981.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_1_0_0]
{
name: "GEO",
index: "target_cell_1_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_1_0_1]
{
name: "GEO",
index: "target_cell_1_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_1_0_2]
{
name: "GEO",
index: "target_cell_1_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_1_0_3]
{
name: "GEO",
index: "target_cell_1_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_1_0_4]
{
name: "GEO",
index: "target_cell_1_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_1_0_5]
{
name: "GEO",
index: "target_cell_1_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_1_0_6]
{
name: "GEO",
index: "target_cell_1_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_1_0_7]
{
name: "GEO",
index: "target_cell_1_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_1_0_8]
{
name: "GEO",
index: "target_cell_1_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_1_0_9]
{
name: "GEO",
index: "target_cell_1_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_1_0_10]
{
name: "GEO",
index: "target_cell_1_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-830.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_2_0_0]
{
name: "GEO",
index: "target_cell_2_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_2_0_1]
{
name: "GEO",
index: "target_cell_2_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_2_0_2]
{
name: "GEO",
index: "target_cell_2_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_2_0_3]
{
name: "GEO",
index: "target_cell_2_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_2_0_4]
{
name: "GEO",
index: "target_cell_2_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_2_0_5]
{
name: "GEO",
index: "target_cell_2_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_2_0_6]
{
name: "GEO",
index: "target_cell_2_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_2_0_7]
{
name: "GEO",
index: "target_cell_2_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_2_0_8]
{
name: "GEO",
index: "target_cell_2_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_2_0_9]
{
name: "GEO",
index: "target_cell_2_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_2_0_10]
{
name: "GEO",
index: "target_cell_2_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-679.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_3_0_0]
{
name: "GEO",
index: "target_cell_3_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_3_0_1]
{
name: "GEO",
index: "target_cell_3_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_3_0_2]
{
name: "GEO",
index: "target_cell_3_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_3_0_3]
{
name: "GEO",
index: "target_cell_3_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_3_0_4]
{
name: "GEO",
index: "target_cell_3_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_3_0_5]
{
name: "GEO",
index: "target_cell_3_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_3_0_6]
{
name: "GEO",
index: "target_cell_3_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_3_0_7]
{
name: "GEO",
index: "target_cell_3_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_3_0_8]
{
name: "GEO",
index: "target_cell_3_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_3_0_9]
{
name: "GEO",
index: "target_cell_3_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_3_0_10]
{
name: "GEO",
index: "target_cell_3_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-528.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_4_0_0]
{
name: "GEO",
index: "target_cell_4_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_4_0_1]
{
name: "GEO",
index: "target_cell_4_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_4_0_2]
{
name: "GEO",
index: "target_cell_4_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_4_0_3]
{
name: "GEO",
index: "target_cell_4_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_4_0_4]
{
name: "GEO",
index: "target_cell_4_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_4_0_5]
{
name: "GEO",
index: "target_cell_4_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_4_0_6]
{
name: "GEO",
index: "target_cell_4_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_4_0_7]
{
name: "GEO",
index: "target_cell_4_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_4_0_8]
{
name: "GEO",
index: "target_cell_4_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_4_0_9]
{
name: "GEO",
index: "target_cell_4_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_4_0_10]
{
name: "GEO",
index: "target_cell_4_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-377.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_5_0_0]
{
name: "GEO",
index: "target_cell_5_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_5_0_1]
{
name: "GEO",
index: "target_cell_5_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_5_0_2]
{
name: "GEO",
index: "target_cell_5_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_5_0_3]
{
name: "GEO",
index: "target_cell_5_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_5_0_4]
{
name: "GEO",
index: "target_cell_5_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_5_0_5]
{
name: "GEO",
index: "target_cell_5_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_5_0_6]
{
name: "GEO",
index: "target_cell_5_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_5_0_7]
{
name: "GEO",
index: "target_cell_5_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_5_0_8]
{
name: "GEO",
index: "target_cell_5_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_5_0_9]
{
name: "GEO",
index: "target_cell_5_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_5_0_10]
{
name: "GEO",
index: "target_cell_5_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-226.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_6_0_0]
{
name: "GEO",
index: "target_cell_6_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_6_0_1]
{
name: "GEO",
index: "target_cell_6_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_6_0_2]
{
name: "GEO",
index: "target_cell_6_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_6_0_3]
{
name: "GEO",
index: "target_cell_6_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_6_0_4]
{
name: "GEO",
index: "target_cell_6_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_6_0_5]
{
name: "GEO",
index: "target_cell_6_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_6_0_6]
{
name: "GEO",
index: "target_cell_6_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_6_0_7]
{
name: "GEO",
index: "target_cell_6_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_6_0_8]
{
name: "GEO",
index: "target_cell_6_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_6_0_9]
{
name: "GEO",
index: "target_cell_6_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_6_0_10]
{
name: "GEO",
index: "target_cell_6_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [-75.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_7_0_0]
{
name: "GEO",
index: "target_cell_7_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_7_0_1]
{
name: "GEO",
index: "target_cell_7_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_7_0_2]
{
name: "GEO",
index: "target_cell_7_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_7_0_3]
{
name: "GEO",
index: "target_cell_7_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_7_0_4]
{
name: "GEO",
index: "target_cell_7_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_7_0_5]
{
name: "GEO",
index: "target_cell_7_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_7_0_6]
{
name: "GEO",
index: "target_cell_7_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_7_0_7]
{
name: "GEO",
index: "target_cell_7_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_7_0_8]
{
name: "GEO",
index: "target_cell_7_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_7_0_9]
{
name: "GEO",
index: "target_cell_7_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_7_0_10]
{
name: "GEO",
index: "target_cell_7_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [75.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_8_0_0]
{
name: "GEO",
index: "target_cell_8_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_8_0_1]
{
name: "GEO",
index: "target_cell_8_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_8_0_2]
{
name: "GEO",
index: "target_cell_8_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_8_0_3]
{
name: "GEO",
index: "target_cell_8_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_8_0_4]
{
name: "GEO",
index: "target_cell_8_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_8_0_5]
{
name: "GEO",
index: "target_cell_8_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_8_0_6]
{
name: "GEO",
index: "target_cell_8_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_8_0_7]
{
name: "GEO",
index: "target_cell_8_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_8_0_8]
{
name: "GEO",
index: "target_cell_8_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_8_0_9]
{
name: "GEO",
index: "target_cell_8_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_8_0_10]
{
name: "GEO",
index: "target_cell_8_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [226.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_9_0_0]
{
name: "GEO",
index: "target_cell_9_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_9_0_1]
{
name: "GEO",
index: "target_cell_9_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_9_0_2]
{
name: "GEO",
index: "target_cell_9_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_9_0_3]
{
name: "GEO",
index: "target_cell_9_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_9_0_4]
{
name: "GEO",
index: "target_cell_9_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_9_0_5]
{
name: "GEO",
index: "target_cell_9_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_9_0_6]
{
name: "GEO",
index: "target_cell_9_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_9_0_7]
{
name: "GEO",
index: "target_cell_9_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_9_0_8]
{
name: "GEO",
index: "target_cell_9_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_9_0_9]
{
name: "GEO",
index: "target_cell_9_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_9_0_10]
{
name: "GEO",
index: "target_cell_9_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [377.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_10_0_0]
{
name: "GEO",
index: "target_cell_10_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_10_0_1]
{
name: "GEO",
index: "target_cell_10_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_10_0_2]
{
name: "GEO",
index: "target_cell_10_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_10_0_3]
{
name: "GEO",
index: "target_cell_10_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_10_0_4]
{
name: "GEO",
index: "target_cell_10_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_10_0_5]
{
name: "GEO",
index: "target_cell_10_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_10_0_6]
{
name: "GEO",
index: "target_cell_10_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_10_0_7]
{
name: "GEO",
index: "target_cell_10_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_10_0_8]
{
name: "GEO",
index: "target_cell_10_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_10_0_9]
{
name: "GEO",
index: "target_cell_10_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_10_0_10]
{
name: "GEO",
index: "target_cell_10_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [528.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_11_0_0]
{
name: "GEO",
index: "target_cell_11_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_11_0_1]
{
name: "GEO",
index: "target_cell_11_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_11_0_2]
{
name: "GEO",
index: "target_cell_11_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_11_0_3]
{
name: "GEO",
index: "target_cell_11_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_11_0_4]
{
name: "GEO",
index: "target_cell_11_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_11_0_5]
{
name: "GEO",
index: "target_cell_11_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_11_0_6]
{
name: "GEO",
index: "target_cell_11_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_11_0_7]
{
name: "GEO",
index: "target_cell_11_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_11_0_8]
{
name: "GEO",
index: "target_cell_11_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_11_0_9]
{
name: "GEO",
index: "target_cell_11_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_11_0_10]
{
name: "GEO",
index: "target_cell_11_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [679.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_12_0_0]
{
name: "GEO",
index: "target_cell_12_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_12_0_1]
{
name: "GEO",
index: "target_cell_12_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_12_0_2]
{
name: "GEO",
index: "target_cell_12_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_12_0_3]
{
name: "GEO",
index: "target_cell_12_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_12_0_4]
{
name: "GEO",
index: "target_cell_12_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_12_0_5]
{
name: "GEO",
index: "target_cell_12_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_12_0_6]
{
name: "GEO",
index: "target_cell_12_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_12_0_7]
{
name: "GEO",
index: "target_cell_12_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_12_0_8]
{
name: "GEO",
index: "target_cell_12_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_12_0_9]
{
name: "GEO",
index: "target_cell_12_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_12_0_10]
{
name: "GEO",
index: "target_cell_12_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [830.500, 0.0, 755.000] // mm
}


// -------- GEO[target_cell_13_0_0]
{
name: "GEO",
index: "target_cell_13_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, -755.000] // mm
}


// -------- GEO[target_cell_13_0_1]
{
name: "GEO",
index: "target_cell_13_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, -604.000] // mm
}


// -------- GEO[target_cell_13_0_2]
{
name: "GEO",
index: "target_cell_13_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, -453.000] // mm
}


// -------- GEO[target_cell_13_0_3]
{
name: "GEO",
index: "target_cell_13_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, -302.000] // mm
}


// -------- GEO[target_cell_13_0_4]
{
name: "GEO",
index: "target_cell_13_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, -151.000] // mm
}


// -------- GEO[target_cell_13_0_5]
{
name: "GEO",
index: "target_cell_13_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, 0.0] // mm
}


// -------- GEO[target_cell_13_0_6]
{
name: "GEO",
index: "target_cell_13_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, 151.000] // mm
}


// -------- GEO[target_cell_13_0_7]
{
name: "GEO",
index: "target_cell_13_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, 302.000] // mm
}


// -------- GEO[target_cell_13_0_8]
{
name: "GEO",
index: "target_cell_13_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, 453.000] // mm
}


// -------- GEO[target_cell_13_0_9]
{
name: "GEO",
index: "target_cell_13_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, 604.000] // mm
}


// -------- GEO[target_cell_13_0_10]
{
name: "GEO",
index: "target_cell_13_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_cell_array",
type: "box",
size: [75.0, 500.0, 75.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_0008li6",
invisible: 0,
position: [981.500, 0.0, 755.000] // mm
}


