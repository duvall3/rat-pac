// RATDB file describing simple detector geometry

// !!! B-DOPED SCINTILLATOR NOT YET IMPLEMENTED !!!

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
invisible: 0,
//position: [] -- center of "world"
}


// -------- GEO[target_plane]
{
name: "GEO",
index: "target_plane",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [1000.0, 1000.0, 2.5] // mm
position: [0.0, -9000.0, -500.0] // mm
material: "scintillator",
color: [0, 0, 1],
}


// -------- GEO[ibd_vertex]
{
name: "GEO",
index: "ibd_vertex",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [10.0, 10.0, 2.5] // mm
//position: [0.0, -9000.0, -500.0] // mm -- now in mother "target_plane"
material: "scintillator",
color: [0, 0, 1],
}


// -------- GEO[capture_plane]
{
name: "GEO",
index: "capture_plane",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "cave",
type: "box",
size: [1000.0, 1020.0, 30.0], // mm
position: [0.0, -8980.0, 500.0] // mm
//material: "b_scintillator",
//material: "gd_scintillator", // PLACEHOLDER!!! -- still implementing B-doped scintillator
material: "air", // this volume will contain the strip stack
color: [0, .1, 0],
}


// -------- GEO[strip_1]
{
name: "GEO",
index: "strip_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -995.0, 0.0] // mm
}


// -------- GEO[strip_2]
{
name: "GEO",
index: "strip_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -944.0, 0.0] // mm
}


// -------- GEO[strip_3]
{
name: "GEO",
index: "strip_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -893.0, 0.0] // mm
}


// -------- GEO[strip_4]
{
name: "GEO",
index: "strip_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -842.0, 0.0] // mm
}


// -------- GEO[strip_5]
{
name: "GEO",
index: "strip_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -791.0, 0.0] // mm
}


// -------- GEO[strip_6]
{
name: "GEO",
index: "strip_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -740.0, 0.0] // mm
}


// -------- GEO[strip_7]
{
name: "GEO",
index: "strip_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -689.0, 0.0] // mm
}


// -------- GEO[strip_8]
{
name: "GEO",
index: "strip_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -638.0, 0.0] // mm
}


// -------- GEO[strip_9]
{
name: "GEO",
index: "strip_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -587.0, 0.0] // mm
}


// -------- GEO[strip_10]
{
name: "GEO",
index: "strip_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -536.0, 0.0] // mm
}


// -------- GEO[strip_11]
{
name: "GEO",
index: "strip_11",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -485.0, 0.0] // mm
}


// -------- GEO[strip_12]
{
name: "GEO",
index: "strip_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -434.0, 0.0] // mm
}


// -------- GEO[strip_13]
{
name: "GEO",
index: "strip_13",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -383.0, 0.0] // mm
}


// -------- GEO[strip_14]
{
name: "GEO",
index: "strip_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -332.0, 0.0] // mm
}


// -------- GEO[strip_15]
{
name: "GEO",
index: "strip_15",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -281.0, 0.0] // mm
}


// -------- GEO[strip_16]
{
name: "GEO",
index: "strip_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -230.0, 0.0] // mm
}


// -------- GEO[strip_17]
{
name: "GEO",
index: "strip_17",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -179.0, 0.0] // mm
}


// -------- GEO[strip_18]
{
name: "GEO",
index: "strip_18",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -128.0, 0.0] // mm
}


// -------- GEO[strip_19]
{
name: "GEO",
index: "strip_19",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -77.0, 0.0] // mm
}


// -------- GEO[strip_20]
{
name: "GEO",
index: "strip_20",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -26.0, 0.0] // mm
}


// -------- GEO[strip_21]
{
name: "GEO",
index: "strip_21",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 25.0, 0.0] // mm
}


// -------- GEO[strip_22]
{
name: "GEO",
index: "strip_22",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 76.0, 0.0] // mm
}


// -------- GEO[strip_23]
{
name: "GEO",
index: "strip_23",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 127.0, 0.0] // mm
}


// -------- GEO[strip_24]
{
name: "GEO",
index: "strip_24",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 178.0, 0.0] // mm
}


// -------- GEO[strip_25]
{
name: "GEO",
index: "strip_25",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 229.0, 0.0] // mm
}


// -------- GEO[strip_26]
{
name: "GEO",
index: "strip_26",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 280.0, 0.0] // mm
}


// -------- GEO[strip_27]
{
name: "GEO",
index: "strip_27",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 331.0, 0.0] // mm
}


// -------- GEO[strip_28]
{
name: "GEO",
index: "strip_28",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 382.0, 0.0] // mm
}


// -------- GEO[strip_29]
{
name: "GEO",
index: "strip_29",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 433.0, 0.0] // mm
}


// -------- GEO[strip_30]
{
name: "GEO",
index: "strip_30",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 484.0, 0.0] // mm
}


// -------- GEO[strip_31]
{
name: "GEO",
index: "strip_31",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 535.0, 0.0] // mm
}


// -------- GEO[strip_32]
{
name: "GEO",
index: "strip_32",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 586.0, 0.0] // mm
}


// -------- GEO[strip_33]
{
name: "GEO",
index: "strip_33",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 637.0, 0.0] // mm
}


// -------- GEO[strip_34]
{
name: "GEO",
index: "strip_34",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 688.0, 0.0] // mm
}


// -------- GEO[strip_35]
{
name: "GEO",
index: "strip_35",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 739.0, 0.0] // mm
}


// -------- GEO[strip_36]
{
name: "GEO",
index: "strip_36",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 790.0, 0.0] // mm
}


// -------- GEO[strip_37]
{
name: "GEO",
index: "strip_37",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 841.0, 0.0] // mm
}


// -------- GEO[strip_38]
{
name: "GEO",
index: "strip_38",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 892.0, 0.0] // mm
}


// -------- GEO[strip_39]
{
name: "GEO",
index: "strip_39",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 943.0, 0.0] // mm
}


// -------- GEO[strip_40]
{
name: "GEO",
index: "strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


