% ibd_spectrum -- plot the IBD spectrum used by RAT-PAC's default IBD generator (as of 10/22/2015)
% Mark J. Duvall ~ mjduvall@hawaii.edu ~ October 2015 ~ %

% Neutrino spectrum
% from Vogel, Gratta RMP via Jon Link
spec_e = [ 1.85,  2.15,  2.45,  2.75,  3.05,  3.35,  3.65,  3.95, 4.25,  4.55,  4.85,  5.15,  5.45,  5.75,  6.05,  6.35, 6.65,  6.95,  7.25,  7.55,  7.85,  8.15]; % (MeV)
spec_flux = [49.80, 39.66, 31.43, 24.79, 19.45, 15.19, 11.80,  9.12, 7.01,  5.35,  4.06,  3.06,  2.28,  1.67,  1.21,  0.85, 0.58,  0.38,  0.23,  0.13,  0.06,  0.03]; % flux, units not specified (possibly relative flux in arbitrary units)

% figure
f_ibd = figure;
if exist('pos'); set(f_ibd, 'position', pos); end%if
ax_ibd = axes;

% plot
p_ibd = plot( spec_e, spec_flux, 'color', 'b', 'marker', '.', 'markersize', 10 );
ylim([0 60]) % for default spectrum
xlabel '\nu_e Energy (MeV)'
ylabel 'Relative Flux (arbitrary)'
TS_ibd = {'RAT-PAC IBD Reactor Spectrum'; 'from Vogel, Gratta RMP via Jon Link'};
T_ibd = title(TS_ibd, 'fontsize', 20);

% annotations
% IBD threshold: E_nuebar = 1.8 MeV (approx.)
ylim_ibd = ylim;
xlim_ibd = xlim;
l_ibd = line( [1.85 1.85], [ylim_ibd(1) ylim_ibd(2)], 'color', 'r', 'linestyle', '--', 'linewidth', 2 );
t_ibd = text( 2, 55, 'IBD Threshold: ~1.85 MeV', 'fontsize', 18, 'color', 'r' );

