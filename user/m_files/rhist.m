function [ h ] = rhist( Q, X = 100, kGraphics = true )
% function to imitate a ROOT-style histogram
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 07/2022 ~ %

%Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.

% init and arg check
% check data dimensions
if ~isvector(Q)
  error('Input Q must be a vector; currently only 1-D histograms are suppoerted.');
endif
% init struct
h = struct('handle', [], ...
  'binContents', [], ...
  'xBins', [], ...
  'Entries', [], ...
  'Mean', [], ...
  'RMS', []);
% check bin dimensions
if isscalar(X)
  h.xBins = linspace(min(Q), max(Q), X);
elseif isvector(X)
  h.xBins = X;
else
  error('Argument X must be a scalar or a vector.');
endif

% main
h.Entries = length(Q);
h.Mean = mean(Q);
h.RMS = std(Q);
h.binContents = hist( Q, h.xBins );

% graphics
% Note: Adding an extra 'point' at the end of the plot simply because
%   the 'stairs' function draws its horizontal segment before its vertical segment;
%   otherwise the plotting line would just be 'h.handle = stairs(h.xBins, h.binContents)',
%   as one might expect
if kGraphics
  fh = figure('position', [1000 440 900 500]);
  ah = axes('fontsize', 20);
  stairsBin = struct( 'X', h.xBins(end)+mean(gradient(h.xBins)), 'Y', h.binContents(end) );
  h.handle = stairs( [h.xBins stairsBin.X], [h.binContents stairsBin.Y] );
  xlim([h.xBins(1) stairsBin.X])
  ylim([0 1.1*max(h.binContents)])
  title 'htemp';
  statPos = [.8 .825 .9 .9];
  statStr = sprintf("\n Entries   %d \n Mean   %f \n RMS   %f \n", h.Entries, h.Mean, h.RMS);
  stats = annotation('textbox', statPos);
  set(stats, 'string', statStr)
  set(stats, 'fontsize', 18)
  set(stats, 'fontweight', 'bold')
  set(stats, 'fitboxtotext', 'on')
  set(stats, 'horizontalalignment', 'center')
  set(stats, 'backgroundcolor', get(gca, 'color'))
endif

% all pau!   )
