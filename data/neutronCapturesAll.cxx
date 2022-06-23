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
TRegexp nCapRE(".*_ncap\.root");
TIter i(dirList);
TIter j(dirList);
TSystemFile *sf;
TString sfStr;
for ( i = dirList->begin(); i != dirList->end(); ++i ) {
  dir = (TSystemDirectory*)*i;
  cout << dir->GetName() << endl; //debug
  dirName = dir->GetName();
  gSystem->cd(dirName.Data());
  for ( j = dir->GetListOfFiles()->begin(); j != dir->GetListOfFiles()->end(); ++j ) {
    sf = (TSystemFile*)*j;
    sfStr = sf->GetName();
    if (sfStr.Contains(nCapRE)) f = sf; // note: there *should* only be 1 match
  }
  dirName.ToUpper();
  phiStr = dirName( TRegexp("[0-9]+DEG") );
  phiStr = phiStr( TRegexp("[0-9]+") );
  phi = phiStr.Atof();
  /* gSystem->WorkingDirectory(); //debug */
  /* cout << f->GetName() << "\t"; //debug */
  /* printf("%f\n", phi); //debug */
  neutronCapturesFinal( f->GetName(), phi );
}

// all pau!   )
}
