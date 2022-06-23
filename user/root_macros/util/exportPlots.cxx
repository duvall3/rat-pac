// exportPlots -- simple macro to extract all the TCanvas objects
//   from a ROOT file and save them in the desired graphics format
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2021 ~ //

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

void exportPlots( const char* filename, const TString kGraphicsSaveFormat = ".png" ) {

// for OpenGL:
// switch default rendering engine
const Bool_t origOGL = gStyle->GetCanvasPreferGL();
if (! origOGL) gStyle->SetCanvasPreferGL(kTRUE);
// set to batch mode if needed
const Bool_t origBatch = gROOT->IsBatch();
if (! origBatch) gROOT->SetBatch(kTRUE);

// init
if (filename == "") {
  if (gFile) {
    filename = gFile->GetName();
  } else {
    TString errLoc = "exportPlots.cxx";
    TString errMsg = "No filename given or fount. Exiting.";
    gROOT->Error( errLoc.Data(), errMsg.Data() );
    return;
  }
}
TRegexp canvasRE = "TCanvas";
TString keyClass, keyName, savename;
TCanvas *c;

// get file contents
TFile *f = TFile::Open(filename);
TList *keys = f->GetListOfKeys(), *cans = new TList;
TKey *key;
TIter i(keys);

// loop over keys
for ( i=keys->begin(); i!=keys->end(); ++i ) {
  key = (TKey*)*i;
  keyClass.Clear();
  keyName.Clear();
  savename.Clear();
  keyClass = key->GetClassName();
  if (keyClass.Contains(canvasRE)) {
    keyName = key->GetName();
    savename = keyName+kGraphicsSaveFormat;
    c = (TCanvas*)key->ReadObj();
    cans->Add(c);
    c->Draw();
    c->SaveAs(savename.Data());
  }
}

// clean up
for ( i=cans->begin(); i!=cans->end(); ++i ) {
  c = (TCanvas*)*i;
  c->Close();
}

// reset graphics settings if applicable
if (! origOGL) gStyle->SetCanvasPreferGL(kFALSE);
if (! origBatch) gROOT->SetBatch(kFALSE);

// all pau!   )
f->Close();
}

