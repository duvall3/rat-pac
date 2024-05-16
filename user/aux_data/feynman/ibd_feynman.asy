// ibd_feynman.asy -- Asymptote macro to draw Feynman diagram of inverse beta decay
// -- adapted from example eetomumu.asy on Asymptote project's web site


//// settings
bool kRaster = false;
//bool kRaster = true;
if (kRaster) {			// raster graphics
  settings.outformat="png";
  settings.render=2**3;
  //settings.render=2**4;
} else {			// vector graphics
  settings.outformat="eps";
  //settings.outformat="pdf";
  //settings.outformat="svg";
  settings.render=0;
}

//// init
import feynman;
defaultpen(fontsize(64pt));
currentpen = linewidth(1.0);
size(15.0cm,0);//,IgnoreAspect);
fmdefaults();


//// drawing

// define points
real L = 50;

// main diagram:
pair zl = (-0.75*L,0);
pair zr = (+0.75*L,0);

pair xu = zl + L*dir(+120);
pair xl = zl + L*dir(-120);

pair yu = zr + L*dir(+60);
pair yl = zr + L*dir(-60);

// for quarks:
path q1a = shift(+0.1*L,0) * (yl--zr);
path q1b = shift(+0.1*L,0) * (zr--yu);
path q2a = shift(+0.2*L,0) * (yl--zr);
path q2b = shift(+0.2*L,0) * (zr--yu);

// for time:
pair tl = (-1.5*L,-1.5*L);
pair tr = (-1.5*L,+1.5*L);

// draw vertices and propagators

drawFermion(zl--xl);
drawFermion(xu--zl);

drawFermion(q1a,linewidth(0.65));
drawFermion(q1b,linewidth(0.65));
drawFermion(q2a,linewidth(0.65));
drawFermion(q2b,linewidth(0.65));

//drawGhost(zl--zr);
drawPhoton(zl--zr);

drawFermion(zr--yu,linewidth(0.65));
drawFermion(yl--zr,linewidth(0.65)); 
drawVertex(zl);
drawVertex(zr);

// draw particle labels

label("$\overline{\nu_e}$", xl, SW, heavygreen);
label("$p$", yl, SE, black);

label("$e^+$", xu, NW, red);
label("$n$", yu, NE, heavyblue);

label("$W^+$", zl--zr, 1.5up, heavygray);

// indicate direction of time
drawMomArrow(tl--tr, 0.9*Relative(left));
label(Label("$t$", 1.8LeftSide), tl--tr);


// all pau!   )
