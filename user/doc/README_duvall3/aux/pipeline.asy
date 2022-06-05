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
// settings
size(1000,1000);
import flowchart;
import fontsize;
settings.outformat="pdf";
/* settings.outformat="eps"; */
settings.render=0;
currentpen = linewidth(1.0);
// init:
// origin and unit vectors
pair O = (0,0);
pair X = (1,0), Y = (0,1);
// for title and hrules
pair titr = (-2., 6.5);
real[] hrx = {-8.0, 4.0};
real[] hry = {5.8, 3.1};
// for key blocks and lines
int n_keyblocks = 5;
real ky = 4.5;
real kx_low = -7.0, kx_high= 2.8;
real[] kx = uniform(kx_low, kx_high, n_keyblocks-1);
pair[] K = new pair[n_keyblocks];
for ( int i=0; i<kx.length; ++i ) {
  K[i] = (kx[i], ky);
}
real karrlen = 1.00;
transform karrl = shift(-karrlen,-0.3);
transform karrr = shift(karrlen,-0.3);


// // top matter
// title
label("Simulation and Analysis Pipeline", titr, currentpen+fontsize(48pt));
// hrule
draw( (hrx[0],hry[0]) -- (hrx[1],hry[0]), currentpen+linewidth(3.0));
// key
block krr = parallelogram("\texttt{PROGRAM}", K[0]);
block ksh = diamond(pack(Label("\texttt{master}"), Label("\texttt{script}")), K[1]);
block kdir = circle("directory/", K[2]);
block kasc = bevel("ASCII file", K[3]+0.6Y);
block kroot = rectangle("ROOT file", K[3]);
block kpng = roundrectangle("PNG file", K[3]-0.6Y);
path ksc = karrl*K[4]+0.5Y -- karrr*K[4]+0.5Y;
path krm = karrl*K[4]-0.5Y -- karrr*K[4]-0.5Y;
draw(krr);
draw(ksh);
draw(kdir);
draw(kasc);
draw(kroot);
draw(kpng);
draw(ksc, arrow=Arrow(TeXHead,3.));
draw(krm, arrow=Arrow(TeXHead,3.));
label("\texttt{shell command}", ksc, 4N+0.3W);
label("\textit{ROOT macro}", krm, 4N+0.3W);
// hrule
draw( (hrx[0],hry[1]) -- (hrx[1],hry[1]) );


// // definitions

// blocks
block ratrun = diamond("\texttt{ratrun.sh}", O);
block dir = circle("DAT/", -X+1.5Y);
block runmac = bevel("run.mac", +1.15X+1.5Y);
block conf = bevel("DAT.conf", -1.5Y);
block root = rectangle("DAT.root", +2X-1.5Y);
block log = bevel("DAT.log", -2X-Y);
block enrt = bevel("DAT\_energies.rt", -2X-2Y);
block enT = rectangle("DAT\_energies\_T.root", -2X-3Y);
block T = rectangle("DAT\_T.root", +2X-3Y);
block T2 = rectangle("DAT\_T.root", -4Y);
block png1 = roundrectangle("Plots 1-3", +3X-5Y);
block res = rectangle("DAT\_results.root", -6Y);
block png2 = roundrectangle("Plots 4-6", +3X-7Y);
block res2 = rectangle("DAT\_results.root", -8Y);
block ratrun2 = parallelogram("\texttt{ RATRUN }", -7.5X-0.15Y);

// groupings
// bash
pair b0 = -3.85X+2.1Y;
pair b1 =  4.50X+2.1Y;
pair b2 =  4.50X-2.33Y;
pair b3 = -3.85X-2.33Y;
path b = b0 -- b1 -- b2 -- b3 -- cycle;
// duvallAnalyzePrep
pair dap0 = -3.85X-2.40Y;
pair dap1 =  4.50X-2.40Y; 
pair dap2 =  4.50X-4.50Y;
pair dap3 = -3.85X-4.50Y;
path dAP = dap0 -- dap1 -- dap2 -- dap3 -- cycle;
// duvallAnalyze
pair da0 = -3.85X-4.60Y;
pair da1 =  4.50X-4.60Y;
pair da2 =  4.50X-8.35Y;
pair da3 = -3.85X-8.35Y;
path dA = da0 -- da1 -- da2 -- da3 -- cycle;
// duvallAnalyzeFull
path dAFb = brace(dap0, da3);
transform dAFT = shift(-2.0X) * reflect(relpoint(dAFb,0.),relpoint(dAFb,1.));
path dAF = dAFT * dAFb;


// // drawing

// blocks
draw(ratrun);
draw(conf);
draw(dir);
draw(runmac);
draw(root);
draw(log);
draw(enrt);
draw(enT);
draw(T);
draw(T2);
draw(png1);
draw(res);
draw(png2);
draw(res2);
draw(ratrun2);

// groupings
draw(b, dashed);
draw(dAP, dashed);
draw(dA, dashed);
draw(dAF);

// additional annotations
label("\textit{duvallAnalyzePrep}", dap0--dap3, 2W);
label("\textit{duvallAnalyze}", da0--da3, 2W);
label("\textit{duvallAnalyzeFull}", dAF, 4W);
path inbash = -6.85X-.15Y -- -4.00X-.15Y;
path inroot = -7.5X-.40Y -- -7.5X-5.1Y;
draw(inbash, dashed, arrow=Arrow(TeXHead,3.));
draw(inroot, dashed, arrow=Arrow(TeXHead,3.));
label("within \texttt{BASH}", inbash, 2N);
label("calling \texttt{ROOT}", inroot, 2W);


// // chart
add(new void(picture pic, transform t) {
    blockconnector operator --=blockconnector(pic,t);
  ratrun--Up--Left--Label("\texttt{mkdir}",.5,2W)--Arrow--dir;
  ratrun--Up--Right--Label("\texttt{echo}",.5,2E)--Arrow--runmac;
  ratrun--Down--Label("\texttt{conflog.sh}",.5,2E)--Arrow--conf;
  ratrun--Right--Label("\texttt{rat}",1.,2E)--Down--Arrow--root;
  ratrun--Left--Label("\texttt{rat}",1.,2W)--Down--Arrow--log;
  log--Down--Label("\texttt{awk}",.45,2W)--Arrow--enrt;
  enrt--Down--Label("\textit{rt\_to\_root}",.55,2W)--Arrow--enT;
  root--Down--Label("\textit{particleTracksToScint}",.8,2E)--Arrow--T;
  T--Down--Left--Label("\textit{correctEnergies}",1.,2E)--Arrow--T2;
  enT--Down--Right--Label("\textit{correctEnergies}",1.,2W)--Arrow--T2;
  T2--Down--Right--Arrow--png1;
  T2--Down--Label("\textit{SEDAQ2}",.5,4W)--Arrow--res;
  res--Down--Right--Arrow--png2;
  res--Down--Label("\textit{angularRecon}",.5,4W)--Arrow--res2;
});


// // all pau!   )
shipout(bbox(2cm));
