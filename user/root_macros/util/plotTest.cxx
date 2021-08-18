// plotTest.cxx -- quick macro to test graphics

void plotTest() {

TH2D* h = new TH2D("h", "h", 25, -5., 5., 25, -5., 5.);
Int_t k(0), N(10000);
Double_t m1(1.), s1(1.), m2(0.7), s2(2.5);
for ( k=0; k<N; k++ ) h->Fill( gRandom->Gaus(m1,s1), gRandom->Gaus(m2,s2) );
TCanvas* c = new TCanvas("c", "c");
h->Draw("surf3z");

// all pau!   )
return;
}
