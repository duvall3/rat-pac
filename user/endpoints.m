% endpoints -- read in positions & generate vectors for delta_{x,y,z,r}
%  -- assuming data = dlmread( 'DATAFILE', .... );

data = data/10;  % convert mm to cm
x0 = data(:,1); y0 = data(:,2); z0 = data(:,3):
xf = data(:,4); yf = data(:,5); zf = data(:,6);
x = xf - x0; y = yf - y0; z = zf - z0;
r = sqrt( x.^2 + y.^2 + z.^2 );
