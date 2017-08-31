// SimpleEnergyDAQ2 -- re-formulation & continuation of original SimpleEnergyDAQ
// -- see header comments in SimpleEnergyDAQ_old for documentation
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/17 ~ //

#include <vector>
#include <cstdlib>
#include <math.h>

void SimpleEnergyDAQ2( const char* filename ) {


// init
gStyle->SetHistLineWidth(2);
gStyle->SetHistLineColor(kBlue);
gStyle->SetOptLogy(true);
Int_t k(0);


// create tree, read ASCII data, set branch addresses
TTree* T = new TTree("T","T");
T->ReadFile( filename, "event/I:event_time/D:wall_time/D:energy/D:energy_q/D" );
Long64_t num_events = T->GetEntries();
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
for (( k = 0; k < num_events; k++ )) {
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
h1->SetLineWidth(2);
h1->SetLineColor(kRed);
TAxis* h1x = h1->GetXaxis();
h1x->SetTitle("Interevent Time(s)");
TAxis* h1y = h1->GetYaxis();
h1y->SetTitle("Entries");

// fill and draw histogram:
for (( k = 1; k < num_events; k++ ))  { T->GetEntry(k); h1->Fill(interevent_time); }
TCanvas* c1 = new TCanvas("c1","c1");
h1->Draw();
c1->SetLogx(1);

// try plotting vs. energy: //FIXME later
const Int_t nBinsEBP = 100;
Double_t ymin = 1.e-3; //s
Double_t ymay = 1.e3; //s
Double_t logymin = TMath::Log10(ymin);
Double_t logymay = TMath::Log10(ymay);
Double_t binwidth = (logymay-logymin)/nBinsEBP;
Double_t ybinsEBP[nBinsEBP+1];
ybinsEBP[0] = ymin;
for ((m=1;m<=nBinsEBP;m++)) {
 ybinsEBP[m] = TMath::Power(10,logymin+m*binwidth);
}

//now ready to create the histogram:
TH2D* h2 = new TH2D("h2", "Quenched Energy vs. Interevent Time", nBinsEBP, xbinsEBP, nBinsEBP, ybinsEBP );
h2->SetLineWidth(2);
//h2->SetLineColor(kRed);
TAxis* h2x = h2->GetXaxis();
h2x->SetTitle("Interevent Time (s)");
TAxis* h2y = h2->GetYaxis();
h2y->SetTitle("Energy_Q (MeV)");

// fill and draw histogram:
for (( k=0; k < num_events; k++ )) {
  T->GetEntry(k);
  h2->Fill(interevent_time, energy_q); // time in s, energy in MeV
}
TCanvas* c2 = new TCanvas("c2","c2");
h2->Draw("colz");
c2->SetLogx(1);
c2->SetLogy(1);
c2->SetLogz(1);

// 1D histogram of energies and quenched energies
TH1D* h3 = new TH1D("h3", "Burst Energy", nBinsEBP, xbinsEBP );
TH1D* h4 = new TH1D("h4", "Quenched Burst Energy", nBinsEBP, xbinsEBP );
TAxis* h3x = h3->GetXaxis();
TAxis* h4x = h4->GetXaxis();
h3x->SetTitle("Burst Energy (MeV), RED=Pure, BLUE=Quenched");
h3->SetLineColor(kBlue);
h4->SetLineColor(kRed);

// fill and draw energy histos
for (( k=0; k < num_events; k++ )) {
  T->GetEntry(k);
  h3->Fill(energy);
  h4->Fill(energy_q);
}
TCanvas* c3 = new TCanvas("c3","c3");
h3->Draw();
h4->Draw("same");
c3->SetLogx(1);
c3->SetLogy(1);

//count IBD candidates
Long64_t ibds;
for (( k = 0; k < num_events; k++ )) {
  T->GetEntry(k);
  if ( interevent_time > 1e-7  &  interevent_time < 4e-4 )  ibds++;
//if ( interevent_time > dt_low  &  interevent_time < dt_high )  ibds++;
}
cout << endl << "IBD Candidates: " << ibds << endl << endl;

// all pau!   )
return;
}
