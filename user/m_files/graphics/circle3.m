function [ H ] = circle3( R = 1, X = 0, Y = 0, Z = 0 )

% [ H ] = circle3( R=1, X=0, Y=0, Z=0 ) -- wrapper for drawing a circle using
%  the rather inconvenient "rectangle" builtin

% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2022 ~ %

%Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.

H = rectangle( "Position", [X-R Y-R Z-R 2*R 2*R 2*R], "Curvature", 1 );
set(gca, 'dataaspectratio', [1 1 1])

%% all pau!   )
% end function
