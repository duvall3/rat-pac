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
size: [672.28125000000000000000, 550.06139469336981993656, 5075.25000000000], // mm
material: "air",
invisible: 0,
position: [0.0, 0.0, 0.0], // mm
color: [0.8 0.8 0.1],
}


// -------- GEO[target_tube_0_0]
{
name: "GEO",
index: "target_tube_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-581.250000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-581.250000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_1]
{
name: "GEO",
index: "target_tube_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-506.250000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-506.250000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_2]
{
name: "GEO",
index: "target_tube_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-431.250000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-431.250000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_3]
{
name: "GEO",
index: "target_tube_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-356.250000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-356.250000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_4]
{
name: "GEO",
index: "target_tube_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-281.250000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-281.250000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_5]
{
name: "GEO",
index: "target_tube_0_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-206.250000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-206.250000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_6]
{
name: "GEO",
index: "target_tube_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-131.250000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_6]
{
name: "GEO",
index: "target_cell_0_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-131.250000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_7]
{
name: "GEO",
index: "target_tube_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-56.250000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_7]
{
name: "GEO",
index: "target_cell_0_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-56.250000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_8]
{
name: "GEO",
index: "target_tube_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [18.750000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_8]
{
name: "GEO",
index: "target_cell_0_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [18.750000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_9]
{
name: "GEO",
index: "target_tube_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [93.750000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_9]
{
name: "GEO",
index: "target_cell_0_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [93.750000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_10]
{
name: "GEO",
index: "target_tube_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [168.750000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_10]
{
name: "GEO",
index: "target_cell_0_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [168.750000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_11]
{
name: "GEO",
index: "target_tube_0_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [243.750000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_11]
{
name: "GEO",
index: "target_cell_0_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [243.750000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_12]
{
name: "GEO",
index: "target_tube_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [318.750000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_12]
{
name: "GEO",
index: "target_cell_0_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [318.750000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_13]
{
name: "GEO",
index: "target_tube_0_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [393.750000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_13]
{
name: "GEO",
index: "target_cell_0_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [393.750000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_14]
{
name: "GEO",
index: "target_tube_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [468.750000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_14]
{
name: "GEO",
index: "target_cell_0_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [468.750000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_0_15]
{
name: "GEO",
index: "target_tube_0_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [543.750000, -487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_0_15]
{
name: "GEO",
index: "target_cell_0_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [543.750000, -487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_0]
{
name: "GEO",
index: "target_tube_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-543.750000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-543.750000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_1]
{
name: "GEO",
index: "target_tube_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-468.750000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-468.750000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_2]
{
name: "GEO",
index: "target_tube_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-393.750000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-393.750000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_3]
{
name: "GEO",
index: "target_tube_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-318.750000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-318.750000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_4]
{
name: "GEO",
index: "target_tube_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-243.750000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-243.750000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_5]
{
name: "GEO",
index: "target_tube_1_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-168.750000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-168.750000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_6]
{
name: "GEO",
index: "target_tube_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-93.750000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_6]
{
name: "GEO",
index: "target_cell_1_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-93.750000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_7]
{
name: "GEO",
index: "target_tube_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-18.750000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_7]
{
name: "GEO",
index: "target_cell_1_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-18.750000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_8]
{
name: "GEO",
index: "target_tube_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [56.250000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_8]
{
name: "GEO",
index: "target_cell_1_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [56.250000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_9]
{
name: "GEO",
index: "target_tube_1_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [131.250000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_9]
{
name: "GEO",
index: "target_cell_1_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [131.250000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_10]
{
name: "GEO",
index: "target_tube_1_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [206.250000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_10]
{
name: "GEO",
index: "target_cell_1_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [206.250000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_11]
{
name: "GEO",
index: "target_tube_1_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [281.250000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_11]
{
name: "GEO",
index: "target_cell_1_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [281.250000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_12]
{
name: "GEO",
index: "target_tube_1_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [356.250000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_12]
{
name: "GEO",
index: "target_cell_1_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [356.250000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_13]
{
name: "GEO",
index: "target_tube_1_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [431.250000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_13]
{
name: "GEO",
index: "target_cell_1_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [431.250000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_14]
{
name: "GEO",
index: "target_tube_1_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [506.250000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_14]
{
name: "GEO",
index: "target_cell_1_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [506.250000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_1_15]
{
name: "GEO",
index: "target_tube_1_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [581.250000, -422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_1_15]
{
name: "GEO",
index: "target_cell_1_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [581.250000, -422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_0]
{
name: "GEO",
index: "target_tube_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-581.250000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-581.250000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_1]
{
name: "GEO",
index: "target_tube_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-506.250000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-506.250000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_2]
{
name: "GEO",
index: "target_tube_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-431.250000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-431.250000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_3]
{
name: "GEO",
index: "target_tube_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-356.250000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-356.250000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_4]
{
name: "GEO",
index: "target_tube_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-281.250000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-281.250000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_5]
{
name: "GEO",
index: "target_tube_2_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-206.250000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-206.250000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_6]
{
name: "GEO",
index: "target_tube_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-131.250000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_6]
{
name: "GEO",
index: "target_cell_2_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-131.250000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_7]
{
name: "GEO",
index: "target_tube_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-56.250000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_7]
{
name: "GEO",
index: "target_cell_2_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-56.250000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_8]
{
name: "GEO",
index: "target_tube_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [18.750000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_8]
{
name: "GEO",
index: "target_cell_2_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [18.750000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_9]
{
name: "GEO",
index: "target_tube_2_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [93.750000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_9]
{
name: "GEO",
index: "target_cell_2_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [93.750000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_10]
{
name: "GEO",
index: "target_tube_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [168.750000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_10]
{
name: "GEO",
index: "target_cell_2_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [168.750000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_11]
{
name: "GEO",
index: "target_tube_2_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [243.750000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_11]
{
name: "GEO",
index: "target_cell_2_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [243.750000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_12]
{
name: "GEO",
index: "target_tube_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [318.750000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_12]
{
name: "GEO",
index: "target_cell_2_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [318.750000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_13]
{
name: "GEO",
index: "target_tube_2_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [393.750000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_13]
{
name: "GEO",
index: "target_cell_2_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [393.750000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_14]
{
name: "GEO",
index: "target_tube_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [468.750000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_14]
{
name: "GEO",
index: "target_cell_2_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [468.750000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_2_15]
{
name: "GEO",
index: "target_tube_2_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [543.750000, -357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_2_15]
{
name: "GEO",
index: "target_cell_2_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [543.750000, -357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_0]
{
name: "GEO",
index: "target_tube_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-543.750000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-543.750000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_1]
{
name: "GEO",
index: "target_tube_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-468.750000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-468.750000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_2]
{
name: "GEO",
index: "target_tube_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-393.750000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-393.750000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_3]
{
name: "GEO",
index: "target_tube_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-318.750000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-318.750000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_4]
{
name: "GEO",
index: "target_tube_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-243.750000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-243.750000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_5]
{
name: "GEO",
index: "target_tube_3_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-168.750000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
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
r_max: 22.000000,
size_z: 5000.000000,
position: [-168.750000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_6]
{
name: "GEO",
index: "target_tube_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-93.750000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_6]
{
name: "GEO",
index: "target_cell_3_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-93.750000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_7]
{
name: "GEO",
index: "target_tube_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-18.750000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_7]
{
name: "GEO",
index: "target_cell_3_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-18.750000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_8]
{
name: "GEO",
index: "target_tube_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [56.250000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_8]
{
name: "GEO",
index: "target_cell_3_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [56.250000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_9]
{
name: "GEO",
index: "target_tube_3_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [131.250000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_9]
{
name: "GEO",
index: "target_cell_3_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [131.250000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_10]
{
name: "GEO",
index: "target_tube_3_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [206.250000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_10]
{
name: "GEO",
index: "target_cell_3_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [206.250000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_11]
{
name: "GEO",
index: "target_tube_3_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [281.250000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_11]
{
name: "GEO",
index: "target_cell_3_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [281.250000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_12]
{
name: "GEO",
index: "target_tube_3_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [356.250000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_12]
{
name: "GEO",
index: "target_cell_3_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [356.250000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_13]
{
name: "GEO",
index: "target_tube_3_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [431.250000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_13]
{
name: "GEO",
index: "target_cell_3_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [431.250000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_14]
{
name: "GEO",
index: "target_tube_3_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [506.250000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_14]
{
name: "GEO",
index: "target_cell_3_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [506.250000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_3_15]
{
name: "GEO",
index: "target_tube_3_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [581.250000, -292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_3_15]
{
name: "GEO",
index: "target_cell_3_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [581.250000, -292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_0]
{
name: "GEO",
index: "target_tube_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-581.250000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_0]
{
name: "GEO",
index: "target_cell_4_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-581.250000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_1]
{
name: "GEO",
index: "target_tube_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-506.250000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_1]
{
name: "GEO",
index: "target_cell_4_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-506.250000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_2]
{
name: "GEO",
index: "target_tube_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-431.250000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_2]
{
name: "GEO",
index: "target_cell_4_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-431.250000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_3]
{
name: "GEO",
index: "target_tube_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-356.250000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_3]
{
name: "GEO",
index: "target_cell_4_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-356.250000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_4]
{
name: "GEO",
index: "target_tube_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-281.250000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_4]
{
name: "GEO",
index: "target_cell_4_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-281.250000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_5]
{
name: "GEO",
index: "target_tube_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-206.250000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_5]
{
name: "GEO",
index: "target_cell_4_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-206.250000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_6]
{
name: "GEO",
index: "target_tube_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-131.250000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_6]
{
name: "GEO",
index: "target_cell_4_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-131.250000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_7]
{
name: "GEO",
index: "target_tube_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-56.250000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_7]
{
name: "GEO",
index: "target_cell_4_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-56.250000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_8]
{
name: "GEO",
index: "target_tube_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [18.750000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_8]
{
name: "GEO",
index: "target_cell_4_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [18.750000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_9]
{
name: "GEO",
index: "target_tube_4_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [93.750000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_9]
{
name: "GEO",
index: "target_cell_4_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [93.750000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_10]
{
name: "GEO",
index: "target_tube_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [168.750000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_10]
{
name: "GEO",
index: "target_cell_4_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [168.750000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_11]
{
name: "GEO",
index: "target_tube_4_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [243.750000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_11]
{
name: "GEO",
index: "target_cell_4_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [243.750000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_12]
{
name: "GEO",
index: "target_tube_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [318.750000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_12]
{
name: "GEO",
index: "target_cell_4_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [318.750000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_13]
{
name: "GEO",
index: "target_tube_4_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [393.750000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_13]
{
name: "GEO",
index: "target_cell_4_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [393.750000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_14]
{
name: "GEO",
index: "target_tube_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [468.750000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_14]
{
name: "GEO",
index: "target_cell_4_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [468.750000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_4_15]
{
name: "GEO",
index: "target_tube_4_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [543.750000, -227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_4_15]
{
name: "GEO",
index: "target_cell_4_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [543.750000, -227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_0]
{
name: "GEO",
index: "target_tube_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-543.750000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_0]
{
name: "GEO",
index: "target_cell_5_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-543.750000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_1]
{
name: "GEO",
index: "target_tube_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-468.750000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_1]
{
name: "GEO",
index: "target_cell_5_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-468.750000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_2]
{
name: "GEO",
index: "target_tube_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-393.750000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_2]
{
name: "GEO",
index: "target_cell_5_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-393.750000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_3]
{
name: "GEO",
index: "target_tube_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-318.750000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_3]
{
name: "GEO",
index: "target_cell_5_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-318.750000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_4]
{
name: "GEO",
index: "target_tube_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-243.750000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_4]
{
name: "GEO",
index: "target_cell_5_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-243.750000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_5]
{
name: "GEO",
index: "target_tube_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-168.750000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_5]
{
name: "GEO",
index: "target_cell_5_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-168.750000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_6]
{
name: "GEO",
index: "target_tube_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-93.750000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_6]
{
name: "GEO",
index: "target_cell_5_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-93.750000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_7]
{
name: "GEO",
index: "target_tube_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-18.750000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_7]
{
name: "GEO",
index: "target_cell_5_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-18.750000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_8]
{
name: "GEO",
index: "target_tube_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [56.250000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_8]
{
name: "GEO",
index: "target_cell_5_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [56.250000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_9]
{
name: "GEO",
index: "target_tube_5_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [131.250000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_9]
{
name: "GEO",
index: "target_cell_5_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [131.250000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_10]
{
name: "GEO",
index: "target_tube_5_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [206.250000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_10]
{
name: "GEO",
index: "target_cell_5_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [206.250000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_11]
{
name: "GEO",
index: "target_tube_5_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [281.250000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_11]
{
name: "GEO",
index: "target_cell_5_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [281.250000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_12]
{
name: "GEO",
index: "target_tube_5_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [356.250000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_12]
{
name: "GEO",
index: "target_cell_5_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [356.250000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_13]
{
name: "GEO",
index: "target_tube_5_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [431.250000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_13]
{
name: "GEO",
index: "target_cell_5_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [431.250000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_14]
{
name: "GEO",
index: "target_tube_5_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [506.250000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_14]
{
name: "GEO",
index: "target_cell_5_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [506.250000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_5_15]
{
name: "GEO",
index: "target_tube_5_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [581.250000, -162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_5_15]
{
name: "GEO",
index: "target_cell_5_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [581.250000, -162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_0]
{
name: "GEO",
index: "target_tube_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-581.250000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_0]
{
name: "GEO",
index: "target_cell_6_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-581.250000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_1]
{
name: "GEO",
index: "target_tube_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-506.250000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_1]
{
name: "GEO",
index: "target_cell_6_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-506.250000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_2]
{
name: "GEO",
index: "target_tube_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-431.250000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_2]
{
name: "GEO",
index: "target_cell_6_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-431.250000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_3]
{
name: "GEO",
index: "target_tube_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-356.250000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_3]
{
name: "GEO",
index: "target_cell_6_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-356.250000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_4]
{
name: "GEO",
index: "target_tube_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-281.250000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_4]
{
name: "GEO",
index: "target_cell_6_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-281.250000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_5]
{
name: "GEO",
index: "target_tube_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-206.250000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_5]
{
name: "GEO",
index: "target_cell_6_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-206.250000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_6]
{
name: "GEO",
index: "target_tube_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-131.250000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_6]
{
name: "GEO",
index: "target_cell_6_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-131.250000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_7]
{
name: "GEO",
index: "target_tube_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-56.250000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_7]
{
name: "GEO",
index: "target_cell_6_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-56.250000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_8]
{
name: "GEO",
index: "target_tube_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [18.750000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_8]
{
name: "GEO",
index: "target_cell_6_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [18.750000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_9]
{
name: "GEO",
index: "target_tube_6_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [93.750000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_9]
{
name: "GEO",
index: "target_cell_6_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [93.750000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_10]
{
name: "GEO",
index: "target_tube_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [168.750000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_10]
{
name: "GEO",
index: "target_cell_6_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [168.750000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_11]
{
name: "GEO",
index: "target_tube_6_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [243.750000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_11]
{
name: "GEO",
index: "target_cell_6_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [243.750000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_12]
{
name: "GEO",
index: "target_tube_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [318.750000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_12]
{
name: "GEO",
index: "target_cell_6_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [318.750000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_13]
{
name: "GEO",
index: "target_tube_6_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [393.750000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_13]
{
name: "GEO",
index: "target_cell_6_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [393.750000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_14]
{
name: "GEO",
index: "target_tube_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [468.750000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_14]
{
name: "GEO",
index: "target_cell_6_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [468.750000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_6_15]
{
name: "GEO",
index: "target_tube_6_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [543.750000, -97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_6_15]
{
name: "GEO",
index: "target_cell_6_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [543.750000, -97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_0]
{
name: "GEO",
index: "target_tube_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-543.750000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_0]
{
name: "GEO",
index: "target_cell_7_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-543.750000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_1]
{
name: "GEO",
index: "target_tube_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-468.750000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_1]
{
name: "GEO",
index: "target_cell_7_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-468.750000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_2]
{
name: "GEO",
index: "target_tube_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-393.750000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_2]
{
name: "GEO",
index: "target_cell_7_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-393.750000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_3]
{
name: "GEO",
index: "target_tube_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-318.750000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_3]
{
name: "GEO",
index: "target_cell_7_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-318.750000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_4]
{
name: "GEO",
index: "target_tube_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-243.750000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_4]
{
name: "GEO",
index: "target_cell_7_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-243.750000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_5]
{
name: "GEO",
index: "target_tube_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-168.750000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_5]
{
name: "GEO",
index: "target_cell_7_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-168.750000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_6]
{
name: "GEO",
index: "target_tube_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-93.750000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_6]
{
name: "GEO",
index: "target_cell_7_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-93.750000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_7]
{
name: "GEO",
index: "target_tube_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-18.750000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_7]
{
name: "GEO",
index: "target_cell_7_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-18.750000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_8]
{
name: "GEO",
index: "target_tube_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [56.250000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_8]
{
name: "GEO",
index: "target_cell_7_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [56.250000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_9]
{
name: "GEO",
index: "target_tube_7_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [131.250000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_9]
{
name: "GEO",
index: "target_cell_7_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [131.250000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_10]
{
name: "GEO",
index: "target_tube_7_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [206.250000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_10]
{
name: "GEO",
index: "target_cell_7_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [206.250000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_11]
{
name: "GEO",
index: "target_tube_7_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [281.250000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_11]
{
name: "GEO",
index: "target_cell_7_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [281.250000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_12]
{
name: "GEO",
index: "target_tube_7_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [356.250000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_12]
{
name: "GEO",
index: "target_cell_7_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [356.250000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_13]
{
name: "GEO",
index: "target_tube_7_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [431.250000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_13]
{
name: "GEO",
index: "target_cell_7_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [431.250000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_14]
{
name: "GEO",
index: "target_tube_7_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [506.250000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_14]
{
name: "GEO",
index: "target_cell_7_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [506.250000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_7_15]
{
name: "GEO",
index: "target_tube_7_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [581.250000, -32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_7_15]
{
name: "GEO",
index: "target_cell_7_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [581.250000, -32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_0]
{
name: "GEO",
index: "target_tube_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-581.250000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_0]
{
name: "GEO",
index: "target_cell_8_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-581.250000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_1]
{
name: "GEO",
index: "target_tube_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-506.250000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_1]
{
name: "GEO",
index: "target_cell_8_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-506.250000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_2]
{
name: "GEO",
index: "target_tube_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-431.250000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_2]
{
name: "GEO",
index: "target_cell_8_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-431.250000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_3]
{
name: "GEO",
index: "target_tube_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-356.250000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_3]
{
name: "GEO",
index: "target_cell_8_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-356.250000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_4]
{
name: "GEO",
index: "target_tube_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-281.250000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_4]
{
name: "GEO",
index: "target_cell_8_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-281.250000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_5]
{
name: "GEO",
index: "target_tube_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-206.250000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_5]
{
name: "GEO",
index: "target_cell_8_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-206.250000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_6]
{
name: "GEO",
index: "target_tube_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-131.250000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_6]
{
name: "GEO",
index: "target_cell_8_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-131.250000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_7]
{
name: "GEO",
index: "target_tube_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-56.250000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_7]
{
name: "GEO",
index: "target_cell_8_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-56.250000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_8]
{
name: "GEO",
index: "target_tube_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [18.750000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_8]
{
name: "GEO",
index: "target_cell_8_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [18.750000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_9]
{
name: "GEO",
index: "target_tube_8_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [93.750000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_9]
{
name: "GEO",
index: "target_cell_8_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [93.750000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_10]
{
name: "GEO",
index: "target_tube_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [168.750000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_10]
{
name: "GEO",
index: "target_cell_8_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [168.750000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_11]
{
name: "GEO",
index: "target_tube_8_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [243.750000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_11]
{
name: "GEO",
index: "target_cell_8_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [243.750000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_12]
{
name: "GEO",
index: "target_tube_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [318.750000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_12]
{
name: "GEO",
index: "target_cell_8_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [318.750000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_13]
{
name: "GEO",
index: "target_tube_8_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [393.750000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_13]
{
name: "GEO",
index: "target_cell_8_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [393.750000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_14]
{
name: "GEO",
index: "target_tube_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [468.750000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_14]
{
name: "GEO",
index: "target_cell_8_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [468.750000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_8_15]
{
name: "GEO",
index: "target_tube_8_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [543.750000, 32.47595264191644925350, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_8_15]
{
name: "GEO",
index: "target_cell_8_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [543.750000, 32.47595264191644925350, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_0]
{
name: "GEO",
index: "target_tube_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-543.750000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_0]
{
name: "GEO",
index: "target_cell_9_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-543.750000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_1]
{
name: "GEO",
index: "target_tube_9_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-468.750000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_1]
{
name: "GEO",
index: "target_cell_9_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-468.750000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_2]
{
name: "GEO",
index: "target_tube_9_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-393.750000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_2]
{
name: "GEO",
index: "target_cell_9_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-393.750000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_3]
{
name: "GEO",
index: "target_tube_9_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-318.750000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_3]
{
name: "GEO",
index: "target_cell_9_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-318.750000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_4]
{
name: "GEO",
index: "target_tube_9_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-243.750000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_4]
{
name: "GEO",
index: "target_cell_9_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-243.750000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_5]
{
name: "GEO",
index: "target_tube_9_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-168.750000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_5]
{
name: "GEO",
index: "target_cell_9_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-168.750000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_6]
{
name: "GEO",
index: "target_tube_9_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-93.750000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_6]
{
name: "GEO",
index: "target_cell_9_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-93.750000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_7]
{
name: "GEO",
index: "target_tube_9_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-18.750000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_7]
{
name: "GEO",
index: "target_cell_9_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-18.750000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_8]
{
name: "GEO",
index: "target_tube_9_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [56.250000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_8]
{
name: "GEO",
index: "target_cell_9_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [56.250000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_9]
{
name: "GEO",
index: "target_tube_9_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [131.250000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_9]
{
name: "GEO",
index: "target_cell_9_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [131.250000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_10]
{
name: "GEO",
index: "target_tube_9_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [206.250000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_10]
{
name: "GEO",
index: "target_cell_9_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [206.250000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_11]
{
name: "GEO",
index: "target_tube_9_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [281.250000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_11]
{
name: "GEO",
index: "target_cell_9_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [281.250000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_12]
{
name: "GEO",
index: "target_tube_9_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [356.250000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_12]
{
name: "GEO",
index: "target_cell_9_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [356.250000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_13]
{
name: "GEO",
index: "target_tube_9_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [431.250000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_13]
{
name: "GEO",
index: "target_cell_9_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [431.250000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_14]
{
name: "GEO",
index: "target_tube_9_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [506.250000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_14]
{
name: "GEO",
index: "target_cell_9_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [506.250000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_9_15]
{
name: "GEO",
index: "target_tube_9_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [581.250000, 97.42785792574934776050, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_9_15]
{
name: "GEO",
index: "target_cell_9_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [581.250000, 97.42785792574934776050, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_0]
{
name: "GEO",
index: "target_tube_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-581.250000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_0]
{
name: "GEO",
index: "target_cell_10_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-581.250000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_1]
{
name: "GEO",
index: "target_tube_10_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-506.250000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_1]
{
name: "GEO",
index: "target_cell_10_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-506.250000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_2]
{
name: "GEO",
index: "target_tube_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-431.250000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_2]
{
name: "GEO",
index: "target_cell_10_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-431.250000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_3]
{
name: "GEO",
index: "target_tube_10_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-356.250000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_3]
{
name: "GEO",
index: "target_cell_10_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-356.250000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_4]
{
name: "GEO",
index: "target_tube_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-281.250000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_4]
{
name: "GEO",
index: "target_cell_10_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-281.250000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_5]
{
name: "GEO",
index: "target_tube_10_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-206.250000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_5]
{
name: "GEO",
index: "target_cell_10_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-206.250000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_6]
{
name: "GEO",
index: "target_tube_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-131.250000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_6]
{
name: "GEO",
index: "target_cell_10_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-131.250000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_7]
{
name: "GEO",
index: "target_tube_10_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-56.250000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_7]
{
name: "GEO",
index: "target_cell_10_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-56.250000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_8]
{
name: "GEO",
index: "target_tube_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [18.750000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_8]
{
name: "GEO",
index: "target_cell_10_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [18.750000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_9]
{
name: "GEO",
index: "target_tube_10_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [93.750000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_9]
{
name: "GEO",
index: "target_cell_10_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [93.750000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_10]
{
name: "GEO",
index: "target_tube_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [168.750000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_10]
{
name: "GEO",
index: "target_cell_10_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [168.750000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_11]
{
name: "GEO",
index: "target_tube_10_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [243.750000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_11]
{
name: "GEO",
index: "target_cell_10_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [243.750000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_12]
{
name: "GEO",
index: "target_tube_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [318.750000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_12]
{
name: "GEO",
index: "target_cell_10_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [318.750000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_13]
{
name: "GEO",
index: "target_tube_10_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [393.750000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_13]
{
name: "GEO",
index: "target_cell_10_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [393.750000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_14]
{
name: "GEO",
index: "target_tube_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [468.750000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_14]
{
name: "GEO",
index: "target_cell_10_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [468.750000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_10_15]
{
name: "GEO",
index: "target_tube_10_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [543.750000, 162.37976320958224626750, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_10_15]
{
name: "GEO",
index: "target_cell_10_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [543.750000, 162.37976320958224626750, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_0]
{
name: "GEO",
index: "target_tube_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-543.750000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_0]
{
name: "GEO",
index: "target_cell_11_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-543.750000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_1]
{
name: "GEO",
index: "target_tube_11_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-468.750000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_1]
{
name: "GEO",
index: "target_cell_11_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-468.750000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_2]
{
name: "GEO",
index: "target_tube_11_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-393.750000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_2]
{
name: "GEO",
index: "target_cell_11_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-393.750000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_3]
{
name: "GEO",
index: "target_tube_11_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-318.750000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_3]
{
name: "GEO",
index: "target_cell_11_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-318.750000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_4]
{
name: "GEO",
index: "target_tube_11_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-243.750000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_4]
{
name: "GEO",
index: "target_cell_11_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-243.750000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_5]
{
name: "GEO",
index: "target_tube_11_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-168.750000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_5]
{
name: "GEO",
index: "target_cell_11_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-168.750000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_6]
{
name: "GEO",
index: "target_tube_11_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-93.750000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_6]
{
name: "GEO",
index: "target_cell_11_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-93.750000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_7]
{
name: "GEO",
index: "target_tube_11_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-18.750000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_7]
{
name: "GEO",
index: "target_cell_11_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-18.750000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_8]
{
name: "GEO",
index: "target_tube_11_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [56.250000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_8]
{
name: "GEO",
index: "target_cell_11_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [56.250000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_9]
{
name: "GEO",
index: "target_tube_11_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [131.250000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_9]
{
name: "GEO",
index: "target_cell_11_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [131.250000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_10]
{
name: "GEO",
index: "target_tube_11_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [206.250000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_10]
{
name: "GEO",
index: "target_cell_11_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [206.250000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_11]
{
name: "GEO",
index: "target_tube_11_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [281.250000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_11]
{
name: "GEO",
index: "target_cell_11_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [281.250000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_12]
{
name: "GEO",
index: "target_tube_11_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [356.250000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_12]
{
name: "GEO",
index: "target_cell_11_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [356.250000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_13]
{
name: "GEO",
index: "target_tube_11_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [431.250000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_13]
{
name: "GEO",
index: "target_cell_11_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [431.250000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_14]
{
name: "GEO",
index: "target_tube_11_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [506.250000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_14]
{
name: "GEO",
index: "target_cell_11_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [506.250000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_11_15]
{
name: "GEO",
index: "target_tube_11_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [581.250000, 227.33166849341514477450, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_11_15]
{
name: "GEO",
index: "target_cell_11_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [581.250000, 227.33166849341514477450, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_0]
{
name: "GEO",
index: "target_tube_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-581.250000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_0]
{
name: "GEO",
index: "target_cell_12_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-581.250000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_1]
{
name: "GEO",
index: "target_tube_12_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-506.250000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_1]
{
name: "GEO",
index: "target_cell_12_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-506.250000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_2]
{
name: "GEO",
index: "target_tube_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-431.250000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_2]
{
name: "GEO",
index: "target_cell_12_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-431.250000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_3]
{
name: "GEO",
index: "target_tube_12_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-356.250000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_3]
{
name: "GEO",
index: "target_cell_12_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-356.250000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_4]
{
name: "GEO",
index: "target_tube_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-281.250000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_4]
{
name: "GEO",
index: "target_cell_12_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-281.250000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_5]
{
name: "GEO",
index: "target_tube_12_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-206.250000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_5]
{
name: "GEO",
index: "target_cell_12_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-206.250000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_6]
{
name: "GEO",
index: "target_tube_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-131.250000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_6]
{
name: "GEO",
index: "target_cell_12_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-131.250000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_7]
{
name: "GEO",
index: "target_tube_12_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-56.250000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_7]
{
name: "GEO",
index: "target_cell_12_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-56.250000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_8]
{
name: "GEO",
index: "target_tube_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [18.750000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_8]
{
name: "GEO",
index: "target_cell_12_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [18.750000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_9]
{
name: "GEO",
index: "target_tube_12_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [93.750000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_9]
{
name: "GEO",
index: "target_cell_12_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [93.750000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_10]
{
name: "GEO",
index: "target_tube_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [168.750000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_10]
{
name: "GEO",
index: "target_cell_12_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [168.750000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_11]
{
name: "GEO",
index: "target_tube_12_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [243.750000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_11]
{
name: "GEO",
index: "target_cell_12_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [243.750000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_12]
{
name: "GEO",
index: "target_tube_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [318.750000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_12]
{
name: "GEO",
index: "target_cell_12_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [318.750000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_13]
{
name: "GEO",
index: "target_tube_12_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [393.750000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_13]
{
name: "GEO",
index: "target_cell_12_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [393.750000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_14]
{
name: "GEO",
index: "target_tube_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [468.750000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_14]
{
name: "GEO",
index: "target_cell_12_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [468.750000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_12_15]
{
name: "GEO",
index: "target_tube_12_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [543.750000, 292.28357377724804328150, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_12_15]
{
name: "GEO",
index: "target_cell_12_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [543.750000, 292.28357377724804328150, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_0]
{
name: "GEO",
index: "target_tube_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-543.750000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_0]
{
name: "GEO",
index: "target_cell_13_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-543.750000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_1]
{
name: "GEO",
index: "target_tube_13_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-468.750000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_1]
{
name: "GEO",
index: "target_cell_13_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-468.750000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_2]
{
name: "GEO",
index: "target_tube_13_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-393.750000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_2]
{
name: "GEO",
index: "target_cell_13_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-393.750000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_3]
{
name: "GEO",
index: "target_tube_13_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-318.750000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_3]
{
name: "GEO",
index: "target_cell_13_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-318.750000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_4]
{
name: "GEO",
index: "target_tube_13_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-243.750000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_4]
{
name: "GEO",
index: "target_cell_13_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-243.750000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_5]
{
name: "GEO",
index: "target_tube_13_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-168.750000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_5]
{
name: "GEO",
index: "target_cell_13_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-168.750000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_6]
{
name: "GEO",
index: "target_tube_13_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-93.750000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_6]
{
name: "GEO",
index: "target_cell_13_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-93.750000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_7]
{
name: "GEO",
index: "target_tube_13_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-18.750000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_7]
{
name: "GEO",
index: "target_cell_13_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-18.750000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_8]
{
name: "GEO",
index: "target_tube_13_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [56.250000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_8]
{
name: "GEO",
index: "target_cell_13_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [56.250000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_9]
{
name: "GEO",
index: "target_tube_13_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [131.250000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_9]
{
name: "GEO",
index: "target_cell_13_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [131.250000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_10]
{
name: "GEO",
index: "target_tube_13_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [206.250000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_10]
{
name: "GEO",
index: "target_cell_13_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [206.250000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_11]
{
name: "GEO",
index: "target_tube_13_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [281.250000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_11]
{
name: "GEO",
index: "target_cell_13_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [281.250000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_12]
{
name: "GEO",
index: "target_tube_13_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [356.250000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_12]
{
name: "GEO",
index: "target_cell_13_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [356.250000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_13]
{
name: "GEO",
index: "target_tube_13_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [431.250000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_13]
{
name: "GEO",
index: "target_cell_13_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [431.250000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_14]
{
name: "GEO",
index: "target_tube_13_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [506.250000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_14]
{
name: "GEO",
index: "target_cell_13_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [506.250000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_13_15]
{
name: "GEO",
index: "target_tube_13_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [581.250000, 357.23547906108094178850, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_13_15]
{
name: "GEO",
index: "target_cell_13_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [581.250000, 357.23547906108094178850, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_0]
{
name: "GEO",
index: "target_tube_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-581.250000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_0]
{
name: "GEO",
index: "target_cell_14_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-581.250000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_1]
{
name: "GEO",
index: "target_tube_14_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-506.250000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_1]
{
name: "GEO",
index: "target_cell_14_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-506.250000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_2]
{
name: "GEO",
index: "target_tube_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-431.250000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_2]
{
name: "GEO",
index: "target_cell_14_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-431.250000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_3]
{
name: "GEO",
index: "target_tube_14_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-356.250000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_3]
{
name: "GEO",
index: "target_cell_14_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-356.250000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_4]
{
name: "GEO",
index: "target_tube_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-281.250000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_4]
{
name: "GEO",
index: "target_cell_14_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-281.250000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_5]
{
name: "GEO",
index: "target_tube_14_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-206.250000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_5]
{
name: "GEO",
index: "target_cell_14_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-206.250000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_6]
{
name: "GEO",
index: "target_tube_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-131.250000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_6]
{
name: "GEO",
index: "target_cell_14_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-131.250000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_7]
{
name: "GEO",
index: "target_tube_14_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-56.250000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_7]
{
name: "GEO",
index: "target_cell_14_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-56.250000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_8]
{
name: "GEO",
index: "target_tube_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [18.750000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_8]
{
name: "GEO",
index: "target_cell_14_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [18.750000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_9]
{
name: "GEO",
index: "target_tube_14_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [93.750000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_9]
{
name: "GEO",
index: "target_cell_14_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [93.750000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_10]
{
name: "GEO",
index: "target_tube_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [168.750000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_10]
{
name: "GEO",
index: "target_cell_14_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [168.750000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_11]
{
name: "GEO",
index: "target_tube_14_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [243.750000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_11]
{
name: "GEO",
index: "target_cell_14_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [243.750000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_12]
{
name: "GEO",
index: "target_tube_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [318.750000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_12]
{
name: "GEO",
index: "target_cell_14_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [318.750000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_13]
{
name: "GEO",
index: "target_tube_14_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [393.750000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_13]
{
name: "GEO",
index: "target_cell_14_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [393.750000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_14]
{
name: "GEO",
index: "target_tube_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [468.750000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_14]
{
name: "GEO",
index: "target_cell_14_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [468.750000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_14_15]
{
name: "GEO",
index: "target_tube_14_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [543.750000, 422.18738434491384029550, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_14_15]
{
name: "GEO",
index: "target_cell_14_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [543.750000, 422.18738434491384029550, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_0]
{
name: "GEO",
index: "target_tube_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-543.750000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_0]
{
name: "GEO",
index: "target_cell_15_0",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-543.750000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_1]
{
name: "GEO",
index: "target_tube_15_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-468.750000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_1]
{
name: "GEO",
index: "target_cell_15_1",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-468.750000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_2]
{
name: "GEO",
index: "target_tube_15_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-393.750000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_2]
{
name: "GEO",
index: "target_cell_15_2",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-393.750000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_3]
{
name: "GEO",
index: "target_tube_15_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-318.750000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_3]
{
name: "GEO",
index: "target_cell_15_3",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-318.750000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_4]
{
name: "GEO",
index: "target_tube_15_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-243.750000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_4]
{
name: "GEO",
index: "target_cell_15_4",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-243.750000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_5]
{
name: "GEO",
index: "target_tube_15_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-168.750000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_5]
{
name: "GEO",
index: "target_cell_15_5",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-168.750000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_6]
{
name: "GEO",
index: "target_tube_15_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-93.750000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_6]
{
name: "GEO",
index: "target_cell_15_6",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-93.750000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_7]
{
name: "GEO",
index: "target_tube_15_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [-18.750000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_7]
{
name: "GEO",
index: "target_cell_15_7",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [-18.750000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_8]
{
name: "GEO",
index: "target_tube_15_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [56.250000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_8]
{
name: "GEO",
index: "target_cell_15_8",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [56.250000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_9]
{
name: "GEO",
index: "target_tube_15_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [131.250000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_9]
{
name: "GEO",
index: "target_cell_15_9",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [131.250000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_10]
{
name: "GEO",
index: "target_tube_15_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [206.250000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_10]
{
name: "GEO",
index: "target_cell_15_10",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [206.250000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_11]
{
name: "GEO",
index: "target_tube_15_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [281.250000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_11]
{
name: "GEO",
index: "target_cell_15_11",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [281.250000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_12]
{
name: "GEO",
index: "target_tube_15_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [356.250000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_12]
{
name: "GEO",
index: "target_cell_15_12",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [356.250000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_13]
{
name: "GEO",
index: "target_tube_15_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [431.250000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_13]
{
name: "GEO",
index: "target_cell_15_13",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [431.250000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_14]
{
name: "GEO",
index: "target_tube_15_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [506.250000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_14]
{
name: "GEO",
index: "target_cell_15_14",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [506.250000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


// -------- GEO[target_tube_15_15]
{
name: "GEO",
index: "target_tube_15_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 25.000000,
size_z: 5000.000000,
position: [581.250000, 487.13928962874673880250, 0.0],
material: "glass",
invisible: 0,
color: [0.6 0.6 0.8],
}


// -------- GEO[target_cell_15_15]
{
name: "GEO",
index: "target_cell_15_15",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "",
mother: "target_cell_array",
type: "tube",
r_max: 22.000000,
size_z: 5000.000000,
position: [581.250000, 487.13928962874673880250, 0.0],
material: "ej254_015li6",
invisible: 0,
color: [0.5 0.1 0.8],
}


