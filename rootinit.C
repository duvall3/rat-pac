{
  // original RAT-PAC defaults
  gROOT->SetStyle("Plain");
  gStyle->SetCanvasBorderMode(0);
  gStyle->SetPadBorderMode(0);
  gStyle->SetPadColor(0);
  gStyle->SetCanvasColor(0);
  gStyle->SetLegendFillColor(0);
  gStyle->SetLegendBorderSize(1);
  gStyle->SetLegendFont(132);
  gStyle->SetLabelFont(132);
  gStyle->SetTitleFont(132);

  gSystem->Load("libRATEvent");
  gSystem->AddIncludePath(" -I$RATROOT/include");

  // custom
  gStyle->SetHistLineWidth(2);
  gStyle->SetHistLineColor(kBlue);
//gStyle->SetOptLogy(1);
  gStyle->SetTitleFont(22, "");
  gStyle->SetTitleFont(62, "xyz");
  gStyle->SetLabelFont(42, "xyz");
  gStyle->SetCanvasDefX(600);
  gStyle->SetCanvasDefY(100);
  gStyle->SetCanvasDefH(800);
  gStyle->SetCanvasDefW(800);

}

