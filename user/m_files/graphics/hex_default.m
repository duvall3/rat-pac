% hex -- base script for hex grid
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2022 ~ %
% NOTE: For the 16x16 array of 1"x10m tubes, the array dimensions are:
%   L   =   1.34 m
%   W   =   1.10 m
%   H   =  10.15 m
%   A_f =   1.48 m^2   % A_f = footprint area (i.e., just L*W)
%   V   =  15.01 m^3

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
% D = 25.4; %% SET SCALE: diameter in mm (for RAT-PAC compatibility)
D = .0254; %% SET SCALE: diameter in m
% D = .3; %% SET SCALE: diameter in m
S = 2 * D; % spacing
r = [1 1] * 0.5 * D; % tube radius
X = zeros(1,6);
Y = X;
L = 1000/2.54 * D; % tube height / tube diameter
% L = 10/2.54 * D; % tube height / tube diameter
% L = 10; % for development

% array size
maxrc_default = 16;
% b_maxrc = exist('maxrc');
% if b_maxrc ~= 0
%   maxrows = maxrc;
%   maxcols = maxrc;
% else
  maxrows = maxrc_default;
  maxcols = maxrc_default;
% endif


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
grid on
xlim([0 (row+1)*S])
ylim([0 (col+1)*S])
zlim([0 L+1])
set(ax, 'dataaspectratio', [1 1 1])
set(s, 'facealpha', 0.5)
set(s, 'linestyle', 'none')
whitebg;

% annotations
set(gca, 'fontsize', 18)
titstr = sprintf("FROST Array | %dx%d | Total Target Mass ~ 1.4 T", maxrows, maxcols);
T = title(titstr);
set(T, 'color', 'k')
set(T, 'fontsize', 24)
xlabel 'x (m)'
ylabel 'y (m)'
zlabel 'z (m)'

% add human for scale
H = human3();

% final adjustments
xlim([-1.5 1.0])
ylim([0 1])
% set(gca, 'xtick', [-1.5:0.5:1.0])
set(gca, 'xtick', [-1.0:1.0:1.0])
set(gca, 'ytick', [0:0.5:1.0])
% set(H, 'linewidth', 3.0)
disp("Recommend running the following line:\nset(f, 'position', [1240 70 660 870])")
set(T, 'fontsize', 18)
set(gca, 'fontsize', 12)

% enable camera rotation for mouse
rotate3d on

% all pau!   )
