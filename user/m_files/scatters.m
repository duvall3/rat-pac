% scatter.m -- process info from a DATARUN.sc<NUM> file
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ %

% assuming you've already run: data_sc = dlmread( '$DATARUN.sc<NUM>', '', 1, 0 );

% some neutrons will not survive to the specified number of scatters;
% these entries must be removed, since dlmread will pad the missing columns with zeros
%   -- we're assuming that no neutron will end up EXACTLY at the origin by coincidence
%   -- can check this number later on by comparing, for example, 'length(x)' vs 'sum( total_scatters >= NUM )'
rows_to_delete = find( data_sc(:,4)==0 & data_sc(:,5)==0 & data_sc(:,6)==0 );
data_sc(rows_to_delete,:) = [];

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

