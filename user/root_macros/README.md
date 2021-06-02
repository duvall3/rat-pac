ROOT MACROS
===================

Instructions for using the (most useful) macros in
  *duvall3 --> rat-pac --> branch collab --> user --> shell_scripts --> [RPEV_Installer.sh](https://github.com/duvall3/rat-pac/blob/collab/user/shell_scripts/RPEV_Installer.sh) ([file](https://github.com/duvall3/rat-pac/raw/collab/user/shell_scripts/RPEV_Installer.sh))*.

### Installation

After git-cloning this repository (or downloading the individual files),
  run the following commands at your BASH prompt
  from the directory containing the macros:

```sh
ln -s $(pwd)/duvall3Include.cxx "$ROOTSYS"/macros
FILE_LIST=(rt_to_root dumpHist SEDAQ RATPACEventViewer angularRecon applyCuts)
for FILE in ${FILE_LIST[*]}; do
  ln -s $(pwd)/"$FILE".cxx "$ROOTSYS"/macros
done
```

### Usage

Simply open ROOT and run ```.x duvall3Include.cxx``` to load the macros.
See comments in individual macro files for details.
