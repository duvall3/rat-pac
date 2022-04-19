// 1stScatterComparison.cxx -- macro to prepare histograms relating to
//   neutron displacement(s) at first scatter
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 04/2022 ~ //

{

// open files and prepare list
TFile *f0 = TFile::Open("../checkerboard-3d/COMPMAIN_CHECKERBOARD-3D_10K/COMPMAIN_CHECKERBOARD-3D_10K_3/COMPMAIN_CHECKERBOARD-3D_10K_3/COMPMAIN_CHECKERBOARD-3D_10K_3.root");
TFile *f1 = TFile::Open("../checkerboard-2d/COMPMAIN_CHECKERBOARD-2D_10K/COMPMAIN_CHECKERBOARD-2D_10K_3/COMPMAIN_CHECKERBOARD-2D_10K_3/COMPMAIN_CHECKERBOARD-2D_10K_3.root");
TFile *f2 = TFile::Open("../sandd/COMPMAIN_SANDD_10K/COMPMAIN_SANDD_10K_3/COMPMAIN_SANDD_10K_3/COMPMAIN_SANDD_10K_3.root");
TFile *f3 = TFile::Open("../chooz/COMPMAIN_CHOOZ_10k/COMPMAIN_CHOOZ_10k_3/COMPMAIN_CHOOZ_10k_3/COMPMAIN_CHOOZ_10k_3.root");
TFile *f4 = TFile::Open("../nulat5/COMPMAIN_NULAT5_10K/COMPMAIN_NULAT5_10K_3/COMPMAIN_NULAT5_10K_3/COMPMAIN_NULAT5_10K_3.root");
TFile *f5 = TFile::Open("../nulat/COMPMAIN_NULAT_10K/COMPMAIN_NULAT_10K_3/COMPMAIN_NULAT_10K_3/COMPMAIN_NULAT_10K_3.root");
TList *fileList = new TList;
fileList->Add(f0); // 3D Checkerboard
/* fileList->Add(f1); // 2D Checkerboard */
/* fileList->Add(f2); // SANDD */
/* fileList->Add(f3); // CHOOZ */
/* fileList->Add(f4); // NuLat-5 */
/* fileList->Add(f5); // NuLat-3 */

// other init
gStyle->SetHistLineWidth(3.);
TCanvas *can = new TCanvas("can", "1st-Scatter Comparison");
can->SetLogy(kTRUE);
TRegexp targetRE("target.*"); // will match "target_{cell,array,cube,etc.}"
/* TH1D *hdr = new TH1D; */
TFile *f;
TIter i(fileList);
TList *hList = new TList;

// MAIN -- QDV
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




// all pau!   )

}
