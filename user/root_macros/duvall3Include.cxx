// duvall3Include.cxx -- load the most useful macros from
//   github.com/duvall3/rat-pac/tree/collab/user/root_macros
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ Updated 6/21 ~ //
//
// NOTE: Easily install these macros by running the following
//   at your BASH prompt while in this directory:
/*
ln -s $(pwd)/duvall3Include.cxx "$ROOTSYS"/macros
FILE_LIST=(rt_to_root dumpHist SEDAQ RATPACEventViewer angularRecon)
for FILE in ${FILE_LIST[*]}; do
  ln -s $(pwd)/"$FILE".cxx "$ROOTSYS"/macros
done
*/
// Then load the macros into your (interactive) ROOT session
//   by simply typing ".x duvall3Include.h" at the CINT prompt

void duvall3Include() {

gROOT->LoadMacro("rt_to_root.cxx");
gROOT->LoadMacro("dumpHist.cxx");
gROOT->LoadMacro("SEDAQ.cxx");
gROOT->LoadMacro("RATPACEventViewer.cxx");
gROOT->LoadMacro("angularRecon.cxx");
gROOT->LoadMacro("applyCuts.cxx");
gROOT->LoadMacro("neutronInitialMomenta.cxx");

// all pau!   )
}
