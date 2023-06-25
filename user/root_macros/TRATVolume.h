// TRATVolume
/// Class for analyzing geometry volumes from RAT-PAC ROOT file //DOC//...//
/**
 * This class applies to individual RAT-PAC volumes. It has two primary uses:  
 * 1. Quickly examining a single volume stored in a RAT-PAC ".root" file; and
 * 2. Building a complete detector geometry when called by TRATGeo.
 *
 * *Note:* To be set properly, FindAbsolutePosition() must be run
 *          after an object is created  
 *  -- This does not need to be done manually if TRATVolume objects
 *       are created by TRATGeo::Build().  
 *  Example:  
 *  ```cpp
 *  TRATVolume V("water_shield");
 *  V.FindAbsolutePosition();
 *  ```
 */
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2021 ~ //
// Updated 07/2022

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

class TRATVolume : public TClass {

private:
  // define defaults
  const TString defaultName = "TRATVolume";
  const TString defaultTitle = "class for analyzing geometry from RAT-PAC ROOT file";
  const char* defaultVolNameChr = "volume_name";
  const TString defaultVolName = TString("volume_name");
  TString keyStrVol;

  // members
  const char*		fVolNameChr;		///< Volume name
  TString		fVolName;		///< Volume name (TString)
  TFile*		fFile;			///< Current ROOT datafile
  const char*		fFileName;		///< Name of current ROOT datafile
  TString 		fExperiment;		///< Name of RAT-PAC experiment
  TString		fExperimentPath;	///< Path to directory defining fExperiment, usually either absolute or relative to $RATROOT/data
  const TMap*		fDB;			///< RAT-PAC database TMap
  TString		fVolumeType;		///< Name of volume type (i.e., shape)
  TString		fMaterial;		///< Volume material
  Double_t		fDensity;		///< Volume density
  TString		fMother;		///< Name of mother volume
  TVector3		fSize;			///< Half-lengths in {x,y,z} (*box-type only*)
  Double_t		fRMin;			///< Tube minimum radius
  Double_t		fRMax;			///< Tube maximum radius
  Double_t		fSizeZ;			///< Tube half-height
  TVector3		fRelativePosition;	///< Volume position, *relative to mother volume*
  TVector3		fAbsolutePosition;	///< Volume position, *relative to overall coordinate system*

private:
  // methods
  void			FindExperiment();	///< Set experiment name, path, etc.
  void			FindVolumeType();	///< Set volume type (i.e., shape)
  void			FindMaterial();		///< Set volume material
  void			FindDensity();		///< Set volume density
  void			FindMother();		///< Set mother volume name
  void			FindRelativePosition();	///< Set volume relative position
  void			FindSize();		///< Set dimensions (*box-type only*)
  void			FindAll();		///< Set all members not individually set in ctor

public:
  // methods
  TRATVolume();
  TRATVolume( const char* volNameChr, const TMap *db );
  void			SetVolume( const char* newNameChr ); ///< Switch to a different volume and re-fill parameters
  void			FindAbsolutePosition();	///< Set volume absolute position
  virtual const char*	GetVolNameChr() const { return fVolNameChr; }
  const TString*	GetVolName() const { return &fVolName; }
  TFile*		GetFile() const { return fFile; }
  virtual const char* 	GetFileName() const { return fFileName; }
  TString		GetExperiment()	const { return fExperiment; }
  TString		GetExperimentPath() const { return fExperimentPath; }
  TMap*			GetDB() const { return fDB; }
  TString		GetVolumeType() const { return fVolumeType; }
  TString		GetMaterial() const { return fMaterial; }
  Double_t		GetDensity() const { return fDensity; }
  TString		GetMother() const { return fMother; }
  TVector3*		GetSize() const { return &fSize; } ///< *box-type only*
  Double_t		GetRMin() const { return fRMin; } ///< *tube-type only*
  Double_t		GetRMax() const { return fRMax; } ///< *tube-type only*
  Double_t		GetSizeZ() const { return fSizeZ; } ///< *tube-type only*
  TVector3*		GetRelativePosition() const { return &fRelativePosition; }
  TVector3*		GetAbsolutePosition() const { return &fAbsolutePosition; }
  // general derived quantities:
  Double_t		Area(); ///< m^2		// currently box-type only
  Double_t		AreaCM() { return Area()*(1.e2)**2; }
  Double_t		AreaMM() { return Area()*(1.e3)**2; }
  Double_t		Volume(); ///< m^3;	// currently box-type only
  Double_t		VolumeCM() { return Volume()*(1.e2)**3; }
  Double_t		VolumeMM() { return Volume()*(1.e3)**3; }
  Double_t		VolumeL() { return VolumeCM()*1.e-3; }
  Double_t		Mass() { return fDensity * VolumeL(); }  ///< Kg
  Double_t		MassG() { return GetDensity() * VolumeCM(); }
  Double_t		MassTons() { return GetDensity() * Volume(); }
  // IBD-specific derived quantities: //TODO: convert some or all of these input arguments into data members
  Double_t		NuFlux(Double_t standoff, Double_t reactorNuRate);			///< Nu_e_bar flux (nu_e_bar/cm^2/s) at detector location
  Double_t		IBDVolRate(Double_t standoff, Double_t reactorNuRate, Double_t nH);	///< Volumetric IBD rate (IBD/cm^3/s) for this volume
  Double_t		IBDRate(Double_t standoff, Double_t reactorNuRate, Double_t nH) { return VolumeCM()*IBDVolRate(standoff, reactorNuRate, nH); }	///< Total IBD rate (IBD/s) for this volume
  // print summaries:
  void			PrintDerived();			///< Print area, volume, mass in all units
  /* void		PrintIBD();			///< Print IBD parameters //TODO: hold until args converted to members as specified above */

//Integrating the TRATVolume class to ROOT.
ClassDef(TRATVolume,5)

}; //end class

// all pau!   )
#endif
