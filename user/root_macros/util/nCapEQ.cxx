// nCapEQ -- rough version of code for finding *all* quenched scintillation energy
//   following a neutron capture
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/2021 ~ //

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

TH1D* nCapEQ( const char* filename, Double_t hxmax = 10. ) {
//TVectorD nCapEQ( const char* filename, Double_t hxmax = 10. ) {

// init
TString fn = filename;
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackCursor c2 = nav.Cursor(0); //debug
RAT::TrackNode *treeStart = c.Parent();
RAT::TrackNode *top = c.Here();
RAT::TrackNode* n = c.GoChild(0);
RAT::TrackNode* n2; //debug
TString pcl;
Int_t event, trackID, step;
Double_t eq;
TString htit = TString::Format("%s | Quenched Neutron-Capture Energies", fn.Data());
TH1D* h = new TH1D("h", htit, 100, 0., hxmax);
TH1I* hp = new TH1I("hp", "Top Parents", 10, 0, 4);
TH1D* ht = new TH1D("ht", "Scint. Times", 100, 0., 1.e5);
TVectorD stepEnergies;
Long64_t tsc(1); // total step counter

//c.PrintTrack(); //debug

// top-level event loop
cout << "Processing particle tracks..." << endl;
for ( event=0; event<r.GetTotal(); event++ ) {

  // init tracking objects
  eq = 0;
  ds = r.GetEvent(event);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  c.GoChild(0);
  c.GoTrackEnd();
  n = c.GoChild(0);

  // track loop
  while ( n != 0x0) {
  //if ( c.Parent() == treeStart ) topMCCount++;
    pcl = n->GetParticleName();
    trackID = n->GetTrackID();
    c2 = c; //debug
    n2 = c2.Here(); //debug
    while ( c2.Parent()->GetTrackID() != 0 ) n2 = c2.GoParent(); //debug
//  cout << n2->GetTrackID() << "\t"; //debug
    // step loop
//  if ( n2->GetTrackID() == 1 ) { // 1 for e+, 2 for n0, both for sum
    if ( (n2->GetTrackID() == 2) ) {//&& (n->GetGlobalTime()*1e-9 < 100.e-6) ) { // 1 for e+, 2 for n0, both for sum
//  if ( (n2->GetTrackID() == 1) || (n2->GetTrackID() == 2) ) { // 1 for e+, 2 for n0, both for sum
    hp->Fill(n2->GetTrackID()); //debug
      for ( step=0; step<c.StepCount(); step++ ) {
//	if ((n->GetGlobalTime() > 100.) && (n->GetGlobalTime() < 100.e3)) {
	  ht->Fill(n->GetGlobalTime());
	  eq += n->GetTotEDepScintQuenched();
//        stepEnergies.ResizeTo(tsc);
//        stepEnergies[tsc-1] = n->GetTotEDepScintQuenched();
	  tsc++;
//	}
      } // end step loop
    } // endif -- parent check
//  printf( "%s(%d)  %d  %f\n", pcl.Data(), trackID, event, eq ); //debug
    n = c.FindNextTrack();
  } // end track loop
//cout << endl; //debug

  //printf( "Event: %d\tEnergy_q: %f MeVee\n", event, eq ); //debug
  h->Fill(eq);
  nav.Clear();

} // end event loop
cout << "Done." << endl;

// plot histogram
TCanvas* c_nCapEQ = new TCanvas("c_nCapEQ", "c_nCapEQ");
h->Draw();
h->GetXaxis()->SetTitle("Energy_Q (MeVee)");
h->GetYaxis()->SetRangeUser(0., 1.2 * h->GetMaximum());
h->Draw();

//// parent histogram //debug
//TCanvas* c_parent = new TCanvas("c_parent", "c_parent");
//hp->Draw();

// time histogram //debug
TCanvas* c_time = new TCanvas("c_time", "c_time");
ht->Draw();

// all pau!   )
return h;
//return stepEnergies;
}
