// SimpleEnergyDAQ -- basic DAQ macro that works from the energy deposited by RAT-PAC into scintillation
//     along each Monte Carlo track step
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/2017 ~ //

// vim markers: 'i = initialize, 'd = extract data, 'b = find bursts, 's = sort data, 'a = analyze;
// 	'e = events_to_process, 'w = window_duration



//void SimpleEnergyDAQ( const char* filename, double window_duration, double thr ) {
void SimpleEnergyDAQ( const char* filename ) {




// PREPARE TO PROCESS RUN

// initialize
TFile *f = TFile::Open(filename);
RAT::DSReader r(filename);
RAT::DS::Root *ds;
RAT::DS::MC *mc;
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
gStyle->SetTitleSize(0.06);
gStyle->SetLabelSize(0.06);
gStyle->SetTitleFont(42);
gStyle->SetLabelFont(42);
TCanvas* c1 = new TCanvas("c1");
c1->SetTitle(filename);
c1->Divide(1,3);
// burst energies
TH1D* h1 = new TH1D("h1", "Burst Energies (MeV)", 100, 1.e-9, 1.5e1); // TODO autoscale
h1->SetLineWidth(2);
h1->SetLineColor(kBlue);
TAxis* h1x = h1->GetXaxis();
h1x->SetTitle("Energy (MeV)");
TAxis* h1y = h1->GetYaxis();
h1y->SetTitle("Entries");
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
h2->SetLineWidth(2);
h2->SetLineColor(kRed);
TAxis* h2x = h2->GetXaxis();
h2x->SetTitle("Time Delay (s)");
TAxis* h2y = h2->GetYaxis();
h2y->SetTitle("Entries");

// draw plots
c1->cd(1);
h1->Draw();
c1->cd(2);
h2->Draw();
c1_2->SetLogx(1);
c1_2->SetLogy(1);
c1->cd(3);
T->Draw("ds.mc.summary.totalScintEdepQuenched");



// EXTRACT DATA

// initialize
long events_to_process = total_events;
//Int_t events_to_process = 500;
TTimeStamp t_event_start_stamp;
Double_t t_event_start_utc;
Double_t t_event_start;
vector <vector <double>> step_list;
vector <double> step_single;
Long64_t number_of_steps;
Long64_t current_step;
Float_t step_edep;
Float_t step_time;

cout << endl;

// event loop
for ( event = 0; event < events_to_process; event++ ) {
  
  if ( event % 100 == 0 ) printf( "Processing at event %i...\n", event );
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
  while ( n != 0 ) {

    number_of_steps = c.StepCount();

    // step loop
    for ( current_step=0; current_step<number_of_steps; current_step++ ) {
      
      // only record if there was scintillation
      if ( n->GetTotEDepScintQuenched() > 0 ) {
        step_single.push_back( t_event_start + n->GetGlobalTime()*1.e-9 );
	step_single.push_back( n->GetTotEDepScintQuenched() );
	step_list.push_back( step_single );
	step_single.resize(0);
//	h1->Fill( n->GetTotEDepScintQuenched() ); //debug -- NOT REALLY THIS QUANTITY
      } // nonzero scintillation

    } // step loop
    
    n = c.FindNextTrack();

  } // track loop

  nav.Clear(); // prevent memory leak
  
} //event loop
cout << endl;




// SORT DATA
double sorting_arr[2000000];
Long64_t scint_steps = step_list.size();
for ( k=0; k<(scint_steps-1); k++ ) { sorting_arr[k] = step_list[k][0]; }
Int_t ind[2000000];
TMath::Sort( scint_steps, sorting_arr, ind, false );
vector <vector <double>> step_list_sorted;
step_list_sorted.resize( scint_steps, 2 );
for ( k=0; k<(scint_steps-1); k++ ) {
  step_list_sorted[k][0] = step_list[ind[k]][0];
  step_list_sorted[k][1] = step_list[ind[k]][1];
}
//for (k=0; k<(scint_steps-1); k++ ) { printf( "%f\t%f\t%f\t%f\n", step_list[k][0], step_list[k][1], step_list_sorted[k][0], step_list_sorted[k][1] ); } //debug
step_list.resize(0);




// LOCATE BURSTS

// threshold
Double_t thr = 0.5; // MeV -- simple low-energy cut

// initialize
//Double_t first_time = step_list_sorted[0][0]; // first deposition in list  FIXME bad first elements
Double_t first_time = step_list_sorted[1][0]; // workaround FIXME
Double_t final_time = step_list_sorted[scint_steps-2][0]; // last deposition in list FIXME why 2??
Double_t window_duration = 100.e-9;
Double_t burst_start_time;
Double_t burst_end_time;
Long64_t burst_start_index;
Long64_t burst_end_index;
vector <vector <double>> burst_list;
vector <double> burst_single;
Long64_t j(0);
Long64_t number_of_bursts(0);
Double_t burst_energy;

//debug
printf( "\nscint_steps: %i\n", scint_steps );
printf( "\n%e\t%e\t%e\t%e\n", first_time, window_duration, final_time, first_time + window_duration );

// check for any scintillation
if ( scint_steps == 0 ) { cout << "WARNING: No scintillation found. Exiting..." << endl; return; }

// check window size
if ( first_time + window_duration > final_time ) { cout << "ERROR: First window exceeds run end time. Check window duration." << endl; return; }

// find beginning of first burst
burst_start_index = 2; //FIXME
//burst_start_time = first_time;
burst_start_time = step_list_sorted[burst_start_index][0];

// run loop
while ( burst_end_time < final_time ) { // TODO change to fixed loop

  burst_end_time = burst_start_time + window_duration;

  // find burst_end_index
  if ( burst_end_time > final_time ) { // check for final window
    burst_end_index = scint_steps-2;
  } else { // all other windows
    j = burst_start_index;
    while ( step_list_sorted[j][0] < burst_end_time ) { j++; } // TODO another one
  } //endif
  burst_end_index = j;

  // find burst energy
  burst_energy = 0;
  for ( k = burst_start_index; k < burst_end_index; k++ ) {
    burst_energy += step_list_sorted[k][1];
  } // burst loop
  //cout << "debug\t" << burst_start_index << "\t" << burst_end_index << "\t" << burst_energy << endl;

  // record burst data
  if ( burst_energy > thr ) {
    number_of_bursts++;
    h1->Fill( burst_energy );
    burst_single.push_back( burst_start_time );
    burst_single.push_back( burst_energy );
    burst_list.push_back( burst_single );
    burst_single.resize(0);
  }

  // done with this burst
  burst_start_index = j+1;
  burst_start_time = step_list_sorted[j+1][0];

} // end run loop
cout << endl;

// report
Int_t b;
cout << "Bursts over threshold: " << number_of_bursts << endl;
cout << "#BURST LIST:" << endl;
for ( b=0; b<number_of_bursts; b++ ) {
  printf( "%e\t\t%e\n", burst_list[b][0], burst_list[b][1] );
}



// ANALYZE

// find time between bursts
Int_t b;
vector <double> delta_t;
delta_t.resize(number_of_bursts-1);
for ( b=0; b<(number_of_bursts-1); b++ ) {
//  h2->Fill( burst_list[b][0] - burst_list[b-1][0] );
  delta_t[b] = burst_list[b+1][0] - burst_list[b][0];
  h2->Fill( delta_t[b] );
}

// neutrino trigger
// TODO




// all pau!   )
return;
}
