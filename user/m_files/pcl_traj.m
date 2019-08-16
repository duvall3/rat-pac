%% pcl_traj -- simple script to make a 3D plot
%    of a particle's trajectory from an input of [X Y Z]

data = dlmread("pcl");
x = data(:,1);
y = data(:,2);
z = data(:,3);

f = figure;
ax = axes;

p = plot3( x, y, z, 'marker', '.' );
daspect(da);

