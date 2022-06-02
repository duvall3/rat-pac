// pipeline.asy -- Asymptote macro to draw simulation and analysis pipeline
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ //

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

// // setup
size(600,600);
import flowchart;
settings.outformat="pdf";
settings.render=0;
currentpen = linewidth(1.0);


// // definitions

// origin and unit vectors
pair O = (0,0);
pair X = (1,0), Y = (0,1);

// blocks
block ratrun = diamond("\textit{ratrun.sh}", O);
block conf = bevel("DAT.conf", O+1.5Y);
block root = rectangle("DAT.root", O+2X-1.5Y);
block log = bevel("DAT.log", O-2X-Y);
block enrt = bevel("DAT\_energies.rt", O-2X-2Y);
block enT = rectangle("DAT\_energies\_T.root", O-2X-3Y);
block T = rectangle("DAT\_T.root", O+2X-3Y);
block T2 = rectangle("DAT\_T.root", O-4Y);
block png1 = roundrectangle("Plots 1-3", O+3X-5Y);
block res = rectangle("DAT\_results.root", O-6Y);
block png2 = roundrectangle("Plots 4-6", O+3X-7Y);
block res2 = rectangle("DAT\_results.root", O-8Y);


// // drawing

// items
draw(ratrun);
draw(root);
draw(log);
draw(enrt);
draw(enT);
draw(T);
draw(T2);
draw(png1);
draw(res);
draw(conf);
draw(png2);
draw(res2);
label("\textit{correctEnergies}", O-3.5Y);

// chart
add(new void(picture pic, transform t) {
    blockconnector operator --=blockconnector(pic,t);
  ratrun--Up--Arrow--conf;
  ratrun--Right--Down--Arrow--root;
  ratrun--Left--Down--Arrow--log;
  log--Down--Label("\texttt{AWK}",.45,2W)--Arrow--enrt;
  enrt--Down--Label("\textit{rt\_to\_root}",.45,2W)--Arrow--enT;
  root--Down--Label("\textit{particleTracksToScint}",.45,2E)--Arrow--T;
  /* T--Down--Left--Label("\textit{correctEnergies}",.45,2E)--Arrow--T2; */
  /* enT--Down--Right--Label("\textit{correctEnergies}",.45,2W)--Arrow--T2; */
  T--Down--Left--Arrow--T2;
  /* enT--Down--Right--Arrow--T2; */
  enT--Down--Label("\textit{particleTracksToScint}",.45,2W,white)--Right--Arrow--T2;
  T2--Down--Right--Arrow--png1;
  T2--Down--Label("\textit{SEDAQ2}",.5,4W)--Arrow--res;
  res--Down--Right--Arrow--png2;
  res--Down--Label("\textit{angularRecon}",.5,4W)--Arrow--res2;
});


// all pau!   )
shipout(bbox(1cm));
