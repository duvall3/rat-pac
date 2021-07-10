// shiftStats -- helper macro to translate stats box horizontally
// -- primarily intended for keeping the stats box from blocking
//    the top of the color scale when histograms are drawn
//    with the "colz" option
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/2021 ~ //

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

void shiftStats( TVirtualPad* p, Double_t deltaX = -.1, Double_t deltaY = 0. ) {

TPaveStats* s = p->GetPrimitive("stats");
if (s == 0x0) return;
Double_t x1, x2, y1, y2;
x1 = s->GetX1NDC();
x2 = s->GetX2NDC();
y1 = s->GetY1NDC();
y2 = s->GetY2NDC();
s->SetX1NDC(x1 + deltaX);
s->SetX2NDC(x2 + deltaX);
s->SetY1NDC(y1 + deltaY);
s->SetY2NDC(y2 + deltaY);
s->Draw();

// all pau!   )
}
