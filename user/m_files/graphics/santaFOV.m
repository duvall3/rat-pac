function [ H ] = santaFOV( ANGLE, INVCOL = false )
% H = santaFOV ( ANGLE ) -- function to illustrate SANTA's field of view
% -- ANGLE is the 'bonus' rotation to the default half-aperture 45-degree FOV cone
% -- INVCOL indicates whether to invert the colors
% -- H is a vector of handles as follows (see below): H = [targ taro cap capx sc]
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ %

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
f = figure('position', 800*[1 .1 1 1]);
a = axes('fontsize', 16, 'view', [70 20], 'dataaspectratio', [1 1 1]);
rotate3d on
grid on
hold on
xlim([-1500 600]); ylim(3500*[-1 1]); zlim(3500*[-1 1]);

% planes
targ = drawpixel( [500 0 0], 'x', 2000, 'm' );
cap = drawpixel( [-500 0 0], 'x', 2000, 'r' );
capx = drawpixel( [-500 0 0], 'x', 6000, 'r' );
% alternate target plane, outline-only
taro1 = line(500*[1 1], 1000*[1 1], 1000*[-1 1]);
taro2 = line(500*[1 1], 1000*[1 1], 1000*[-1 1]);
taro3 = line(500*[1 1], 1000*[1 1], 1000*[-1 1]);
taro4 = line(500*[1 1], 1000*[1 1], 1000*[-1 1]);
taro = [taro1 taro2 taro3 taro4];
set(taro, 'linewidth', 3.)
for k = 2:4
  rotate(taro(k), [1 0 0], 90*(k-1), 500*[1 0 0])
end

% cones
[cy cz cx] = cylinder([0 2000]);
cx = flip(cx)*2000 - 1500;
sc0 = surf(cx, cy, cz);
scu = surf(cx, cy, cz);
scl = surf(cx, cy, cz);
scr = surf(cx, cy, cz);
scd = surf(cx, cy, cz);
sc = [sc0 scu scl scr scd];
% patches for cone legends
fov_i = drawpixel( [0 0 1.1*max(zlim())], 'z', 1, 'g' );
fov_f = drawpixel( [0 0 1.2*max(zlim())], 'z', 1, 'b' );

% FOV expansion
% ANGLE = 45./3.; % promoted to input argument
rotate(scu, [0 1 0], ANGLE, [500 0 0])
rotate(scl, [0 0 1], ANGLE, [500 0 0])
rotate(scr, [0 0 1], -ANGLE, [500 0 0])
rotate(scd, [0 1 0], -ANGLE, [500 0 0])

% adjust colors
set(targ, 'facecolor', 'none') % drawing border instead (taro)
set(sc, 'facecolor', 'y')
set(sc0, 'facecolor', 'm')
set([targ cap], 'facealpha', 0.8)
set(sc, 'facealpha', 0.5)
set([sc capx], 'edgealpha', 0)
set(capx, 'facealpha', 0.25)
set(taro, 'color', 'g')
set(taro, 'color', 'g')
set([cap capx], 'facecolor', 'c')
set(sc(2:end), 'facecolor', 'y')
set(fov_i, 'facecolor', 'm')
set(fov_f, 'facecolor', 'y')

% annotations
titstr = sprintf( "SANTA FOV, Expanded by %.1f^{o}", ANGLE );
T = title(titstr);
xlabel 'x (mm)'; ylabel 'y (mm)'; zlabel 'z (mm)';
leg_obj = [taro1 cap fov_i fov_f];
leg_lab = {'Target Plane', 'Capture Plane', 'Original FOV', 'Expanded FOV'};
leg = legend(leg_obj, 'location', 'northeast');
set(leg, 'string', leg_lab)

% color inversion
if (INVCOL)
  set(f, 'color', 'k')
  set(a, 'color', 'k')
  set(a, 'xcolor', 'w')
  set(a, 'ycolor', 'w')
  set(a, 'zcolor', 'w')
  set(leg, 'color', 'k')
  set(leg, 'textcolor', 'w')
  set(T, 'color', 'w')
endif

% all pau!   )
H = [targ taro cap capx sc];
