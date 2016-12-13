// GetNumScintPhoton -- scratch macro for finding # of scintillation photons
// 	for individual RAT-PAC events (i.e., including from any secondary tracks)

void GetNumScintPhoton( const char* inputfile, Int_t number_of_events ) {

// open file
TFile *file0 = TFile::Open(inputfile);
RAT::DSReader r(inputfile);

// event loop
for (Int_t event=1; event<=number_of_events; event++) {

  // check event
  RAT::DS::Root *ds = r.NextEvent();
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);
  c.GoChild(0);
  RAT::TrackNode *n = c.GoTrackEnd();
  TString term_vol = n->GetVolume();
  TString term_proc = n->GetProcess();
//printf("\n%s\t%s\n\n", term_vol.Data(), term_proc.Data());
  
  // get number of scintillation photons
  RAT::DS::MC *mc = ds->GetMC();
  RAT::DS::MCSummary *sum = mc->GetMCSummary();
  Int_t scint_photons = sum->GetNumScintPhoton();
//printf("\n%i\n\n",scint_photons);
  
  // print summary
  printf("\nEvent: %i\nVolume: %s\nProcess: %s\nScintPhotons: %i\n#\n",\
    event, term_vol.Data(), term_proc.Data(), scint_photons);
  
  nav.Clear();

} // event loop

// all pau!   )
}
