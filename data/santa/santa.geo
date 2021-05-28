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
//size: [1000.0, 1020.0, 2.5] // mm
size: [3.0, 1005.0, 1025.0] // mm
//position: [0.0, -8980.0, -500.0] // mm
//position: [-500.0, 0.0, -8980.0] // mm
position: [500.0, 0.0, -8980.0] // mm
material: "air",   // this volume will contain scintillator bars
color: [0, 0, 1],
}


// -------- GEO[ibd_vertex]
{
name: "GEO",
index: "ibd_vertex",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_bar_21", // just above center (even number of bars)
type: "box",
//size: [.125, 25.0, 2.5] // mm
size: [2.5, .125, 25.0] // mm
material: "air",
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
//size: [1000.0, 1020.0, 30.0], // mm
size: [35.0, 1005.0, 1025.0], // mm
//position: [0.0, -8980.0, 500.0] // mm
//position: [500.0, 0.0, -8980.0] // mm
position: [-500.0, 0.0, -8980.0] // mm
material: "air", // this volume will contain the bar stack
color: [0, .1, 0],
}


// -------- GEO[target_bar_1]
{
name: "GEO",
index: "target_bar_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -955.0] // mm
}


// -------- GEO[target_bar_2]
{
name: "GEO",
index: "target_bar_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -904.0] // mm
}


// -------- GEO[target_bar_3]
{
name: "GEO",
index: "target_bar_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -853.0] // mm
}


// -------- GEO[target_bar_4]
{
name: "GEO",
index: "target_bar_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -802.0] // mm
}


// -------- GEO[target_bar_5]
{
name: "GEO",
index: "target_bar_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -751.0] // mm
}


// -------- GEO[target_bar_6]
{
name: "GEO",
index: "target_bar_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -700.0] // mm
}


// -------- GEO[target_bar_7]
{
name: "GEO",
index: "target_bar_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -649.0] // mm
}


// -------- GEO[target_bar_8]
{
name: "GEO",
index: "target_bar_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -598.0] // mm
}


// -------- GEO[target_bar_9]
{
name: "GEO",
index: "target_bar_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -547.0] // mm
}


// -------- GEO[target_bar_10]
{
name: "GEO",
index: "target_bar_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -496.0] // mm
}


// -------- GEO[target_bar_11]
{
name: "GEO",
index: "target_bar_11",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -445.0] // mm
}


// -------- GEO[target_bar_12]
{
name: "GEO",
index: "target_bar_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -394.0] // mm
}


// -------- GEO[target_bar_13]
{
name: "GEO",
index: "target_bar_13",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -343.0] // mm
}


// -------- GEO[target_bar_14]
{
name: "GEO",
index: "target_bar_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -292.0] // mm
}


// -------- GEO[target_bar_15]
{
name: "GEO",
index: "target_bar_15",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -241.0] // mm
}


// -------- GEO[target_bar_16]
{
name: "GEO",
index: "target_bar_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -190.0] // mm
}


// -------- GEO[target_bar_17]
{
name: "GEO",
index: "target_bar_17",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -139.0] // mm
}


// -------- GEO[target_bar_18]
{
name: "GEO",
index: "target_bar_18",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -88.0] // mm
}


// -------- GEO[target_bar_19]
{
name: "GEO",
index: "target_bar_19",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, -37.0] // mm
}


// -------- GEO[target_bar_20]
{
name: "GEO",
index: "target_bar_20",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 14.0] // mm
}


// -------- GEO[target_bar_21]
{
name: "GEO",
index: "target_bar_21",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 65.0] // mm
}


// -------- GEO[target_bar_22]
{
name: "GEO",
index: "target_bar_22",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 116.0] // mm
}


// -------- GEO[target_bar_23]
{
name: "GEO",
index: "target_bar_23",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 167.0] // mm
}


// -------- GEO[target_bar_24]
{
name: "GEO",
index: "target_bar_24",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 218.0] // mm
}


// -------- GEO[target_bar_25]
{
name: "GEO",
index: "target_bar_25",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 269.0] // mm
}


// -------- GEO[target_bar_26]
{
name: "GEO",
index: "target_bar_26",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 320.0] // mm
}


// -------- GEO[target_bar_27]
{
name: "GEO",
index: "target_bar_27",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 371.0] // mm
}


// -------- GEO[target_bar_28]
{
name: "GEO",
index: "target_bar_28",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 422.0] // mm
}


// -------- GEO[target_bar_29]
{
name: "GEO",
index: "target_bar_29",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 473.0] // mm
}


// -------- GEO[target_bar_30]
{
name: "GEO",
index: "target_bar_30",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 524.0] // mm
}


// -------- GEO[target_bar_31]
{
name: "GEO",
index: "target_bar_31",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 575.0] // mm
}


// -------- GEO[target_bar_32]
{
name: "GEO",
index: "target_bar_32",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 626.0] // mm
}


// -------- GEO[target_bar_33]
{
name: "GEO",
index: "target_bar_33",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 677.0] // mm
}


// -------- GEO[target_bar_34]
{
name: "GEO",
index: "target_bar_34",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 728.0] // mm
}


// -------- GEO[target_bar_35]
{
name: "GEO",
index: "target_bar_35",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 779.0] // mm
}


// -------- GEO[target_bar_36]
{
name: "GEO",
index: "target_bar_36",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 830.0] // mm
}


// -------- GEO[target_bar_37]
{
name: "GEO",
index: "target_bar_37",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 881.0] // mm
}


// -------- GEO[target_bar_38]
{
name: "GEO",
index: "target_bar_38",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 932.0] // mm
}


// -------- GEO[target_bar_39]
{
name: "GEO",
index: "target_bar_39",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 983.0] // mm
}


// -------- GEO[target_bar_40]
{
name: "GEO",
index: "target_bar_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "target_plane",
type: "box",
size: [2.5, 1000.0, 25.0] // mm
material: "ej254_undoped",
invisible: 0,
position: [0.0, 0.0, 1034.0] // mm
}


// -------- GEO[capture_bar_1]
{
name: "GEO",
index: "capture_bar_1",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -955.0] // mm
}


// -------- GEO[capture_bar_2]
{
name: "GEO",
index: "capture_bar_2",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -904.0] // mm
}


// -------- GEO[capture_bar_3]
{
name: "GEO",
index: "capture_bar_3",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -853.0] // mm
}


// -------- GEO[capture_bar_4]
{
name: "GEO",
index: "capture_bar_4",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -802.0] // mm
}


// -------- GEO[capture_bar_5]
{
name: "GEO",
index: "capture_bar_5",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -751.0] // mm
}


// -------- GEO[capture_bar_6]
{
name: "GEO",
index: "capture_bar_6",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -700.0] // mm
}


// -------- GEO[capture_bar_7]
{
name: "GEO",
index: "capture_bar_7",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -649.0] // mm
}


// -------- GEO[capture_bar_8]
{
name: "GEO",
index: "capture_bar_8",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -598.0] // mm
}


// -------- GEO[capture_bar_9]
{
name: "GEO",
index: "capture_bar_9",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -547.0] // mm
}


// -------- GEO[capture_bar_10]
{
name: "GEO",
index: "capture_bar_10",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -496.0] // mm
}


// -------- GEO[capture_bar_11]
{
name: "GEO",
index: "capture_bar_11",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -445.0] // mm
}


// -------- GEO[capture_bar_12]
{
name: "GEO",
index: "capture_bar_12",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -394.0] // mm
}


// -------- GEO[capture_bar_13]
{
name: "GEO",
index: "capture_bar_13",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -343.0] // mm
}


// -------- GEO[capture_bar_14]
{
name: "GEO",
index: "capture_bar_14",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -292.0] // mm
}


// -------- GEO[capture_bar_15]
{
name: "GEO",
index: "capture_bar_15",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -241.0] // mm
}


// -------- GEO[capture_bar_16]
{
name: "GEO",
index: "capture_bar_16",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -190.0] // mm
}


// -------- GEO[capture_bar_17]
{
name: "GEO",
index: "capture_bar_17",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -139.0] // mm
}


// -------- GEO[capture_bar_18]
{
name: "GEO",
index: "capture_bar_18",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -88.0] // mm
}


// -------- GEO[capture_bar_19]
{
name: "GEO",
index: "capture_bar_19",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, -37.0] // mm
}


// -------- GEO[capture_bar_20]
{
name: "GEO",
index: "capture_bar_20",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 14.0] // mm
}


// -------- GEO[capture_bar_21]
{
name: "GEO",
index: "capture_bar_21",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 65.0] // mm
}


// -------- GEO[capture_bar_22]
{
name: "GEO",
index: "capture_bar_22",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 116.0] // mm
}


// -------- GEO[capture_bar_23]
{
name: "GEO",
index: "capture_bar_23",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 167.0] // mm
}


// -------- GEO[capture_bar_24]
{
name: "GEO",
index: "capture_bar_24",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 218.0] // mm
}


// -------- GEO[capture_bar_25]
{
name: "GEO",
index: "capture_bar_25",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 269.0] // mm
}


// -------- GEO[capture_bar_26]
{
name: "GEO",
index: "capture_bar_26",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 320.0] // mm
}


// -------- GEO[capture_bar_27]
{
name: "GEO",
index: "capture_bar_27",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 371.0] // mm
}


// -------- GEO[capture_bar_28]
{
name: "GEO",
index: "capture_bar_28",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 422.0] // mm
}


// -------- GEO[capture_bar_29]
{
name: "GEO",
index: "capture_bar_29",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 473.0] // mm
}


// -------- GEO[capture_bar_30]
{
name: "GEO",
index: "capture_bar_30",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 524.0] // mm
}


// -------- GEO[capture_bar_31]
{
name: "GEO",
index: "capture_bar_31",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 575.0] // mm
}


// -------- GEO[capture_bar_32]
{
name: "GEO",
index: "capture_bar_32",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 626.0] // mm
}


// -------- GEO[capture_bar_33]
{
name: "GEO",
index: "capture_bar_33",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 677.0] // mm
}


// -------- GEO[capture_bar_34]
{
name: "GEO",
index: "capture_bar_34",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 728.0] // mm
}


// -------- GEO[capture_bar_35]
{
name: "GEO",
index: "capture_bar_35",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 779.0] // mm
}


// -------- GEO[capture_bar_36]
{
name: "GEO",
index: "capture_bar_36",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 830.0] // mm
}


// -------- GEO[capture_bar_37]
{
name: "GEO",
index: "capture_bar_37",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 881.0] // mm
}


// -------- GEO[capture_bar_38]
{
name: "GEO",
index: "capture_bar_38",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 932.0] // mm
}


// -------- GEO[capture_bar_39]
{
name: "GEO",
index: "capture_bar_39",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 983.0] // mm
}


// -------- GEO[capture_bar_40]
{
name: "GEO",
index: "capture_bar_40",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: "capture_plane",
type: "box",
size: [30.0, 1000.0, 25.0], // mm
material: "ej254_5b",
invisible: 0,
position: [0.0, 0.0, 1034.0] // mm
}


