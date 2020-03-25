// SEDAQ -- modified version of SimpleEnergyDAQ to operate on files that
//   already contain T but not T2
// -- further documentation forthcoming
// -- see https://github.com/duvall3/rat-pac/tree/collab
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //
// ~ SEDAQ v0.9.1 ~ 11/2019 ~ //

// INPUT: ROOT file containing TTree "T" (Scintillation Data)
// OUTPUT: ROOT file containing TTrees "T2" (IBD Candidate Data) and "T_Trig" (IBD Trigger Parameters and Result)
// 	*** NOTE: View trigger parameters using T_Trig->Show(0), NOT T_Trig->Scan() ***
// ARGUMENTS:
//   -- filename -- input ROOT file
//   -- prompt_low -- IBD trigger, low threshold on prompt event (MeV)
//   -- deltaT_low -- IBD trigger, lower bound on interevent time
//   -- deltaT_high -- IBD trigger, upper bound on interevent time
//   -- delayed_low -- IBD trigger, low threshold on delayed event (MeV)
//   -- graphics_tf -- whether to draw & save plots; defaults to false for batch mode
//   -- nulat_tf -- whether to apply cuts specific to NuLat

#include <math.h>
#include <aTanFull.cxx>

void SEDAQ( const char* filename, Double_t prompt_low, Double_t delayed_low, Double_t deltaT_low, Double_t deltaT_high, Bool_t graphics_tf, Bool_t nulat_tf ) {


//// INIT

// init
gStyle->SetHistLineWidth(2);
gStyle->SetHistLineColor(kBlue);
gStyle->SetOptLogy(true);
Double_t pi = TMath::Pi();
TString FileName, basename, savename;
FileName = filename;
if (FileName.Contains("_T.root")) {
  basename = FileName(0,FileName.Index("_T.root"));
} else if (FileName.Contains(".root")) {
  basename = FileName(0,FileName.Index("_T.root"));
} else {
  cout << endl << "Possible file-type error: SEDAQ operates on the output of $RATROOT/user/root_macros/rt_to_root.cxx. Exiting..." << endl << endl;
  return 2;
}
savename = basename+"_results.root";
TFile f = TFile(savename, "recreate");
Int_t k(0);

// TTree T and T2 -- read/create
TTree* T2 = new TTree("T2","IBD Candidate Data");
TFriendElement* TF = T2->AddFriend("T",filename);
TTree* T = TF->GetTree();

// address T branches
Long64_t num_bursts = T->GetEntries();
Int_t event;
Double_t event_time, wall_time, energy, energy_q, x, y, z;
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T->SetBranchAddress( "event", &event );
T->SetBranchAddress( "event_time", &event_time );
T->SetBranchAddress( "wall_time", &wall_time );
T->SetBranchAddress( "energy", &energy );
T->SetBranchAddress( "energy_q", &energy_q );
T->SetBranchAddress( "x", &x );
T->SetBranchAddress( "y", &y );
T->SetBranchAddress( "z", &z );
T->SetBranchAddress( "event_time_adj", &event_time_adj );
T->SetBranchAddress( "wall_time_adj", &wall_time_adj );
T->SetBranchAddress( "interevent_time", &interevent_time );

// address T2 branches
Int_t prompt_cand_event, delayed_cand_event;
Double_t prompt_cand_t, prompt_cand_eq, delayed_cand_t, delayed_cand_eq;
Double_t prompt_cand_x, prompt_cand_y, prompt_cand_z;
Double_t delayed_cand_x, delayed_cand_y, delayed_cand_z;
Double_t cos_psi; // where psi (ψ) = angle between incoming and reconstructed neutrino momenta
Double_t phi_recon, theta_recon; // angle reconstruction
T2->Branch("prompt_cand_event", &prompt_cand_event, "prompt_cand_event/I");
T2->Branch("delayed_cand_event", &delayed_cand_event, "delayed_cand_event/I");
T2->Branch("prompt_cand_t", &prompt_cand_t, "prompt_cand_t/D");
T2->Branch("prompt_cand_eq", &prompt_cand_eq, "prompt_cand_eq/D");
T2->Branch("delayed_cand_t", &delayed_cand_t, "delayed_cand_t/D");
T2->Branch("delayed_cand_eq", &delayed_cand_eq, "delayed_cand_eq/D");
T2->Branch("interevent_time", &interevent_time, "interevent_time/D");
T2->Branch("prompt_cand_x", &prompt_cand_x, "prompt_cand_x/D");
T2->Branch("prompt_cand_y", &prompt_cand_y, "prompt_cand_y/D");
T2->Branch("prompt_cand_z", &prompt_cand_z, "prompt_cand_z/D");
T2->Branch("delayed_cand_x", &delayed_cand_x, "delayed_cand_x/D");
T2->Branch("delayed_cand_y", &delayed_cand_y, "delayed_cand_y/D");
T2->Branch("delayed_cand_z", &delayed_cand_z, "delayed_cand_z/D");
T2->Branch("cos_psi", &cos_psi, "cos_psi/D");
T2->Branch("phi_recon", &phi_recon, "phi_recon/D");
T2->Branch("theta_recon", &theta_recon, "theta_recon/D");

// Copy total number of top-level MC events from T to T2
// -- NOTE: this method is not especially robust;
//      anyone anyone using the TTree's UserInfo for anything else
//      will have to modify
TList* Tuser = T->GetUserInfo();
TList* T2user = T2->GetUserInfo();
TObjString* nMCEvents_tos1 = (TObjString*)Tuser->At(0);
TString nMCEvents_ts = nMCEvents_tos1->GetString();
//cout << endl << nMCEvents_ts.Data() << endl; //debug
TObjString* nMCEvents_tos2 = new TObjString(nMCEvents_ts.Data());
T2user->Add(nMCEvents_tos2);
T2user->Write();

//// T PLOTS

if ( graphics_tf == true ) { // skip graphics unless in batch mode (default)

  //// PREPARE PLOTS

  // interevent times
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
  TH1D* h1 = new TH1D("h1", "Time Between Bursts (Interevent Time)", nBinsEBP, xbinsEBP );
  h1->SetLineColor(kRed);
  TAxis* h1x = h1->GetXaxis();
  h1x->SetTitle("Interevent Time(s)");
  TAxis* h1y = h1->GetYaxis();
  h1y->SetTitle("Entries");

  // energy vs. deltaT:
  // again, log-binning courtesy mfb:
  const Int_t nBinsEBP = 100;
  Double_t ymin = 1.e-3; //s
  Double_t ymax = 1.e3; //s
  Double_t logymin = TMath::Log10(ymin);
  Double_t logymax = TMath::Log10(ymax);
  Double_t binwidth = (logymax-logymin)/nBinsEBP;
  Double_t ybinsEBP[nBinsEBP+1];
  ybinsEBP[0] = ymin;
  for ((m=1;m<=nBinsEBP;m++)) {
  ybinsEBP[m] = TMath::Power(10,logymin+m*binwidth);
  }
  //now ready to create the histogram:
  TH2D* h2 = new TH2D("h2", "Quenched Energy vs. Interevent Time", nBinsEBP, xbinsEBP, nBinsEBP, ybinsEBP );
  TAxis* h2x = h2->GetXaxis();
  TAxis* h2y = h2->GetYaxis();
  h2x->SetTitle("Interevent Time (s)");
  h2y->SetTitle("Energy_Q (MeV)");

  // 1D histogram of energies and quenched energies
  TH1D* h3 = new TH1D("h3", "Burst Energy", nBinsEBP, ybinsEBP );
  TH1D* h4 = new TH1D("h4", "Quenched Burst Energy", nBinsEBP, ybinsEBP );
  TAxis* h3x = h3->GetXaxis();
  TAxis* h4x = h4->GetXaxis();
  h3x->SetTitle("Burst Energy (MeV), BLUE=Pure, RED=Quenched");
  h3->SetLineColor(kBlue);
  h4->SetLineColor(kRed);

  // 2D histogram of *unquenched* energies and deltaT's:
  TH2D* h5 = new TH2D("h5", "Unquenched Energy vs. Interevent Time", nBinsEBP, xbinsEBP, nBinsEBP, ybinsEBP );
  TAxis* h5x = h5->GetXaxis();
  TAxis* h5y = h5->GetYaxis();
  h5x->SetTitle("Interevent Time (s)");
  h5y->SetTitle("Energy_Q (MeV)");


  //// FILL AND DRAW PLOTS

  // fill all histograms:
  for (( k=0; k < num_bursts; k++ )) {
  T->GetEntry(k);
  if ( energy_q > 0 ) {
    h1->Fill(interevent_time);
    h2->Fill(interevent_time, energy_q); // time in s, energy in MeV
    h3->Fill(energy);
    h4->Fill(energy_q);
    h5->Fill(interevent_time, energy);
    }
  }

  // draw all histograms:
  TCanvas* c1 = new TCanvas("c1",filename, 70, 60, 1500, 800);
  c1->Divide(2,2);
  c1->cd(1);
  h1->Draw();
  c1_1->SetLogx(1);
  c1->cd(4);
  h2->Draw("colz");
  c1_4->SetLogx(1);
  c1_4->SetLogz(1);
  c1->cd(3);
  h3->Draw();
  h4->Draw("same");
  c1_3->SetLogx(1);
  c1->cd(2);
  h5->Draw("colz");
  c1_2->SetLogx(1);
  c1_2->SetLogz(1);
  // save plot
  c1->Write();
  TString savename1;
  savename1 = basename+"_bursts.png";
  c1->SaveAs(savename1);
  c1->Close();

} //end if -- graphics_tf for T plots


//// NEUTRINO TRIGGER

// init
Bool_t prompt_tf, delayed_tf;
Double_t deltaX, deltaY, deltaZ, R;
Double_t deltaT_low, deltaT_high, trigger_reset;
//Double_t prompt_low;
Double_t prompt_high, delayed_low, delayed_high;
// for NuLat: address cube-centered positions
Bool_t cubed_tf = ( T->FindBranch("cubed_x") != 0x0 );
if ( cubed_tf ) {
  Double_t cubed_x, cubed_y, cubed_z;
  T->SetBranchAddress("cubed_x", &cubed_x);
  T->SetBranchAddress("cubed_y", &cubed_y);
  T->SetBranchAddress("cubed_z", &cubed_z);
}
// error checking -- nulat option XOR cubed branch
if ( nulat_tf ^ cubed_tf )  cout << "WARNING: Partial but incomplete NuLat parameters found." << endl;

// set cut parameters //thresholds
trigger_reset = 800.e-6;
//deltaT_low = 10.e-6;
//deltaT_high = 100.e-6;
//prompt_low = 0.00;
//prompt_low = 1.00;
prompt_high = 100.;
//delayed_low = 0.00;
//delayed_low = 1.00;
delayed_high = 100.;

// for drawing skymap
Double_t longtd, lattd;
TTree* T_map = new TTree("T_map", "Skymap Angle Transform");
T_map->Branch("longtd", &longtd);
T_map->Branch("lattd", &lattd);

// scan through events for IBD candidates
for (( k = 0; k < num_bursts; k++ )) {

  prompt_tf = false;
  delayed_tf = false;
  T->GetEntry(k);
  // look for prompt:
  if ( interevent_time > trigger_reset & energy_q > prompt_low & energy_q < prompt_high ) {
    prompt_tf = true;
    prompt_cand_event = event;
    prompt_cand_t = wall_time_adj;
    prompt_cand_eq = energy_q;
    // positions: either MC "truth" data (plain x,y,z), or realistic / adjusted values
    if ( cubed_tf ) { // i.e., if NuLat cube-centered values are available
      prompt_cand_x = cubed_x;
      prompt_cand_y = cubed_y;
      prompt_cand_z = cubed_z;
    } else {
      prompt_cand_x = x;
      prompt_cand_y = y;
      prompt_cand_z = z;
    } // end if
    // look for delayed:
    if ( k < num_bursts-1 ) {
      T->GetEntry(k+1);
      if ( interevent_time > deltaT_low & interevent_time < deltaT_high & energy_q > delayed_low & energy_q < delayed_high ) {
        delayed_tf = true;
	delayed_cand_event = event;
	delayed_cand_t = wall_time_adj;
	delayed_cand_eq = energy_q;
	if ( cubed_tf ) { // i.e., if NuLat cube-centered values are available
	  delayed_cand_x = cubed_x;
	  delayed_cand_y = cubed_y;
	  delayed_cand_z = cubed_z;
	} else {
	  delayed_cand_x = x;
	  delayed_cand_y = y;
	  delayed_cand_z = z;
	} //end if
      }
    }
  }

  // if candidate burst pair is found, add burst times and energies and reconstructed angle to tree: //NOTE: phi=arctan(y/x) unless changed manually below
  if ( prompt_tf & delayed_tf ) {
    deltaX = delayed_cand_x - prompt_cand_x;
    deltaY = delayed_cand_y - prompt_cand_y;
    deltaZ = delayed_cand_z - prompt_cand_z;
    R = sqrt( deltaX**2 + deltaY**2 + deltaZ**2 );
    // reverse travel direction to point at neutrino source
    cos_psi = -deltaX / R; // incoming neutrinos are directed along +x
    phi_recon = aTanFull(deltaY, deltaX) * 180/pi ;
    theta_recon = acos( -deltaZ / R ) * 180/pi;
    // transform angles for skymap projection
    if ( phi_recon <= 180 ) {
      longtd = phi_recon;
    } else {
      longtd = phi_recon - 360;
    }
    lattd = theta_recon - 90;
    T_map->Fill();
    // NuLat -- additional cuts
    Double_t cube_half_length = 25.; //mm
    Double_t cube_separation = 1.; //mm
    if ( nulat_tf & cubed_tf ) { // apply NuLat position cuts -- cubes must be adjacent
      if ( abs(delayed_cand_x-prompt_cand_x)<=(2*cube_half_length+cube_separation) & abs(delayed_cand_y-prompt_cand_y)<=(2*cube_half_length+cube_separation) & abs(delayed_cand_z-prompt_cand_z)<=(2*cube_half_length+cube_separation) ) {
        T2->Fill();
      }
    } else { // just fill
    T2->Fill();
    } //endif
  } //endif

} //end event loop

// prepare some summary variables
Long64_t ibd_candidates = T2->GetEntries();
//Long64_t nMCEvents = nMCEvents_tos->GetString()->Atoll(); // convert back to long
Long64_t nMCEvents = 50; //debug
//Double_t ibd_eff = (Double_t)ibd_candidates/nMCEvents;
const char* units = "Time (ns), Energy (MeV)";

// save ibd trigger parameters and result
TTree* T_Trig = new TTree("T_Trig","IBD Trigger Parameters and Total");
T_Trig->Branch("units",units,"units/C");
//T_Trig->Branch("nMCEvents",&nMCEvents,"nMCEvents/L");
T_Trig->Branch("deltaT_low",&deltaT_low,"deltaT_low/D");
T_Trig->Branch("deltaT_high",&deltaT_high,"deltaT_high/D");
T_Trig->Branch("prompt_low",&prompt_low,"prompt_low/D");
T_Trig->Branch("prompt_high",&prompt_high,"prompt_high/D");
T_Trig->Branch("delayed_low",&delayed_low,"delayed_low/D");
T_Trig->Branch("delayed_high",&delayed_high,"delayed_high/D");
T_Trig->Branch("ibd_candidates",&ibd_candidates,"ibd_candidates/L");
//T_Trig->Branch("ibd_eff",&ibd_eff,"ibd_eff/D");
T_Trig->Fill();

// print summary to stdout
cout << endl << "SimpleEnergyDAQ IBD Trigger Summary:" << endl;
T_Trig->Show(0);
cout << endl;


//// PLOT NEUTRINO-CANDIDATE RESULTS

if ( T2->GetEntries() > 0 && graphics_tf==true ) { // skip T2 graphics if there were no IBD triggers or if batch mode is on

  // interevent time bins
  const Int_t nBinsEBP = 100;
  Double_t xmin = 1.e-7; //s
  Double_t xmax = 5.e-4; //s
  Double_t logxmin = TMath::Log10(xmin);
  Double_t logxmax = TMath::Log10(xmax);
  Double_t binwidth = (logxmax-logxmin)/nBinsEBP;
  Double_t xbinsEBP[nBinsEBP+1];
  xbinsEBP[0] = xmin;
  for (Int_t m=1;m<=nBinsEBP;m++) {
   xbinsEBP[m] = TMath::Power(10,logxmin+m*binwidth);
  }

  // energy bins
  const Int_t nBinsEBP = 100;
  Double_t ymin = 1.e-1; //MeV
  Double_t ymax = 1.e2; //MeV
  Double_t logymin = TMath::Log10(ymin);
  Double_t logymax = TMath::Log10(ymax);
  Double_t binwidth = (logymax-logymin)/nBinsEBP;
  Double_t ybinsEBP[nBinsEBP+1];
  ybinsEBP[0] = ymin;
  for ((m=1;m<=nBinsEBP;m++)) {
   ybinsEBP[m] = TMath::Power(10,logymin+m*binwidth);
  }

  // delayed event histogram
  TH2D* h_ibd = new TH2D("h_ibd", "IBD Trigger Results", nBinsEBP, xbinsEBP, nBinsEBP, 0., 10.);
  TAxis* h_ibdx = h_ibd->GetXaxis();
  TAxis* h_ibdy = h_ibd->GetYaxis();
  h_ibdx->SetTitle("Interevent Times (s)");
  h_ibdy->SetTitle("Energies (MeV)");

  // prompt event histogram
  TH2D* h_ibd2 = new TH2D("h_ibd2", "IBD Trigger Results", nBinsEBP, xbinsEBP, nBinsEBP, 0., 10.);
  TAxis* h_ibd2x = h_ibd2->GetXaxis();
  TAxis* h_ibd2y = h_ibd2->GetYaxis();
  TAxis* h_ibd2z = h_ibd2->GetZaxis();
  h_ibd2x->SetTitle("Interevent Time (s)");
  h_ibd2y->SetTitle("Energy (MeV)");
  h_ibd2z->SetTitle("Entries");
  h_ibd2x->SetTitleOffset(1.5);
  h_ibd2y->SetTitleOffset(1.5);

  // fill histograms
  for (( k = 0; k < T2->GetEntries(); k++ )) {
    T2->GetEntry(k);
    h_ibd->Fill(delayed_cand_t-prompt_cand_t, delayed_cand_eq);
    h_ibd2->Fill(xmin, prompt_cand_eq);
  }

  // draw histograms
  TCanvas* c2 = new TCanvas("c2",filename, 70, 60, 1500, 800);
  h_ibd2->Draw("lego3");
  h_ibd->Draw("samelego");
  c2->SetTheta(35);
  c2->SetPhi(265);
  c2->SetLogx(1);
  c2->SetLogy(0);

  // position plot
  Double_t x_abs = 600.;
  // prompt
  TCanvas* c3 = new TCanvas("c3",filename, 70, 60, 800, 800);
  c3->SetLogy(false);
  T2->Draw("prompt_cand_y:prompt_cand_x:prompt_cand_z>>h_prompt"); // recall that RAT-PAC uses "y" for the vertical axis, not "z"
  h_prompt->SetMarkerColor(kRed);
  h_prompt->SetMarkerStyle(4);
  h_prompt->GetXaxis()->SetLimits(-x_abs,x_abs);
  h_prompt->GetYaxis()->SetLimits(-x_abs,x_abs);
  h_prompt->GetZaxis()->SetLimits(-x_abs,x_abs);
  // delayed
  T2->Draw("delayed_cand_y:delayed_cand_x:delayed_cand_z>>h_delayed"); // recall that RAT-PAC uses "y" for the vertical axis, not "z"
  h_delayed->SetMarkerColor(kBlue);
  h_delayed->SetMarkerStyle(5);
  h_delayed->GetXaxis()->SetLimits(-x_abs,x_abs);
  h_delayed->GetYaxis()->SetLimits(-x_abs,x_abs);
  h_delayed->GetZaxis()->SetLimits(-x_abs,x_abs);
  // draw
  h_prompt->Draw();
  h_delayed->Draw("same");

  // save plots
  c2->Write();
  c3->Write();
  TString savename2, savename3;
  savename2 = basename+"_nu-trg.png";
  savename3 = basename+"_pd-xyz.png";
  c2->SaveAs(savename2);
  c3->SaveAs(savename3);
  c2->Close();
  c3->Close();

} //endif -- IBD candidates && no batch mode


//// mostly pau!   )
f.Write();
f.Close();
return;
}


//// OVERLOADING

void SEDAQ ( const char* filename ) {
  SEDAQ( filename, 0., 0., false );
}

void SEDAQ ( const char* filename, bool graphics_tf ) {
  SEDAQ( filename, 0., 0., graphics_tf );
}

void SEDAQ ( const char* filename, Double_t prompt_low ) {
  SEDAQ( filename, prompt_low, 0., false );
}

void SEDAQ ( const char* filename, Bool_t graphics_tf, Bool_t nulat_tf ) {
  SEDAQ( filename, prompt_low, 0., 10.e-6, 100.e-6, graphics_tf, nulat_tf );
}

void SEDAQ ( const char* filename, Double_t prompt_low, Bool_t graphics_tf ) {
  SEDAQ( filename, prompt_low, 0., graphics_tf );
}

void SEDAQ ( const char* filename, Double_t prompt_low, Double_t delayed_low ) {
  SEDAQ( filename, prompt_low, delayed_low, false );
}

void SEDAQ ( const char* filename, Double_t prompt_low, Double_t delayed_low, Bool_t graphics_tf ) {
  SEDAQ( filename, prompt_low, delayed_low, 10.e-6, 100.e-6, graphics_tf );
}

void SEDAQ ( const char* filename, Double_t prompt_low, Double_t delayed_low, Double_t deltaT_high, Bool_t graphics_tf ) {
  SEDAQ( filename, prompt_low, delayed_low, deltaT_low, 100.e-6, graphics_tf );
}

void SEDAQ ( const char* filename, Double_t prompt_low, Double_t delayed_low, Double_t deltaT_low, Double_t deltaT_high, Bool_t graphics_tf ) {
  SEDAQ( filename, prompt_low, delayed_low, deltaT_low, deltaT_high, graphics_tf, false );
}



//// ALL PAU!   )
