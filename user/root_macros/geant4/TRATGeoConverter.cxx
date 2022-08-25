// TRATGeoConverter -- basic template for writing ROOT classes
// -- Note: For CINT, load using gROOT->LoadMacro("TRATGeoConverter.cxx");
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

#include <TRATGeoConverter.h>

// Call the ClassImp() macro to give the TRATGeoConverter class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TRATGeoConverter);
#endif

/* //______________________________________________________________________________ */
/* // default ctor */
/* TRATGeoConverter::TRATGeoConverter() */
/* { */
/*   SetName("TRATGeoConverter"); */
/*   SetTitle("Class for converting RAT-PAC geometry to GEANT4 format"); */
/*   fInFileName = ""; */
/*   fOutFileName = ""; */
/* } */

//______________________________________________________________________________
// normal ctor
TRATGeoConverter::TRATGeoConverter( const char* inFileName )
{
  SetName("TRATGeoConverter");
  SetTitle("Class for converting RAT-PAC geometry to GEANT4 format");
  fInFileName = inFileName;
  TString fileName(inFileName);
  fileName.ReplaceAll( "\.root", "_geo.cc" );
  const char* oFN = fileName.Data();
  fOutFileName = oFN;
  /* SetFiles(); */
}

//______________________________________________________________________________
// SetInFile
void TRATGeoConverter::SetInFile()
{
  fInFile = TFile::Open(fInFileName);
  return;
}

//______________________________________________________________________________
// SetOutFile
void TRATGeoConverter::SetOutFile()
{
  fOutFile = fopen( fOutFileName, "w" );
  return;
}

//______________________________________________________________________________
// SetFiles
void TRATGeoConverter::SetFiles()
{
  if ( fInFileName == "" ) {
    this->Error("TRATGeoConverter::SetFiles", "Please set an input filename first.\n");
    return;
  } else {
    SetInFile();
  }
  /* if ( fOutFileName == "" ) { */
    TString fileName(fInFileName);
    fileName.ReplaceAll( "\.root", "_geo.cc" );
    fOutFileName = fileName.Data();
  /* } else { */
  /*   fOutFileName = outFileName; */
  /* } */
  SetOutFile();
  return;
}

//______________________________________________________________________________
// BuildGeometry
void TRATGeoConverter::BuildGeometry()
{
  SetFiles();
  fInFile->cd();
  fRATGeo = new TRATGeo;
  GetGeo()->Build();
  return;
}

//______________________________________________________________________________
// Convert
void TRATGeoConverter::Convert()
{

  // geo check
  if ( GetGeo() == 0x0 ) BuildGeometry();

  // just to save some typing
  FILE *f = fOutFile;

  // header
  fprintf( f, "\n//// RAT-to-GEANT Geometry Conversion by TRATGeoConverter\n//// Generated for experiment \"%s\" from file \"%s\"\n\n", fRATGeo->GetExperiment().Data(), GetInFileName() );

  // start with world volume
  TRATVolume *world = (TRATVolume*)fRATGeo->GetVolume("world");
  if (world==0x0) { // TODO: add a manual SetTopVolume or SetWorldVolume method
    this->Error("TRATGeoConverter::Convert()", "World volume not found.\n");
    return;
  }
  fprintf( f, "// world\n" );
  // attempt to guess G4 material, will need manual find-and-replace if not a match
  TString worldMat(world->GetMaterial());
  worldMat.ToUpper();
  worldMat.Prepend("G4_");
  fprintf( f, "G4Material *world_mat = nist->FindOrBuildMaterial(\"%s\");\n", worldMat.Data() );
  // shape //TODO: boxes only for now
  TVector3 *worldSize = world->GetSize();
  fprintf( f, "G4Box *solid_world = new G4Box(\"world\", %f*cm, %f*cm, %f*cm);\n", worldSize->X()/10., worldSize->Y()/10., worldSize->Z()/10. );
  // logical volume
  fprintf( f, "G4LogicalVolume *logic_world = new G4LogicalVolume(solid_world, world_mat, \"world\");\n" );
  // placement
  fprintf( f, "new G4PVPlacement(0, G4ThreeVector(), logic_world, \"world\", 0, false, 0, checkOverlaps);\n" );
  fprintf( f, "\n" );

  // MAIN
  // init
  TList *volumeList = fRATGeo->GetListOfVolumes();
  TIter i(volumeList);
  TRATVolume *vol;
  TString volName, volMat, volMatName, volPosName, volSolidName, volLogicName, volMother;
  TVector3 *volPos, *volSize;
  // loop over remaining volumes
  for ( i = volumeList->begin(); i != volumeList->end(); ++i ) {
    // get volume
    vol = (TRATVolume*)*i;
    if (vol==world) continue; // skip world volume, already done above
    volName = vol->GetName();
    fprintf( f, "// %s\n", volName.Data() );
    // material
    volMat = vol->GetMaterial();
    volMat.ToUpper();
    volMat.Prepend("G4_");
    volMatName = volName + "_mat";
    fprintf( f, "G4Material *%s = nist->FindOrBuildMaterial(\"%s\");\n", volMatName.Data(), volMat.Data() );
    // position
    volPosName = volName + "_pos";
    volPos = vol->GetRelativePosition();
    fprintf( f, "G4ThreeVector %s = G4ThreeVector(%f*cm, %f*cm, %f*cm );\n", volPosName.Data(), volPos->X()/10., volPos->Y()/10., volPos->Z()/10. );
    // shape and size
    volSolidName = "solid_" + volName;
    volSize = vol->GetSize();
    fprintf( f, "G4Box *%s = new G4Box(\"%s\", %f*cm, %f*cm, %f*cm );\n", volSolidName.Data(), volName.Data(), volSize->X()/10., volSize->Y()/10., volSize->Z()/10. );
    // logical volume
    volLogicName = "logic_" + volName;
    fprintf( f, "G4LogicalVolume *%s = new G4LogicalVolume(%s, %s, \"%s\");\n", volLogicName.Data(), volSolidName.Data(), volMatName.Data(), volName.Data() );
    // placement
    volMother = vol->GetMother();
    volMother.Prepend("logic_");
    fprintf( f, "new G4PVPlacement(0, %s, %s, \"%s\", %s, false, 0, checkOverlaps);\n", volPosName.Data(), volLogicName.Data(), volName.Data(), volMother.Data() );
    fprintf( f, "\n" );
  }

  // all pau!   )
  fprintf( f, "//// TRATGeoConverter end\n\n\n" );
  CloseOutFile();
  return;

}

////______________________________________________________________________________
//TRATGeoConverter::
//{
//}

////______________________________________________________________________________
//TRATGeoConverter::
//{
//}

//______________________________________________________________________________
// override Print
void TRATGeoConverter::Print()
{
  printf("%s: %s\tat: %#lx\n", GetName(), GetTitle(), this);
  printf("InFile: %s\tat: %#lx\n", fInFileName, fInFile);
  printf("OutFile: %s\tat: %#lx\n", fOutFileName, fOutFile);
  /* printf("Overwrite: %d\n", fkOverwrite); */
  printf("TRATGeo at: %#lx\n", fRATGeo);
}


