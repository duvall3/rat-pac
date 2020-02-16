RAT-PAC / ROOT IBD Event Viewer
=======================================

Instructions for using Mark Duvall's ROOT-based event viewer for RAT-PAC IBD events.

**Written for ROOT 5.34; ROOT 6 version currently in development**

Required Files
------------------

The viewer is a self-contained ROOT macro. It is located on GitHub at duvall3 --> rat-pac --> branch collab --> user --> root_macros --> [RATPACEventviewer.cxx](https://github.com/duvall3/rat-pac/raw/collab/user/root_macros/RATPACEventViewer.cxx).

The viewer decides which detector volumes to draw by looking for a regular expression, which by default is `target_cell_[0-9].*`. This can be altered by providing an optional second argument to the macro command -- e.g., "target_cube", "scintillator_volume[0-9].?", etc. Please see [TRegexp](https://root.cern.ch/doc/master/classTRegexp.html) for details on how to construct a ROOT-compatible regex.
The default option covers any volume whose name contains `target_cell_`, followed by at least one digit, followed by any other characters. The following are all valid examples compatible with the default option: `target_cell_5`, `target_cell_2_4`, `target_cell_0_0_0`.

Usage
--------------

To use the viewer, simply load the macro and run it on the desired ROOT file. Remember that the macro (or a link to it) must be located in your `$ROOTSYS/macros` directory, or you will have to specify the full path to the macro file.

```cpp
.L RATPACEventViewer.cxx
RATPACEventViewer("some_data_file.root", [TString tcs = "target_cell_[0-9].*"] );
```
The commands in the macro are as follows, where `event` is the event number:

```cpp
drawTracks( <event> )
drawNextEvent()
drawPrevEvent()
```

The macro will print out a summary for each track, including particle name, number of points, and production and termination vertices.

The comments in the macro file contain more detailed information on usage. They are copied here below for convenience.

Details
--------------------

```cpp
// RATPACEventViewer -- for viewing RAT-PAC detector geometry and particle tracks in ROOT
//
// -- Usage: "RATPACEventViewer( <RAT-PAC rootfile> )" to draw detector;
//      then "drawTracks( <event number>, [IBD_TF] )" to draw tracks for a given event
//
// -- Primarily written for IBD events, but should work just fine for anything
//      with either one particle per top-level MC event (use IBD_TF = kFALSE)
//      or two (use IBD_TF = kTRUE or simply omit IBD_TF argument)
//
// -- "IBD_TF" should be kTRUE for runs using the RAT-PAC IBD generator builtin
//      and kFALSE otherwise
//      -- note: in standard ROOT, kTRUE == true == 1 and KFALSE == false == 0
//
// -- "IBD_TF" is kTRUE by default; this default can be changed in the function
//      definition for "drawTracks()" if desired
//
// -- Example ~ Scan through some IBD events:
//      .L RATPACEventViewer.cxx
//      RATPACEventViewer( "some_IBD_run.root" );
//      Int_t event = 0;
//      drawTracks(event);
//      drawNextEvent();
//      drawNextEvent();
//
// -- As of this version, the following items are still hard-coded
//    and are tagged with //HC// in the code below:
//    - name of top & world volumes
//    - shape of top & world volumes
//    - dimensions of top & world volumes
//    - names of target cells
//    - shapes of target cells
//
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2019 ~ //
// ~ RATPACEventviewer v0.9.5 ~ //
```
