// convert particle tracks to ASCII
// recommended usage: root -q -l -b ToAscii.cxx | grep -v "Cerenkov|hadElastic|RAT|ToAscii" > OUTPUT_FILENAME.dat

void ToAscii() {

// edit following line for INPUT_FILENAME
TFile *file0 = TFile::Open("doped_water.root");

// edit following line for INPUT_FILENAME
RAT::DSReader r("doped_water.root");

// edit following line for NUMBER_OF_EVENTS
for (int events=1; events<=1000; events++) {

  RAT::DS::Root *ds = r.NextEvent();
  
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);

// choose one of the following two lines, depending on particle:  
  c.GoChild(0); // if using RAT-PAC IBD generator, this will be e+
  c.PrintTrack();
  c.GoParent();

//  c.GoChild(1); // if using RAT-PAC IBD generator, this will be neutron
//  c.PrintTrack();
//  c.GoParent();

  cout << endl;
  cout << endl;

}

return;

}
