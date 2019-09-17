%% pcl_traj -- simple script to make a 3D plot
%    of a particle's trajectory from an input of [X Y Z]

da = [1 1 1];

%data = dlmread("pcl", "", 5, 0);   % better to pass it through 'grep' "^[[:digit:]-]"
data = dlmread("pcl");
x = data(:,1);
y = data(:,2);
z = data(:,3);

f = figure;
ax = axes;

p = plot3( x, z, y, 'marker', '.', 'color', 'r' );
%i = 943:end;
%p = plot3( x(943:end), z(943:end), y(943:end), 'marker', '.', 'color', 'r' );   %debug
daspect(da);

hold on

%cell_array = [20*-28 20*28 -201 201 -28 28];  % default
cs = 463.5;   % cube side
cell_array = [ -cs cs -cs cs -cs cs ];   % for cube
drawBox3d(cell_array, 'color', 'b');
axlim = [-5000 5000]; % default
xlim(axlim); ylim(axlim); zlim(axlim);

%src_shift = -1000;
src_shift = 0;
source = [ src_shift-1 src_shift+1 -201 201 -28 28 ];
drawBox3d(source, 'color', 'm');

title 'Particle Trajectory'
xlabel 'x (mm)'
ylabel 'z (mm)'
zlabel 'y (mm)'

% all pau!   )