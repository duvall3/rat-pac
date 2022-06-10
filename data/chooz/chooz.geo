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
/* size: [10000.0, 10000.0, 10000.0], // mm */
size: [1600.0, 1600.0, 1600.0], // mm -- smaller cave to match other experiments
material: "air",
color: [0.8 0.1, 0.1],
invisible: 0,
//position: [] -- center of "world"
}


//// -------- GEO[tank]
//{
//name: "GEO",
//index: "tank",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//mother: "cave",
//type: "tube",
////r_max: 550.0, // mm -- small
//r_max: 5050.0, // mm -- large
////size_z: 550.0, // mm -- smal
//size_z: 5050.0, // mm -- large
//material: "steel",
//color: [0.5, 0.5, 0.5],
////position: [0.0, -9450.0, 0.0] // mm
//position: [0.0, 0.0, 0.0] // mm -- moved to center of cave
////rotation: [90.0, 0.0, 0.0] // degrees
//}


// -------- GEO[water_shield]
{
name: "GEO",
index: "water_shield",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "tube",
r_max: 1250.0, // mm
size_z: 1250.0, // mm
material: "water",
color: [0., 0.2, 1.0],
invisible: 0,
}



// -------- GEO[target]
{
name: "GEO",
index: "target",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: "tank",
//mother: "cave",
mother: "water_shield",
type: "tube",
//r_max: 500.0, // mm -- small
//r_max: 5000.0, // mm -- large
r_max: 750.0, // mm -- approx. actual DC size
//size_z: 500.0, // mm -- small
//size_z: 5000.0, // mm -- large
size_z: 750.0, // mm -- approx. actual DC size
material: "gd_scintillator", // Double CHOOZ target
//material: "doped_water", // WATCHMAN target
//material: "ej254_5b", // SANTA target -- for materials testing
//material: "ej254_1b", // miniTimeCube target -- for materials testing
//material: "ej254_015li6", // NuLat (possible) target -- for materials testing
color: [0, 0, 1],
}



