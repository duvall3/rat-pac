function [ P RSQ F H S ] = simple_polyfit( X, Y, N = 1, PLOT = true, XLA = 'x', YLA = 'y' )
% [ P RSQ F H S ] = simple_polyfit( X, Y, N = 1, PLOT = true, XLA = 'x', YLA = 'y' )
% Perform a simple polynomial fit on (X,Y) and plot if desired;
%    default is a linear fit modeled as Y = P(1)*X + P(2).
% -- Returns polynomial coefficients P suitable for use with polyval.
% -- If a second output is requested, returns an array of plot handles.
% -- If a third output is requested, returns a string summarizing the fit results.
% -- If a fourth output is requested, returns the coefficient of determination RSQ
% --   (i.e., R^2).
% -- If a fifth output is requested, returns the struct S; see polyfit for details.

% ~ Mark J. Duvall / T. Rocks Science ~ mjduvall@hawaii.edu ~ 07/2024 ~ %

## -*- texinfo -*-
## @deftypefn {Function File} { [ @var{P} @var{H} @var{RSQ} @var{S} ] =} simple_polyfit (@var{X}, @var{Y} [, @var{N}=1, @var{PLOT}=true} ] )
## Perform a simple polynomial fit on (X,Y) and plot if desired; default is a linear fit modeled as Y = P(1)*X + P(2).
##
## Returns polynomial coefficients @var{P} suitable for use with polyval.
##
## If a second output is requested, returns an array of plot handles.
##
## If a third output is requested, returns the coefficient of determination @var{RSQ} (i.e., R^2).
##
## If a fourth output is requested, returns the struct @var{S}; see polyfit for details.
##
## @end deftypefn

% init
H = [];

% perform fit
[P S] = polyfit(X, Y, N);

% coefficient of determination (i.e., R^2)                                         
SSe = sumsq(Y - S.yf);                                                           
SSt = sumsq(Y - mean(Y));                                                      
RSQ = 1 - SSe/SSt;                                                                 

% basic fit information
F = '\nBasic Fit Information:\n';
F = [F sprintf('P = \n')];
F = [F sprintf('  %g\n', P)];
F = [F sprintf('R^2 = %f\n', RSQ)];
F = [F '\n'];
printf(F);

% plot if desired
if PLOT
  f = figure;
  ax = axes;
  H(1) = plot( X, Y, 'ob' );
  grid on
  hold on
  XL = xlim;
  XX = linspace(XL(1), XL(2), 1000);
  YY = polyval(P, XX);
  H(2) = plot( XX, YY, 'r' );
  title 'Simple Polynomial Fit';
  xlabel(XLA);
  ylabel(YLA);
  l = legend( H, {'Data  ', 'Fit  '}, 'location', 'northwest' );
endif

% all pau!   )
endfunction
