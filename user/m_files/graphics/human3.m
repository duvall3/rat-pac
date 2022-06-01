function [ H ] = human3( S = 1 )

% [ H ] = human( S ) -- generate / draw a "human for scale" stick figure
% -- [ H ] is a vector of graphics handles
% -- S is a float value for the number of Octave units equal to 1 meter
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2022 ~ %

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

% init
currentfig = gcf;
currentax = gca;
hold on

% % main
% H(1) = circle(S,0,5*S);
% bodx = [0 0];
% body = bodx;
% bodz = [-1 -3];
% H(2) = line(bodx, body, bodz+5);
% legx = [0 -1];
% legy = legx;
% legz = [-3 -5];
% H(3) = line(legx, legy, legz+5);
% H(4) = line(-legx, legy, legz+5);
% armx = [0 -1];
% army = armx;
% armz = [-1 -2];
% H(5) = line(armx, army, armz+5);
% H(6) = line(-armx, army, armz+5);

% % adjust
% set(H(1), 'linewidth', 2)
% set(H(1), 'edgecolor', 'blue')
% set(H(2:end), 'color', 'blue')

% draw and transform 2D human
H = human2(S);
view(3)
rotate(H, [1 0 0], 90.0, [0 0 0]);
for k = 1:length(H)
  set( H(k), 'xdata', get(H(k),'xdata')-1*S )
end

% adjust axis if necessary
leftlim = -2*S;
XLIM = xlim;
if ( XLIM(1) > leftlim )
  xlim([leftlim XLIM(2)])
endif

% enable camera rotation for mouse
rotate3d on

%% all pau!   )
%% endfunction
