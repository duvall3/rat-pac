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
T->ReadFile( filename, "event/I:event_start/D:wall_time/D:energy/D:energy_q/D" );
Int_t event;
Double_t event_start, wall_time, energy, energy_q;
T->SetBranchAddress( "event", &event );
T->SetBranchAddress( "event_start", &event_start );
T->SetBranchAddress( "wall_time", &wall_time );
T->SetBranchAddress( "energy", &energy );
T->SetBranchAddress( "energy_q", &energy_q );


// create and address new branches 
Double_t run_start, interevent_time, event_start_adj, wall_time_adj;
T->GetEntry(0);
run_start = event_start;
T->Branch("event_start_adj", &event_start_adj, "event_start_adj/D");
T->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
//T->Branch("dataset_start", &dataset_start, "dataset_start/D");
T->Branch("interevent_time", &interevent_time, "interevent_time/D");


// fill new branches
Double_t time_current, time_prev;
for (( k=0; k<number_of_events-1; k++ )) {
  T->GetEntry(k);
  event_start_adj = event_start - run_start;
  wall_time_adj = wall_time - run_start;
  if (( k>0 )) {
    time_current = wall_time_adj;
    T->GetEntry(k-1);
    time_prev = wall_time_adj;
    interevent_time = time_current - time_prev;
    T->Fill();
  }//endif
}




// all pau!   )
return;
}
