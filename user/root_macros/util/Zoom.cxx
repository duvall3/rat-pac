// Zoom -- define convenient zoom function
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2021 ~ //

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

void Zoom(Double_t zoomFactor = 2.) {
  TString zoomCmd1 = "TView *view = gPad->GetView(); ";
  TString zoomCmd2 = TString::Format("view->ZoomView(gPad, %f)", zoomFactor);
  gInterpreter->ProcessLine(zoomCmd1.Data());
  gInterpreter->ProcessLine(zoomCmd2.Data());
  // all pau!   )
  return;
}

