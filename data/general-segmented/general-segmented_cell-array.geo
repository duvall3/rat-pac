// -------- GEO[target_cell_array]
{
name: "GEO",
index: "target_cell_array",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [500.000, 500.000, 500.000], // mm
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
size: [500.0, 500.0, 500.0], // mm  // for sphere, change size to single-value r_max
material: "ej254_015li6",
invisible: 0,
position: [0.0, 0.0, 0.0] // mm
}


