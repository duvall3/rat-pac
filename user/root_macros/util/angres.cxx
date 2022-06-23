// angres -- EWISotT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2022 ~ //

void angres( const char* filename ) {
/* { */

// init
TFile *f = TFile::Open(filename, "update");
TObjString *experiment = (TObjString*)gDirectory->Get("experiment");
TString exper = experiment->GetString();
exper.ReplaceAll("\"","");
if (exper.Contains("/")) exper = exper( exper.Last('/')+1, exper.Length()-1 );

// scint system vs nCap
TString fileName(filename);
if (fileName.Contains("_results.root")) {
  TTree *T_r = (TTree*)gDirectory->Get("T_r");
  TString dispVectorName = "r";
  TCut cuts("");
} else if (fileName.Contains("_ncap_res.root")) {
  TTree *T_r = (TTree*)gDirectory->Get("T_ncap");
  TString dispVectorName = "dr_q";
  TCut rcut("dr_q.Mag()>1.0");
  TCut vcut("volCheck==1");
  TCut cuts = rcut+vcut;
} else {
  TString errLoc = "::angres.cxx";
  TString errMsg = "Filetype error: Expecting a scint \"_results.root\" or an nCap \"_ncap_res.root\" file.";
  gROOT->Error(errLoc.Data(), errMsg.Data());
  return;
}
Long64_t N = T_r->GetEntries(cuts);
Double_t l, dp, P;
TVector3 mu;
TCanvas *c_angres = new TCanvas("c_angres", "c_angres");

// detector-specific position resolutions (mm)
// -- yes, this should be a 'switch/case' statement; no, I don't currently care (TString switches are weird)
if ( exper.Contains("chooz") ) { // Double CHOOZ
  P = 150.;
} else if ( exper.Contains("nulat") || exper.Contains("rboard-3d") ) { // NuLat and 3D-Chkbd.
  P = 25.;
} else if ( exper.Contains("santa") ) { // SANTA
  P = (1./3.) * (2.5 + 50. + (1./2.)*(25.+30.));
} else if ( exper.Contains("sandd") || exper.Contains("rboard-2d") ) { // SANDD, 2D-Chkbd.
  P = (1./3.) * (2.5 + 2.5 + 25.);
} else if ( exper.Contains("prospect") ) { // PROSPECT
  P = 150.;
}

// main

// get means
if ( exper.Contains("chooz") ) { // Double CHOOZ
  T_r->Draw("r.fX>>hx", "abs(r.fX)<500."); // DC ONLY
  T_r->Draw("r.fY>>hy", "abs(r.fY)<500."); // DC ONLY
  T_r->Draw("r.fZ>>hz", "abs(r.fZ)<500."); // DC ONLY
} else {
  /* T_r->Draw("r.fX>>hx"); */
  /* T_r->Draw("r.fY>>hy"); */
  /* T_r->Draw("r.fZ>>hz"); */
  T_r->Draw(dispVectorName+".fX>>hx", cuts);
  T_r->Draw(dispVectorName+".fY>>hy", cuts);
  T_r->Draw(dispVectorName+".fZ>>hz", cuts);
}
c_angres->Close();
mu.SetXYZ(hx->GetMean(), hy->GetMean(), hz->GetMean());

// calculate angular resolution via (Delta phi)_{1#sigma} = #arctan( (P/l) / #sqrt{N} )
/* l = sqrt( lx**2 + ly**2 + lz**2 ); */
l = mu.Mag();
dp = TMath::ATan( (P/l) / sqrt(N) ) * TMath::RadToDeg();

// report and save results
// result
TVectorD deltaPhi(1);
deltaPhi[0] = dp;
deltaPhi.Write("deltaPhi");
// details
/* printf( "\nExperiment = %s\nFilename = %s\nN = %d\nP = %e\nl = %e\nDeltaPhi = %3.4f deg\n\n", exper.Data(), gFile->GetName(), N, P, l, dp ); */
TString deltaPhiReportStr;
deltaPhiReportStr.Form( "\n\nExperiment = %s\nFilename = %s\nN = %d\nP = %e\nl = %e\nDeltaPhi_{1sigma} = %3.4f deg,\n\t from DeltaPhi_{1sigma} = arctan( (P/l) / sqrt(N) )\n\n", exper.Data(), gFile->GetName(), N, P, l, dp );
printf( "%s\n", deltaPhiReportStr.Data() );
TObjString *deltaPhiReport = new TObjString(deltaPhiReportStr);
deltaPhiReport->Write("deltaPhiReport");
f->Close();

// all pau!   )
}
