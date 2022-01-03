// ue4_export -- export particle tracks to a UE4-compatible CSV file
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
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


/* Reminder: UE4 CSV format is as follows:
 * 1st line: 'Name,' followed by time values
 * Remaining lines: variable name followed by values
 * Example:
 *   Name,0.0,1.3,10.7,200.3
 *   Event0neutronX,0.0,3.4,12.6,-22.7
 *   Event0neutronY,0.0,-3.4,-223.8,-345.6
 *
 * To achieve this format, run 'csvtool transpose' on the output
 *   of this macro. For example:
 * ~$ root -q -c 'ue4_export.cxx("SomeDataFile.root")'
 * ~$ csvtool transpose SomeDataFile_raw.csv > SomeDataFile.csv
*/


void ue4_export(const char* filename = "") {


// init
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::DS::MC* mc = ds->GetMC();
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();
Long64_t totalRATEvents = r.GetTotal();
Long64_t eventsPerFile = 1;
TString pclName, headerName, headerX, headerY, headerZ;
TString fullHeaderLine, dataLine;
Long64_t event, totalEvents;
Double_t t, x, y, z;
Long64_t k(0), kMCP(0), N(totalRATEvents);
Int_t i(0), mcChildren(0);
RAT::DS::MCParticle *mcp;
Bool_t isLepton(kFALSE), isNeutron(kFALSE);
Int_t leptonLower(11), leptonUpper(18);
Double_t tStep, xStep, yStep, zStep;
TVector3 coords;
Double_t event_time, wall_time;
Int_t pdgcode;

// file operations
TString fileName = filename, dirName, baseName, saveName;
if (fileName == "") {
  if (gFile) { // try gFile
    fileName = gFile->GetName();
  } else { // try cwd
    TString dirName = gSystem->WorkingDirectory();
    dirName = dirName(dirName.Last('/')+1, dirName.Length());
    dirName.Append(".root");
    if (gFile = TFile::Open(dirName.Data())) {
      fileName = dirName.Data();
    } else {
      gROOT->Error("Filename", "Please specify a file.\n");
      return;
    }
  }
}
TString baseName = fileName(0, fileName.Index('.root'));
TString saveName;// = baseName;// + ".csv"; //TEMP TODO


// MAIN
cout << "Processing particle tracks..." << endl << endl;

//TODO: add loop for eventsPerFile (incl. offset in event loop)

/* for ( k=0; k<N; k++ ) { // event loop */
/* for ( k=0; k<eventsPerFile; k++ ) { // event loop -- //temp */
/* for ( k=0; k<1; k++ ) { // event loop */
for ( k=7; k<11; k++ ) {

  //TEMP create individual track file
  saveName.Form("Event%dNeutron_raw.csv", k);
  ofstream outfile(saveName.Data());

  // init
  event = k;
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  mc = ds->GetMC();
  mcChildren = mc->GetMCParticleCount();
  event_time = mc->GetUTC().AsDouble();
  fullHeaderLine.Form("Name");

  // MCParticle loop
  for ( kMCP=0; kMCP<mcChildren; kMCP++ ) {

    // reset lepton and neutron tests
    isLepton = kFALSE;
    isNeutron = kFALSE;

    // enter track
    c = nav.Cursor(0);
    n = c.GoChild(kMCP);
    pdgcode = n->GetPDGCode();
    pclName = n->GetParticleName();
    if (pclName == "e+") pclName = "positron";
    // lepton and neutron tests
    isLepton = (TMath::Abs(pdgcode) < leptonLower ? kFALSE : TMath::Abs(pdgcode) > leptonUpper ? kFALSE : kTRUE);
    isNeutron = (pdgcode==2112);
    if (! isNeutron) continue;  //TEMP only export neutron data
    // header info
    headerName.Form(",");//Event%d", event);
    headerName.Append(pclName);
    headerX = headerName + "X";
    headerY = headerName + "Y";
    headerZ = headerName + "Z";
    fullHeaderLine.Append(headerX+headerY+headerZ);
    outfile << fullHeaderLine.Data() << endl;

    // process track
    coords = n->GetEndpoint();
    x = coords.X();
    y = coords.Y();
    z = coords.Z();
    t = n->GetGlobalTime()*1.e-9;
    wall_time = event_time + t;
    for ( i=0; i<c.StepCount(); i++ ) { // step loop
      n = c.GoStep(i);
      /* tStep = event_time + n->GetGlobalTime()*1.e-9; */
      tStep = n->GetGlobalTime();//*1.e-9;
      xStep = n->GetEndpoint().X();
      yStep = n->GetEndpoint().Y();
      zStep = n->GetEndpoint().Z();
      dataLine.Form("%f,%f,%f,%f\n", tStep, xStep, yStep, zStep);
      outfile << dataLine.Data();
    } // step loop

  } // MCParticle loop

  // keep memory from blowing up
  nav.Clear();

  // update user
  if ( (k%1000==0) ) printf("  Processed %d events...\n", k );

  // close track file
  outfile.close();

} // event loop


// all pau!   )
return;
}
