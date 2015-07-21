% plot_cap_locs -- make 3D plot of endpoints from {x,y,z} (!assuming output from 'endpoints.m'!)

% make plot
f_cap_locs = figure;
p = plot3( x, y, z, 'marker', '^', 'linestyle', '--', 'color', 'k', 'markersize', 10, 'markerfacecolor', 'b' );
% adjust plot
ax = gca;
limits = [xlim; ylim; zlim];
L = [-max(abs(limits)) max(abs(limits))];
xlim(L); ylim(L); zlim(L);
set(ax, 'DataAspectRatio', [1 1 1])

% make nice interactive
cameratoolbar('SetMode', 'orbit')
