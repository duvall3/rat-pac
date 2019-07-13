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
size: [100000.0, 100000.0, 100000.0], // mm
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
size: [100000.0, 1.0, 100000.0], // mm
material: "rock",
invisible: 0,
position: [0.0, -100000.0, 0.0] // mm
}

// -------- GEO[cave_ceiling]
{
name: "GEO",
index: "cave_ceiling",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [100000.0, 1.0, 100000.0], // mm
material: "rock",
invisible: 0,
position: [0.0, 100000.0, 0.0] // mm
}


// -------- GEO[cave_back]
{
name: "GEO",
index: "cave_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [100000.0, 100000.0, 1.0], // mm
material: "rock",
invisible: 0,
position: [0.0, 0.0, 100000.0] // mm
}


// -------- GEO[cave_lwall]
{
name: "GEO",
index: "cave_lwall",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [1.0, 100000.0, 100000.0], // mm
material: "rock",
invisible: 0,
position: [-100000.0, 0.0, 0.0] // mm
}


// -------- GEO[cave_rwall]
{
name: "GEO",
index: "cave_rwall",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [1.0, 100000.0, 100000.0], // mm
material: "rock",
invisible: 0,
position: [100000.0, 0.0, 0.0] // mm
}

// -------- GEO[cell_array]
{
name: "GEO",
index: "cell_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [34.500, 66.000, 157.500], // mm
material: "air",
invisible: 0,
position: [0.0, 0.0, 0.0] // mm



// -------- GEO[target_cell_0_0_0]
{
name: "GEO",
index: "target_cell_0_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -66.000, -157.500] // mm
}


// -------- GEO[target_cell_0_0_1]
{
name: "GEO",
index: "target_cell_0_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -66.000, -94.500] // mm
}


// -------- GEO[target_cell_0_0_2]
{
name: "GEO",
index: "target_cell_0_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -66.000, -31.500] // mm
}


// -------- GEO[target_cell_0_0_3]
{
name: "GEO",
index: "target_cell_0_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -66.000, 31.500] // mm
}


// -------- GEO[target_cell_0_0_4]
{
name: "GEO",
index: "target_cell_0_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -66.000, 94.500] // mm
}


// -------- GEO[target_cell_0_1_0]
{
name: "GEO",
index: "target_cell_0_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -33.000, -157.500] // mm
}


// -------- GEO[target_cell_0_1_1]
{
name: "GEO",
index: "target_cell_0_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -33.000, -94.500] // mm
}


// -------- GEO[target_cell_0_1_2]
{
name: "GEO",
index: "target_cell_0_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -33.000, -31.500] // mm
}


// -------- GEO[target_cell_0_1_3]
{
name: "GEO",
index: "target_cell_0_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -33.000, 31.500] // mm
}


// -------- GEO[target_cell_0_1_4]
{
name: "GEO",
index: "target_cell_0_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, -33.000, 94.500] // mm
}


// -------- GEO[target_cell_0_2_0]
{
name: "GEO",
index: "target_cell_0_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 0.0, -157.500] // mm
}


// -------- GEO[target_cell_0_2_1]
{
name: "GEO",
index: "target_cell_0_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 0.0, -94.500] // mm
}


// -------- GEO[target_cell_0_2_2]
{
name: "GEO",
index: "target_cell_0_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 0.0, -31.500] // mm
}


// -------- GEO[target_cell_0_2_3]
{
name: "GEO",
index: "target_cell_0_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 0.0, 31.500] // mm
}


// -------- GEO[target_cell_0_2_4]
{
name: "GEO",
index: "target_cell_0_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 0.0, 94.500] // mm
}


// -------- GEO[target_cell_0_3_0]
{
name: "GEO",
index: "target_cell_0_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 33.000, -157.500] // mm
}


// -------- GEO[target_cell_0_3_1]
{
name: "GEO",
index: "target_cell_0_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 33.000, -94.500] // mm
}


// -------- GEO[target_cell_0_3_2]
{
name: "GEO",
index: "target_cell_0_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 33.000, -31.500] // mm
}


// -------- GEO[target_cell_0_3_3]
{
name: "GEO",
index: "target_cell_0_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 33.000, 31.500] // mm
}


// -------- GEO[target_cell_0_3_4]
{
name: "GEO",
index: "target_cell_0_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-34.500, 33.000, 94.500] // mm
}


// -------- GEO[target_cell_1_0_0]
{
name: "GEO",
index: "target_cell_1_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -66.000, -157.500] // mm
}


// -------- GEO[target_cell_1_0_1]
{
name: "GEO",
index: "target_cell_1_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -66.000, -94.500] // mm
}


// -------- GEO[target_cell_1_0_2]
{
name: "GEO",
index: "target_cell_1_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -66.000, -31.500] // mm
}


// -------- GEO[target_cell_1_0_3]
{
name: "GEO",
index: "target_cell_1_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -66.000, 31.500] // mm
}


// -------- GEO[target_cell_1_0_4]
{
name: "GEO",
index: "target_cell_1_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -66.000, 94.500] // mm
}


// -------- GEO[target_cell_1_1_0]
{
name: "GEO",
index: "target_cell_1_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -33.000, -157.500] // mm
}


// -------- GEO[target_cell_1_1_1]
{
name: "GEO",
index: "target_cell_1_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -33.000, -94.500] // mm
}


// -------- GEO[target_cell_1_1_2]
{
name: "GEO",
index: "target_cell_1_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -33.000, -31.500] // mm
}


// -------- GEO[target_cell_1_1_3]
{
name: "GEO",
index: "target_cell_1_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -33.000, 31.500] // mm
}


// -------- GEO[target_cell_1_1_4]
{
name: "GEO",
index: "target_cell_1_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, -33.000, 94.500] // mm
}


// -------- GEO[target_cell_1_2_0]
{
name: "GEO",
index: "target_cell_1_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 0.0, -157.500] // mm
}


// -------- GEO[target_cell_1_2_1]
{
name: "GEO",
index: "target_cell_1_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 0.0, -94.500] // mm
}


// -------- GEO[target_cell_1_2_2]
{
name: "GEO",
index: "target_cell_1_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 0.0, -31.500] // mm
}


// -------- GEO[target_cell_1_2_3]
{
name: "GEO",
index: "target_cell_1_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 0.0, 31.500] // mm
}


// -------- GEO[target_cell_1_2_4]
{
name: "GEO",
index: "target_cell_1_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 0.0, 94.500] // mm
}


// -------- GEO[target_cell_1_3_0]
{
name: "GEO",
index: "target_cell_1_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 33.000, -157.500] // mm
}


// -------- GEO[target_cell_1_3_1]
{
name: "GEO",
index: "target_cell_1_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 33.000, -94.500] // mm
}


// -------- GEO[target_cell_1_3_2]
{
name: "GEO",
index: "target_cell_1_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 33.000, -31.500] // mm
}


// -------- GEO[target_cell_1_3_3]
{
name: "GEO",
index: "target_cell_1_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 33.000, 31.500] // mm
}


// -------- GEO[target_cell_1_3_4]
{
name: "GEO",
index: "target_cell_1_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-11.500, 33.000, 94.500] // mm
}


// -------- GEO[target_cell_2_0_0]
{
name: "GEO",
index: "target_cell_2_0_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -66.000, -157.500] // mm
}


// -------- GEO[target_cell_2_0_1]
{
name: "GEO",
index: "target_cell_2_0_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -66.000, -94.500] // mm
}


// -------- GEO[target_cell_2_0_2]
{
name: "GEO",
index: "target_cell_2_0_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -66.000, -31.500] // mm
}


// -------- GEO[target_cell_2_0_3]
{
name: "GEO",
index: "target_cell_2_0_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -66.000, 31.500] // mm
}


// -------- GEO[target_cell_2_0_4]
{
name: "GEO",
index: "target_cell_2_0_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -66.000, 94.500] // mm
}


// -------- GEO[target_cell_2_1_0]
{
name: "GEO",
index: "target_cell_2_1_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -33.000, -157.500] // mm
}


// -------- GEO[target_cell_2_1_1]
{
name: "GEO",
index: "target_cell_2_1_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -33.000, -94.500] // mm
}


// -------- GEO[target_cell_2_1_2]
{
name: "GEO",
index: "target_cell_2_1_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -33.000, -31.500] // mm
}


// -------- GEO[target_cell_2_1_3]
{
name: "GEO",
index: "target_cell_2_1_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -33.000, 31.500] // mm
}


// -------- GEO[target_cell_2_1_4]
{
name: "GEO",
index: "target_cell_2_1_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, -33.000, 94.500] // mm
}


// -------- GEO[target_cell_2_2_0]
{
name: "GEO",
index: "target_cell_2_2_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 0.0, -157.500] // mm
}


// -------- GEO[target_cell_2_2_1]
{
name: "GEO",
index: "target_cell_2_2_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 0.0, -94.500] // mm
}


// -------- GEO[target_cell_2_2_2]
{
name: "GEO",
index: "target_cell_2_2_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 0.0, -31.500] // mm
}


// -------- GEO[target_cell_2_2_3]
{
name: "GEO",
index: "target_cell_2_2_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 0.0, 31.500] // mm
}


// -------- GEO[target_cell_2_2_4]
{
name: "GEO",
index: "target_cell_2_2_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 0.0, 94.500] // mm
}


// -------- GEO[target_cell_2_3_0]
{
name: "GEO",
index: "target_cell_2_3_0",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 33.000, -157.500] // mm
}


// -------- GEO[target_cell_2_3_1]
{
name: "GEO",
index: "target_cell_2_3_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 33.000, -94.500] // mm
}


// -------- GEO[target_cell_2_3_2]
{
name: "GEO",
index: "target_cell_2_3_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 33.000, -31.500] // mm
}


// -------- GEO[target_cell_2_3_3]
{
name: "GEO",
index: "target_cell_2_3_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 33.000, 31.500] // mm
}


// -------- GEO[target_cell_2_3_4]
{
name: "GEO",
index: "target_cell_2_3_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cell_array",
type: "box",
size: [10.0, 15.0, 30.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [11.500, 33.000, 94.500] // mm
}


