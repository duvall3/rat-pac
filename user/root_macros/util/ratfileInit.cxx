// ratfileInit -- because typing this a few thousand times has been enough
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/2021 ~ //

{

  // filename stuff
  const char* dirname = gSystem->pwd();
  TString FN = dirname;
  FN = FN(FN.Last('/')+1, FN.Length()-1);
  FN.Append(".root");
  const char* filename = FN.Data();

  // MAIN
  RAT::DSReader r(filename);
  RAT::DS::Root* ds = r.GetEvent(0);
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(kFALSE);
  RAT::TrackNode* n = c.Here();

// all pau!   )
}
