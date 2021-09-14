// addGeoChooz -- add outlines of Chooz geometry to c3(*_pd-xyz) plot from SEDAQ2.cxx
// -- run with '.x addGeoChooz.cxx' at the ROOT/CINT prompt

//Copyright (C) 2021 Mark J. Duvall
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

{

const char* resultsFilename;

// for OpenGL:
// get current graphics settings
const Bool_t origOGL = gStyle->GetCanvasPreferGL();
const Bool_t origBatch = gROOT->IsBatch();
// switch default rendering engine
if (! origOGL) gStyle->SetCanvasPreferGL(kTRUE);

// arg check / open results file
if (resultsFilename=="") {
  if (gFile) {
    resultsFilename = gFile->GetName();
  } else {
    TString warnLoc = "AddGeoChooz.cxx";
    TString warnMsg = "Set (const char* resultsFilename) first!";
    gDirectory->Warning( warnLoc.Data(), warnMsg.Data() );
    return;
  }
}
TFile *f2 = TFile::Open(resultsFilename);

  // finish file init and get histos
  TString fileName(resultsFilename);
  TString basename = fileName(0,fileName.Index("_results.root"));
  TString savename = basename+"_pd-xyz-with-geo.png";
  c3->Draw();
  TH3F *h_prompt = (TH3F*)gDirectory->Get("h_prompt");
  TH3F *h_delayed = (TH3F*)gDirectory->Get("h_delayed");
  TLegend *leg3 = (TLegend*)c3->GetPrimitive("legend3");
  TLegend *l3 = leg3->Clone("l3");
  c3->Clear();

  // geo init
  TMaterial *vacuum = new TMaterial("vacuum", "vacuum", 0., 0., 0.);
  TRATVolume *vol;
  TNode *n;
  TList *nodeList = new TList;

  // make and draw target tank
  TTUBE *targetTank = new TTUBE("targetTank", "prototype shape for target tank", "vacuum", 0., 10000., 10000.);
  nTargetTank = new TNode("target", "node for target", "targetTank", 0., 0., 0.);
  nTargetTank->SetLineWidth(2.);
//nTargetTank->SetLineColor(kGray);
  nodeList->Add(nTargetTank);
  nTargetTank->Draw("same");
//nTargetTank->Draw();

  // redraw histos
//Option_t *hpo = "glboxFbBb", *hdo = "sameglbox1FbBb";
  Option_t *hpo = "sameglboxFbBb", *hdo = "sameglbox1FbBb";
  h_prompt->SetFillColor(kRed);
  h_delayed->SetFillColor(kBlue);
  h_prompt->SetTitleOffset(2., "YZ");
//h_prompt->SetAxisColor(0, "xyz");
//h_delayed->SetAxisColor(0, "xyz");
//h_prompt->SetLabelColor(0, "xyz");
//h_delayed->SetLabelColor(0, "xyz");
  h_prompt->Draw(hpo);
  h_delayed->Draw(hdo);

//  // fix view
//  printf("\nRun the following lines to fix the view:\n");
//  printf("// fix view\n");
//  printf("TView *view = gPad->GetView();\n");
//  printf("view->SetParallel();\n");
//  printf("view->ShowAxis();\n");
//  printf("view->Draw();\n");

  // annotations
  //tit3->Draw();
  l3->Draw();

  // finish up
  // NOTE: *DO NOT* write c3 back to _results file!!!
  printf("\nRun the following lines to finish up:\n");
  printf("// save and close\n");
  printf("c3->SaveAs(\"%s\");\n", savename.Data());
  printf("c3->Close();\n");
  printf("gFile->Close();\n");
  if (! origOGL) printf("gStyle->SetCanvasPreferGL(kFALSE);\n");
  if (! origBatch) printf("gROOT->SetBatch(kFALSE);\n");
  printf("\n\n");


// all pau!   )
}

