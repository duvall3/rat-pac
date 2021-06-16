function [ps, pi, pc] = plot_g4_neutron_xs( Z, keV_tf = false )

% [ps, pi, pc] = plot_g4_neutron_xs( Z, keV_tf = false ) -- plot GEANT4 neutron-interaction cross-sections
%   for given element
% -- [pc, ps] are the graphics handles for the capture plot
%      and the elastic-scattering plot, respectively
% -- Z is the atomic number of the desired nucleus
% -- keV_tf: if true, plots energy in keV; otherwise, defaults to MeV
% -- optional isotope "I" argument (equal to isotope nuclear mass in amu)
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
inelastfile = sprintf("%s/inelast%d", datadir, Z);
cap = dlmread(capfile, '', 2, 0);
el = dlmread(elastfile, '', 2, 0);
inel = dlmread(inelastfile, '', 2, 0);

% prepare axis items
en_lim = [1e-9 1e5];
en_label = 'Neutron Energy (MeV)';
en_therm = (1/40)*1e-6;
en_reactor_low = 1e-3; % K_n = 1 keV
en_reactor_high = 1e-2; % K_n = 10 keV
xs_lim = [1e-30 1e-18];

% change MeV to keV if desired
if keV_tf == true
  el(:,1) = el(:,1)*1e3;
  inel(:,1) = inel(:,1)*1e3;
  cap(:,1) = cap(:,1)*1e3;
  en_lim = en_lim * 1e3;
  en_label = 'Neutron Energy (keV)';
  en_therm = en_therm*1e3;
  en_reactor_low = en_reactor_low*1e3;
  en_reactor_high = en_reactor_high*1e3;
endif

% MAIN
%f = figure;
ax = gca;
ps = plot(el(:,1), el(:,2), 'color', 'red', 'linewidth', 2);
hold on
pi = plot(inel(:,1), inel(:,2), 'color', 'cyan', 'linewidth', 2);
pc = plot(cap(:,1), cap(:,2), 'color', 'blue', 'linewidth', 2);
set(ax, 'xscale', 'log')
set(ax, 'yscale', 'log')

% annotations
Tstr = sprintf("Neutron Cross Sections for Z = %d", Z);
T = title(Tstr);
xlabel(en_label)
ylabel 'Cross Section (cm^{2})'
l_therm = line([en_therm en_therm], [xs_lim(1) xs_lim(2)], 'color', 'black', 'linewidth', 1, 'linestyle', ':');
p = patch( [en_reactor_low en_reactor_high en_reactor_high en_reactor_low], [xs_lim(2) xs_lim(2) xs_lim(1) xs_lim(1)], 'facecolor', [.5 .5 .5], 'facealpha', 0.2, 'edgecolor', 'none');
l = legend( [ps pi pc l_therm p], {'Elastic Scattering', 'Inelastic Scattering', 'Capture', 'Thermal Energy', 'Reactor Region'} );
set(ax, 'fontsize', 16)
set(l, 'fontsize', 14)

% adjust axes
set(gca, 'xlim', en_lim)
set(gca, 'ylim', xs_lim)
%ylm = get(gca, 'ylim');
%set(l_therm, 'ydata', [ylm(1) ylm(2)])
%set(p, 'ydata', [ylm(2); ylm(2); ylm(1); ylm(1)])

% all pau!   )
%endfunction
