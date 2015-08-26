function [ ] = run_analysis( x, y, z );
% run_analysis -- takes a given set of positions [x y z] and returns analysis
%   -- returned objects are mu_{xyz}, sigma_{xyz}, l, P, theta, & D_theta, all defined below
%   -- use 'find' to cut data (even across multiple vectors simultaneously)
%         -- e.g., x between -/+100 and only nonzero y: "inds=find(abs(x)<100 & y~=0); x_cut=x(inds); y_cut=y(inds);"
% ~ Mark J. Duvall ~ mjduvall@hawai.edu ~ August 2015 ~ %


% very basic arg check:
if ( length(x)==length(y) && length(y)==length(z) )
  N = length(x);
else
  error('\nVectors x, y, z must all be equal length.\n');
end %if

fprintf('\n\n\nRun Analysis\n');
fprintf('#################\n\n');

% means & stdevs of displacements
mu_x = mean(x); mu_y = mean(y); mu_z = mean(z);
sigma_x = std(x); sigma_y = std(y); sigma_z = std(z);
fprintf 'means & stdevs of displacements:\n'
fprintf('\tmu_x\tmu_y\tmu_z\n\tsigma_x\tsigma_y\tsigma_z\n\t=\n');
fprintf('\t%f\t%f\t%f\n\t%f\t%f\t%f\n\n', mu_x, mu_y, mu_z, sigma_x, sigma_y, sigma_z);

% length of mean displaced position
fprintf 'length of mean displaced position:  '
l = sqrt( mu_x^2 + mu_y^2 + mu_z^2 );
fprintf('l = sqrt( mu_x^2 + mu_y^2 + mu_z^2 )\n');
fprintf('l = %f\n\n', l);

% position resolution
fprintf 'position resolution:  '
P = mean( [ sigma_x sigma_y sigma_z ] );
fprintf('P = (1/3) * (sigma_x + sigma_y + sigma_z)\n', P);
fprintf('P = %f\n\n', P);

% angle to/from source 
fprintf 'angle to/from source:  '
theta = atan( mu_z / mu_x ) * 180/pi;
fprintf('theta = arctan( mu_z / mu_x )\n');
fprintf('theta = %f\n\n', theta);

% angular resolution
fprintf 'angular resolution:  '
D_theta = atan( (P/l) / sqrt(N) ) * 180/pi;
fprintf('D_theta = arctan( (P/l) / sqrt(N) )\n');
fprintf('D_theta = %f\n\n', D_theta);


fprintf('#################\n\n');
fprintf('\n\n\n');


% all pau!   )
end %function
