// rootlogon.C -- just what it says
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ //
//
// NOTE: The following gStyle defaults have been moved to $RATROOT/rootinit.C
//  // custom
//  gStyle->SetHistLineWidth(2);
//  gStyle->SetHistLineColor(kBlue);
////gStyle->SetOptLogy(1);
//  gStyle->SetTitleFont(22, "");
//  gStyle->SetTitleFont(62, "xyz");
//  gStyle->SetLabelFont(42, "xyz");
//  gStyle->SetCanvasDefX(600);
//  gStyle->SetCanvasDefY(100);
//  gStyle->SetCanvasDefH(800);
//  gStyle->SetCanvasDefW(800);
//
{

  /* #include "TRATMaterial.cxx" */
  #include "TIBDParams.cxx"
  /* #include "TRATVolume.cxx" */
  /* #include "TRATGeo.cxx" */
  /* #include "TMath.h" */

  // make pi, e
  const Double_t pi = TMath::Pi();
  const Double_t e = TMath::E();

  // define decent legend coordinates
  Double_t legxy[4] = {.01, .83, .12, .93};

  // define convenient zoom function
  gROOT->LoadMacro("Zoom.cxx");

  // load RAT-PAC macros
  gROOT->LoadMacro("duvall3Macros.cxx");
  duvall3Macros();

  // load user classes and libraries
  /* gROOT->LoadMacro("TRATVolume.cxx"); */
  /* gROOT->LoadMacro("TRATGeo.cxx"); */
  /* gROOT->LoadMacro("TIBDParams.cxx"); */
  gROOT->LoadMacro("TDuvallUtils.cxx");
  gROOT->LoadMacro("TRefMatch.cxx");
  gROOT->LoadMacro("TRATGeoConverter.cxx");
  gROOT->LoadMacro("TRATPACEventViewer.cxx");
  gROOT->LoadMacro("TKSMultiRes.cxx");

}
