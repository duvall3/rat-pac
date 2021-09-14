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
// switch default rendering engine
if (! origOGL) gStyle->SetCanvasPreferGL(kTRUE);

// arg check / open results file
TFile *f2 = TFile::Open(resultsFilename);
TString warnLoc = "AddGeoChooz.cxx";
TString warnMsg = "Set (const char* resultsFilename) first!";
if (f2==0) {
  gDirectory->Warning( warnLoc.Data(), warnMsg.Data() );
  return;
} else {

  // finish file init and get histos
  TString fileName(resultsFilename);
  TString basename = fileName(0,fileName.Index("_results.root"));
  TString savename = basename+"_pd-xyz-with-geo.png";
  c3->Draw();
  TH3F *h_prompt = (TH3F*)gDirectory->Get("h_prompt");
  TH3F *h_delayed = (TH3F*)gDirectory->Get("h_delayed");

  // redraw histos
  Option_t *hpo = "glboxFbBb", *hdo = "sameglbox1FbBb";
  h_prompt->SetFillColor(kRed);
  h_delayed->SetFillColor(kBlue);
  h_prompt->SetTitleOffset(2., "Y");
  h_prompt->SetTitleOffset(2., "Z");
  h_prompt->Draw(hpo);
  h_delayed->Draw(hdo);

  // geo init
  TMaterial *vacuum = new TMaterial("vacuum", "vacuum", 0., 0., 0.);
  TRATVolume *vol;
  TNode *n;
  TList *nodeList = new TList;

  // make and draw target tank
  TTUBE *targetTank = new TTUBE("targetTank", "prototype shape for target tank", "vacuum", 0., 5000., 5000.);
  n = new TNode("target", "node for target", "targetTank", 0., 0., 0.);
  n->SetLineWidth(2.);
//n->SetLineColor(kGray);
  n->Draw("same");
//n->Draw();

  // finish up
  printf("\nNow run the following lines:\n\n");
  printf("c3->SaveAs(savename.Data());\n");
  printf("c3->Close();\n");
  printf("f2->Close();\n\n");

}

// reset graphics settings if applicable
if (! origOGL) gStyle->SetCanvasPreferGL(kFALSE);

// all pau!   )
}

