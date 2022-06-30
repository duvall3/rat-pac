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


/* // CAVE FACES -- for visualization purposes */
/* // -------- GEO[cave_floor] */
/* { */
/* name: "GEO", */
/* index: "cave_floor", */
/* valid_begin: [0, 0], */
/* valid_end: [0, 0], */
/* mother: "world", */
/* type: "box", */
/* size: [10000.0, 1.0, 10000.0], // mm */
/* material: "rock", */
/* invisible: 1, */
/* position: [0.0, -10000.0, 0.0] // mm */
/* } */
//
/* // -------- GEO[cave_ceiling] */
/* { */
/* name: "GEO", */
/* index: "cave_ceiling", */
/* valid_begin: [0, 0], */
/* valid_end: [0, 0], */
/* mother: "world", */
/* type: "box", */
/* size: [10000.0, 1.0, 10000.0], // mm */
/* material: "rock", */
/* invisible: 1, */
/* position: [0.0, 10000.0, 0.0] // mm */
/* } */
//
//
/* // -------- GEO[cave_back] */
/* { */
/* name: "GEO", */
/* index: "cave_back", */
/* valid_begin: [0, 0], */
/* valid_end: [0, 0], */
/* mother: "world", */
/* type: "box", */
/* size: [10000.0, 10000.0, 1.0], // mm */
/* material: "rock", */
/* invisible: 1, */
/* position: [0.0, 0.0, 10000.0] // mm */
/* } */
//
//
/* // -------- GEO[cave_lwall] */
/* { */
/* name: "GEO", */
/* index: "cave_lwall", */
/* valid_begin: [0, 0], */
/* valid_end: [0, 0], */
/* mother: "world", */
/* type: "box", */
/* size: [1.0, 10000.0, 10000.0], // mm */
/* material: "rock", */
/* invisible: 1, */
/* position: [-10000.0, 0.0, 0.0] // mm */
/* } */
//
//
/* // -------- GEO[cave_rwall] */
/* { */
/* name: "GEO", */
/* index: "cave_rwall", */
/* valid_begin: [0, 0], */
/* valid_end: [0, 0], */
/* mother: "world", */
/* type: "box", */
/* size: [1.0, 10000.0, 10000.0], // mm */
/* material: "rock", */
/* invisible: 1, */
/* position: [10000.0, 0.0, 0.0] // mm */
/* } */
//
/* // -------- GEO[source] */
/* { */
/* name: "GEO", */
/* index: "source", */
/* valid_begin: [0, 0], */
/* valid_end: [0, 0], */
/* mother: "world", */
/* type: "box", */
/* size: [1.0, 27.0, 200.0], // mm */
/* material: "air", */
/* invisible: 1, */
/* position: [-100.0, 0.0, 0.0] // mm */
/* } */


// DETECTOR ELEMENTS

// -------- GEO[target_cell_array]
{
name: "GEO",
index: "target_cell_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [349.96500000000000000000, 187.74341840801094598096, 50.75250000000], // mm
material: "air",
invisible: 0,
position: [0.0, 0.0, 0.0], // mm
color: [0.8 0.8 0.1],
}


// -------- GEO[target_cell_0_0]
{
name: "GEO",
index: "target_cell_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-247.500000, -116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_0_1]
{
name: "GEO",
index: "target_cell_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-157.500000, -116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_0_2]
{
name: "GEO",
index: "target_cell_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-67.500000, -116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_0_3]
{
name: "GEO",
index: "target_cell_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [22.500000, -116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_0_4]
{
name: "GEO",
index: "target_cell_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [112.500000, -116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_0_5]
{
name: "GEO",
index: "target_cell_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [202.500000, -116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_1_0]
{
name: "GEO",
index: "target_cell_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-202.500000, -38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_1_1]
{
name: "GEO",
index: "target_cell_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-112.500000, -38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_1_2]
{
name: "GEO",
index: "target_cell_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-22.500000, -38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_1_3]
{
name: "GEO",
index: "target_cell_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [67.500000, -38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_1_4]
{
name: "GEO",
index: "target_cell_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [157.500000, -38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_1_5]
{
name: "GEO",
index: "target_cell_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [247.500000, -38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_2_0]
{
name: "GEO",
index: "target_cell_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-247.500000, 38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_2_1]
{
name: "GEO",
index: "target_cell_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-157.500000, 38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_2_2]
{
name: "GEO",
index: "target_cell_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-67.500000, 38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_2_3]
{
name: "GEO",
index: "target_cell_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [22.500000, 38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_2_4]
{
name: "GEO",
index: "target_cell_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [112.500000, 38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_2_5]
{
name: "GEO",
index: "target_cell_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [202.500000, 38.97114317029973910420, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_3_0]
{
name: "GEO",
index: "target_cell_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-202.500000, 116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_3_1]
{
name: "GEO",
index: "target_cell_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-112.500000, 116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_3_2]
{
name: "GEO",
index: "target_cell_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [-22.500000, 116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_3_3]
{
name: "GEO",
index: "target_cell_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [67.500000, 116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_3_4]
{
name: "GEO",
index: "target_cell_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [157.500000, 116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_cell_3_5]
{
name: "GEO",
index: "target_cell_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 50.000000,
position: [247.500000, 116.91342951089921731260, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


