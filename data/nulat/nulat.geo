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
position: [0.0, -10002.0, 0.0] // mm
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
position: [0.0, 10002.0, 0.0] // mm
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
position: [0.0, 0.0, 10002.0] // mm
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
position: [-10002.0, 0.0, 0.0] // mm
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
position: [10002.0, 0.0, 0.0] // mm
}


// CUBE ARRAY (mother)
// -------- GEO[cube_array]
{
name: "GEO",
index: "cube_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [76.0, 76.0, 76.0], // mm
material: "air",
invisible: 0,
position: [0.0, -9924.0, 0.0], // mm
}


// -------- GEO[target_cube_left_bot_back]
{
name: "GEO",
index: "target_cube_left_bot_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-51.0, -51.0, -51.0] // mm
}


// -------- GEO[target_cube_left_bot_mid]
{
name: "GEO",
index: "target_cube_left_bot_mid",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-51.0, -51.0, 0.0] // mm
}


// -------- GEO[target_cube_left_bot_front]
{
name: "GEO",
index: "target_cube_left_bot_front",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-51.0, -51.0, 51.0] // mm
}


// -------- GEO[target_cube_left_mid_back]
{
name: "GEO",
index: "target_cube_left_mid_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-51.0, 0.0, -51.0] // mm
}


// -------- GEO[target_cube_left_mid_mid]
{
name: "GEO",
index: "target_cube_left_mid_mid",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-51.0, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_left_mid_front]
{
name: "GEO",
index: "target_cube_left_mid_front",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-51.0, 0.0, 51.0] // mm
}


// -------- GEO[target_cube_left_top_back]
{
name: "GEO",
index: "target_cube_left_top_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-51.0, 51.0, -51.0] // mm
}


// -------- GEO[target_cube_left_top_mid]
{
name: "GEO",
index: "target_cube_left_top_mid",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-51.0, 51.0, 0.0] // mm
}


// -------- GEO[target_cube_left_top_front]
{
name: "GEO",
index: "target_cube_left_top_front",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [-51.0, 51.0, 51.0] // mm
}


// -------- GEO[target_cube_mid_bot_back]
{
name: "GEO",
index: "target_cube_mid_bot_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [0.0, -51.0, -51.0] // mm
}


// -------- GEO[target_cube_mid_bot_mid]
{
name: "GEO",
index: "target_cube_mid_bot_mid",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [0.0, -51.0, 0.0] // mm
}


// -------- GEO[target_cube_mid_bot_front]
{
name: "GEO",
index: "target_cube_mid_bot_front",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [0.0, -51.0, 51.0] // mm
}


// -------- GEO[target_cube_mid_mid_back]
{
name: "GEO",
index: "target_cube_mid_mid_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [0.0, 0.0, -51.0] // mm
}


// -------- GEO[target_cube_mid_mid_mid]
{
name: "GEO",
index: "target_cube_mid_mid_mid",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [0.0, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_mid_mid_front]
{
name: "GEO",
index: "target_cube_mid_mid_front",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [0.0, 0.0, 51.0] // mm
}


// -------- GEO[target_cube_mid_top_back]
{
name: "GEO",
index: "target_cube_mid_top_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [0.0, 51.0, -51.0] // mm
}


// -------- GEO[target_cube_mid_top_mid]
{
name: "GEO",
index: "target_cube_mid_top_mid",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [0.0, 51.0, 0.0] // mm
}


// -------- GEO[target_cube_mid_top_front]
{
name: "GEO",
index: "target_cube_mid_top_front",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [0.0, 51.0, 51.0] // mm
}


// -------- GEO[target_cube_right_bot_back]
{
name: "GEO",
index: "target_cube_right_bot_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [51.0, -51.0, -51.0] // mm
}


// -------- GEO[target_cube_right_bot_mid]
{
name: "GEO",
index: "target_cube_right_bot_mid",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [51.0, -51.0, 0.0] // mm
}


// -------- GEO[target_cube_right_bot_front]
{
name: "GEO",
index: "target_cube_right_bot_front",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [51.0, -51.0, 51.0] // mm
}


// -------- GEO[target_cube_right_mid_back]
{
name: "GEO",
index: "target_cube_right_mid_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [51.0, 0.0, -51.0] // mm
}


// -------- GEO[target_cube_right_mid_mid]
{
name: "GEO",
index: "target_cube_right_mid_mid",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [51.0, 0.0, 0.0] // mm
}


// -------- GEO[target_cube_right_mid_front]
{
name: "GEO",
index: "target_cube_right_mid_front",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [51.0, 0.0, 51.0] // mm
}


// -------- GEO[target_cube_right_top_back]
{
name: "GEO",
index: "target_cube_right_top_back",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [51.0, 51.0, -51.0] // mm
}


// -------- GEO[target_cube_right_top_mid]
{
name: "GEO",
index: "target_cube_right_top_mid",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [51.0, 51.0, 0.0] // mm
}


// -------- GEO[target_cube_right_top_front]
{
name: "GEO",
index: "target_cube_right_top_front",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cube_array",
type: "box",
size: [25.0, 25.0, 25.0], // mm
material: "ej254_015li6",
invisible: 0,
position: [51.0, 51.0, 51.0] // mm
}


