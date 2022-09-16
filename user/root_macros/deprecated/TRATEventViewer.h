// TRATEventViewer -- class for visualizing RAT-PAC events
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

#ifndef TRATEventViewer
#define TRATEventViewer

#include "TFile.h"
#include "TClass.h"
#include <TRATGeo.cxx>

class TRATEventViewer : public TClass {

private:
  TFile*		fFile;			// current ROOT datafile
  const char*		fFileName;		// name of current ROOT datafile
  TString 		fExperiment;		// name of RAT-PAC experiment
  TString		fExperimentPath;	// path to directory defining fExperiment, usually either absolute or relative to $RATROOT/data
  TMap*			fDB;			// RAT-PAC database
  TRATGeo*		fRATGeo;		// TRATGeo object containing volume info
  TGeoManager*		fGeoManager;		// ROOT geometry manager
//RAT::DSReader		fr;			// RAT-PAC DS reader

private:
  void			Init();			// initialize
  void			FindExperiment();	// fill experiment name, path, etc.

public:
  TRATEventViewer();
  TRATEventViewer(const char* filename);
  void			Build();		// construct volumes and open viewer
  TFile*                GetFile() const { return fFile; }
  virtual const char*   GetFileName() const { return fFileName; }
  TString               GetExperiment() const { return fExperiment; }
  TString               GetExperimentPath() const { return fExperimentPath; }
  TMap*			GetDB() const { return fDB; }
  TRATGeo*		GetRATGeo() const { return fRATGeo; }
  void			DrawTracks( );

//Integrating the TRATEventViewer class to ROOT.
ClassDef(TRATEventViewer,1)

}; //endclass

// all pau!   )
#endif
