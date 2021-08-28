// getVolumeRelativeCenter -- helper macro to find the center of a RAT-PAC volume with a given name,
//   *relative to its mother volume*
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

TVector3 getVolumeCenter( const char* volName ) {

// check for ratdb
if (gDirectory->FindObjectAny("db")) {
  TMap* db = (TMap*)gDirectory->FindObjectAny("db");
} else {
  TString errMsg = TString::Format( "\nCould not evaluate getVolumeRelativeCenter(\"%s\"): RAT-PAC database not found.\n", volName );
  gDirectory->Error("FindObjectAny", errMsg);
  return;
}

// init
TVector3 volRelativeCenter;
TObjString valTOS, xTOS, yTOS, zTOS;
TString keyStr, valStr, motherName;
TObjArray* posArr;

// get volume's (relative) position
keyStr.Form("GEO[%s].position", volName);
valTOS = (TObjString)db->GetValue(keyStr.Data());
valStr = valTOS.GetString();
valStr.ReplaceAll("[","");
valStr.ReplaceAll("d","");
valStr.ReplaceAll("]","");
valStr.Replace(valStr.Last(','), 1, "");
posArr = valStr.Tokenize(",");
xTOS = (TObjString)posArr->At(0);
yTOS = (TObjString)posArr->At(1);
zTOS = (TObjString)posArr->At(2);
volRelativeCenter = TVector3( xTOS.GetString().Atoll(), yTOS.GetString().Atoll(), zTOS.GetString().Atoll() );

// all pau!   )
return volRelativeCenter;
}

//// overload
//TVector3 getVolumeRelativeCenter( TString volNameStr ) = getVolumeRelativeCenter( volNameStr.Data() );

