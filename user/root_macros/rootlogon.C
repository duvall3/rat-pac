// rootlogon.C -- just what it says
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ //

{

  gStyle->SetHistLineWidth(2);
  gStyle->SetHistLineColor(kBlue);
  gStyle->SetOptLogy(true);

  gROOT->LoadMacro("duvall3Include.h");
  duvall3Include();

}
