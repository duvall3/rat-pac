{

// prepare directory list
TString angleDirname, phiStr, ncapName;
Double_t phi;
TList *angleDirs = listFiles("OFFAXIS_.*");
TIter iD(angleDirs);
TSystemDirectory *sDir;

// process angle directories
TRegexp phiPat("..deg");
Int_t phiIndex;
for ( iD = angleDirs->begin(); iD != angleDirs->end(); ++iD ) {
  sDir = (TSystemDirectory*)*iD;
  angleDirname = sDir->GetName();
  gSystem->cd(angleDirname.Data());
  ncapName = angleDirname+"_ncap.root";
  phiStr = angleDirname;
  phiStr.ToLower();
  phiIndex = phiStr.Index(phiPat);
  phiStr = phiStr(phiIndex, 2);
  phi = phiStr.Atof();
  printf("dir: %s\tphi: %f\n", angleDirname.Data(), phi); //debug
  // MAIN
  gInterpreter->ExecuteMacro("reproc.cxx");
  gSystem->Exec("chain_ncap.sh");
  neutronCapturesFinal( ncapName.Data(), phi );
  gSystem->cd("..");
}

// all pau!   )
}
