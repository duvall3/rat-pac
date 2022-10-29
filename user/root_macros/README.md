ROOT MACROS
===================

Instructions for using the (most useful) macros in
  *duvall3 --> rat-pac --> branch collab --> user --> [root_macros](https://github.com/duvall3/rat-pac/blob/collab/user/root_macros)*.

### Installation

_Note: These are written for *nix systems (Mac/Linux)_

1. After git-cloning this repository (or downloading the individual files),
  run the `macro_paths.sh` script located in this directory
  and follow the instructions it provides.
2. If you are using the `rootlogon.C` provided in this directory,
  then everything should now be ready.
  If you are using your own `rootlogon.C` elsewhere, simply append the contents
  of this directory's version to yours. 

### Usage

Open ROOT and run ```.x duvall3Include.cxx``` to load the macros.
See comments in individual macro files for details.
