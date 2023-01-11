% forest -- draw glass-tube forest
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

% NOTE: Length units are (nominally) in cm

% general init
f = figure;
ax = axes;
array_length = 8; % number of tubes along {x,y}
phi0 = deg2rad(60);
R = 3; % spacing (radii)
r = [1 1] * 2.54; % tube radius
S = R * r(2); % spacing (absolute)
L = 10*1.e2; % 10m -> cm


% column prototype
[x y z] = cylinder(r);
z = L * z;
s0 = surfl(x,y,z);
hold on
set(ax, 'dataaspectratio', [1 1 1])
set(s0, 'visible', 'off')

% MAIN
% prepare hex grid
X = S * (0:array_length-1);
Y = X * sin(phi0);
[XX YY] = meshgrid(X,Y);
for k=1:array_length
  XX(k,:) = XX(k,:) + S*cos(phi0)*mod(k+1,2);
end
% plot tubes
for kx = 1:array_length
  for ky = 1:array_length
    s(kx,ky) = surfl( x+XX(kx,ky), y+YY(kx,ky), z );
  end
end

% % debug
% sc = scatter(XX,YY,'markerfacecolor','c');
% for kx = 1:array_length
%   for ky = 1:array_length
%     hc(kx,ky) = circle(r(2), XX(kx,ky), YY(kx,ky));
%   end
% end

% adjust plot
xlim([0 1]*S*(array_length+1)-S)
ylim([0 1]*S*(array_length+1)-S)
zlim([-1 L+1])
% set(s, 'facecolor', 'c')
set(s, 'edgecolor', 'c')
set(s, 'facealpha', 0.5)
title 'Glass-Tube Hex Array'
xlabel 'x (cm)'
ylabel 'y (cm)'
zlabel 'z (cm)'


% all pau!   )
