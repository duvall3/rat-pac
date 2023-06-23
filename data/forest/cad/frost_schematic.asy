// frost_schematic -- Asymptote code defining schematic for FROST project
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2023 ~ //

//Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
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


//// INIT

// output settings
//bool kOutputPNG = false;
bool kOutputPNG = true;
if (kOutputPNG) {
  settings.outformat = "png";
  settings.render = 2**4;
  //settings.render = 2**3;
  //settings.render = 2**2;
} else {
  //settings.outformat="eps";
  settings.outformat="svg";
  settings.render=0;
}

// general init
size(500,0);
pen dfpen = defaultpen;
pen glasspen = dfpen+cyan+opacity(0.50);
pen scintpen = dfpen+blue+opacity(0.25);
pen pmtpen = dfpen+magenta+opacity(0.75);
pen dimpen = dfpen+linewidth(1.25);
pen dashpen = dfpen+linewidth(1.00)+dashed;
pair O = (0,0);
pair X = (1,0);
pair Y = (0,1);
// actual dimensions (cm):
real RG = 2.54;				// glass-tube outer radius (cm)
real RS = 2.20;				// scint-tube outer radius (cm)
real  S = 4*RG;				// tube spacing, center-to-center (cm)


//// FUNCTIONS

// create a path from an array of pairs
path pathify(pair[] R) {
  if (R.length<3) return R[0]--R[1]--cycle;
  path P = R[0] -- R[1];
  for (int k=2; k<R.length; ++k) {
    P = P -- R[k];
  }
  P = P -- cycle;
  return P;
}

// create "tube" (annular ring)
path tube(pair R = O) {
  path[] rings;
  rings[0] = circle(R,RG);
  rings[1] = reverse(circle(R,RS));
  return rings[0] -- rings[1] -- cycle;
}

// correct sig-figs //TODO: generalize (//HC//) //FIXME: not currently working
string sig3(string str) {
  /* write( length(str) ); //debug */
  string newstr = str;
  if ( length(str) < 4 ) {
    /* newstr = format("%s0", str); */
    newstr = insert(str, length(str), "0");
  }
  return newstr;
}

//// MAIN

// define vertices
pair[] verts;
pair R;
real theta;
real theta_0 = 0;				// hexagon aligned horizontally
//real theta_0 = 2*pi/12;			// hexagon aligned vertically
for ( int k=0; k<6; ++k ) {
  theta = k * 2*pi/6 + theta_0;
  R = S * ( cos(theta), sin(theta) );
  verts[k] = R;
}

// rectangular bg
real L = 1.35*S;
// background vertices, clockwise ("UL" = "upper left," etc.)
pair bgUL = (-L,1.25*L);
pair bgUR = (2.10*L,1.25*L);
pair bgLR = (2.10*L,-0.50*L);
pair bgLL = (-L,-0.50*L);
pair[] bgpairs = {bgUL, bgUR, bgLR, bgLL};
path bgbox = pathify( bgpairs );
fill( bgbox, white );

// draw tubes
// outer tubes
for ( int k=0; k<4; ++k ) {
  theta = k * 2*pi/6 + theta_0;
  fill( tube(verts[k]), cyan );
  fill( circle(verts[k],RS), magenta );
}
// central tube
fill( circle(O,RG), magenta );
fill( tube(O), cyan );

// annotations
// title
label( "$FROST\ Dimensions$", shift(1.25*S*X+3.0*RS*Y)*verts[1], dfpen+fontsize(16) );
label( "$Full\ Array: 16\times16$", shift(1.25*S*X+2.25*RS*Y)*verts[1], dfpen+fontsize(16) );
// dimensions for entire array
string fullArrayWidth = format("$\hookrightarrow\ \approx %.2f$ m\ $\times\ $", 16*S/100);
string fullArrayHeight = format("%.2f\ \mathrm{m}", 16*sin(60*pi/180)*S/100);
string fullArrayDims = insert(fullArrayWidth, length(fullArrayWidth)-1, fullArrayHeight);
label( fullArrayDims, shift(1.50*S*X+1.50*RS*Y)*verts[1], dfpen+fontsize(16) );
// define transforms
transform dimTdown = shift(-1.5*RG*Y);
transform dimTup = shift(+1.5*RG*Y);
transform labelT = shift(0.5*RG*Y)*dimTdown;
// spacing between tube centers
string sepText = format("$S \equiv 4r_{outer} = %f$ cm", S);
path sepPath0 = O -- verts[0];
path sepPath1 = O -- verts[1];
path sepPath2 = verts[0] -- verts[1];
path sepPath3 = O -- verts[3];
draw( O -- dimTdown*O, dashpen );
draw( verts[0] -- dimTdown*verts[0], dashpen );
draw( sepPath0, dimpen, Bars );
draw( sepPath1, dimpen, Bars );
draw( sepPath2, dimpen, Bars );
label( sepText, labelT*sepPath0, dimpen );
label( "$S$", sepPath0, dimpen );
label( "$S$", sepPath1, dimpen );
label( "$S$", sepPath2, dimpen );
// tube inner radius
string innerText = format("%.2f cm", RS);
innerText = sig3(innerText);	//TODO: HC
path innerPath = verts[2] -- shift(RS*X)*verts[2];
draw( innerPath, dimpen, Bars );
string innerText = format("$r_{inner} = %f$ cm", RS);
pair[] innerLabels = { dimTdown*verts[2], shift(RS*X)*dimTdown*verts[2] };
draw( verts[2] -- innerLabels[0], dashpen );
draw( shift(RS*X)*verts[2] -- innerLabels[1], dashpen );
label( innerText, innerLabels[0] -- innerLabels[1], dimpen );
// tube outer radius
string outerText = format("$r_{outer} = %f$ cm", RG);
outerText = sig3(outerText);	//TODO: HC
path outerPath = verts[2] -- shift(-RG*X)*verts[2];
draw( outerPath, dimpen, Bars );
pair[] outerLabels = { dimTup*verts[2], shift(-RG*X)*dimTup*verts[2] };
draw( verts[2] -- outerLabels[0], dashpen );
draw( shift(-RG*X)*verts[2] -- outerLabels[1], dashpen );
label( outerText, outerLabels[0] -- outerLabels[1], dimpen );
// hex angle
path hexArc = arc(O, 4.0, 0., 60.);
draw( hexArc );
label( "$60^{o}$", hexArc );
// perpendicular separation
string perpText = format("$S_{\perp} \equiv S \cdot \sin (60^{o}) \approx %.2f$ cm", S*sin(60*pi/180));
perpText = sig3(perpText);	//TODO: HC
real perpXmax = verts[1].x+S;
pair[] perpVerts = { (perpXmax,verts[0].y), (perpXmax,verts[1].y) };
path perpPath = perpVerts[0] -- perpVerts[1];
draw( verts[1] -- perpVerts[1], dashpen );
draw( verts[0] -- perpVerts[0], dashpen );
draw( perpPath, Arrows);
label( perpText, perpPath );

// all pau!   )
