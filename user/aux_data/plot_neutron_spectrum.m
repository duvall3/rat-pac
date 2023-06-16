# plot_neutron_spectrum -- script to produce plot of the sea-level fast-netron background according to JEDEC standard JESD89a
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2023 ~ %

%Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
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


%% init

% JEDEC data
data = dlmread('neutron_background.txt', '', 3, 0);

% JEDEC analytical fit
% energy vector
En = 10.^(linspace(-1,4,10000))'; % sampling resolution: 10000 exponentially-spaced points across [0.1,10^4] MeV
% parameters
A1 = 1.006e-6; b1 = 0.35; c1 = 2.1451;
A2 = 1.011e-3; b2 = 0.4106; c2 = -0.667;
% spectrum
phi1 = A1 * exp( -b1 * (log(En)).^2 + c1 * log(En) );
phi2 = A2 * exp( -b2 * (log(En)).^2 + c2 * log(En) );
phi = phi1 + phi2;


%% MAIN

% figure init
f = figure('color', 'w');
a = axes;
p = loglog( En, phi, 'm' );		% curve fit
set(p, 'linewidth', 2.5)
set(a, 'color', 'w', 'xcolor', 'k', 'ycolor', 'k', 'gridcolor', 'k', 'minorgridcolor', 'k');
grid on
set(a, 'gridlinestyle', ':', 'gridalpha', 1., 'linewidth', 1.5)
xlim([1.e-1 1.e4]);
ylim([1.e-7 1.e-2]);
hold on
sc = plot( data(:,1), data(:,2) );	% data points
set(sc, 'linestyle', 'none', 'marker', 'o', 'markeredgecolor', 'b', 'markerfacecolor', 'b', 'markersize', 5);

% annotations
T = title('Sea-level Muogenic Neutron Spectrum from JEDEC Standard JSED89a', 'color', 'k');
xla = xlabel('Neutron Energy (MeV)');
yla = ylabel('Differential Flux (cm^{-2} s^{-1} MeV^{-1})');
l = legend( [sc p], {'Data', 'Analytical Fit'} );
set(l, 'color', 'w', 'location', 'northeast')
set(T, 'fontsize', 26, 'fontweight', 'bold')
set(a, 'fontsize', 22, 'fontweight', 'bold')
set(l, 'fontsize', 22, 'fontweight', 'bold')


%% all pau!   )
% print(f, 'neutron_spectrum.png')
