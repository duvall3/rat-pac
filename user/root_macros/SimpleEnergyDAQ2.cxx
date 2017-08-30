// SimpleEnergyDAQ2 -- re-formulation & continuation of original SimpleEnergyDAQ
// -- see header comments in SimpleEnergyDAQ_old for documentation
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/17 ~ //

#include <vector>
#include <cstdlib>
#include <math.h>

void SimpleEnergyDAQ2( const char* filename, int number_of_events ) {
//void SimpleEnergyDAQ2( const char* filename, ) {


// init
gStyle->SetHistLineWidth(2);
gStyle->SetHistLineColor(kBlue);
gStyle->SetOptLogy(true);
Int_t k(0);


// create tree, read ASCII data, set branch addresses
TTree* T = new TTree("T","T");
T->ReadFile( filename, "event/I:event_time/D:wall_time/D:energy/D:energy_q/D" );
Int_t event;
Double_t event_time, wall_time, energy, energy_q;
T->SetBranchAddress( "event", &event );
T->SetBranchAddress( "event_time", &event_time );
T->SetBranchAddress( "wall_time", &wall_time );
T->SetBranchAddress( "energy", &energy );
T->SetBranchAddress( "energy_q", &energy_q );


// create and address new branches 
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T->GetEntry(0);
run_start = event_time;
T->Branch("event_time_adj", &event_time_adj, "event_time_adj/D");
T->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
T->Branch("interevent_time", &interevent_time, "interevent_time/D");


// fill new branches
Double_t time_current, time_prev;
// times aligned to run start
for (( k=0; k<number_of_events; k++ )) {
  T->GetEntry(k);
  event_time_adj = event_time - run_start;
  wall_time_adj = wall_time - run_start;
  T->GetBranch("event_time_adj")->Fill();
  T->GetBranch("wall_time_adj")->Fill();
  // interevent times
  if ( k > 0 ) {
    time_current = wall_time;
    T->GetEntry(k-1);
    time_prev = wall_time;
    interevent_time = time_current - time_prev;
    T->GetBranch("interevent_time")->Fill();
  }
}



// all pau!   )
return;
}
