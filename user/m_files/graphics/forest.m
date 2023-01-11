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

% options
% whether to label in meters or
if ~exist('LABEL_IN_METERS')
  LABEL_IN_METERS=false;
  % LABEL_IN_METERS=true;
endif
% whether to draw a stick figure for scale
if ~exist('DRAW_HUMAN')
  DRAW_HUMAN=false;
  % DRAW_HUMAN=true;
endif

% general init
f = figure;
ax = axes;
% array_length = 4; % number of tubes along {x,y}
% array_length = 8; % number of tubes along {x,y}
array_length = 16; % number of tubes along {x,y}
phi0 = deg2rad(60);
R = 4; % spacing (radii)
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
grid on
grid minor on

% annotations
% T = title('Glass-Tube Hex Array');
T = title('Glass-Tube Array | 16x16 | Total Target Mass \sim 1.3 T');
if DRAW_HUMAN
  H = human3(100);
endif
if LABEL_IN_METERS
  if DRAW_HUMAN
    xlim([-2. 2.2]*100)
    ylim([-.1 1.6]*100)
    set(ax, 'xtick', [-2:1:2]*100)
    set(ax, 'ytick', [0:.5:1.5]*100)
  else
    xlim([-.1 1.5]*100) %KEEPME
    ylim([-.1 1.5]*100) %KEEPME
    set(ax, 'xtick', [-10 125]) %KEEPME
    set(ax, 'ytick', [-10 125]) %KEEPME
    set(s, 'linewidth', 5)
  endif
  for prop = {'xticklabel' 'yticklabel' 'zticklabel'}
    tick_labels = get(ax, prop);
    for k = 1:length(tick_labels{1})
      tick_labels{1}{k} = num2str( str2num(tick_labels{1}{k})/100 );
    end
    set(ax, prop, tick_labels)
  end
  xla = xlabel('x (m)');
  yla = ylabel('y (m)');
  zla = zlabel('z (m)');
else
  xla = xlabel('x (cm)');
  yla = ylabel('y (cm)');
  zla = zlabel('z (cm)');
  %TEMP, FOR TOP VIEW:
  view(2)
  set(s, 'linewidth', 3)
  set(T, 'string', "Hexagonal Array of Scintillator-Filled 1'' Glass Tubes");
  xlim([-.05 .48]*100)
  ylim([-.05 .38]*100)
  XC = mean( [min(XX) max(XX)] );
  YC = mean( [min(YY) max(YY)] );
  eoff = S*0.2*(3:5);
  CX = plot( max(max(XX))+eoff, YC*ones(size(eoff)), 'k');
  CY = plot( XC*ones(size(eoff)), max(max(YY))+eoff, 'k');
  set([CX CY], 'linestyle', 'none', 'marker', '.', 'markersize', 24)
endif

% all pau!   )
