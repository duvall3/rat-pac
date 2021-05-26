// duvall3Include.h -- load all macros in $RATROOT/user/root_macros
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ //

void duvall3Include() {

gROOT->LoadMacro("rt_to_root.cxx");
gROOT->LoadMacro("dumpHist.cxx");
gROOT->LoadMacro("SEDAQ.cxx");
gROOT->LoadMacro("RATPACEventViewer.cxx");
gROOT->LoadMacro("angularRecon.cxx");

// all pau!   )
}
