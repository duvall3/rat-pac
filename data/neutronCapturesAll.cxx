{

// init
TList *dirList = new TList, *nCapFiles = new TList;
TSystemFile *f;
TString dirName, phiStr;
Double_t phi;

TSystemDirectory *dir0  = new TSystemDirectory;
TSystemDirectory *dir1  = new TSystemDirectory;
TSystemDirectory *dir2  = new TSystemDirectory;
TSystemDirectory *dir3  = new TSystemDirectory;
TSystemDirectory *dir4  = new TSystemDirectory;
TSystemDirectory *dir5  = new TSystemDirectory;
TSystemDirectory *dir6  = new TSystemDirectory;
TSystemDirectory *dir7  = new TSystemDirectory;
TSystemDirectory *dir8  = new TSystemDirectory;
TSystemDirectory *dir9  = new TSystemDirectory;
TSystemDirectory *dir10 = new TSystemDirectory;
TSystemDirectory *dir11 = new TSystemDirectory;
TSystemDirectory *dir12 = new TSystemDirectory;
TSystemDirectory *dir13 = new TSystemDirectory;
TSystemDirectory *dir14 = new TSystemDirectory;
TSystemDirectory *dir15 = new TSystemDirectory;
dir0->SetDirectory( "/home/mark/rat-pac/data/nulat5/OFFAXIS/00DEG");    dirList->Add(dir0);
dir1->SetDirectory( "/home/mark/rat-pac/data/nulat5/OFFAXIS/15DEG");    dirList->Add(dir1);
dir2->SetDirectory( "/home/mark/rat-pac/data/nulat5/OFFAXIS/30DEG");    dirList->Add(dir2);
dir3->SetDirectory( "/home/mark/rat-pac/data/nulat5/OFFAXIS/45DEG");    dirList->Add(dir3);
dir4->SetDirectory( "/home/mark/rat-pac/data/nulat/OFFAXIS/00DEG");     dirList->Add(dir4);
dir5->SetDirectory( "/home/mark/rat-pac/data/nulat/OFFAXIS/15DEG");     dirList->Add(dir5);
dir6->SetDirectory( "/home/mark/rat-pac/data/nulat/OFFAXIS/30DEG");     dirList->Add(dir6);
dir7->SetDirectory( "/home/mark/rat-pac/data/nulat/OFFAXIS/45DEG");     dirList->Add(dir7);
dir8->SetDirectory( "/home/mark/rat-pac/data/prospect/OFFAXIS/00DEG");  dirList->Add(dir8);
dir9->SetDirectory( "/home/mark/rat-pac/data/prospect/OFFAXIS/15DEG");  dirList->Add(dir9);
dir10->SetDirectory("/home/mark/rat-pac/data/prospect/OFFAXIS/30DEG");  dirList->Add(dir10);
dir11->SetDirectory("/home/mark/rat-pac/data/prospect/OFFAXIS/45DEG");  dirList->Add(dir11);
dir12->SetDirectory("/home/mark/rat-pac/data/sandd/OFFAXIS/00DEG");     dirList->Add(dir12);
dir13->SetDirectory("/home/mark/rat-pac/data/sandd/OFFAXIS/15DEG");     dirList->Add(dir13);
dir14->SetDirectory("/home/mark/rat-pac/data/sandd/OFFAXIS/30DEG");     dirList->Add(dir14);
dir15->SetDirectory("/home/mark/rat-pac/data/sandd/OFFAXIS/45DEG");     dirList->Add(dir15);

/* dirList->Print(); //debug */

// MAIN
cout << endl;
TRegexp nCapRE(".*_ncap\.root");
TIter i_dirList(dirList);
TIter j_dataDir(dirList);
TSystemFile *sf;
TString sfStr;
for ( i_dirList = dirList->begin(); i_dirList != dirList->end(); ++i_dirList ) {
  dir = (TSystemDirectory*)*i_dirList;
  dirName = dir->GetName();
  gSystem->cd(dirName.Data());
  for ( j_dataDir = dir->GetListOfFiles()->begin(); j_dataDir != dir->GetListOfFiles()->end(); ++j_dataDir ) {
    sf = (TSystemFile*)*j_dataDir;
    sfStr = sf->GetName();
    if (sfStr.Contains(nCapRE)) f = sf; // note: there *should* only be 1 match
  }
  dirName.ToUpper();
  phiStr = dirName( TRegexp("[0-9]+DEG") );
  phiStr = phiStr( TRegexp("[0-9]+") );
  phi = phiStr.Atof();
  printf( "Processing neutronCapturesFinal(\"%s\", %2.2f)...\n", f->GetName(), phi );
  neutronCapturesFinal( f->GetName(), phi );
}
cout << endl << endl;

// all pau!   )
}
