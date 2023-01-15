// TRATMaterial
// Class for calculating certain properties of materials
// Primarily intended for:
// -- use with RAT-PAC
// -- calculating the MFP for neutron elastic scattering
// Note: For CINT, load using gROOT->LoadMacro("TRATMaterial.cxx");
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 08/2022 ~ //

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

#ifndef TRATMaterial
#define TRATMaterial

#include <TIBDParams.h>

class TRATMaterial : public TClass {

private:
  // members
  TString		fMatName;							///< name of material
  TObject*		fParent;							///< pointer to parent material
  Bool_t		fkEval;								///< whether Evaluate() has been called on this object
  Bool_t		fkComplete;							///< whether material is an element
  Int_t			fNComp;								///< number of component materials
  TList*		fCompList;							///< list of component materials
  /* Double_t		fDensityCGS;							///< material density in g/cm^3 */
  /* Double_t		fDensityMKS;							///< material density in kg/m^3 */
  Double_t		fDensity;							///< material density in g/cm^3
  Double_t		fAMU;								///< molecular mass
  /* TMatrixD		fComposition;							///< matrix describing %wt of component materials */
  Double_t		fPctWt;								///< this material's %wt in parent material
  TString		fTarget;							///< name of scattering target
  /* Double_t		fTargetDensityCGS;						///< number density of scattering targets in #/cm^3 */
  /* Double_t		fTargetDensityMKS;						///< number density of scattering targets in #/m^3 */
  Double_t		fTargetDensity;							///< number density of scattering targets in #/cm^3
  Double_t		fES_XS_B;							///< neutron elastic-scattering cross-section in barns
  Double_t		fES_XS_C;							///< neutron elastic-scattering cross-section in cm^-2
  Double_t		fMFP;								///< mean free path in cm

private:
  // internal methods
  /* void			Init(); */
  void			SetComplete(Bool_t newComplete) {fkComplete=newComplete;}
  /* void			SetCompList(TList* */
  void			SetEval(Bool_t newEval) {fkEval=newEval;}
  /* Bool_t		CheckComplete(); */
public:
  // public methods
  TRATMaterial();									///< Default ctor
  TRATMaterial(const char* matName, Double_t targetDensity=0., Double_t ES_XS_B=0.);	///< Normal ctor
  // setters and getters
  void			SetMatName(TString newMatName) {fMatName=newMatName; SetName(TString::Format("TRATMaterial for %s",newMatName.Data()));}
  void			SetParent(TObject* newParent) {fParent=newParent;}
  void			SetComplete(Bool_t newComplete) {fkComplete=newComplete;}
  void			SetNComp(Int_t newNComp) {fNComp=newNComp;}
  void			SetDensity(Double_t newDensity) {fDensity=newDensity;}
  void			SetAMU(Double_t newAMU) {fAMU=newAMU;}
  void			SetPctWt(Double_t newPctWt) {fPctWt=newPctWt;}
  void			SetTarget(TString newTarget) {fTarget=newTarget;}
  void			SetTargetDensity(Double_t newTargetDensity) {fTargetDensity=newTargetDensity;}
  void			SetES_XS_B(Double_t newES_XS_B);
  void			SetES_XS_C(Double_t newES_XS_C);
  void			SetMFP(Double_t newMFP;) {fMFP=newMFP;}
  TString		GetMatName() {return fMatName;}
  TObject*		GetParent() {return fParent;}
  Bool_t		IsEval() {return fkEval;}
  Bool_t		IsComplete() {return fkComplete;}
  Int_t			GetNComp() {return fNComp;}
  TList*		GetListOfComponents() {return fCompList;}
  Double_t		GetDensity() {return fDensity;}
  Double_t		GetAMU() {return fAMU;}
  Double_t		GetPctWt() {return fPctWt;}
  TString		GetTarget() {return fTarget;}
  Double_t		GetTargetDensity() {return fTargetDensity;}
  Double_t		GetES_XS_B() {return fES_XS_B;}
  Double_t		GetES_XS_C() {return fES_XS_C;}
  Double_t		GetMFP() {return fMFP;}

  // general
  Double_t		CalculateTargetDensity();					///< calculate volumetric number-density of scattering targets
  Bool_t		CheckComplete();						///< check if ready to run MFP calculation
  Double_t		Evaluate();							///< calculate MFP

// Integrating the TRATMaterial class into ROOT
ClassDef(TRATMaterial,1) ///< with class version number

}; //end class

// all pau!   )
#endif

