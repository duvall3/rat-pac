// santa -- basic rendering of SANTA geometry
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2023 ~ //

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

// basic settings
bool kOutputPNG = true;
//bool kOutputPNG = false;
bool kBlackBG = true;
//bool kBlackBG = false;
if (kOutputPNG) {
  settings.outformat = "png";
  //settings.render = 2**2;
  settings.render = 2**3;
} else {
  settings.outformat = "eps";
  //settings.outformat = "svg";
  settings.render = 0;
}
// modules
import three;
import solids;
// general
pen bgcolor, textcolor, reconcolor;
if (kBlackBG) {
  bgcolor = defaultpen+black;
  textcolor = defaultpen+white;
  reconcolor = defaultpen+cyan;
} else {
  bgcolor = defaultpen+white;
  textcolor = defaultpen+black;
  reconcolor = defaultpen+magenta;
}
size(100,0);
triple cameraVector = (0.4, 1., 0.3);
currentprojection = orthographic(cameraVector);
currentlight.position = reflect(O, Y, Z)*currentlight.position;
//currentlight.position = unit(cameraVector);
//write(currentlight.position); //debug
currentlight.background = bgcolor;
pen dfPen = defaultpen+textcolor;
pen labelPen = dfPen;
pen refPen = dfPen+gray+opacity(0.35);
//pen refPen = dfPen+gray;//+opacity(0.35);
pen planePen = dfPen+opacity(0.75);
//pen anglePen = dfPen+dashed;
pen anglePen = dfPen+reconcolor+linetype(new real[] {4,4});
pen anglePen2 = dfPen+dotted;


//// MAIN

// init
// dimensions
real SCALE = 1.e-2;	 	// overall scale adjustment
real S =   2000.*SCALE; // mm	// side length
real D =   1000.*SCALE; // mm 	// plane separation
real tt =     5.*SCALE; // mm 	// target-plane thickness
real tc =    60.*SCALE; // mm 	// capture-plane thickness
real axl = 2000.*SCALE; // mm 	// length of axis indicators
triple phic = Z*axl*3/4; // center of arc for phi
// solids
surface floor = shift(-X*S-Y*S-Z*S/2)*scale(2*S,2*S,1)*unitplane;
surface xy = shift(-X*S-Y*S)*scale(2*S,2*S,1)*unitplane;
surface xz = rotate(90., X)*xy;
surface yz = rotate(90., Y)*xy;
surface xzSmall = rotate(90.,X)*scale(S,S,1)*unitplane;
surface pt = shift(+X*D/2-Y*S/2-Z*S/2)*scale(tt,S,S)*unitcube;
surface pc = shift(-X*D/2-Y*S/2-Z*S/2)*scale(tc,S,S)*unitcube;
// arcs
real thetaSplit = 60.;
real phiSplit = 96.;
path3 theta = arc(O, 0.9*axl, 0., 0., thetaSplit, 0., Y);
path3 theta2 = arc(O, 0.9*axl, thetaSplit, 0., 90., 0., Y);
path3 phi = shift(phic)*arc(O, 0.2*axl, 90., 0., 90., phiSplit, Z);
path3 phi2 = shift(phic)*arc(O, 0.2*axl, 90., phiSplit, 90., 360., Z);
// label dots
triple ptm = (+1.5*D,-1.*S,-.5*S);
triple pcm = (-0.0*D,+0.*S,-.7*S);
// circled "X" for phi arrow begin
path3[] circX = X .. Y .. -X .. -Y .. cycle ^^ scale3(sqrt(2)/2.)*(-X+Y -- X-Y ^^ X+Y -- -X-Y);
circX = shift(point(phi,0))*rotate(90.,X)*scale3(0.025*axl)*circX;

// draw
// axes
currentpen = dfPen;
dot(O);
draw(Label("$x$", EndPoint), scale3(axl)*(O--X), ArcArrow3(TeXHead3));
draw(Label("$y$", EndPoint), scale3(axl)*(O--Y), ArcArrow3(TeXHead3));
draw(Label("$z$", EndPoint), scale3(axl)*(O--Z), ArcArrow3(TeXHead3));
//currentpen = dfPen+dashdotted;
//draw(scale3(axl/2.)*(O -- -X));
//draw(scale3(axl/2.)*(O -- -Y));
//draw(scale3(axl/2.)*(O -- -Z));
// references
//draw(floor, gray);
//draw(xy, refPen);
//draw(xz, refPen);
//draw(yz, refPen);
draw(xzSmall, refPen);
// detector planes
draw(pt, planePen+red);
draw(pc, planePen+blue);
dot(scale(0.4)*Label("Target Plane", labelPen+red), ptm, labelPen+opacity(0.0));
dot(scale(0.4)*Label("Capture Plane", labelPen+blue), pcm, labelPen+opacity(0.0));
// angle definitions
draw(Label("$\theta$", EndPoint, LeftSide), theta, anglePen, ArcArrow3);
draw(Label("$\varphi$", EndPoint, NE), phi,  anglePen, ArcArrow3);//, BeginBar3(X+Z));
//draw(phi, gray+solid, arrow=None, BeginBar3(3.5,X+Z));
//draw(phi, gray+solid, arrow=None, BeginBar3(3.5,X-Z));
//draw(circX, reconcolor);
dot(point(phi,0), reconcolor);
draw(theta2, anglePen2);
draw(phi2,   anglePen2);


// all pau!   )
