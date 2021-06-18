// neutronFirstSteps -- find length of neutrons' first steps
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/21 ~ //


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


TTree* neutronFirstSteps(const char* fileName = "", bool save_tf = kFALSE) {

// filename stuff
if (fileName == "") {
  if (gFile != 0x0) {
    TString filename = gFile->GetName();
  } else {
    gROOT->Error("No file specified or loaded.", "%s/\n");
    return 0x0;
  }
} else {
  TString filename = fileName;
  TFile* f = TFile::Open(filename);
}
TString datarun = filename(0,filename.Index(".root"));
TPair* tp = db->FindObject("DETECTOR[].experiment");
TObjString* tos = tp->Value();
TString detectorpath = tos->GetString();
detectorpath.ReplaceAll("\"", "");
TObjArray* toa = detectorpath.Tokenize("/");
tos = (TObjString*)toa->At(toa->GetEntries()-1);
TString detector = tos->GetString();

// RAT-PAC object init
//RAT::DSReader r(gFile->GetName());
RAT::DSReader r(filename.Data());
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();

// general init
Int_t k, N = r.GetTotal();
Double_t firstStepLength;

// prepare new TTree
TTree* T4 = new TTree("T4", "Initial Neutron Step Lengths");
T4->Branch("firstStepLength", &firstStepLength);

// MAIN
for ( k=0; k<N; k++ ) {
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  c.GoChild(0);
  n = c.GoStep(1);
  firstStepLength = sqrt( (n->GetEndpoint().X())**2 + (n->GetEndpoint().Y())**2 + (n->GetEndpoint().Z())**2 );
  T4->Fill();
  nav.Clear(); // clear memory for next event
}

// draw histo
TString title = detector+" | "+filename+" | Neutron First Step Lengths";
TString can_name = "can";
Int_t can_no;
while (gROOT->FindObjectAny(can_name)) {
  can_name = "can"+TString::Itoa(can_no, 10);
}
TCanvas* can = new TCanvas(can_name, title, 820, 120, 800, 700);
T4->Draw("firstStepLength");
TH1D* hstep = (TH1D*)htemp;
hstep->SetTitle(title);
hstep->SetName("hstep");
hstep->SetLineColor(kBlue);
hstep->SetLineWidth(2);
hstep->GetXaxis()->SetTitle("First Step Length (mm)");
can->Draw();
can->SetLogy(kTRUE);

// save if desired
if (save_tf == kTRUE) {
  TString savename = datarun+"_neutronFirstSteps.png";
  can->SaveAs(savename);
}

// all pau!   )
return T4;
}
