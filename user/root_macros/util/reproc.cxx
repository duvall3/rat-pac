{

// prepare directory list
TList *dirs = listFiles("OFFAXIS_.*");
TIter i(dirs);
TSystemFile *sf;
TSystemDirectory *sd;
for ( i = dirs->begin(); i != dirs->end(); ++i ) {
  sf = (TSystemFile*)*i;
  if (! sf->IsDirectory()) dirs->Remove(sf);
}

// process files
TString dirname, filename;
for ( i = dirs->begin(); i != dirs->end(); ++i ) {
  sd = (TSystemDirectory*)*i;
  dirname.Form(sd->GetName());
  filename = dirname+".root";
  gSystem->cd(dirname.Data());
  gSystem->cd(dirname.Data());
  cout << "Processing " << filename.Data() << "..." << endl;
  neutronCaptures(filename.Data());
  gSystem->cd("../..");
}

}
