// TRATGeo -- class for assembling geometry in a RAT-PAC ROOT file
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/2021 ~ //

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

#ifndef TRATGeo
#define TRATGeo

#include "TFile.h"
#include "TClass.h"
#include <TRATVolume.cxx>

class TRATGeo : public TClass {

private:
  TFile*		fFile;			// current ROOT datafile
  const char*		fFileName;		// name of current ROOT datafile
  TString 		fExperiment;		// name of RAT-PAC experiment
  TString		fExperimentPath;	// path to directory defining fExperiment, usually either absolute or relative to $RATROOT/data
  const TMap*		fDB;			// RAT-PAC database TMap*
  TList*		fVolumeList;		// list of TRATVolume objects

private:
//void			Init();			// initialize
  void			FindExperiment();	// fill experiment name, path, etc.
//void			Build();		// construct TRATVolume list

public:
  TRATGeo();
  void			Init();
  void			Build();
  TFile*                GetFile() const { return fFile; }
  virtual const char*   GetFileName() const { return fFileName; }
  TString               GetExperiment() const { return fExperiment; }
  TString               GetExperimentPath() const { return fExperimentPath; }
  TMap*                 GetDB() const { return fDB; }
  TList*		GetListOfVolumes() const { return fVolumeList; }
  TRATVolume*		GetVolume(const char* volumeName);

//Integrating the TRATGeo class to ROOT.
ClassDef(TRATGeo,1)

}; //endclass

// all pau!   )
#endif
