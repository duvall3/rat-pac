// TRATVolume -- class for analyzing geometry from RAT-PAC ROOT file
// -- NOTE: To be set properly, TRATVolume::FindAbsolutePosition() *MUST* be run
//         after an object is created
//    -- Example: TRATVolume v("water_shield"); v.FindAbsolutePosition();
//    -- This does *not* need to be done manually if TRATVolume objects
//         are created by TRATGeo::Build()
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

#ifndef TRATVolume
#define TRATVolume

#include "TFile.h"
#include "TClass.h"

class TRATVolume : public TClass {

private:
  const char*		fVolNameChr;		// volume name
  TString		fVolName;		// volume name (TString)
  TFile*		fFile;			// current ROOT datafile
  const char*		fFileName;		// name of current ROOT datafile
  TString 		fExperiment;		// name of RAT-PAC experiment
  TString		fExperimentPath;	// path to directory defining fExperiment, usually either absolute or relative to $RATROOT/data
  const TMap*		fDB;			// RAT-PAC database TMap
  TString		fVolumeType;		// name of volume type (i.e., shape)
  TString		fMaterial;		// volume material
  TString		fMother;		// name of mother volume
  TVector3		fSize;			// half-lengths in {x,y,z} (*box-type only*)
  TVector3		fRelativePosition;	// volume position, *relative to mother volume*
  TVector3		fAbsolutePosition;	// volume position, *relative to overall coordinate system*

private:
  void			FindExperiment();	// set experiment name, path, etc.
  void			FindVolumeType();	// set volume type (i.e., shape)
  void			FindMaterial();		// set volume material
  void			FindMother();		// set mother volume name
  void			FindRelativePosition();	// set volume relative position
  void			FindSize();		// set dimensions (*box-type only*)
  void			FindAll();		// set all members not individually set in ctor
//void			FindAbsolutePosition();	// set volume absolute position

public:
  TRATVolume();
  TRATVolume( const char* volNameChr );
  TRATVolume( const TString volName );
  void			FindAbsolutePosition();	// set volume absolute position
  virtual const char*	GetVolNameChr() const { return fVolNameChr; }
  const TString		GetVolName() const { return fVolName; }
  TFile*		GetFile() const { return fFile; }
  virtual const char* 	GetFileName() const { return fFileName; }
  TString		GetExperiment()	const { return fExperiment; }
  TString		GetExperimentPath() const { return fExperimentPath; }
  TMap*			GetDB() const { return fDB; }
  TString		GetVolumeType() const { return fVolumeType; }
  TString		GetMaterial() const { return fMaterial; }
  TString		GetMother() const { return fMother; }
  TVector3		GetSize() const { return fSize; }
  TVector3		GetRelativePosition() const { return fRelativePosition; }
  TVector3		GetAbsolutePosition() const { return fAbsolutePosition; }

//Integrating the TRATVolume class to ROOT.
ClassDef(TRATVolume,3)

}; //endclass

// all pau!   )
#endif
