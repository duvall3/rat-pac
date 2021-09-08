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

// arg check / open results file
TFile *f2 = TFile::Open(resultsFilename);
TString warnLoc = "AddGeoChooz.cxx";
TString warnMsg = "Set (const char* resultsFilename) first!";
if (f2==0) {
  gDirectory->Warning( warnLoc.Data(), warnMsg.Data() );
  return;
} else {

  // finish file init and draw histos
  TString fileName(resultsFilename);
  TString basename = fileName(0,fileName.Index("_results.root"));
  TString savename = basename+"_pd-xyz-with-geo.png";
  c3->Draw();

  // geo init
  TMaterial *vacuum = new TMaterial("vacuum", "vacuum", 0., 0., 0.);
  TRATVolume *vol;
  TNode *n;
  TList *nodeList = new TList;

  // make and draw target tank
  TTUBE *targetTank = new TTUBE("targetTank", "prototype shape for target tank", "vacuum", 0., 5000., 5000.);
  n = new TNode("target", "node for target", "targetTank", 0., 0., 0.);
  n->SetLineColor(kGray);
  n->Draw("same");

  // finish up
  // NOTE: *DO NOT* write c3 back to _results file!!!
  c3->SaveAs(savename.Data());
  c3->Close();
  f2->Close();

}

// all pau!   )
}

