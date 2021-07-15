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

TString fn = filename;
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
//RAT::TrackNode *treeStart = c.Parent();
RAT::TrackNode* n = c.GoChild(0);
TString pcl;
Int_t event, trackID, step;
Double_t eq;
TString htit = TString::Format("%s | Quenched Neutron-Capture Energies", fn.Data());
TH1D* h = new TH1D("h", htit, 100, 0., hxmax);

//c.PrintTrack();

for ( event=0; event<r.GetTotal(); event++ ) {

eq = 0;
ds = r.GetEvent(event);
RAT::TrackNav nav(ds);
c = nav.Cursor(0);
c.GoChild(1);
c.GoTrackEnd();
n = c.GoChild(0);

//while ( topMCCount < 250 ) {
while ( n != 0x0) {
//if ( c.Parent() == treeStart ) topMCCount++;
  pcl = n->GetParticleName();
  trackID = n->GetTrackID();
  for ( step=0; step<c.StepCount(); step++ ) {
    eq += n->GetTotEDepScintQuenched();
  }
//printf( "%s(%d)  %d  %f\n", pcl.Data(), trackID, event, eq );
  n = c.FindNextTrack();
}

//printf( "Event: %d\tEnergy_q: %f MeVee\n", event, eq );
h->Fill(eq);
nav.Clear();

}

TCanvas* ch = new TCanvas("ch", "ch");
h->Draw();
h->GetXaxis()->SetTitle("Energy_Q (MeVee)");
h->GetYaxis()->SetRangeUser(0., 1.2 * h->GetMaximum());
h->Draw();

// all pau!   )
return h;
}
