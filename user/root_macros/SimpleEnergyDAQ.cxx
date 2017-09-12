// SimpleEnergyDAQ -- re-formulation & continuation of original SimpleEnergyDAQ
// -- see header comments in SimpleEnergyDAQ_old for documentation
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/17 ~ //

#include <math.h>

void SimpleEnergyDAQ( const char* filename ) {


//// INIT AND FILL

// init
gStyle->SetHistLineWidth(2);
gStyle->SetHistLineColor(kBlue);
gStyle->SetOptLogy(true);
Int_t k(0);

// create tree, read ASCII data, set branch addresses
TTree* T = new TTree("T","T");
T->ReadFile( filename, "event/I:event_time/D:wall_time/D:energy/D:energy_q/D" );
Long64_t num_bursts = T->GetEntries();
Int_t event;
Double_t event_time, wall_time, energy, energy_q;
T->SetBranchAddress( "event", &event );
T->SetBranchAddress( "event_time", &event_time );
T->SetBranchAddress( "wall_time", &wall_time );
T->SetBranchAddress( "energy", &energy );
T->SetBranchAddress( "energy_q", &energy_q );

// create and address new branches 
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T->GetEntry(0);
run_start = event_time;
T->Branch("event_time_adj", &event_time_adj, "event_time_adj/D");
T->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
T->Branch("interevent_time", &interevent_time, "interevent_time/D");

// fill new branches
Double_t time_current, time_prev;
// times aligned to run start
for (( k = 0; k < num_bursts; k++ )) {
  T->GetEntry(k);
  event_time_adj = event_time - run_start;
  wall_time_adj = wall_time - run_start;
  T->GetBranch("event_time_adj")->Fill();
  T->GetBranch("wall_time_adj")->Fill();
  // interevent times
  if ( k == 0 ) { 
    interevent_time = 0;
  } else {
    time_current = wall_time;
    T->GetEntry(k-1);
    time_prev = wall_time;
    T->GetEntry(k);
    interevent_time = time_current - time_prev;
  }
  T->GetBranch("interevent_time")->Fill();
}


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
h2x->SetTitle("Interevent Time (s)");
TAxis* h2y = h2->GetYaxis();
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
h5x->SetTitle("Interevent Time (s)");
TAxis* h5y = h5->GetYaxis();
h5y->SetTitle("Energy_Q (MeV)");


//// FILL AND DRAW PLOTS

// fill all histograms:
for (( k=0; k < num_bursts; k++ )) {
  T->GetEntry(k);
  h1->Fill(interevent_time);
  h2->Fill(interevent_time, energy_q); // time in s, energy in MeV
  h3->Fill(energy);
  h4->Fill(energy_q);
  h5->Fill(interevent_time, energy);
}

// draw all histograms:
TCanvas* c1 = new TCanvas("c1","c1");
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
//TPaveStats* ps5 = h5->GetListOfFunctions()->FindObject("stats");
//ps5->SetX1NDC(ps5->GetX1NDC()-.05);
//ps5->SetX2NDC(ps5->GetX2NDC()-.05);
c1_2->SetLogx(1);
c1_2->SetLogz(1);


//// NEUTRINO TRIGGER

// Prepare new ROOT tree for IBD trigger output:
TTree* T2 = new TTree("T2","T2");
Bool_t prompt_tf, delayed_tf;
Double_t deltaT_low, deltaT_high, trigger_reset;
Double_t prompt_low, prompt_high, delayed_low, delayed_high;
Double_t prompt_cand_t, prompt_cand_eq, delayed_cand_t, delayed_cand_eq;
T2->Branch("prompt_cand_t", &prompt_cand_t, "prompt_cand_t/D");
T2->Branch("prompt_cand_eq", &prompt_cand_eq, "prompt_cand_eq/D");
T2->Branch("delayed_cand_t", &delayed_cand_t, "delayed_cand_t/D");
T2->Branch("delayed_cand_eq", &delayed_cand_eq, "delayed_cand_eq/D");

// set cut parameters
trigger_reset = 800.e-6;
deltaT_low = 100.e-9;
deltaT_high = 400.e-6;
prompt_low = 0.00;
//prompt_low = 1.00;
prompt_high = 100.;
delayed_low = 0.00;
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
    // look for delayed:
    if ( k < num_bursts-1 ) {
      T->GetEntry(k+1);
      if ( interevent_time > deltaT_low & interevent_time < deltaT_high & energy_q > delayed_low & energy_q < delayed_high ) {
        delayed_tf = true;
	delayed_cand_t = wall_time_adj;
	delayed_cand_eq = energy_q;
      }
    }
  }
  // if candidate burst pair is found, increment IBD candidate counter and add burst times and energies to tree:
  if ( prompt_tf & delayed_tf ) {
    T2->Fill();
  }
} //end event loop
cout << endl << "IBD Candidates: " << T2->GetEntries() << endl << endl;


// PLOT NEUTRINO-CANDIDATE RESULTS

// interevent times
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
TH1D* h6 = new TH1D("h6", "Interevent Time (s)", nBinsEBP, xbinsEBP);
h6->SetLineColor(kRed);
TAxis* h6x = h6->GetXaxis();
h6x->SetTitle("Interevent Time (s)");
TAxis* h6y = h6->GetYaxis();
h6y->SetTitle("Entries");

// energies
const Int_t nBinsEBP = 100;
Double_t ymin = 1.e-1; //s
Double_t ymax = 1.e2; //s
Double_t logymin = TMath::Log10(ymin);
Double_t logymax = TMath::Log10(ymax);
Double_t binwidth = (logymax-logymin)/nBinsEBP;
Double_t ybinsEBP[nBinsEBP+1];
ybinsEBP[0] = ymin;
for ((m=1;m<=nBinsEBP;m++)) {
 ybinsEBP[m] = TMath::Power(10,logymin+m*binwidth);
}
// prompt
TH1D* h7 = new TH1D("h7", "Prompt & Delayed Energies (MeV)", nBinsEBP, ybinsEBP);
h7->SetLineColor(kRed);
TAxis* h7x = h7->GetXaxis();
h7x->SetTitle("Energy (MeV)");
TAxis* h7y = h7->GetYaxis();
h7y->SetTitle("Entries");
// delayed
TH1D* h8 = new TH1D("h8", "", nBinsEBP, ybinsEBP);

// or maybe just both?
// delayed
TH2D* h_ibd = new TH2D("h_ibd", "IBD Trigger Results", nBinsEBP, xbinsEBP, nBinsEBP, 0., 10.);
TAxis* h_ibdx = h_ibd->GetXaxis();
h_ibdx->SetTitle("Interevent Times (s)");
TAxis* h_ibdy = h_ibd->GetYaxis();
h_ibdy->SetTitle("Energies (MeV)");
// prompt
TH2D* h_ibd2 = new TH2D("h_ibd2", "IBD Trigger Results", nBinsEBP, xbinsEBP, nBinsEBP, 0., 10.);
TAxis* h_ibd2x = h_ibd2->GetXaxis();
TAxis* h_ibd2y = h_ibd2->GetYaxis();
TAxis* h_ibd2z = h_ibd2->GetZaxis();
h_ibd2x->SetTitle("Interevent Time (s)");
h_ibd2y->SetTitle("Energy (MeV)");
h_ibd2z->SetTitle("Entries");
h_ibd2x->SetTitleOffset(1.5);
h_ibd2y->SetTitleOffset(1.5);

// fill
for (( k = 0; k < T2->GetEntries(); k++ )) {
  T2->GetEntry(k);
//h6->Fill(delayed_cand_t-prompt_cand_t);
//h7->Fill(prompt_cand_eq);
//h8->Fill(delayed_cand_eq);
  h_ibd->Fill(delayed_cand_t-prompt_cand_t, delayed_cand_eq);
  h_ibd2->Fill(1e-7, prompt_cand_eq);
}

// draw
TCanvas* c2 = new TCanvas("c2","c2");
h_ibd2->Draw("lego3");
h_ibd->Draw("samelego");
c2->SetLogx(1);
c2->SetLogy(0);
//c2->Divide(1,2);
//c2_1->cd();
//h6->Draw();
//c2_1->SetLogx(1);
//c2_2->cd();
//h7->Draw();
//h8->Draw("same");
//c2_2->SetLogx(1);


// all pau!   )
return;
}
