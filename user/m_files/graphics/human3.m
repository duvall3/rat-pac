function [ H ] = human3( S = 1 )

% [ H ] = human3( S = 1 ) -- generate / draw a "human for scale" stick figure
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

% draw and transform 2D human
H = human2(S);
view(3)
rotate(H, [1 0 0], 90.0, [0 0 0]);
for k = 1:length(H)
  set( H(k), 'xdata', get(H(k),'xdata')-S )
end

% adjust axis if necessary
leftlim = -1.5*S;
XLIM = xlim;
if ( XLIM(1) > leftlim )
  xlim([leftlim XLIM(2)])
endif

% enable camera rotation for mouse
rotate3d on

%% all pau!   )
%% endfunction
