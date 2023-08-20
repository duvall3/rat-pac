//TRATTrackAnalyzer
/// Class for processing data from RAT-PAC particle tracks
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 08/2023 ~ //

// Copyright (C) 2023 Mark J. Duvall
// 
//     This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
// 
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
// 
//     You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <http://www.gnu.org/licenses/>.
// 

#ifndef TRATTrackAnalyzer
#define TRATTrackAnalyzer

class TRATTrackAnalyzer : public TClass {

public:
  // mode enums
  enum EParticleSelection								///< How to select particles
  {
    kIBDPositrons,									///< Positrons in an IBD run, top-level only
    kIBDNeutrons,									///< Neutrons in an IBD run, top-level only
    kParticleSearch									///< Search all levels for a given particle
  };
  enum EStepSelection									///< How to select track steps
  {
    kStartEnd,										///< Only examine the first and last steps of selected tracks
    kAllSteps										///< Iterate over all steps of selected tracks
  };

private:
  // members
  EParticleSelection	fParticleSelectionMode;						///< Particle selection mode (see enum)
  EStepSelection	fStepSelectionMode;						///< Step selection mode (see enum)
  TString		fFileName;							///< Name of RAT file
  Bool_t		fkVerbose;							///< Whether to print track at each cursor movement 
  TObject*		fDSReaderObject;						///< Reference to the DSReader
  /* RAT::DS::Root*	fDS;								///< RAT data structure */
  /* RAT::DS::MC*	fMC;								///< RAT MC */
  /* TObject*		fTrackNavObject;						///< Reference to the TrackNav */
  /* RAT::TrackCursor*	fCursor;							///< RAT track cursor */
  /* RAT::TrackNode*	fNode;								///< RAT track node */
  Long64_t		fTotalEvents;							///< Number of top-level RAT events
  TString		fParticleName;							///< Name of particle to seek
  TTree*		fTree;								///< Results tree
  TH1D*			fHist;								///< Results histogram

private:
  // internal methods
  /* void			SomePrivateMethod();					///< Private method */
  void			SetTotalEvents(Long64_t newTotal) { fTotalEvents = newTotal; }
  /* void			SetDS(RAT::DS::Root* newDS) { fDS = newDS; } */

public:
  // public methods
  TRATTrackAnalyzer( const char* filename );						///< Normal ctor
  // getters and setters
  EParticleSelection	GetParticleSelectionMode() { return fParticleSelectionMode; }
  EStepSelection	GetStepSelectionMode() { return fStepSelectionMode; }
  TString		GetFileName() { return fFileName; }
  Bool_t		IsVerbose() { return fkVerbose; }
  /* TObject*		GetDSReaderObject() { return fDSReaderObject; } */
  RAT::DSReader*	GetDSReader() { return (RAT::DSReader*)fDSReaderObject; }
  /* RAT::DS::Root*	GetDS() { return fDS; } */
  /* RAT::DS::MC*	GetMC() { return fMC; } */
  /* TObject*		GetTrackNavObject() { return fTrackNavObject; } */
  /* RAT::TrackNav*	GetNav() { return (RAT::TrackNav*)fTrackNavObject; } */
  /* RAT::TrackCursor*	GetCursor() { return fCursor; } */
  /* RAT::TrackNode*	GetNode() { return fNode; } */
  Long64_t		GetTotalEvents() { return fTotalEvents; }
  TString		GetParticleName() { return fParticleName; }
  TTree*		GetTree() { return fTree; }
  TH1D*			GetHist() { return fHist; }
  void			SetParticleSelectionMode(EParticleSelection newPSMode) { fParticleSelectionMode = newPSMode; }
  void			SetStepSelectionMode(EStepSelection newSSMode) { fStepSelectionMode = newSSMode; }
  void			SetVerbose(Bool_t newVerbose) { fkVerbose = newVerbose; }
  void			SetParticleName(TString newName) { fParticleName = newName; }
  void			SetParticleName(const char* newName) { fParticleName = TString(newName); }
  // general
  /* Double_t		SomeCalculation( Int_t someArg1 = 0 );				///< Regular function with default argument */
  void			Analyze();							///< Run selected analysis
  void			Save();								///< Save results
  void			Run();								///< Perform analysis and save results

// Integrating the TRATTrackAnalyzer class into ROOT
ClassDef(TRATTrackAnalyzer,1) ///< with class version number

}; //end class

// all pau!   )
#endif

// all pau!   )

