% scatter.m -- read & graph info from a DATARUN.sc<NUM> file
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ %

% read & convert mm to cm
x0 = data_sc(:,1)/10;
y0 = data_sc(:,2)/10;
z0 = data_sc(:,3)/10;
xf = data_sc(:,4)/10;
yf = data_sc(:,5)/10;
zf = data_sc(:,6)/10;

% calculate delta{x,y,z} & r
x = xf - x0;
y = yf - y0;
z = zf - z0;
r = sqrt( x.^2 + y.^2 + z.^2 );

