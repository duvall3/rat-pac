// rootlogon.C -- just what it says
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ //

{

  #include <TDuvallAnalyze.cxx>

  gROOT->LoadMacro("duvall3Macros.cxx");
  duvall3Macros();

  gROOT->LoadMacro("setDefaults.cxx");
  setDefaults();

}
