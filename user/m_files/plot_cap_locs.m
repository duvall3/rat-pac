% plot_cap_locs -- make 3D plot of endpoints from {x,y,z}
%  -- assuming duvall3/rat-pac/user/m_files/n0_endpoints.m has just been run
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


% make plot
f_cap_locs = figure;
s = scatter3( x, y, z, 'marker', 'o', 'MarkerFaceColor', 'b' );
% add origin
hold on
o = scatter3( 0, 0, 0, 'marker', '*', 'sizedata', 625, 'cdata', [1 0 0], 'LineWidth', 3 );

% labels
T = title('Neutron-Capture Displacements', 'interpreter', 'none');
xlabel 'x (cm)'
ylabel 'y (cm)'
zlabel 'z (cm)'

% adjust limits
ax = gca;
limits = [xlim; ylim; zlim];
L = [-max(abs(limits(:))) max(abs(limits(:)))];
xlim(L); ylim(L); zlim(L);

% make pretty
set(ax, 'DataAspectRatio', [1 1 1])
set(ax, 'xgrid', 'on', 'ygrid', 'on', 'zgrid', 'on')

% set camera to nice rotational mode
cameratoolbar('SetMode', 'orbit')