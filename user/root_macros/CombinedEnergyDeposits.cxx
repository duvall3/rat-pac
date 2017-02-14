// CombinedEnergyDeposits -- output a table of (times, energies) for the scintillation energy deposited along each track step
// -- currently: creates overall vector for dE/dt
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 2/17 ~ //


//(vector <float> energy, vector <float> time) Loop( RAT::DS::Root* ds ) { // takes *ds as input
//int CombinedEnergyDeposits( RAT::DS::Root* ds ) { // takes *ds as input

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

// event loop
for ( Int_t event=0; event<num_of_events; event++ ) {

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
  RAT::TrackNode *n = c.Here(); // enter event

  // create vectors for main data
//vector <float> time;
  vector <int> time_sec;
  vector <float> time_nanosec;
//vector <double> time_as_double;
  vector <float> energy;
  Float_t cumulative_en(0);

  Int_t track_counter(0); //debug

  // loop over tracks
  while ( n != 0 ) {

    TString particle_name = n->GetParticleName();
//  printf( "Track: %i\tParticle: %s\t", n->GetTrackID(), particle_name.Data() ); //debug
    Float_t tot_en(0);

    // loop over steps
    while ( c.IsTrackEnd() == false ) {
//    TTimeStamp t_step = TTimeStamp::TTimeStamp( t_event_start.GetSec(), t_event_start.GetNanoSec() + n->GetGlobalTime() );
//    TTimeStamp t_step = TTimeStamp::TTimeStamp( t_event_start.GetSec(), n->GetGlobalTime() );
//    TTimeStamp t_step = TTimeStamp::TTimeStamp( 0, 0 );
      time_sec.push_back( step_sec );
//    time_sec.push_back( sec_event_start );
//    time_sec.push_back( t_step.GetSec() );
      time_nanosec.push_back( n->GetGlobalTime() + nanosec_event_start - nanosec_run_start );
//    time_nanosec.push_back( n->GetGlobalTime() ); 
//    time_nanosec.push_back( t_step.GetNanoSec() );
//    time_as_double.push_back( ev_starttime + n->GetGlobalTime()*1e-9 - run_starttime );
//    Float_t step_nanosec = n->GetGlobalTime() - nanosec_event_start - nanosec_run_start;
//    Float_t step_time = step_sec + step_nanosec*1e-9;
//    time.push_back( step_time );
      energy.push_back( n->GetTotEDepScintQuenched() );
      tot_en += n->GetTotEDepScintQuenched();
      n = c.GoNext();
    } // step loop

  //printf( "tot_en: %5.6f\n", tot_en ); //debug
    cumulative_en += tot_en;
    track_counter++;

    RAT::TrackNode *n = c.FindNextTrack();

  } // track loop

  // print summary
  //printf( "Cumulative Energy: %5.6f\n", cumulative_en );
  //printf( "Total Tracks: %i\n\n", track_counter );

  // print vectors
  Int_t len = energy.size();
  for (Int_t k=0; k<len; k++) {
    printf( "%i\t%5.6f\t%5.6f\n", time_sec[k], time_nanosec[k], energy[k] );
  }

  // cleanup
  nav.Clear();
  mc->Clear();

} // event loop

// all pau!   )
return;
}
