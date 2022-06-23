{

//// init

//file operations
TString fullPath = gSystem->pwd();
TObjArray *pathParts = fullPath.Tokenize('/');
TObjString* datarunObjStr = (TObjString*)pathParts->At( pathParts->GetEntries() - 1 );
TString datarunName = datarunObjStr->GetString();
TString scintFile = datarunName + "_T.root";
TString resultsFile = datarunName + "_results.root";
TFile *f0 = TFile::Open(scintFile.Data());
TFile *f1 = TFile::Open(resultsFile.Data());

// TEntryList operations
TEntryList *elAll = (TEntryList*)gDirectory->Get("elAll");
TEntryList *elPrompt = (TEntryList*)gDirectory->Get("elPrompt");
TEntryList *elDelayed = (TEntryList*)gDirectory->Get("elDelayed");
TEntryList *elNeither = (TEntryList*)gDirectory->Get("elNeither");

// begin investigating rejected entries
TRegexp tcRE = "target_cell_[0-9]+";
Int_t k = 0, N = elNeither->GetN();
f0->cd();
T_scint->Show( elNeither->GetEntry(k) );
k++; T_scint->Show( elNeither->GetEntry(k) );

}
