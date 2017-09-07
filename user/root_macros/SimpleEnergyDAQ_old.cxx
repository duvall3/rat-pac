// SimpleEnergyDAQ -- basic DAQ macro that works from the energy deposited by RAT-PAC into scintillation
//     along each Monte Carlo track step
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/2017 ~ //

// USAGE: arguments are filename, window duration (ns), low-energy threshold (MeV), and a debug flag (bool)

// vim markers: 'i = initialize, 'd = extract data, 'b = find bursts, 's = sort data, 'a = analyze;
// 	'e = events_to_process, 'w = window_duration, 't = threshold


#include <vector>

// window_duration in ns, thr in MeV:
void SimpleEnergyDAQ( const char* filename, double window_duration=100., double thr=0., bool debug_tf=0 ) {



cerr << endl << endl << "~~~ SimpleEnergyDAQ ~~~" << endl << endl;


// PREPARE TO PROCESS RUN

cerr << "Initializing..." << endl << endl;

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
for (Int_t m=1;m<=nBinsEBP;m++) {
  xbinsEBP[m] = TMath::Power(10,logxmin+m*binwidth);
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
//long events_to_process = total_events;
long events_to_process = 1000; //debug
c1->cd(1);
h1->Draw();
c1->cd(2);
h2->Draw();
c1_2->SetLogx(1);
c1_2->SetLogy(1);
c1->cd(3);
TString events_to_draw = "ds.mc.id < ";
events_to_draw.Append( TString::LLtoa(events_to_process,10) );
T->Draw( "ds.mc.summary.totalScintEdepQuenched", events_to_draw );
if ( thr < 0.2 ) {
  c1_1->SetLogy(1);
  c1_3->SetLogy(1);
}



// EXTRACT DATA

// initialize
Long64_t total_tracks(0); //debug
TTimeStamp t_event_start_stamp;
Double_t t_event_start_utc;
Double_t t_event_start;
vector <vector <double>> step_list;
vector <double> step_single;
Long64_t number_of_steps;
Long64_t current_step;
Float_t step_edep;
Float_t step_time;

// event loop
for ( event = 0; event < events_to_process; event++ ) {
  
  if ( event % 100 == 0 )  cerr << "Extracting data at event " << event << "...\n";
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

    n = c.GoStep(current_step);

    // debug
    if ( debug_tf == true ) {
      printf("%d : current_step: %d/%d track_id: %d parent_id: %d  %5.3e %5.3e\n",event,current_step,number_of_steps,n->GetTrackID(),c.Parent()->GetTrackID(),t_event_start + n->GetGlobalTime()*1.e-9,n->GetTotEDepScint());
    }

      // only record if there was scintillation
      if ( n->GetTotEDepScintQuenched() > 0 ) {
        step_single.push_back( t_event_start + n->GetGlobalTime()*1.e-9 );
	step_single.push_back( n->GetTotEDepScintQuenched() );
	step_list.push_back( step_single );
	step_single.resize(0);
      } // nonzero scintillation

    } // step loop
    
    total_tracks++; //debug -- see note at "cout << ... << total_tracks" line below
    n = c.FindNextTrack();

  } // track loop

  nav.Clear(); // prevent memory leak
  
} //event loop

//cerr << endl;

// debug -- check that each track is visited exactly once
if ( debug_tf == true )  cout << endl << "Total tracks: " << total_tracks << endl << endl;
/* Note: compare this count against the number of entries in T->Draw("ds.mc.track.id")
     or T->Draw("ds.mc.track.id", "ds.mc.id < EVENTS_TO_PROCESS"), as applicable */




// SORT DATA

cerr << endl << "Sorting data..." << endl;

// create arrays for TMath::Sort()
double sorting_arr[2000000];
Long64_t ind[2000000];


// fill time array to be sorted
Long64_t scint_steps = step_list.size();
for ( k=0; k<scint_steps; k++ )  sorting_arr[k] = step_list[k][0];

// TMath::Sort will fill the array "ind" with the indices that put "sorting_arr" in ascending order
TMath::Sort( scint_steps, sorting_arr, ind, false );

// now create and fill a vector (of dimensions scint_steps x 2) containing the sorted (time, energy) pairs
vector <vector <double>> step_list_sorted;
step_list_sorted.resize( scint_steps, 2 );
for ( k=0; k<scint_steps; k++ ) {
  step_list_sorted[k][0] = step_list[ind[k]][0];
  step_list_sorted[k][1] = step_list[ind[k]][1];
}

//debug
if ( debug_tf == true ) {
  for (k=0; k<scint_steps; k++ ) { printf( "%f\t%f\t%f\t%f\n", step_list[k][0], step_list[k][1], step_list_sorted[k][0], step_list_sorted[k][1] ); } //debug
}

// clear step_list
step_list.resize(0);

//debug
if ( debug_tf == true ) {
  cout << endl << "sorted index order: " << endl;
  for (k=0; k<20; k++) { cout << ind[k] << endl; }
  cout << endl;
}


// LOCATE BURSTS

cerr << endl << "Grouping energy depositions..." << endl << endl;

// initialize
Double_t final_time = step_list_sorted[scint_steps-1][0]; //debug
window_duration = window_duration * 1.e-9; // convert to ns
Double_t burst_start_time;
Double_t burst_end_time;
Long64_t burst_start_index;
Long64_t burst_end_index;
vector <vector <double>> burst_list;
vector <double> burst_single;
Long64_t i(0);
Double_t burst_energy;

// check for any scintillation
if ( scint_steps == 0 ) { cout << "WARNING: No scintillation found. Exiting..." << endl; return; }

// find beginning of first burst
burst_start_index = 0;
Double_t window_end_time = burst_start_time + window_duration;

// check window size
if ( burst_start_time + window_duration > final_time ) { cout << "ERROR: First window exceeds run end time. Check window duration." << endl; return; }


// burst-finding loop
for ( i = 0; i < scint_steps; i++ ) {

  // determine whether end of burst has been reached yet
  if ( step_list_sorted[i][0] < window_end_time ) {
    // if not, do nothing and move on
  } else {
    // if so:
    // record beginning of burst
    burst_single.push_back( burst_start_index );
    burst_single.push_back( step_list_sorted[burst_start_index][0] );
    // record end of burst
    burst_single.push_back( i-1 );
    burst_single.push_back( step_list_sorted[i-1][0] );
    // write current burst to burst_list and reset burst_single
    burst_list.push_back( burst_single );
    burst_single.resize(0);
    // initialize next burst
    burst_start_index = i;
    window_end_time = step_list_sorted[i][0] + window_duration;
  }

} // burst-finding loop

// debug
if ( debug_tf == true ) {
  cout << "debug: final i = " << i << endl;
  cout << "debug: final time = " << step_list_sorted[i-1][0] << endl << endl;
}


// add columns for burst energies and durations
Long64_t number_of_bursts = burst_list.size();
burst_list.resize( number_of_bursts, 5 );


// burst-summing loop
Long64_t b;
vector <double> burst_durations;
for ( b = 0; b < number_of_bursts; b++ ) {

  // tally burst energy
  burst_energy = 0;
  for ( k = burst_list[b][0]; k < burst_list[b][2]; k++ ) {
    burst_energy += step_list_sorted[k][1];
  }

  burst_durations.push_back( burst_list[b][3] - burst_list[b][1] );

  // record burst energy and duration
  burst_list[b][4] = burst_energy;

} // burst-summing loop
  


// report results
Double_t burst_sum(0);
vector <long> burst_over_thr_ids;
cout << "BURSTS OVER THRESHOLD:" << endl;
printf( "%s\t%s\t\t%s\t%s\t\t%s\t\t%s\n", "start_index", "start_time_ns", "end_index", "end_time_ns", "energy_MeV", "duration" );
for ( b=0; b<number_of_bursts; b++ ) {
  if ( burst_list[b][4] > thr ) {
    h1->Fill( burst_list[b][4] );
    printf( "%d\t\t%e\t\t%d\t\t%e\t\t%e\t\t%e\n", burst_list[b][0], burst_list[b][1], burst_list[b][2], burst_list[b][3], burst_list[b][4], burst_durations[b] );
//  printf( "%d\t\t%e\t\t%d\t\t%e\t\t%e\t\t%e\n", burst_list[b][0], burst_list[b][1], burst_list[b][2], burst_list[b][3], burst_list[b][4] );
    burst_sum += burst_list[b][4];
    burst_over_thr_ids.push_back(b);
  }
}
Long64_t bursts_over_thr = burst_over_thr_ids.size();
printf( "\nBursts over threshold: %i\n", bursts_over_thr );
printf( "\nBurst Energy Sum (MeV): %e\n\n", burst_sum );

printf( "RAT-PAC, *ALL* Quenched Scint. Energy: %e\n\n", htemp->GetEntries() * htemp->GetMean() );


// TODO check step counts against each other //debug



// ANALYZE

cerr << "Analyzing..." << endl << endl;

// find time between bursts
Long64_t j;
vector <double> delta_t;
delta_t.resize(bursts_over_thr-1);
for ( j=0; j<(bursts_over_thr-1); j++ ) {
  delta_t[j] = burst_list[burst_over_thr_ids[j+1]][1] - burst_list[burst_over_thr_ids[j]][1];
  h2->Fill( delta_t[j] );
}

// neutrino trigger
// TODO





// all pau!   )
cerr << "Processing complete." << endl << endl;
cerr << "### SimpleEnergyDAQ ###" << endl << endl << endl;
return;
}
