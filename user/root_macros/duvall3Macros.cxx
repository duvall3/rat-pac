// duvall3Macros.cxx -- load the most useful macros from
//   github.com/duvall3/rat-pac/tree/collab/user/root_macros
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ Updated 6/21 ~ //
//
// NOTE: Easily install these macros by running the following
//   at your BASH prompt while in this directory:
/*
ln -s $(pwd)/duvall3Macros.cxx "$ROOTSYS"/macros
FILE_LIST=(rt_to_root dumpHist SEDAQ RATPACEventViewer angularRecon neutronInitialMomenta)
for FILE in ${FILE_LIST[*]}; do
  ln -s $(pwd)/"$FILE".cxx "$ROOTSYS"/macros
done
*/
// Then load the macros into your (interactive) ROOT session
//   by simply typing ".x duvall3Macros.h" at the CINT prompt

void duvall3Macros() {

gROOT->LoadMacro("rt_to_root.cxx");
gROOT->LoadMacro("dumpHist.cxx");
//gROOT->LoadMacro("SEDAQ.cxx");
gROOT->LoadMacro("SEDAQ2.cxx");
//gROOT->LoadMacro("RATPACEventViewer.cxx");
gROOT->LoadMacro("RATPACEventViewer2.cxx");
gROOT->LoadMacro("angularRecon.cxx");
//gROOT->LoadMacro("neutronInitialMomenta.cxx");
//gROOT->LoadMacro("neutronCaptures.cxx");
gROOT->LoadMacro("ibdTracksToScint.cxx");
gROOT->LoadMacro("particleTracksToScint.cxx");
//gROOT->LoadMacro("findCellScintTotal.cxx");
//gROOT->LoadMacro("findCellScintTotalQuenched.cxx");
gROOT->LoadMacro("shiftStats.cxx");
gROOT->LoadMacro("nCapEQ.cxx");
gROOT->LoadMacro("findScintBursts.cxx");
//gROOT->LoadMacro("ratfileInit.cxx");
gROOT->LoadMacro("correctEnergies.cxx");
gROOT->LoadMacro("duvallAnalyze.cxx");
gROOT->LoadMacro("duvallAnalyzeFull.cxx");
//gROOT->LoadMacro("getVolumeRelativeCenter.cxx");
//gROOT->LoadMacro("getVolumeCenter.cxx");
gROOT->LoadMacro("addGeoNuLat.cxx");
//gROOT->LoadMacro("addGeoChooz.cxx");
gROOT->LoadMacro("addGeoSANTA.cxx");
gROOT->LoadMacro("addGeoSANDD.cxx");
gROOT->LoadMacro("exportPlots.cxx");
gROOT->LoadMacro("radarPlot.cxx");
gROOT->LoadMacro("drawAllCosPsi.cxx");
//gROOT->LoadMacro("backgroundNeutrons.cxx");
gROOT->LoadMacro("logBins.cxx");
gROOT->LoadMacro("plotKElog.cxx");
//gROOT->LoadMacro("TIBDParams.cxx");
gROOT->LoadMacro("findVarsOfType.cxx");
gROOT->LoadMacro("loadAllKeys.cxx");
gROOT->LoadMacro("ue4_export.cxx");

}

// all pau!   )
