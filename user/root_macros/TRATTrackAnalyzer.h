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

private:
  // members
  TString		fFileName;							///< name of RAT file
  TObject*		fDSReaderObject;						///< reference to the DSReader
  RAT::DS::Root*	fDS;								///< RAT data structure
  /* RAT::DS::MC*	fMC;								///< RAT MC */
  /* TObject*		fTrackNavObject;						///< reference to the TrackNav */
  RAT::TrackCursor*	fCursor;							///< RAT track cursor
  RAT::TrackNode*	fNode;								///< RAT track node

private:
  // internal methods
  /* void			SomePrivateMethod();					///< Private method */

public:
  // public methods
  TRATTrackAnalyzer( const char* filename );						///< Normal ctor
  // setters and getters
  TString		GetFileName() { return fFileName; }
  /* TObject*		GetDSReaderObject() { return fDSReaderObject; } */
  RAT::DSReader*	GetDSReader() { return (RAT::DSReader*)fDSReaderObject; }
  RAT::DS::Root*	GetDS() { return fDS; }
  /* RAT::DS::MC*	GetMC() { return fMC; } */
  /* TObject*		GetTrackNavObject() { return fTrackNavObject; } */
  /* RAT::TrackNav*	GetNav() { return (RAT::TrackNav*)fTrackNavObject; } */
  RAT::TrackCursor*	GetCursor() { return fCursor; }
  RAT::TrackNode*	GetNode() { return fNode; }
  // general
  /* Double_t		SomeCalculation( Int_t someArg1 = 0 );				///< Regular function with default argument */

// Integrating the TRATTrackAnalyzer class into ROOT
ClassDef(TRATTrackAnalyzer,1) ///< with class version number

}; //end class

// all pau!   )
#endif

// all pau!   )

