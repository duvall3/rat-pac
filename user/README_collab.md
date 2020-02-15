RAT-PAC / ROOT IBD Event Viewer
=======================================

Instructions for using Mark Duvall's ROOT-based event viewer for RAT-PAC IBD events.

**Written for ROOT 5.34; ROOT 6 version currently in development**

Required Files
------------------

The viewer is a self-contained ROOT macro. It is located on GitHub at duvall3 --> rat-pac --> branch collab --> user --> root_macros --> [RATPACEventviewer.cxx](github.com/duvall3/rat-pac/tree/collab/user/root_macros/RATPACEventViewer.cxx).

Usage
--------------

To use the viewer, simply load the macro and run it on the desired ROOT file. Remember that the macro (or a link to it) must be located in your `$ROOTSYS/macros` directory, or you will have to specify the full path to the macro file.

```cpp
.L RATPACEventViewer.cxx
RATPACEventViewer("some_data_file.root");
```
The commands in the macro are as follows, where `event` is the event number:

```cpp
drawTracks( <event> )
drawNextEvent()
drawPrevEvent()
```

The macro will print out a summary for each event, including particle name, number of points, and the production and termination vertices.

The comments in the macro file contain more detailed information on usage. They are copied here below for convenience.

Details
--------------------

```cpp
// RATPACEventViewer -- for viewing RAT-PAC detector geometry and particle tracks in ROOT
//
// -- usage: "RATPACEventViewer( <RAT-PAC rootfile> )" to draw detector;
//      then "drawTracks( <event number>, [IBD_TF] )" to draw tracks for a given event
//
// -- "IBD_TF" should be kTRUE for runs using the RAT-PAC IBD generator builtin
//      and kFALSE otherwise
//      -- note: in standard ROOT, kTRUE == true == 1 and KFALSE == false == 0
//
// -- NOTE: Primarily written for IBD events, but should work just fine for anything
//      with either one particle per top-level MC event (use IBD_TF = kFALSE)
//      or two (use IBD_TF = kTRUE or simply omit IBD_TF argument)
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
// ~ RATPACEventviewer v0.9.4 ~ //
```

