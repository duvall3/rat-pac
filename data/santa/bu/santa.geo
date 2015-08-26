// RATDB geometry file for SANTA detector

// !!! B-DOPED SCINTILLATOR ONLY IMPLEMENTED -- NO OPTICS YET !!!

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
material: "air",   // this volume will contain scintillator strips
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
//position: [0.0, -9000.0, -500.0] // mm -- now in (center of) mother "target_plane"
material: "ej254_undoped", // plain PVT
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
material: "air", // this volume will contain the strip stack
color: [0, .1, 0],
}


// -------- GEO[capture_strip_1]
{
name: "GEO",
index: "capture_strip_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -995.0, 0.0] // mm
}


// -------- GEO[capture_strip_2]
{
name: "GEO",
index: "capture_strip_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -944.0, 0.0] // mm
}


// -------- GEO[capture_strip_3]
{
name: "GEO",
index: "capture_strip_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -893.0, 0.0] // mm
}


// -------- GEO[capture_strip_4]
{
name: "GEO",
index: "capture_strip_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -842.0, 0.0] // mm
}


// -------- GEO[capture_strip_5]
{
name: "GEO",
index: "capture_strip_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -791.0, 0.0] // mm
}


// -------- GEO[capture_strip_6]
{
name: "GEO",
index: "capture_strip_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -740.0, 0.0] // mm
}


// -------- GEO[capture_strip_7]
{
name: "GEO",
index: "capture_strip_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -689.0, 0.0] // mm
}


// -------- GEO[capture_strip_8]
{
name: "GEO",
index: "capture_strip_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -638.0, 0.0] // mm
}


// -------- GEO[capture_strip_9]
{
name: "GEO",
index: "capture_strip_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -587.0, 0.0] // mm
}


// -------- GEO[capture_strip_10]
{
name: "GEO",
index: "capture_strip_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -536.0, 0.0] // mm
}


// -------- GEO[capture_strip_11]
{
name: "GEO",
index: "capture_strip_11",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -485.0, 0.0] // mm
}


// -------- GEO[capture_strip_12]
{
name: "GEO",
index: "capture_strip_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -434.0, 0.0] // mm
}


// -------- GEO[capture_strip_13]
{
name: "GEO",
index: "capture_strip_13",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -383.0, 0.0] // mm
}


// -------- GEO[capture_strip_14]
{
name: "GEO",
index: "capture_strip_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -332.0, 0.0] // mm
}


// -------- GEO[capture_strip_15]
{
name: "GEO",
index: "capture_strip_15",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -281.0, 0.0] // mm
}


// -------- GEO[capture_strip_16]
{
name: "GEO",
index: "capture_strip_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -230.0, 0.0] // mm
}


// -------- GEO[capture_strip_17]
{
name: "GEO",
index: "capture_strip_17",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -179.0, 0.0] // mm
}


// -------- GEO[capture_strip_18]
{
name: "GEO",
index: "capture_strip_18",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -128.0, 0.0] // mm
}


// -------- GEO[capture_strip_19]
{
name: "GEO",
index: "capture_strip_19",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -77.0, 0.0] // mm
}


// -------- GEO[capture_strip_20]
{
name: "GEO",
index: "capture_strip_20",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, -26.0, 0.0] // mm
}


// -------- GEO[capture_strip_21]
{
name: "GEO",
index: "capture_strip_21",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 25.0, 0.0] // mm
}


// -------- GEO[capture_strip_22]
{
name: "GEO",
index: "capture_strip_22",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 76.0, 0.0] // mm
}


// -------- GEO[capture_strip_23]
{
name: "GEO",
index: "capture_strip_23",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 127.0, 0.0] // mm
}


// -------- GEO[capture_strip_24]
{
name: "GEO",
index: "capture_strip_24",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 178.0, 0.0] // mm
}


// -------- GEO[capture_strip_25]
{
name: "GEO",
index: "capture_strip_25",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 229.0, 0.0] // mm
}


// -------- GEO[capture_strip_26]
{
name: "GEO",
index: "capture_strip_26",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 280.0, 0.0] // mm
}


// -------- GEO[capture_strip_27]
{
name: "GEO",
index: "capture_strip_27",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 331.0, 0.0] // mm
}


// -------- GEO[capture_strip_28]
{
name: "GEO",
index: "capture_strip_28",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 382.0, 0.0] // mm
}


// -------- GEO[capture_strip_29]
{
name: "GEO",
index: "capture_strip_29",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 433.0, 0.0] // mm
}


// -------- GEO[capture_strip_30]
{
name: "GEO",
index: "capture_strip_30",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 484.0, 0.0] // mm
}


// -------- GEO[capture_strip_31]
{
name: "GEO",
index: "capture_strip_31",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 535.0, 0.0] // mm
}


// -------- GEO[capture_strip_32]
{
name: "GEO",
index: "capture_strip_32",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 586.0, 0.0] // mm
}


// -------- GEO[capture_strip_33]
{
name: "GEO",
index: "capture_strip_33",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 637.0, 0.0] // mm
}


// -------- GEO[capture_strip_34]
{
name: "GEO",
index: "capture_strip_34",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 688.0, 0.0] // mm
}


// -------- GEO[capture_strip_35]
{
name: "GEO",
index: "capture_strip_35",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 739.0, 0.0] // mm
}


// -------- GEO[capture_strip_36]
{
name: "GEO",
index: "capture_strip_36",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 790.0, 0.0] // mm
}


// -------- GEO[capture_strip_37]
{
name: "GEO",
index: "capture_strip_37",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 841.0, 0.0] // mm
}


// -------- GEO[capture_strip_38]
{
name: "GEO",
index: "capture_strip_38",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 892.0, 0.0] // mm
}


// -------- GEO[capture_strip_39]
{
name: "GEO",
index: "capture_strip_39",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 943.0, 0.0] // mm
}


// -------- GEO[capture_strip_40]
{
name: "GEO",
index: "capture_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 25.0, 30.0], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[capture_sheet_1]
{
name: "GEO",
index: "capture_sheet_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -969.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_2]
{
name: "GEO",
index: "capture_sheet_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -918.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_3]
{
name: "GEO",
index: "capture_sheet_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -867.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_4]
{
name: "GEO",
index: "capture_sheet_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -816.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_5]
{
name: "GEO",
index: "capture_sheet_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -765.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_6]
{
name: "GEO",
index: "capture_sheet_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -714.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_7]
{
name: "GEO",
index: "capture_sheet_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -663.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_8]
{
name: "GEO",
index: "capture_sheet_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -612.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_9]
{
name: "GEO",
index: "capture_sheet_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -561.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_10]
{
name: "GEO",
index: "capture_sheet_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -510.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_11]
{
name: "GEO",
index: "capture_sheet_11",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -459.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_12]
{
name: "GEO",
index: "capture_sheet_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -408.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_13]
{
name: "GEO",
index: "capture_sheet_13",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -357.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_14]
{
name: "GEO",
index: "capture_sheet_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -306.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_15]
{
name: "GEO",
index: "capture_sheet_15",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -255.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_16]
{
name: "GEO",
index: "capture_sheet_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -204.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_17]
{
name: "GEO",
index: "capture_sheet_17",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -153.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_18]
{
name: "GEO",
index: "capture_sheet_18",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -102.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_19]
{
name: "GEO",
index: "capture_sheet_19",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -51.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_20]
{
name: "GEO",
index: "capture_sheet_20",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_21]
{
name: "GEO",
index: "capture_sheet_21",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 50.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_22]
{
name: "GEO",
index: "capture_sheet_22",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 101.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_23]
{
name: "GEO",
index: "capture_sheet_23",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 152.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_24]
{
name: "GEO",
index: "capture_sheet_24",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 203.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_25]
{
name: "GEO",
index: "capture_sheet_25",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 254.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_26]
{
name: "GEO",
index: "capture_sheet_26",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 305.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_27]
{
name: "GEO",
index: "capture_sheet_27",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 356.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_28]
{
name: "GEO",
index: "capture_sheet_28",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 407.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_29]
{
name: "GEO",
index: "capture_sheet_29",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 458.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_30]
{
name: "GEO",
index: "capture_sheet_30",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 509.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_31]
{
name: "GEO",
index: "capture_sheet_31",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 560.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_32]
{
name: "GEO",
index: "capture_sheet_32",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 611.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_33]
{
name: "GEO",
index: "capture_sheet_33",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 662.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_34]
{
name: "GEO",
index: "capture_sheet_34",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 713.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_35]
{
name: "GEO",
index: "capture_sheet_35",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 764.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_36]
{
name: "GEO",
index: "capture_sheet_36",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 815.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_37]
{
name: "GEO",
index: "capture_sheet_37",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 866.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_38]
{
name: "GEO",
index: "capture_sheet_38",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 917.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[capture_sheet_39]
{
name: "GEO",
index: "capture_sheet_39",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [1000.0, 0.25, 30.0], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 968.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_strip_40]
{
name: "GEO",
index: "target_strip_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 25.0, 2.5], // mm
material: "gd_scintillator",
invisible: 0,
position: [0.0, 994.0, 0.0] // mm
}


// -------- GEO[target_sheet_1]
{
name: "GEO",
index: "target_sheet_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -969.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_2]
{
name: "GEO",
index: "target_sheet_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -918.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_3]
{
name: "GEO",
index: "target_sheet_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -867.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_4]
{
name: "GEO",
index: "target_sheet_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -816.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_5]
{
name: "GEO",
index: "target_sheet_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -765.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_6]
{
name: "GEO",
index: "target_sheet_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -714.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_7]
{
name: "GEO",
index: "target_sheet_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -663.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_8]
{
name: "GEO",
index: "target_sheet_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -612.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_9]
{
name: "GEO",
index: "target_sheet_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -561.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_10]
{
name: "GEO",
index: "target_sheet_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -510.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_11]
{
name: "GEO",
index: "target_sheet_11",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -459.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_12]
{
name: "GEO",
index: "target_sheet_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -408.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_13]
{
name: "GEO",
index: "target_sheet_13",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -357.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_14]
{
name: "GEO",
index: "target_sheet_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -306.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_15]
{
name: "GEO",
index: "target_sheet_15",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -255.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_16]
{
name: "GEO",
index: "target_sheet_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -204.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_17]
{
name: "GEO",
index: "target_sheet_17",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -153.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_18]
{
name: "GEO",
index: "target_sheet_18",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -102.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_19]
{
name: "GEO",
index: "target_sheet_19",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -51.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_20]
{
name: "GEO",
index: "target_sheet_20",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, -.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_21]
{
name: "GEO",
index: "target_sheet_21",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 50.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_22]
{
name: "GEO",
index: "target_sheet_22",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 101.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_23]
{
name: "GEO",
index: "target_sheet_23",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 152.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_24]
{
name: "GEO",
index: "target_sheet_24",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 203.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_25]
{
name: "GEO",
index: "target_sheet_25",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 254.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_26]
{
name: "GEO",
index: "target_sheet_26",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 305.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_27]
{
name: "GEO",
index: "target_sheet_27",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 356.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_28]
{
name: "GEO",
index: "target_sheet_28",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 407.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_29]
{
name: "GEO",
index: "target_sheet_29",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 458.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_30]
{
name: "GEO",
index: "target_sheet_30",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 509.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_31]
{
name: "GEO",
index: "target_sheet_31",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 560.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_32]
{
name: "GEO",
index: "target_sheet_32",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 611.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_33]
{
name: "GEO",
index: "target_sheet_33",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 662.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_34]
{
name: "GEO",
index: "target_sheet_34",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 713.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_35]
{
name: "GEO",
index: "target_sheet_35",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 764.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_36]
{
name: "GEO",
index: "target_sheet_36",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 815.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_37]
{
name: "GEO",
index: "target_sheet_37",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 866.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_38]
{
name: "GEO",
index: "target_sheet_38",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 917.5, 0.0] // mm
color: [1, 1, 1 ],
}


// -------- GEO[target_sheet_39]
{
name: "GEO",
index: "target_sheet_39",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [1000.0, 0.25, 2.5], // mm
material: "acrylic_black",
invisible: 0,
position: [0.0, 968.5, 0.0] // mm
color: [1, 1, 1 ],
}


