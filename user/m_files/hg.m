function [ hg_data handles ] = hg( data, bins )
% -- custom stairstep-style histogram-drawing function
% -- currently only supports evenly-spaced bins
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ %

% get & check binning -- currently not working properly
bin_delta = bins(2) - bins(1);
%if all( bins(2:end) - bins(1:end-1) == bin_delta ) ~= 1
%  error( 'ERROR: Only evenly-spaced bins are supported.\n' )
%endif
  
hg_data = hist( data, bins );
handles = zeros(3,1);

handles(1) = figure;
handles(2) = axes;
handles(3) = stairs( [bins(1)-bin_delta bins bins(end)+bin_delta] - bin_delta/2, [hg_data(1) hg_data hg_data(end)], 'color', 'k', 'linewidth', 2 );

% some customization:
set( handles(2), 'xgrid', 'off', 'ygrid', 'off' )
%xlim( [min(bins) max(bins)] )
set( handles(2), 'ticklength', [.03 .075] )

% on the author's system:
pos = [ 1000 100 1.5*[560 420]];
set( handles(1), 'position', pos );
