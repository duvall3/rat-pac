// addGeoChooz -- add outlines of Chooz geometry to c3(*_pd-xyz) plot from SEDAQ2.cxx

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
if (resultsFilename == "") {
  cout << "Set resultsFilename" << endl;
} else {

  // open results file and get histos and related objects
  TFile *f2 = TFile::Open(resultsFilename);
  TString fileName(resultsFilename);
  TString basename = fileName(0,fileName.Index(".root"));
  TString savename = basename+"_pd-xyz_with-geo.png";
  c3->Draw();

  // geo init
  TMaterial *vacuum = new TMaterial("vacuum", "vacuum", 0., 0., 0.);
  TRATVolume *vol;
  TNode *n;
  TList *nodeList = new TList;

  // target tank
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
