// SEDAQ -- modified version of SimpleEnergyDAQ to operate on files that already contain T but not T2
// -- see documentation in duvall3->comparision->$RATROOT/user/root_macros/SimpleEnergyDAQ.cxx
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //

// INPUT: ROOT file containing T -- scintillation energy deposits
// OUTPUT: ROOT file containing T2 -- SimpleEnergyDAQ results
// ARGS:
//   -- prompt_low -- IBD trigger, low threshold on prompt event (MeV)
//   -- graphics_tf -- whether to draw & save plots; defaults to false for batch mode

#include <math.h>

void SEDAQ( const char* filename, Double_t prompt_low=0, Double_t delayed_low, bool graphics_tf=false ) {


//// INIT

// init
gStyle->SetHistLineWidth(2);
gStyle->SetHistLineColor(kBlue);
gStyle->SetOptLogy(true);
TString FileName, basename, savename;
FileName = filename;
if (FileName.Contains("_T.root")) {
  basename = FileName(0,FileName.Index("_T.root"));
} else if (FileName.Contains(".root")) {
  basename = FileName(0,FileName.Index("_T.root"));
} else {
  cout << endl << "Possible error: Check file type. Exiting..." << endl << endl;
  return 2;
}
savename = basename+"_results.root";
TFile f = TFile(savename, "recreate");
Int_t k(0);

// TTree T and T2 -- read/create
TTree* T2 = new TTree("T2","T2");
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
Double_t prompt_cand_t, prompt_cand_eq, delayed_cand_t, delayed_cand_eq;
Double_t prompt_cand_x, prompt_cand_y, prompt_cand_z;
Double_t delayed_cand_x, delayed_cand_y, delayed_cand_z;
T2->Branch("prompt_cand_t", &prompt_cand_t, "prompt_cand_t/D");
T2->Branch("prompt_cand_eq", &prompt_cand_eq, "prompt_cand_eq/D");
T2->Branch("delayed_cand_t", &delayed_cand_t, "delayed_cand_t/D");
T2->Branch("delayed_cand_eq", &delayed_cand_eq, "delayed_cand_eq/D");
T2->Branch("prompt_cand_x", &prompt_cand_x, "prompt_cand_x/D");
T2->Branch("prompt_cand_y", &prompt_cand_y, "prompt_cand_y/D");
T2->Branch("prompt_cand_z", &prompt_cand_z, "prompt_cand_z/D");
T2->Branch("delayed_cand_x", &delayed_cand_x, "delayed_cand_x/D");
T2->Branch("delayed_cand_y", &delayed_cand_y, "delayed_cand_y/D");
T2->Branch("delayed_cand_z", &delayed_cand_z, "delayed_cand_z/D");


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
Double_t deltaT_low, deltaT_high, trigger_reset;
//Double_t prompt_low, prompt_high, delayed_low, delayed_high;
Double_t prompt_high, delayed_low, delayed_high;

// set cut parameters //thresholds
trigger_reset = 800.e-6;
deltaT_low = 100.e-9;
deltaT_high = 400.e-6;
//prompt_low = 0.00;
//prompt_low = 1.00;
prompt_high = 100.;
//delayed_low = 0.00;
//delayed_low = 1.00;
delayed_high = 100.;

// scan through events for IBD candidates
for (( k = 0; k < num_bursts; k++ )) {
  prompt_tf = false;
  delayed_tf = false;
  T->GetEntry(k);
  // look for prompt:
  if ( interevent_time > trigger_reset & energy_q > prompt_low & energy_q < prompt_high ) {
    prompt_tf = true;
    prompt_cand_t = wall_time_adj;
    prompt_cand_eq = energy_q;
    prompt_cand_x = x;
    prompt_cand_y = y;
    prompt_cand_z = z;
    // look for delayed:
    if ( k < num_bursts-1 ) {
      T->GetEntry(k+1);
      if ( interevent_time > deltaT_low & interevent_time < deltaT_high & energy_q > delayed_low & energy_q < delayed_high ) {
        delayed_tf = true;
	delayed_cand_t = wall_time_adj;
	delayed_cand_eq = energy_q;
	delayed_cand_x = x;
	delayed_cand_y = y;
	delayed_cand_z = z;
      }
    }
  }
  // if candidate burst pair is found, add burst times and energies to tree:
  if ( prompt_tf & delayed_tf ) {
    T2->Fill();
  }
} //end event loop
cout << endl << "IBD Candidates: " << T2->GetEntries() << endl << endl;



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
  // prompt
  TCanvas* c3 = new TCanvas("c3",filename, 70, 60, 800, 800);
  c3->SetLogy(false);
  T2->Draw("prompt_cand_x:prompt_cand_z:prompt_cand_y>>h_prompt"); // recall that RAT-PAC uses "y" for the vertical axis, not "z"
  h_prompt->SetMarkerColor(kRed);
  h_prompt->SetMarkerStyle(4);
  h_prompt->GetXaxis()->SetLimits(-600,600);
  h_prompt->GetYaxis()->SetLimits(-600,600);
  h_prompt->GetZaxis()->SetLimits(-600,600);
  // delayed
  T2->Draw("delayed_cand_x:delayed_cand_y:delayed_cand_z>>h_delayed","","same");
  h_delayed->SetMarkerColor(kBlue);
  h_delayed->SetMarkerStyle(5);
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

void SEDAQ ( const char* filename, bool graphics_tf=false ) {
  SEDAQ( filename, 0., 0., graphics_tf );
}

void SEDAQ ( const char* filename, Double_t prompt_low ) {
  SEDAQ( filename, prompt_low, , 0., false );
}

void SEDAQ( const char* filename, Double_t prompt_low, Bool_t graphics_tf ) {
  SEDAQ( filename, prompt_low, 0., graphics_tf );
}

void SEDAQ ( const char* filename, Double_t prompt_low, Double_t delayed_low ) {
  SEDAQ( filename, prompt_low, delayed_low, false );
}

//// ALL PAU!   )
