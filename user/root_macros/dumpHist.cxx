// dumpHist -- simple macro to dump TH1 data as (x,y) pairs to stdout
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 5/21 ~ //

//Copyright (C) 2021 Mark J. Duvall
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


//void dumpHist( TH1* histo, const char* filename = "" ) {
void dumpHist( const char* histo_name, const char* filename = "" ) {

  // get desired ROOT file
  Bool_t newfile_tf;
  TFile* f_initial = gFile;
  if (filename == "") { // if no filename given, just use currently-open file
    TFile* f = f_initial;
    newfile_tf = kFALSE;
    if (f_initial == 0x0) { // if there is no currently-open file, print error msg and finish
      cerr << "Error: No file open or specified." << endl;
      return;
    }
  } else { // filename is specified
    if ( f_initial == 0x0 ) { // no file is initially open
      TFile* f = TFile::Open(filename);
      newfile_tf = kFALSE;
    } else { // a file is initially open
      if ( filename != f_initial->GetName() ) { // filename is some new file
	TFile* f = TFile::Open(filename);
	newfile_tf = kTRUE;
      } else { // filename is for already-open file
	TFile* f = f_initial;
	newfile_tf = kFALSE;
      } //endif -- test filename match
    } //endif -- a file is initially open
  } //endif -- filename given

  // get specified histogram
  TH1* h = (TH1*)f->FindObjectAny(histo_name);
  if (h == 0x0) { // if histo_name not found
    cerr << "Error: Specified histogram \"" << histo_name << "\" not found." << endl;
    // re-open original file if applicable
    if ( (newfile_tf == kTRUE) && (f_initial != 0x0) ) {
      f->Close();
      TFile::Open(f_initial->GetName());
    }
    return;
  } //endif -- histo_name found

  // MAIN
  Int_t nbins, k;
  nbins = h->GetNbinsX();
  for ( k=0; k<nbins; k++ ) cout << h->GetBinCenter(k) << "\t" << h->GetBinContent(k) << endl;

  // re-open original file if applicable
  if ( (newfile_tf == kTRUE) && (f_initial != 0x0) ) {
    f->Close();
    TFile::Open(f_initial->GetName());
  }

// all pau!   )
}
