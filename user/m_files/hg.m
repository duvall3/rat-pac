function [ hg_data handles ] = hg( data, bins )
% -- custom stairstep-style histogram-drawing function
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ %

hg_data = hist( data, bins );
handles = zeros(3,1);

handles(1) = figure;
handles(2) = axes;
handles(3) = stairs( bins, hg_data, 'color', 'k', 'linewidth', 2 );

% some customization:
set( handles(2), 'xgrid', 'off', 'ygrid', 'off' )
%xlim( [min(bins) max(bins)] )
set( handles(2), 'ticklength', [.03 .075] )

% on the author's system:
pos = [ 1000 100 1.5*[560 420]];
set( handles(1), 'position', pos );
