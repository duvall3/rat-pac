% drawdtr -- draw detector
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2019 ~ %

% init
pkg load geometry
data = dlmread( 'geodump.txt' );
x = data(:,1);
y = data(:,3);
z = data(:,2);
clear data
f = figure;
ax = axes;

% MAIN
% graphics init
s = 2.5;
i = 1;
boxlims = [ x(i)-s x(i)+s, y(i)-s y(i)+s, z(i)-s z(i)+s ];
drawBox3d( boxlims, 'color', 'w' )
hold on
% volume-element loop
for i = 1:length(x)
  boxlims = [ x(i)-s x(i)+s, y(i)-80*s y(i)+80*s, z(i)-s z(i)+s ];
  drawBox3d( boxlims, 'color', 'k' );
end
% adjust viewer
axlim = [-500 500]*.3; xlim(axlim); ylim(axlim); zlim(axlim);
daspect([1 1 1])
xlabel 'x (mm)';
ylabel 'y (mm)';
zlabel 'z (mm)';

