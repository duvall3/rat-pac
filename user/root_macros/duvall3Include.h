// duvall3Include.h -- load all macros in $RATROOT/user/root_macros
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ //
//
// NOTE: Easily install these macros by running the following
//   at your BASH prompt while in this directory:
/*
ln -s $(pwd)/duvall3Include.h "$ROOTSYS"/macros
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

// all pau!   )
}
