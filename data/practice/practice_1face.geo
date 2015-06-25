// RATDB file describing simple detector geometry

// -------- GEO[world]
{
name: "GEO",
index: "world",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "", // world volume has no mother
type: "box",
size: [50000.0, 10000.0, 50000.0], // mm
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
size: [7000.0, 7000.0, 7000.0], // mm
material: "air",
color: [0.8 0.1, 0.1],
invisible: 0,
//position: [] -- center of "world"
}

// -------- GEO[sky_muons]
/* this volume is intended to be a source of downward muons;
	it is designed to sit exactly above the tank */
{
name: "GEO",
index: "sky_muons",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "world",
type: "box",
size: [3750.0, 2.0, 3750.0],
material: "air",
color: [0.1, 0.8, 0.1],
position: [0.0, 5000.0, 0.0] // mm
}

// -------- GEO[tank]
{
name: "GEO",
index: "tank",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [2600.0, 2600.0, 2600.0], // mm
material: "steel",
color: [0.5, 0.5, 0.5],
position: [0.0, -4400, 0.0] // mm -- should be on floor of "cave" (7m - 2.6m = 4.4m)
}


// -------- GEO[target]
{
name: "GEO",
index: "target",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "tank",
type: "box",
size: [2500.0, 2500.0, 2500.0], // mm
material: "water",
color: [0, 0, 1],
// position: [] -- center of "tank"
}

// -------- GEO[pmts]
{
name: "GEO",
index: "pmts",
valid_begin: [0, 0], 
valid_end: [0, 0],
mother: "target",
type: "pmtarray", 
pmt_model: "r11780_hqe",
pmt_detector_type: "idpmt",
sensitive_detector: "/mydet/pmt/inner",
pos_table: "PMTINFO_1face",
orientation: "point",
orient_point: [0.0, 0.0, 100000.0], // mm; all looking essentially in the +z direciton
} 



//// -------- GEO[buffer]
//{
//name: "GEO",
//index: "buffer",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//
//mother: "tank",
//
//type: "sphere",
//r_max: 3500.0, // Outer radius, mm
//
//material: "MineralOil",
//color: [0.7, 0.4, 0.5, 0.1],
//}
//
//// -------- GEO[av] (acrylic vessel)
//{
//name: "GEO",
//index: "av",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//
//mother: "buffer",
//
//type: "sphere",
//r_max: 2700.0, // Outer radius, mm
//
//material: "Acrylic",
//color: [1.0, 1.0, 0.0],
//}
//
//// -------- GEO[scint]
//{
//name: "GEO",
//index: "scint",
//valid_begin: [0, 0],
//valid_end: [0, 0],
//
//mother: "av",
//
//type: "sphere",
//r_max: 2600.0, // Outer radius, mm
//
//material: "GdLoadedScint",
//color: [0.6, 0.3, 1.0, 0.2],
//}
