// addVersion -- Simple code snippet for adding a software
//   version number to an output file
// ~ Mark J. Duvall / T. Rocks Science ~ duvall3@github.com ~ 07/2024 ~ //
// NOT INTENDED FOR STANDALONE USE //

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

// PLACE THIS BLOCK NEAR THE BEGINNING //
// set version numbers as needed
Int_t VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH;
// VERSION_MAJOR = 1;
// VERSION_MINOR = 2;
// VERSION_PATCH = 3;
// build version as string
TString versionString;
versionString.Form("v%d.%d.%d", VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH);
// convert for saving
TObjString *versionObjString = new TObjString(versionString);
// and/or:
// build version as TVectorF
TVectorF versionVectorObj(3);
versionVectorObj[0] = VERSION_MAJOR;
versionVectorObj[1] = VERSION_MINOR;
versionVectorObj[2] = VERSION_PATCH;
TVectorF *versionVector = &versionVectorObj;
// and/or:
// build version from GitHub revision fingerprint (probably *nix only)
// -- Note: This will give the commit ID *specific to the requested file only*
Bool_t kGit = kTRUE;
if (kGit) {
  TString THISFILE = "addVersion.cxx"; // add full path and/or change as needed
  TString shellCmd;
  shellCmd.Form("'git' log -n 1 --abbrev-commit --oneline %s | 'cut' -d ' ' -f 1", THISFILE.Data());
  TString gitRev = gSystem->GetFromPipe(shellCmd.Data());
  TObjString *gitRevObjString = new TObjString(gitRev);
}

// PLACE THIS BLOCK NEAR THE END //
TFile *outFile = gFile; // replace "gFile" with a pointer to your output TFile if needed
versionObjString->Write("versionObjString");
versionVector->Write("versionVector");
if (kGit) {
  gitRevObjString->Write("gitRevObjString");
}

// all pau!   )

// // You can then retrieve the version info from the output file as follows:
// // simple method:
// TFile *f = TFile::Open("YOUR_FILENAME.root");
// versionObjString->Print();
// versionVector->Print();
// gitRevObjString->Print();
// // or, if you need to retrieve the actual objects for further use:
// TFile *f = TFile::Open("YOUR_FILENAME.root");
// TObjString *vOS = (TObjString*)gDirectory->Get("versionObjString");
// vOS->Print(); // or vOS->GetString().Print();
// TObjString *gitRevOS = (TObjString*)gDirectory->Get("gitRevObjString");
// gitRevOS->Print(); // or gitRevOS->GetString().Print();
// // and:
// TVectorF *vV = (TVectorF*)gDirectory->Get("versionVector");
// vV->Print();
// // if you need the components, then also run:
// TVectorF v = *vV;
// Int_t VERSION_MAJOR = (Int_t)v[0];
// Int_t VERSION_MINOR = (Int_t)v[1];
// Int_t VERSION_PATCH = (Int_t)v[2];
// // Enjoy!
