// drawPrevEvent -- see github.com/duvall3-->RAT-PAC-->collab-->user-->root_macros-->drawTracks.cxx


//// PARTICLE TRACKS


// drawPrevEvent
void drawPrevEvent() {
  // retrieve canvas and event label/number
  TCanvas* c = gPad->GetCanvas();
  TPaveText* lab = c->GetListOfPrimitives()->FindObject("Event Label");
  if ( lab == 0x0 )  {
    cerr << "Error: No event drawn yet; use drawTracks(<EVENT>, [IBD_TF])." << endl;
    return;
  }
  TString evname = lab->GetLine(0)->GetTitle();
  TRegexp tr = "[0-9]";
  evname.Remove( 0, evname.Index(tr) );
  Int_t ev = evname.Atoi();
  // retrieve ibd_TF
  Bool_t ibd_TF;
  TLegend* tl = c->GetListOfPrimitives()->FindObject("Track Legend");
  Int_t num_tracks = tl->GetListOfPrimitives()->LastIndex() + 1;
  if ( num_tracks < 2  ) {
    ibd_TF = kFALSE;
  } else if ( num_tracks == 2 ) {
    ibd_TF = kTRUE;
  } else {
    ibd_TF = kTRUE;
    cout << "WARNING: Only the first two top-level tracks will be drawn." << endl;
  }
  // increment event and draw
  ev--;
  drawTracks(ev);
// all pau!   )
}
