%% pcl_traj -- simple script to make a 3D plot
%    of a particle's trajectory from an input of [X Y Z]

da = [1 1 1];

data = dlmread("pcl");
x = data(:,1);
y = data(:,2);
z = data(:,3);

%f = figure;
%ax = axes;

p = plot3( x, z, y, 'marker', '.', 'color', 'r' );
daspect(da);

hold on

%cell_array = [20*-28 20*28 -201 201 -28 28];  % default
cs = 1000.0;   % cube side
cell_array = [ -cs cs -cs cs -cs cs ];   % for cube
drawBox3d(cell_array, 'color', 'b');
axlim = [-5000 5000]; % default
xlim(axlim); ylim(axlim); zlim(axlim);

title 'Particle Trajectory'
xlabel 'x (mm)'
ylabel 'z (mm)'
zlabel 'y (mm)'

% all pau!   )