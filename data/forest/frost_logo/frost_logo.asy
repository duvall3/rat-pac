// frost_logo -- Asymptote code defining logo for FROST project
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
//bool kOutput = false;
bool kOutput = true;
if (kOutput) {
settings.outformat = "png";
/* settings.outformat="eps"; */
settings.render = 2**4;
/* settings.render = 2**3; */
/* settings.render = 2**2; */
/* settings.render=0; */
}

// general init
size(100,0);
/* bbox(black,Fill); */
pen dfpen = defaultpen;
pen glasspen = dfpen+cyan+opacity(0.50);
pen scintpen = dfpen+blue+opacity(0.25);
pen pmtpen = dfpen+magenta+opacity(0.75);
pair O = (0,0);
pair X = (1,0);
pair Y = (0,1);
// actual dimensions:
real RG = 2.54;				// glass-tube outer radius
real RS = 2.20;				// scint-tube outer radius
real  S = 4*RG;				// tube spacing, center-to-center


//// GEO

path tube(pair R = O) {
  path[] rings;
  rings[0] = circle(R,RG);
  rings[1] = reverse(circle(R,.95*RS));
  /* fill( rings[0] -- rings[1] -- cycle, magenta ); */
  return rings[0] -- rings[1] -- cycle;
}

path spike(real theta) {
  real L = 1.3*S;
  pair r0 = RG/2 * ( cos(theta-pi/2), sin(theta-pi/2) );
  pair r1 = L * ( cos(theta), sin(theta) );
  pair r2 = RG/2 * ( cos(theta+pi/2), sin(theta+pi/2) );
  path P = r0 -- r1 -- r2 -- cycle;
  /* fill(P, cyan); */
  return P;
}

// pathify an array of pairs
path pathify(pair[] R) {
  if (R.length<3) return R[0]--R[1]--cycle;
  path P = R[0] -- R[1];
  for (int k=2; k<R.length; ++k) {
    P = P -- R[k];
  }
  P = P -- cycle;
  return P;
}


//// MAIN

// draw bg
real L = 1.35*S;
axialshade( scale(L) * ( (-1,1)--(1,1)--(1,-1)--(-1,-1)--cycle ), heavyblue, (L,L), darkblue, -(L,L) );

// draw spikes
pair[] verts;
pair R;
real theta;
real theta_0 = 0;
/* real theta_0 = 2*pi/12; */
for ( int k=0; k<6; ++k ) {
  theta = k * 2*pi/6 + theta_0;
  R = S * ( cos(theta), sin(theta) );
  verts[k] = R;
  axialshade( spike(theta), white, L*(1,1), deepcyan, L*(-1,-1) );
}

// draw tubes
path crossbeam;
axialshade( tube(), white, RG*(1,1), magenta, RG*(-1,-1) );
for ( int k=0; k<6; ++k ) {
  if (k<5) {
    crossbeam = scale(0.95)*(verts[k]--verts[k+1]) -- scale(1.05)*(verts[k+1]--verts[k]) -- cycle;
  } else {
    crossbeam = scale(0.95)*(verts[k]--verts[0]) -- scale(1.05)*(verts[0]--verts[k]) -- cycle;
  }
  axialshade( crossbeam,  white, L*(1,1), deepcyan, L*(-1,-1) );
  axialshade( tube(verts[k]), white, verts[k]+RG*(X+Y), magenta, verts[k]-RG*(X+Y) );
}


// all pau!   )
/* bbox(currentpicture, Fill, black); */
/* bbox(currentpicture, heavyblue); */
bbox(heavyblue, Fill);
