// SimpleEnergyDAQ -- simple trigger processer based on scintillation energy deposits (TotEDepScintQuenched)
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/17 ~ //

#include <vector>

void SimpleEnergyDAQ( const char* filename ) {


// open file
TFile *file0 = TFile::Open(filename);
RAT::DSReader r(filename);
Int_t num_of_events = r.GetTotal();

// get run start time
RAT::DS::Root *ds = r.GetEvent(0);
RAT::DS::MC *mc = ds->GetMC();
TTimeStamp t_run_start = mc->GetUTC();
time_t sec_run_start = t_run_start.GetSec();
Float_t nanosec_run_start = (Float_t)t_run_start.GetNanoSec();
mc->Clear();

// prepare histograms
//
TCanvas* c1 = new TCanvas;

// E-T distribution
TH1D* h = new TH1D("h", "T Distribution", 100, 1.e-9, 10.);
TAxis* xa = h->GetXaxis();
TAxis* ya = h->GetYaxis();
xa->SetTitle("Time (s)");
//xa->SetTitleOffset(1.5);
//xa->SetLabelSize(.02);
ya->SetTitle("Entries");
//ya->SetTitleOffset(1.5);
//ya->SetLabelSize(.02);

// for trigger distribution
// Marc's section:
  const Int_t nBinsEBP = 100;
  Double_t xmin = 1.e-12; //s
  Double_t xmax = 1.e1; //s
  Double_t logxmin = TMath::Log10(xmin);
  Double_t logxmax = TMath::Log10(xmax);
  Double_t binwidth = (logxmax-logxmin)/nBinsEBP;
  Double_t xbinsEBP[nBinsEBP+1];
  xbinsEBP[0] = xmin;
  for (Int_t i=1;i<=nBinsEBP;i++) {
    xbinsEBP[i] = TMath::Power(10,logxmin+i*binwidth);
  }
// applying Marc's cool stuff:
//TH2D* h2 = new TH2D("h2", "E - T_Event Distribution", 100, 1.e-3, 1.e9, 100, 1.e-4, 1.e-2);
TH1D* h2 = new TH1D("h2", "Interevent Time", nBinsEBP, xbinsEBP);
TAxis* xa2 = h2->GetXaxis();
TAxis* ya2 = h2->GetYaxis();
xa2->SetTitle("Time (s)");
ya2->SetTitle("Entries");


//Int_t total_electrons(0); //debug
//Int_t total_gammas(0); //debug


// create vectors for main data
vector <int> time_sec;
vector <float> time_nanosec;
vector <float> energy;
vector <int> time_since_event_start_nanosec;
Float_t cumulative_en(0);

// event loop
for ( Int_t event=0; event<num_of_events; event++ ) {
//for ( Int_t event=0; event<1000; event++ ) {
  if ( event % 100 == 0 ) { printf("Processing at Event %i...\n",event); } // mostly debug

  // load event and grab start time
  ds = r.GetEvent(event);
  mc = ds->GetMC();
  TTimeStamp t_event_start = mc->GetUTC();
  time_t sec_event_start = t_event_start.GetSec();
  Float_t nanosec_event_start = t_event_start.GetNanoSec();
  // offset time to beginning of run
  Int_t delta_t_sec = sec_event_start - sec_run_start;
  Int_t step_sec = sec_event_start - sec_run_start;

  // create RAT tracking objects
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);
  RAT::TrackNode *n = c.Here(); // enter event

  Int_t track_counter(0); //debug

  // loop over tracks
  while ( n != 0 ) {

    TString particle_name = n->GetParticleName();
//  printf( "Track: %i\tParticle: %s\t", n->GetTrackID(), particle_name.Data() ); //debug
//  if ( particle_name.Contains("e-") ) { total_electrons += 1; } //debug
//  if ( particle_name.Contains("gamma") ) { total_gammas += 1; } //debug

    
    Float_t tot_en(0);

    // loop over steps
    Int_t num_of_steps = c.StepCount();
    Int_t current_step;
    for ( current_step=0; current_step<(num_of_steps-1); current_step++ ) {
      if ( n->GetTotEDepScintQuenched() > 0 ) {
	time_sec.push_back( step_sec );
	time_nanosec.push_back( n->GetGlobalTime() + nanosec_event_start - nanosec_run_start );
	time_since_event_start_nanosec.push_back( n->GetGlobalTime() );
	energy.push_back( n->GetTotEDepScintQuenched() );
	tot_en += n->GetTotEDepScintQuenched();
	n = c.GoNext();
      } // nonzero scintillation
    } // step loop

  //printf( "tot_en: %5.6f\n", tot_en ); //debug
    cumulative_en += tot_en;
    track_counter++;

    n = c.FindNextTrack();

  } // track loop

  // print track summary
//printf( "Cumulative Energy: %5.6f\n", cumulative_en );
//printf( "Total Tracks: %i\n\n", track_counter );


  // cleanup
  nav.Clear();
  mc->Clear();

} // event loop

Int_t len = energy.size();

//printf( "Total Electrons: %i\nTotal Gammas: %i\n", total_electrons, total_gammas ); //debug

// make single vector for times -- should be relocated to original loop
vector <double> time_full;
for (Int_t k=0; k<len; k++) {
  time_full.push_back(time_sec[k]+time_nanosec[k]*1.e-9);
  h->Fill(time_full[k]); // fill histogram
} // time_full

// sorting
vector <vector <double>> events;
vector <double> events_k;
for (k=0; k<len; k++) {
  events_k.push_back(time_full[k]);
  events_k.push_back(energy[k]);
  events.push_back(events_k);
  events_k.resize(0);
}
//std::sort(
//DEBUG: SORTING
printf( "\n//DEBUG: SORTING CHECK\nStep Time (s)\tStep Energy (MeV)\n" );
//for (k=0; k<len; k++) { printf("%e\t%e\t%e\e\t%f\n", time_full[k], energy[k], events[k][0], events[k][1] ); }




// TRIGGER LOGIC
cout << "len = " << time_full.size() << endl;
cout << "final time = " << time_full[len-1] << endl;

// sum energies and mark windows
Double_t window_duration = 50.e-9; // 50-ns window for now
Double_t window_start_time = time_full[0];
//Double_t window_end_time = window_start_time + window_duration;
Double_t window_end_time;
Int_t window_start_index(0);
Int_t window_end_index;
Int_t triggered_events(0);
vector <double> event_times;
vector <double> event_energies;
Double_t window_energy;
//vector <vector <double>> events;
Double_t final_time = time_full[len-1]; // end of run

//debug
printf( "At start of window loop:\n" );
printf( "window duration: %e\nwindow start time: %e\nwindow end time: %e\nwindow start index: %i\nwindow end index: %i\ntriggered events: %i\nfinal time: %e\n", window_duration, window_start_time, window_end_time, window_start_index, window_end_index, triggered_events, final_time );
printf("\n");

//for (   ) { // window loop
while( window_end_time < final_time ) { // temporary: uses "while" FIXME
//for ( Int_t k=0; k<3; k++ ) { //DEBUG: first 3 windows

  triggered_events++; //main
  event_times.push_back(window_start_time); //main

  window_end_time = window_start_time + window_duration;

  printf( "\n###\nAt start of window %i:\n", k );
  printf( "window duration: %e\nwindow start time: %e\nwindow end time: %e\nwindow start index: %i\nwindow end index: %i\ntriggered events: %i\nfinal time: %e\n", window_duration, window_start_time, window_end_time, window_start_index, window_end_index, triggered_events, final_time );

  // find window_end_index
  if (window_end_time > final_time) { // check for final window
    window_end_index = len;
  } else { // all other windows
    for (Int_t i=window_start_index; i<len; i++) {
      if (time_full[i] < window_end_time)  { // next index
//	continue;
      } else { // found the end of the window
	window_end_index = i;
  	break;
      } //endif
    } // index loop
  } // final window check

  // sum energies inside window
  window_energy = 0;
  for (Int_t j=window_start_index; j<window_end_index; j++) {
    window_energy += energy[j];
  }

  event_energies.push_back(window_energy); //main
   
  printf( "###\nAt end of window %i:\n", k );
  printf( "window duration: %e\nwindow start time: %e\nwindow end time: %e\nwindow start index: %i\nwindow end index: %i\ntriggered events: %i\nfinal time: %e\n", window_duration, window_start_time, window_end_time, window_start_index, window_end_index, triggered_events, final_time );
  
  //beginning of next window
  window_start_index = j+1;
  window_start_time = time_full[j+1];
  printf("\n");

} // window loop


// now do something with the results
// TESTING: just print to stdout for now -- later will plot and analyze
cout << endl;
cout << "Triggered Singles: " << triggered_events << endl;
cout << "Event Times (s)" << "\t\t" << "Event Energies (MeV)" << endl;
for (Int_t ev=0; ev<triggered_events; ev++) {
  cout << event_times[ev] << "\t\t" << event_energies[ev] << endl;
}



// determine triggers -- plot interevent times

  


//drawHist:
// draw histograms
//c1->Divide(2,1);
//c1->cd(1);
//h->Draw("");
//c1_1->SetLogz(true);
//c1->cd(2);
h->SetLineColor(kBlue); //true
h->SetLineWidth(2); //true
h->Draw(""); //true
//c1->SetLogx(true);
c1->SetLogy(true); //true
//c1_2->SetLogx(true);
//c1_2->SetLogz(true);

//Double_t time_full_arr[len];
//Double_t energy_arr[len];
//Double_t time_full_arr[1000000]; //
//Double_t energy_arr[1000000]; //
//for (k=0; k<len; k++) {
//time_full_arr[k] = time_full[k];
//energy_arr[k] = (double)energy[k];
//}
// Graph energy deposits by clock time
// -- currently, need to create arrays from the vectors -- too many loops! TODO
Double_t event_times_arr[10000];
Double_t event_energies_arr[10000];
for (k=0; k<triggered_events; k++) {
  event_times_arr[k] = event_times[k];
  event_energies_arr[k] = event_energies[k];
}
TCanvas* c2 = new TCanvas("c2");
//TGraph* g = new TGraph(len, time_full_arr, energy_arr);
TGraph* g = new TGraph(triggered_events, event_times_arr, event_energies_arr);
g->SetName("g");
g->SetTitle("SimpleEnergyDAQ -- Single Triggers");
g->GetXaxis()->SetTitle("Time (s)");
g->GetYaxis()->SetTitle("Energy (MeV)");
g->SetMarkerColor(kBlue);
g->SetMarkerSize(2);
g->Draw("A*");


// all pau!   )
return;
}
