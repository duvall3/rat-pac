function [ps, pc] = plot_g4_neutron_xs( Z )

% [ps, pc] = plot_g4_neutron_xs( Z ) -- plot GEANT4 neutron-interaction cross-sections
%   for given element
% -- [pc, ps] are the graphics handles for the capture plot
%      and the elastic-scattering plot, respectively
% -- Z is the atomic number of the desired nucleus
% -- optional isotope "I" argument (equal to nuclear mass in amu)
%      may be added in the future
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/21 ~ %


%Copyright (C) 2021 Mark J. Duvall
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

% filesystem operations
[status, datadir] = system("echo -n $G4NEUTRONXSDATA");
if isempty(datadir)
  disp "Error: Environment variable $G4NEUTRONXSDATA not found. Were environment scripts sourced?"
  return
endif
capfile = sprintf("%s/cap%d", datadir, Z);
elastfile = sprintf("%s/elast%d", datadir, Z);
cap = dlmread(capfile, '', 2, 0);
el = dlmread(elastfile, '', 2, 0);

% MAIN
%f = figure;
ax = gca;
ps = plot(el(:,1), el(:,2), 'color', 'red', 'linewidth', 2);
hold on
pc = plot(cap(:,1), cap(:,2), 'color', 'blue', 'linewidth', 2);

% annotations
Tstr = sprintf("Neutron Cross Sections for Atomic Number = %d", Z);
T = title(Tstr);
xlabel 'Neutron Energy (MeV)'
ylabel 'Cross Section (cm^{2})'
set(ax, 'fontsize', 16)
l = legend( [ps pc], {'Elastic Scattering', 'Capture'} );
set(l, 'fontsize', 14)

% adjust axes
set(ax, 'xscale', 'log')
set(ax, 'yscale', 'log')
set(gca, 'xlim', [1e-7 1e5]); %MeV
%set(gca, 'ylim', [1e-29 1e-19]); %cm^2 %%FIXME
% all pau!   )
%endfunction
