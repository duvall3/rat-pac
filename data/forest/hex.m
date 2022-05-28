% hexes -- base script for hex grid
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

% general init
f = figure;
ax = axes;
phi0 = deg2rad(60);
S = 2; % spacing
r = [1 1] * 0.5; % tube radius
X = zeros(1,6);
Y = X;
L = 1000/2.54; % tube height / tube diameter
% L = 10; %debug % for development

% array size
maxrows = 32;
maxcols = 32;

% dummy column
[x y z] = cylinder(r);
z = L * z;
% s0 = surfl(x,y,z);
hold on

% MAIN
for row = [1:maxrows]
  for col = [1:maxcols]
    if ( mod(row,2) == 0 )
      X(col) = S * col;
    else
      X(col) = S * col + S/2;
    endif
    Y(row) = S * row * sqrt(3)/2;
    s(row,col) = surfl( x + X(col), y + Y(row), z);
  end
end

% adjust plot
view(3)
% xlim([-1 1.5*row*S])
% ylim([-1 1.1*col*S])
xlim([-1 (row+1)*S])
ylim([-1 (col+1)*S])
zlim([-1 L+1])
set(ax, 'dataaspectratio', [1 1 1])
% set(s, 'facecolor', 'magenta')
set(s, 'facealpha', 0.5)
set(s, 'linestyle', 'none')

% annotations
titstr = sprintf("FOREST Array (%dx%d)", maxrows, maxcols);
T = title(titstr);
xlabel 'x (diameters)'
ylabel 'y (diameters)'
zlabel 'z (diameters)'


% all pau!   )
