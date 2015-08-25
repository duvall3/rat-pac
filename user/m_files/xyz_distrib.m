% Copyright (C) 2015 Mark Duvall
% 
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

% Author: Mark Duvall <mark@vibegroove2>
% Created: 2015-08-19


% xyz_dist -- plot x, y, & z distributions

% x
figure;
[ h_x x_handles ] = hg( x, xbins );
xlabel 'x (cm)'
ylabel 'Events'
title 'X Displacement'

% y
figure;
[ h_y y_handles ] = hg( y, xbins );
xlabel 'y (cm)'
ylabel 'Events'
title 'Y Displacement'

% z
figure;
[ h_z z_handles ] = hg( z, xbins );
xlabel 'z (cm)'
ylabel 'Events'
title 'Z Displacement'


% end
