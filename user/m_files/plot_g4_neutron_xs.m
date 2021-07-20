function [ handle_array ] = plot_g4_neutron_xs( Z )

% [ handle_array ] = plot_g4_neutron_xs( Z )
% -- Z is the atomic number of the desired nucleus
% -- handle_array is an Nx3 matrix, where N is the number of elements in Z;
%      each row contains the plot handles [ el_scat inel_scat cap ]
% -- optional isotope "I" argument (equal to isotope nuclear mass in amu)
%      may be added in the future
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/21 ~ %

%function [ ] = plot_g4_neutron_xs( Z, color = 'blue', prev_handles = [], keV_tf = true )
% [pes, pis, pc] = plot_g4_neutron_xs( Z, keV_tf = true ) -- plot GEANT4 neutron-interaction cross-sections
%   for given element
% -- [pes, pis, pc] are the graphics handles for the elastic-scattering plot,
%      the inelastic-scattering plot, and the capture plot, respectively
% -- keV_tf: if true, changes energy units to keV; otherwise, defaults to MeV


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
en_reactor_low = 1e-3; % K_n ~ 10^1 keV
en_reactor_high = 1e-1; % K_n ~ 10^2 keV
xs_lim = [1e-30 1e-18];
% switch to keV
en_lim = en_lim * 1e3;
en_label = 'Neutron Energy (keV)';
en_therm = en_therm*1e3;
en_reactor_low = en_reactor_low*1e3;
en_reactor_high = en_reactor_high*1e3;

% plot prep
f = figure('position', [720 240 1200 720]);
ax = axes('xscale', 'log', 'yscale', 'log');
set(ax, 'fontsize', 20, 'titlefontsizemultiplier', 1.3)
set(gcf, 'name', 'GEANT4 Neutron Cross-Section Data')
hold on
l_es = line( [en_lim(1) en_lim(1)], [xs_lim(1) xs_lim(1)], 'color', 'black' );
l_is = line( [en_lim(1) en_lim(1)], [xs_lim(1) xs_lim(1)], 'linestyle', ':', 'color', 'black' );
l_cap = line( [en_lim(1) en_lim(1)], [xs_lim(1) xs_lim(1)], 'linestyle', '--', 'color', 'black' );
l_none = line( [en_lim(1) en_lim(1)], [xs_lim(1) xs_lim(1)], 'color', 'none' );
set( [l_es l_is l_cap l_none], 'visible', 'off')
l_therm = line([en_therm en_therm], [xs_lim(1)*.1 xs_lim(2)*10], 'color', [.5 .5 .5], 'linewidth', 2, 'linestyle', '-.');
p = patch( [en_reactor_low en_reactor_high en_reactor_high en_reactor_low], [xs_lim(2)*10 xs_lim(2)*10 xs_lim(1)*.1 xs_lim(1)*.1], 'facecolor', [.5 .5 .5], 'facealpha', 0.2, 'edgecolor', 'none');
legend_items = [ l_therm p l_none l_none l_es l_is l_cap l_none ];
legend_names = {'Thermal Energy', 'Reactor Region', '', 'For Each Z:', 'Elastic Scattering', 'Inelastic Scattering', 'Capture', '' };

% labels
Tstr = sprintf("Neutron Cross Sections from %s", datadir_basename);
T = title(Tstr);
xlabel(en_label)
ylabel 'Cross Section (cm^{2})'
set(ax, 'fontsize', 16)
colorlist = 'rbgmc';

% MAIN
icolor = 1;
for z = Z
  % (re)set data
  clear('el', 'inel', 'cap')
  % read data
  elastfile = sprintf("%s/elast%d", datadir, z);
  inelastfile = sprintf("%s/inelast%d", datadir, z);
  capfile = sprintf("%s/cap%d", datadir, z);
  el = dlmread(elastfile, '', 2, 0);
  inel = dlmread(inelastfile, '', 2, 0);
  cap = dlmread(capfile, '', 2, 0);
  % process el-scat data
  if any( el(:,2) > 0 )
    el(:,1) = el(:,1)*1e3; % switch to keV
    el(isnan(el(:,2)),:) = []; % remove non-plottable data
    el(el(:,2)<=0,:) = []; % " "
    pes = plot(el(:,1), el(:,2), 'linewidth', 2); % make plot
  else
    pes = 0;
  endif
  % process inel-scat data
  if any( inel(:,2) > 0 )
    inel(:,1) = inel(:,1)*1e3;
    inel(isnan(inel(:,2)),:) = [];
    inel(inel(:,2)<=0,:) = [];
    pis = plot(inel(:,1), inel(:,2), 'linewidth', 2, 'linestyle', ':');
  else
    pis = 0;
  endif
  % process cap data
  if any( cap(:,2) > 0 )
    cap(:,1) = cap(:,1)*1e3;
    cap(isnan(cap(:,2)),:) = [];
    cap(cap(:,2)<=0,:) = [];
    pc = plot(cap(:,1), cap(:,2), 'linewidth', 2, 'linestyle', '--');
  else
    pc = 0;
  endif
  % update relevent items
  handles = [pes pis pc];
  if any( handles ~= 0 )
    current_color = sprintf('%s', colorlist(icolor));
    lZ = line( [en_lim(1) en_lim(1)], [xs_lim(1) xs_lim(1)], 'linewidth', 2, 'color', current_color );
    lZ_label = sprintf('Z = %d', z);
    set( lZ, 'visible', 'off' )
    set( handles(handles~=0), 'color', current_color )
    legend_items(end+1) = lZ;
    legend_names(end+1) = lZ_label;
    handle_array(end+1,:) = handles;
    icolor += 1;
  endif
end % Z loop

% legend
l = legend( legend_items, legend_names, 'location', 'northeastoutside' );
set(l, 'fontsize', 18)

% adjust axes
set(gca, 'xlim', en_lim)
set(gca, 'ylim', xs_lim)
% workaround
printf("Finished plotting data for %d nuclei. To fix the bug in the axes limits, run the following command:\n  set(gca, 'ylim', [1e-30 1e-18])\n", length(Z));

% all pau!   )
%endfunction
