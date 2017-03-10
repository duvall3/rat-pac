// SimpleEnergyDAQ -- simple trigger processer based on scintillation energy deposits (TotEDepScintQuenched)
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/17 ~ //


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

// create vectors for main data
vector <int> time_sec;
vector <float> time_nanosec;
vector <float> energy;
vector <int> time_since_event_start_nanosec;
Float_t cumulative_en(0);

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


// event loop
//for ( Int_t event=0; event<num_of_events; event++ ) {
for ( Int_t event=0; event<1000; event++ ) {
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


//printf( "Total Electrons: %i\nTotal Gammas: %i\n", total_electrons, total_gammas ); //debug


// TRIGGER LOGIC
Int_t len = energy.size();
vector <double> time_full; // soon change to double

// make single vector for times -- should be relocated to original loop
for (Int_t k=0; k<len; k++) {
  time_full.push_back(time_sec[k]+time_nanosec[k]*1.e-9);
  h->Fill(time_full[k]); // fill histogram
} // len

// look for triggers
window = 50.e-9; // 50-ns window for now
//Double_t first_time = time_full[0];
for (k=0; k<len; k++) {

  // look ahead 50ns
  if ( time_full[k] < first_time+window ) { 
    continue; // not there yet
  } else {
    


} // look for triggers
  




//drawHist:
// draw histograms
//c1->Divide(2,1);
//c1->cd(1);
//h->Draw("");
//c1_1->SetLogz(true);
//c1->cd(2);
h->Draw("");
//c1->SetLogx(true);
c1->SetLogy(true);
//c1_2->SetLogx(true);
//c1_2->SetLogz(true);

// Graph energy deposits by clock time
// -- later will turn into triggers by clock time TODO
// -- currently, need to create arrays from the vectors -- too many loops! TODO
//Double_t time_full_arr[len];
//Double_t energy_arr[len];
cout << "Num_el: " << len << endl; // stupid workaround for ROOT's prohibition of variable-length arrays FIXME
Double_t time_full_arr[10120]; //FIXME
Double_t energy_arr[10120]; //FIXME
for (k=0; k<len; k++) {
  time_full_arr[k] = time_full[k];
  energy_arr[k] = (double)energy[k];
}
TCanvas* c2 = new TCanvas;
TGraph* g = new TGraph(len, time_full_arr, energy_arr);
g->Draw("A*");


// all pau!   )
return;
}
