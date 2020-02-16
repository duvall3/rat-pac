RAT-PAC / ROOT IBD Event Viewer
=======================================

Instructions for using Mark Duvall's ROOT-based event viewer for RAT-PAC IBD events.

**Written for ROOT 5.34; ROOT 6 version currently in development**


Required Files
------------------

The viewer is a self-contained ROOT macro. It is located on GitHub at duvall3 --> rat-pac --> branch collab --> user --> root_macros --> [RATPACEventviewer.cxx](https://github.com/duvall3/rat-pac/raw/collab/user/root_macros/RATPACEventViewer.cxx).


Usage
--------------

### Basic Invocation

To use the viewer, simply load the macro and run it on the desired ROOT file. Remember that the macro (or a link to it) must be located in your `$ROOTSYS/macros` directory, or you will have to specify the full path to the macro file. To invoke it in its default configuration, simply type the following at the ROOT prompt:

```cpp
.L RATPACEventViewer.cxx
RATPACEventViewer("some_data_file.root");
```
### General Invocation

The viewer decides which detector volumes to draw by looking for a regular expression in the volume names, which by default is `target_cell_[0-9].*`.
This default option covers any volume whose name contains `target_cell_` followed by at least one digit, followed by any other characters.
This can be altered by providing an optional second argument to command invoking the macro.
The following are all valid examples compatible with the default option: `target_cell_5`, `target_cell_2_4`, `target_cell_0_0_0`. Examples of alternate regular expressions to provide as the optional second argument include `target_cube`, `scintillator_volume[0-9].?`, `ej254.*`.
Please see [TRegexp](https://root.cern.ch/doc/master/classTRegexp.html) for further details on how to construct a ROOT-compatible regular expression.

In this more general case, invoke the viewer as follows, where `tcr` is the target-cell regex:

```cpp
.L RATPACEventViewer.cxx
RATPACEventViewer("some_data_file.root", tcr);
```

### Commands

Invoking the macro will automatically draw the detector geometry. The commands to draw the particle tracks for a given event are as follows, where `event` is the event number:

```cpp
drawTracks( <event> )
drawNextEvent()
drawPrevEvent()
```

### Output

In addition to drawing the particle tracks in the viewer, the macro will print out a summary for each track, including particle name, number of points, and production and termination vertices.

### Further Information

The comments in the macro file contain more detailed information on usage. They are copied here below for convenience.


Details
--------------------

```cpp
// RATPACEventViewer -- for viewing RAT-PAC detector geometry and particle tracks in ROOT
//
// -- Usage: "RATPACEventViewer( <RAT-PAC rootfile>, [target_cell_regex] )" to draw detector;
//      then "drawTracks( <event number>, [IBD_TF] )" to draw tracks for a given event
//
// -- Primarily written for IBD events, but should work just fine for anything
//      with either one particle per top-level MC event (use IBD_TF = kFALSE)
//      or two (use IBD_TF = kTRUE or simply omit IBD_TF argument)
//
// -- "target_cell_regex" determines which detector volumes will be drawn;
//      it defaults to "target_cell_[0-9].*", but any regex
//      matching (exclusively) your target volumes should work
//      -- for more information on ROOT-compatible regexes, see:
//         https://root.cern.ch/doc/master/classTRegexp.html
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
//      drawTracks(0);
//      drawNextEvent();
//      drawNextEvent();
//      drawNextEvent();
//
// -- As of this version, the following items are still hard-coded
//    and are tagged with //HC// in the code below:
//    - name of top & world volumes
//    - shape of top & world volumes
//    - dimensions of top & world volumes
//    - shapes of target cells (currently "box")
//    - material of target cells (currently Eljen EJ-254 doped at 1.5%wt Li-6)
//
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2019 ~ //
// ~ RATPACEventviewer v1.0.1 ~ //
```
