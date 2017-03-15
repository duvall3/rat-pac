// CombinedEnergyDeposits -- creates a histogram of (times, energies) for the scintillation energy deposited along each track step
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 2/17 ~ //


//void CombinedEnergyDeposits( const char* filename, int event ) {
void CombinedEnergyDeposits( const char* filename ) {


// open file
TFile *file0 = TFile::Open(filename);
RAT::DSReader r(filename);
Int_t num_of_events = r.GetTotal();

// get run start time
RAT::DS::Root *ds = r.GetEvent(0);
RAT::DS::MC *mc = ds->GetMC();
TTimeStamp t_run_start = mc->GetUTC();
//const Double_t run_starttime = t_run_start.AsDouble();
time_t sec_run_start = t_run_start.GetSec();
Float_t nanosec_run_start = (Float_t)t_run_start.GetNanoSec();
mc->Clear();

// prepare histograms
//
TCanvas* c1 = new TCanvas;

// E-T distribution
TH2D* h = new TH2D("h", "E - T Distribution", 100, 1.e-9, 6., 100, 1.e-4, 1.e-2);
TAxis* xa = h->GetXaxis();
TAxis* ya = h->GetYaxis();
xa->SetTitle("Time (s)");
xa->SetTitleOffset(1.5);
xa->SetLabelSize(.02);
ya->SetTitle("Energy (MeV)");
ya->SetTitleOffset(1.5);
ya->SetLabelSize(.02);

// E-T_since_event_start distribution
// Marc's section:
  const Int_t nBinsEBP = 100;
  Double_t xmin = 1.e-3; //ns
  Double_t xmax = 1.e9; //ns
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
TH2D* h2 = new TH2D("h2", "E - T_Event Distribution", nBinsEBP, xbinsEBP, 100, 1.e-4, 1.e-2);
TAxis* xa2 = h2->GetXaxis();
TAxis* ya2 = h2->GetYaxis();
xa2->SetTitle("Time (ns)");
xa2->SetTitleOffset(1.5);
xa2->SetLabelSize(.02);
ya2->SetTitle("Energy (MeV)");
ya2->SetTitleOffset(1.5);


// event loop
for ( Int_t event=0; event<num_of_events; event++ ) {
//for ( Int_t event=0; event<1000; event++ ) {

  // load event and grab start time
  ds = r.GetEvent(event);
  mc = ds->GetMC();
  TTimeStamp t_event_start = mc->GetUTC();
//const Double_t ev_starttime = t_event_start.AsDouble();
  time_t sec_event_start = t_event_start.GetSec();
  Float_t nanosec_event_start = t_event_start.GetNanoSec();
  // offset time to beginning of run
  Int_t delta_t_sec = sec_event_start - sec_run_start;
  Int_t step_sec = sec_event_start - sec_run_start;

  // create RAT tracking objects
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);
//RAT::TrackNode *n = c.Here(); // enter event
  RAT::TrackNode *n = c.GoChild(0); // enter event (from top level) -- TRACK DUPLICATE TEST

  // create vectors for main data
  vector <int> time_sec;
  vector <float> time_nanosec;
  vector <float> energy;
  vector <int> time_since_event_start_nanosec;
  Float_t cumulative_en(0);

  Int_t track_counter(0); //debug
  Int_t photon_counter(0); //debug

  // loop over tracks
  while ( n != 0 ) {

    TString particle_name = n->GetParticleName();
    Int_t track_id = n->GetTrackID();
//  if ( photon_counter % 1000 == 0 ) { cout << "Skipping photon " << photon_counter << "..." << endl; } //debug, mostly
//  if ( particle_name.Contains("opticalphoton") ) {
//    photon_counter++;
//    n = c.FindNextTrack();
//    continue; // skip optical photons
//  }
//  printf( "Track: %i\tParticle: %s\t", n->GetTrackID(), particle_name.Data() ); //debug
    Float_t tot_en(0);

    // loop over steps
//  while ( c.IsTrackEnd() == false ) {
    Int_t num_of_steps = c.StepCount();
    for ( Int_t step=0; step<(num_of_steps-1); step++ ) {
      time_sec.push_back( step_sec );
      time_nanosec.push_back( n->GetGlobalTime() + nanosec_event_start - nanosec_run_start );
      time_since_event_start_nanosec.push_back( n->GetGlobalTime() );
      energy.push_back( n->GetTotEDepScintQuenched() );
      tot_en += n->GetTotEDepScintQuenched();
      n = c.GoNext();
    } // step loop

  //printf( "tot_en: %5.6f\n", tot_en ); //debug
    cumulative_en += tot_en;
    track_counter++;

    n = c.FindNextTrack();

  } // track loop

//  // print track summary
//  printf( "Track ID: %d\n", track_id  );
//  printf( "Cumulative Energy: %5.6f\n", cumulative_en );
//  printf( "Total Tracks: %i\n\n", track_counter );

  // generate histogram
  Int_t len = energy.size();
  for (Int_t k=0; k<len; k++) {
    if ( energy[k] > 0 ) {
      h->Fill(time_sec[k]+time_nanosec[k]*1.e-9, energy[k]); // fill histogram
      h2->Fill(time_since_event_start_nanosec[k], energy[k]); // fill histogram2
    } // nonzero scintillation
  } // elements

  // cleanup
  nav.Clear();
  mc->Clear();

} // event loop

//drawHist:
// draw histograms
c1->Divide(2,1);
c1->cd(1);
h->Draw("lego2");
c1_1->SetLogz(true);
c1->cd(2);
h2->Draw("lego2");
c1_2->SetLogx(true);
c1_2->SetLogz(true);


// all pau!   )
return;
}
