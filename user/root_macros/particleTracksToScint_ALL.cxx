// particleTracksToScint_ALL -- macro to translae prompt-to-delayed displacement vectors
//   from IBD candidate events to "_T.root" scint-data format
// -- for use with the macros in https://github.com/duvall3/rat-pac/tree/collab/user/root-macros/
// -- runs on original RAT-PAC .root file
//
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2022 ~ //

//Copyright (C) 2022 Mark J. Duvall
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

void particleTracksToScint_ALL ( const char* filename ) {

// load utility macros if needed
if (! gInterpreter->IsLoaded("findCellScintTotal.cxx")) gROOT->LoadMacro("findCellScintTotal.cxx");
if (! gInterpreter->IsLoaded("findCellScintTotalQuenched.cxx")) gROOT->LoadMacro("findCellScintTotalQuenched.cxx");
//if (! gInterpreter->IsLoaded("findChildScintTotal.cxx")) gROOT->LoadMacro("findChildScintTotal.cxx");
//if (! gInterpreter->IsLoaded("findChildScintTotalQuenched.cxx")) gROOT->LoadMacro("findChildScintTotalQuenched.cxx");

// init
TString FileName = filename;
TString basename = FileName(0, FileName.Index(".root"));
TString savename = basename + "_T.root";
TFile* f0 = TFile::Open(filename); // needed by TRATGeo for RAT database
TObjString experiment = (TObjString)db->GetValue("DETECTOR[].experiment");
//Double_t positionResolution = 150.; // position resolution (mm)
Double_t positionResolution = 86.7; // position resolution (mm)
TRATGeo g;
g.Build();
TFile* f = TFile::Open(savename, "recreate");
f->cd(); // just to be safe
experiment.Write("experiment");
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::DS::MC* mc = ds->GetMC();
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();

// possibly not needed in current version
//TRegexp tarname = ".*target.*"; // general
//TRegexp tarname = ".*[target|capture].*"; // SANTA
//TString volname;
//Bool_t prompt_tf, delayed_tf;

// get total top-level RAT-PAC MC events
Long64_t totalRATEvents;
//totalRATEvents = T->GetEntries();
totalRATEvents = r.GetTotal();
TString nMCEvents = TString::LLtoa(totalRATEvents, 10); // Long to TString, base-10
TObjString *nMCEvents_tos = new TObjString(nMCEvents);

// create tree and set branch addresses
TTree* T_scint = new TTree("T_scint", "Pseudo-Scintillation Data");
//TTree* T_scint = new TTree("T", "Pseudo-Scintillation Data");
T_scint->GetUserInfo()->Add(nMCEvents_tos);
Int_t event, pdgcode;
Double_t event_time, wall_time, energy, energy_q, x, y, z, x_quantized, y_quantized, z_quantized, x_res, y_res, z_res;
TString cap_product, vol_name;
T_scint->Branch( "event", &event, "event/I" );
T_scint->Branch( "pdgcode", &pdgcode, "pdgcode/I" );
T_scint->Branch( "event_time", &event_time, "event_time/D" );
T_scint->Branch( "wall_time", &wall_time, "wall_time/D" );
T_scint->Branch( "energy", &energy, "energy/D" );
T_scint->Branch( "energy_q", &energy_q, "energy_q/D" );
T_scint->Branch( "x", &x, "x/D" );
T_scint->Branch( "y", &y, "y/D" );
T_scint->Branch( "z", &z, "z/D" );
T_scint->Branch( "x_quantized", &x_quantized, "x_quantized/D" );
T_scint->Branch( "y_quantized", &y_quantized, "y_quantized/D" );
T_scint->Branch( "z_quantized", &z_quantized, "z_quantized/D" );
T_scint->Branch( "x_res", &x_res, "x_res/D" );
T_scint->Branch( "y_res", &y_res, "y_res/D" );
T_scint->Branch( "z_res", &z_res, "z_res/D" );
T_scint->Branch( "cap_product", &cap_product );
T_scint->Branch( "vol_name", &vol_name );

// MAIN PASS 1
cout << "Processing particle tracks..." << endl;

Long64_t k(0), kMCP(0), N(totalRATEvents);
Int_t i(0), mcChildren(0);
RAT::DS::MCParticle *mcp;
TString pclName;
Bool_t isLepton(kFALSE), isNeutron(kFALSE);
Int_t leptonLower(11), leptonUpper(18);
Double_t eStep, eSum, eqStep, eqSum;
Double_t xStep, yStep, zStep, xEQ, yEQ, zEQ;
TRATVolume *vol;
TVector3 coords;
TVector3 *volCoords;

for ( k=0; k<N; k++ ) { // event loop

  // init
  event = k;
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
//c = nav.Cursor(0); // moved inside MCParticle loop
  mc = ds->GetMC();
  mcChildren = mc->GetMCParticleCount();
  event_time = mc->GetUTC().AsDouble();

  // MCParticle loop
  /* for ( kMCP=0; kMCP<mcChildren; kMCP++ ) { // OLD, for reference */
  while ( n = c.FindNextTrack() ) {

    // reset lepton and neutron tests
    isLepton = kFALSE;
    isNeutron = kFALSE;

    // enter track
    /* c = nav.Cursor(0); */
    /* n = c.GoChild(kMCP); */
    pdgcode = n->GetPDGCode();
    pclName = n->GetParticleName();
    // lepton and neutron tests
    isLepton = (TMath::Abs(pdgcode) < leptonLower ? kFALSE : TMath::Abs(pdgcode) > leptonUpper ? kFALSE : kTRUE);
    isNeutron = (pdgcode==2112);

//    //debug
//    cout << "kMCP: " << kMCP << endl;
//    printf("Event: %d\nPDGCode: %d\t Particle: %s\nTrack: %d\nParent: 0x%x\n", k, pdgcode, pclName.Data(), n->GetTrackID(), c.Parent());
//    if (kMCP == mcChildren-1) cout << endl;

    // for leptons:
    if (isLepton) {
      // current: use *starting volume* of e+ track for quantized position
      // -- also using raw MC-truth starting position for regular coordinates
      // TODO: instead, use volume with greatest scint. energy deposit
      coords = n->GetEndpoint();
      x = coords.X();
      y = coords.Y();
      z = coords.Z();
      vol_name = n->GetVolume();
      vol = (TRATVolume*)g.GetVolume(vol_name.Data());
      volCoords = vol->GetAbsolutePosition();
      x_quantized = volCoords->X();
      y_quantized = volCoords->Y();
      z_quantized = volCoords->Z();
      wall_time = event_time + n->GetGlobalTime()*1.e-9;
  //  xEQ = 0;
  //  yEQ = 0;
  //  zEQ = 0;
  //  eSum = 0;
  //  eqSum = 0;
  //  energy = 0;
  //  energy_q = 0;
  //  for ( i=0; i<c.StepCount(); i++ ) { // step loop
  //    n = c.GoStep(i);
  //    eStep = n->GetTotEDepScint();
  //    eqStep = n->GetTotEDepScintQuenched();
  //    xStep = n->GetEndpoint().X();
  //    yStep = n->GetEndpoint().Y();
  //    zStep = n->GetEndpoint().Z();
  //    xEQ += xStep * eqStep;
  //    yEQ += yStep * eqStep;
  //    zEQ += zStep * eqStep;
  //    eSum += eStep;
  //    eqSum += eqStep;
  //  } // step loop
  //  energy = eSum;
  //  energy_q = eqSum;
  //  x = xEQ / eqSum;
  //  y = yEQ / eqSum;
  //  z = zEQ / eqSum;
      x_res = gRandom->Gaus(x, positionResolution);
      y_res = gRandom->Gaus(y, positionResolution);
      z_res = gRandom->Gaus(z, positionResolution);
      cap_product = "";
  //  if (energy_q > 0) T_scint->Fill(); // possible bugfix
      T_scint->Fill();
    } // isLepton

    // for neutrons:
    if (isNeutron) {
    //for ( i=0; i<c.StepCount(); i++ ) { // step loop
    //  n = c.GoStep(i);
    //  if (n->GetProcess() == "hadElastic") {
    //    energy_q = findCellScintTotalQuenched(c);
    //    if (energy_q > 100.e-3) {
    //      wall_time = event_time + n->GetGlobalTime()*1e-9;
    //      energy = findCellScintTotal(c);
    //      x = n->GetEndpoint().X();
    //      y = n->GetEndpoint().Y();
    //      z = n->GetEndpoint().Z();
    //      T_scint->Fill(); // scatters must be <thresh>MeVee or above to register
    //    } //energy_q
    //  } //hadElastic
    //} //step loop
      n = c.GoTrackEnd();
      wall_time = event_time + n->GetGlobalTime()*1.e-9;
      TString nProc = n->GetProcess();
      if ( (nProc == "nCapture") || (nProc == "neutronInelastic") ) {
        vol_name = n->GetVolume();
        vol = (TRATVolume*)g.GetVolume(vol_name.Data());
        volCoords = vol->GetAbsolutePosition();
        x_quantized = volCoords->X();
        y_quantized = volCoords->Y();
        z_quantized = volCoords->Z();
        n = c.GoChild(c.ChildCount()-1);
        cap_product = n->GetParticleName();
        n = c.GoParent();
        energy_q = findCellScintTotalQuenched(c);
    //  energy_q = findChildScintTotalQuenched(c); //debug
        energy = findCellScintTotal(c);
    //  energy = findChildScintTotal(c); //debug
        x = n->GetEndpoint().X();
        y = n->GetEndpoint().Y();
        z = n->GetEndpoint().Z();
        x_res = gRandom->Gaus(x, positionResolution);
        y_res = gRandom->Gaus(y, positionResolution);
        z_res = gRandom->Gaus(z, positionResolution);
        T_scint->Fill();
      } // nCapture || neutronInelastic
    } // isNeutron

  } // MCParticle loop

  // keep memory from blowing up
  nav.Clear();

  // update user
  if ( (k%1000==0) ) printf("  Processed %d events...\n", k );

} // event loop


// MAIN PASS 2

// create new branches
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T_scint->Branch("event_time_adj", &event_time_adj, "event_time_adj/D");
T_scint->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
T_scint->Branch("interevent_time", &interevent_time, "interevent_time/D");
T_scint->GetEntry(0);
run_start = event_time;

// fill new branches
Double_t time_current, time_prev;
// times aligned to run start
for (( k = 0; k < T_scint->GetEntries(); k++ )) {
  T_scint->GetEntry(k);
  event_time_adj = event_time - run_start;
  wall_time_adj = wall_time - run_start;
  T_scint->GetBranch("event_time_adj")->Fill();
  T_scint->GetBranch("wall_time_adj")->Fill();
  // interevent times
  if ( k == 0 ) { 
    interevent_time = 0;
  } else {
    time_current = wall_time;
    T_scint->GetEntry(k-1);
    time_prev = wall_time;
    T_scint->GetEntry(k);
    interevent_time = time_current - time_prev;
  }
  T_scint->GetBranch("interevent_time")->Fill();
}

// finish up
cout << "Done." << endl << endl;
T_scint->Write();
//TString gName;
//gName.Form("%s_TRATGeo", g.GetExperiment().Data());
//g.Write(gName.Data());
//g.Write("G");
f->Close();

// all pau!   )
}
