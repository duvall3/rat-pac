// drawPrevEvent -- see github.com/duvall3-->RAT-PAC-->Comparison-->user-->root_macros-->drawTracks.cxx


//// PARTICLE TRACKS


// drawPrevEvent
void drawPrevEvent() {
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
  ev--;
  drawTracks(ev); //FIXME need to retrieve and include IBD_TF
// all pau!   )
}
