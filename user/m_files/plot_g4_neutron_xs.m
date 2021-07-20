function [ ] = plot_g4_neutron_xs( Z )
%function [ ] = plot_g4_neutron_xs( Z, color = 'blue', prev_handles = [], keV_tf = true )

% [pes, pis, pc] = plot_g4_neutron_xs( Z, keV_tf = true ) -- plot GEANT4 neutron-interaction cross-sections
%   for given element
% -- [pes, pis, pc] are the graphics handles for the elastic-scattering plot,
%      the inelastic-scattering plot, and the capture plot, respectively
% -- Z is the atomic number of the desired nucleus
% -- keV_tf: if true, changes energy units to keV; otherwise, defaults to MeV
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

% filesystem init
[status, datadir] = system("echo -n $G4NEUTRONXSDATA");
if isempty(datadir)
  disp "Error: Environment variable $G4NEUTRONXSDATA not found. Were environment scripts sourced?"
  return
endif
[status2, datadir_basename] = system("basename $G4NEUTRONXSDATA");

% prepare axis items
en_lim = [1e-9 1e5];
en_label = 'Neutron Energy (MeV)';
en_therm = (1/40)*1e-6;
en_reactor_low = 1e-3; % K_n = 1 keV
en_reactor_high = 1e-2; % K_n = 10 keV
xs_lim = [1e-30 1e-18];
% switch to keV
en_lim = en_lim * 1e3;
en_label = 'Neutron Energy (keV)';
en_therm = en_therm*1e3;
en_reactor_low = en_reactor_low*1e3;
en_reactor_high = en_reactor_high*1e3;

% plot prep
f = figure;
ax = axes('xlim', en_lim, 'ylim', xs_lim, 'xscale', 'log', 'yscale', 'log');
set(gcf, 'name', 'GEANT4 Neutron Cross-Section Data');
hold on
l_es = line( [en_lim(1) en_lim(1)], [xs_lim(1) xs_lim(1)], 'color', 'black' );
l_is = line( [en_lim(1) en_lim(1)], [xs_lim(1) xs_lim(1)], 'linestyle', ':', 'color', 'black' );
l_cap = line( [en_lim(1) en_lim(1)], [xs_lim(1) xs_lim(1)], 'linestyle', '--', 'color', 'black' );
set( [l_es l_is l_cap], 'visible', 'off')
l_therm = line([en_therm en_therm], [xs_lim(1)*.1 xs_lim(2)*10], 'color', 'black', 'linewidth', 1, 'linestyle', ':');
p = patch( [en_reactor_low en_reactor_high en_reactor_high en_reactor_low], [xs_lim(2)*10 xs_lim(2)*10 xs_lim(1)*.1 xs_lim(1)*.1], 'facecolor', [.5 .5 .5], 'facealpha', 0.2, 'edgecolor', 'none');
legend_items = [l_es l_is l_cap l_therm p];
legend_names = {'Elastic Scattering', 'Inelastic Scattering', 'Capture', 'Thermal Energy', 'Reactor Region'};

% labels
Tstr = sprintf("Neutron Cross Sections from %s", datadir_basename);
T = title(Tstr);
xlabel(en_label)
ylabel 'Cross Section (cm^{2})'
set(ax, 'fontsize', 16)
colorlist = 'brmgc';
icolor = 1;

% MAIN
for z = Z
  % read data
  capfile = sprintf("%s/cap%d", datadir, z);
  elastfile = sprintf("%s/elast%d", datadir, z);
  inelastfile = sprintf("%s/inelast%d", datadir, z);
  cap = dlmread(capfile, '', 2, 0);
  el = dlmread(elastfile, '', 2, 0);
  inel = dlmread(inelastfile, '', 2, 0);
  % switch to keV
  el(:,1) = el(:,1)*1e3;
  inel(:,1) = inel(:,1)*1e3;
  cap(:,1) = cap(:,1)*1e3;
  % remove non-plottable data
  cap(isnan(cap(:,2)),:) = [];
  el(isnan(el(:,2)),:) = [];
  inel(isnan(inel(:,2)),:) = [];
  cap(cap(:,2)<=0,:) = [];
  el(el(:,2)<=0,:) = [];
  inel(inel(:,2)<=0,:) = [];
  % make plots
  pes = plot(el(:,1), el(:,2), 'linewidth', 2);
  pes_label = sprintf('Z = %d', z);
  set(gca, 'ylim', xs_lim)
  pis = plot(inel(:,1), inel(:,2), 'linewidth', 2, 'linestyle', ':');
  pc = plot(cap(:,1), cap(:,2), 'linewidth', 2, 'linestyle', '--');
  set( [pes pis pc], 'color', sprintf('%s', colorlist(icolor)))
  icolor += 1;
  legend_items(end+1) = pes;
  legend_names(end+1) = pes_label;
end
%set(ax, 'xscale', 'log')
%set(ax, 'yscale', 'log')

% legend
l = legend( legend_items, legend_names, 'location', 'northeastoutside' );

% adjust axes
%set(gca, 'xlim', en_lim)
%set(gca, 'ylim', xs_lim)
% workaround
disp "To fix the axes, run the following command: set(gca, 'ylim', [1e-30 1e-18])"

% all pau!   )
%endfunction
