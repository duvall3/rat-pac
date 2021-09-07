// addGeoSANTA -- add outlines of SANTA geometry to c3(*_pd-xyz) plot from SEDAQ2.cxx

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

TList* addGeoSANTA(const char* ratFilename, const char* resultsFilename) {

// open a RAT run and get detector geometry
TFile *f1 = TFile::Open(ratFilename);
TRATGeo g;
g.Build();
TList *vols = g.GetListOfVolumes();
f1->Close();

// open results file and get histos and related objects
TFile *f2 = TFile::Open(resultsFilename);
TString fileName(resultsFilename);
TString basename = fileName(0,fileName.Index(".root"));
TString savename = basename+"_pd-xyz_with-geo.png";
TH3F *hp = (TH3F*)gDirectory->Get("h_prompt");
TH3F *hd = (TH3F*)gDirectory->Get("h_delayed");
//c3->Draw();
//TLegend *legend3 = (TLegend*)c3->GetPrimitive("legend3");
//TLegend *l3 = legend3->Clone("l3");
//TPaveText *title = (TPaveText*)gPad->GetPrimitive("title");
////TPaveText *tit3 = title->Clone("tit3");
//c3->Clear();
hd->SetStats(0);
hp->SetStats(0);

// geo init
TMaterial *vacuum = new TMaterial("vacuum", "vacuum", 0., 0., 0.);
TRATVolume *vol;
TNode *n;
TList *nodeList = new TList;

// target plane
vol = (TRATVolume*)g.GetVolume("target_plane");
TBRIK *targetPlane = new TBRIK("targetPlaneShape", "prototype shape for target plane", "vacuum", vol->GetSize().X(), vol->GetSize().Y(), vol->GetSize().Z());
n = new TNode("targetPlane", "node for targetPlane", "targetPlaneShape", vol->GetAbsolutePosition().X(), vol->GetAbsolutePosition().Y(), vol->GetAbsolutePosition().Z());
n->SetLineColor(kGray);
nodeList->Add(n);
n->Draw("");
//hp->Draw("AHsame");

// capture plane
vol = (TRATVolume*)g.GetVolume("capture_plane");
TBRIK *capturePlane = new TBRIK("capturePlaneShape", "prototype shape for capture plane", "vacuum", vol->GetSize().X(), vol->GetSize().Y(), vol->GetSize().Z());
n = new TNode("capturePlane", "node for capturePlane", "capturePlaneShape", vol->GetAbsolutePosition().X(), vol->GetAbsolutePosition().Y(), vol->GetAbsolutePosition().Z());
n->SetLineColor(kGray);
nodeList->Add(n);
n->Draw("same");
//hd->Draw("AHsame");

//// adjust view
////Double_t viewLim = 100.;
//TView *view = gPad->GetView();
////view->SetRange(-viewLim, -viewLim, -viewLim, viewLim, viewLim, viewLim);
//view->SetParallel();
////view->ShowAxis();
//view->Draw();


// annotations
//tit3->Draw();
//l3->Draw();

//// finish up
//// NOTE: *DO NOT* write c3 back to _results file!!!
//c3->SaveAs(savename.Data());
//c3->Close();
//f2->Close();

// all pau!   )
return nodeList;
}
