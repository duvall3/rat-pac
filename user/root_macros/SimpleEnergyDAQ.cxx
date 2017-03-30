// SimpleEnergyDAQ -- basic DAQ macro that works from the energy deposited by RAT-PAC into scintillation
//     along each Monte Carlo track step
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/2017 ~ //

// vim markers: 'i = initialize, 'd = extract data, 'b = bursts, 'p = plot; 'e = events_to_process, 'w = window_duration


//void SimpleEnergyDAQ( const char* filename, long events_to_process, double window_duration, double thr ) {
//void SimpleEnergyDAQ( const char* filename, long events_to_process ) {
void SimpleEnergyDAQ( const char* filename ) {





// PREPARE TO PROCESS RUN

// initialize
TFile *f = TFile::Open(filename);
RAT::DSReader r(filename);
RAT::DS::Root *ds;
RAT::DS::MC *mc;
//RAT::TrackNav nav;  // no default constructor, moved to event loop
//RAT::TrackCursor c; // same as TrackNav above
RAT::TrackNode *n;
long total_events = r.GetTotal();
Long64_t event;
Long64_t k;

// get run start time
ds = r.GetEvent(0);
mc = ds->GetMC();
TTimeStamp t_run_start_stamp = mc->GetUTC();
Double_t t_run_start = t_run_start_stamp.GetSec() + (t_run_start_stamp.GetNanoSec())*1.e-9;
mc->Clear();
ds->Clear();

// prepare plots
gStyle->SetStatFontSize(0.08);
Float_t axisTitleSize = 0.05;
Float_t axisLabelSize = 0.05;
Style_t axisFont = 42; // helvetica
TCanvas* c1 = new TCanvas("c1");
c1->SetTitle(filename);
c1->Divide(1,2);
// burst energies
TH1D* h1 = new TH1D("h1", "Burst Energies (MeV)", 100, 1.e-9, 1.5e1); // TODO autoscale
TAxis* h1x = h1->GetXaxis();
h1x->SetTitle("Energy (MeV)");
h1x->SetTitleSize(axisTitleSize);
h1x->SetLabelSize(axisLabelSize);
h1x->SetTitleFont(axisFont);
h1x->SetLabelFont(axisFont);
TAxis* h1y = h1->GetYaxis();
h1y->SetTitle("Entries");
h1y->SetTitleSize(axisTitleSize);
h1y->SetLabelSize(axisLabelSize);
h1y->SetTitleFont(axisFont);
h1y->SetLabelFont(axisFont);
// inter-burst times
// first, some great log-binning code courtesy of Marc Bergevin (bergevin1@llnl.gov):
const Int_t nBinsEBP = 100;
Double_t xmin = 1.e-10; //s
Double_t xmax = 1.e3; //s
Double_t logxmin = TMath::Log10(xmin);
Double_t logxmax = TMath::Log10(xmax);
Double_t binwidth = (logxmax-logxmin)/nBinsEBP;
Double_t xbinsEBP[nBinsEBP+1];
xbinsEBP[0] = xmin;
for (Int_t i=1;i<=nBinsEBP;i++) {
  xbinsEBP[i] = TMath::Power(10,logxmin+i*binwidth);
}
// now ready to create the histogram:
TH1D* h2 = new TH1D("h2", "Time Between Bursts (Interevent Time)", nBinsEBP, xbinsEBP );
TAxis* h2x = h2->GetXaxis();
h2x->SetTitle("Time Delay (s)");
h2x->SetTitleSize(axisTitleSize);
h2x->SetLabelSize(axisLabelSize);
TAxis* h2y = h2->GetYaxis();
h2y->SetTitle("Entries");
h2y->SetTitleSize(axisTitleSize);
h2y->SetLabelSize(axisLabelSize);

// experimental: draw and watch live fill
c1->cd(1);
h1->Draw();
c1->cd(2);
h2->Draw();



// EXTRACT AND SORT DATA

// initialize
//long events_to_process = total_events; //debug
Int_t events_to_process = 100;
TTimeStamp t_event_start_stamp;
Double_t t_event_start_utc;
Double_t t_event_start;
vector <double> step_times;
vector <double> step_energies;

// event loop
for ( event = 0; event < events_to_process; event++ ) {
  
  // load event 
  ds = r.GetEvent(event);
  mc = ds->GetMC();
  // get event start time
  t_event_start_stamp = mc->GetUTC();
  t_event_start_utc = (t_event_start_stamp.GetSec() + (t_event_start_stamp.GetNanoSec())*1.e-9);
  t_event_start = t_event_start_utc - t_run_start; // offset utc from start of run
  // enter event
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);
  n = c.GoChild(0);

  // track loop


  

  nav.Clear(); // prevent memory leak
  
} //event loop


// LOCATE BURSTS




// PLOT & ANALYZE





// all pau!   )
return;
}
