// 1stScatterComparison.cxx -- macro to prepare histograms relating to
//   neutron displacement(s) at first scatter
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 04/2022 ~ //

{

// open files and prepare list
TList *fileList = new TList;
TFile *f0 = TFile::Open("../checkerboard-3d/COMPMAIN_CHECKERBOARD-3D_10K/COMPMAIN_CHECKERBOARD-3D_10K_3/COMPMAIN_CHECKERBOARD-3D_10K_3/COMPMAIN_CHECKERBOARD-3D_10K_3.root"); fileList->Add(f0);
TFile *f1 = TFile::Open("../checkerboard-2d/COMPMAIN_CHECKERBOARD-2D_10K/COMPMAIN_CHECKERBOARD-2D_10K_3/COMPMAIN_CHECKERBOARD-2D_10K_3/COMPMAIN_CHECKERBOARD-2D_10K_3.root"); fileList->Add(f1);
TFile *f2 = TFile::Open("../sandd/COMPMAIN_SANDD_10K/COMPMAIN_SANDD_10K_3/COMPMAIN_SANDD_10K_3/COMPMAIN_SANDD_10K_3.root"); fileList->Add(f2);
TFile *f3 = TFile::Open("../chooz/COMPMAIN_CHOOZ_10k/COMPMAIN_CHOOZ_10k_3/COMPMAIN_CHOOZ_10k_3/COMPMAIN_CHOOZ_10k_3.root"); fileList->Add(f3);
TFile *f4 = TFile::Open("../nulat5/COMPMAIN_NULAT5_10K/COMPMAIN_NULAT5_10K_3/COMPMAIN_NULAT5_10K_3/COMPMAIN_NULAT5_10K_3.root"); fileList->Add(f4);
TFile *f5 = TFile::Open("../nulat/COMPMAIN_NULAT_10K/COMPMAIN_NULAT_10K_3/COMPMAIN_NULAT_10K_3/COMPMAIN_NULAT_10K_3.root"); fileList->Add(f5);
/* fileList->Add(f0); // 3D Checkerboard */
/* fileList->Add(f1); // 2D Checkerboard */
/* fileList->Add(f2); // SANDD */
/* fileList->Add(f3); // CHOOZ */
/* fileList->Add(f4); // NuLat-5 */
/* fileList->Add(f5); // NuLat-3 */

// other init
gStyle->SetHistLineWidth(3.);
TCanvas *can = new TCanvas("can", "1st-Scatter Comparison");
can->SetLogy(kTRUE);
can->SetLogx(kTRUE);
TRegexp targetRE("target.*"); // will match "target_{cell,array,cube,etc.}"
/* TH1D *hdr = new TH1D; */
TFile *f;
/* TIter i(fileList); */
TList *hList = new TList;
Int_t k(0);
Color_t colors[6] = {4, 3, 7, 11, 2, 1};
TLegend *leg = new TLegend;
leg->SetX1NDC(0.80);
leg->SetX2NDC(0.98);
leg->SetY1NDC(0.65);
leg->SetY2NDC(0.80);

// MAIN 1 (QDV)
for ( i = fileList->begin(); i != fileList->end(); ++i ) {
  f = (TFile*)*i;
  f->cd();
  printf( "Processing file \"%s\"...\n", gFile->GetName() );
  /* printf("%s\n", gFile->GetName()); // check */
  scatteringPositions(gFile->GetName());
  /* T_sp->Draw("x1.Mag()", "v1.Contains(targetRE)", "same"); */
  /* T_sp->Draw("x1.Mag()>>hdr", "", "same"); */
  /* T_sp->Draw("x1.X()", "", "same"); */
  /* T_sp->Show(5); */
  /* hList->Add(hdr); */
  printf( "Finished (%d events).\n\n", T_sp->GetEntries() );
}

// fine, whatever, no loop

// chk3
f0->cd();
can->cd();
T_sp->Draw("x1.Mag()>>h0", "v1.Contains(targetRE)");
h0->SetLineColor(colors[0]);
leg->AddEntry(h0, "3D Chkbd.");

// nulat-5
f4->cd();
can->Clear();
T_sp->Draw("x1.Mag()>>h4", "v1.Contains(targetRE)");
h4->SetLineColor(colors[4]);
leg->AddEntry(h4, "NuLat 5^3");

/* // chk3 */
/* f0->cd(); */
/* can->cd(); */
/* T_sp->Draw("x1.Mag()>>h0", "v1.Contains(targetRE)"); */
/* h0->SetLineColor(colors[0]); */
/* leg->AddEntry(h0, "3D Chkbd."); */


// finish and draw
can->Clear();
f0->cd();
h0->Draw();
TH1F* h4 = (TH1F*)gROOT->FindObjectAnyFile("h4");
h4->Draw("same");
leg->Draw();
h0->SetTitle("Neutron Total Displacement at 1 Scatter");
h0->GetXaxis()->SetTitle("||#vec{#Deltar}|| (mm)");
h0->GetXaxis()->SetTitleOffset(1.1);
h0->GetYaxis()->SetTitle("Entries");

// all pau!   )

}
