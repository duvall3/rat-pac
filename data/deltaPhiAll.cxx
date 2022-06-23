// deltaPhiAll -- extract angular resolutions
// Suggested Usage: .x deltaPhiAll.cxx > deltaPhiAll.txt
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ //

//Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

{

// init
TRegexp nCapRE(".*_ncap_res\.root");
TList *dirList = new TList, *nCapFiles = new TList;
TIter i_dirList(dirList);
TIter j_dataDir(dirList);
TString dirName, phiStr, sfStr;
TSystemFile *f, *sf;
TFile *rf;
Double_t phi;
TObjString *experiment;
TString experimentStr;
TVectorD *deltaPhi;

// the list
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
printf("\texperiment\tphi\tdeltaPhi_{1sigma}\n\n");
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
  rf = TFile::Open( f->GetName() );
  experiment = (TObjString*)gDirectory->Get("experiment");
  experimentStr = experiment->GetString();
  experimentStr.ReplaceAll("\"","");
  deltaPhi = (TVectorD*)gDirectory->Get("deltaPhi");
  if (deltaPhi==0x0) {
    gDirectory->Error("deltaPhiAll", "TVectorD* deltaPhi not found; exiting...");
    continue;
  }
  if (phi==0.) {
    printf( "\t%s", experimentStr.Data() );
    if (experimentStr.Length()<8) printf("\t");
  } else {
    printf("\t\t");
  }
  printf( "\t%02d°\t%02.2f°\n", phi, deltaPhi[0][0] );
  if (phi==45.) printf("\n");
}
cout << endl << endl;

// all pau!   )
}
