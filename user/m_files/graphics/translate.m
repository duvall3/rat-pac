function translate( H, DELTA )

% translate( H, DELTA ) -- simple function to translate graphics objects
% -- H is an array of the graphics-object handles to be translated
% -- DELTA is a 1x3 vector [x y z] describing the translation
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

for k = 1:length(H)
  set( H(k), 'xdata', get(H(k),'xdata') + DELTA(1) )
  set( H(k), 'ydata', get(H(k),'ydata') + DELTA(2) )
  set( H(k), 'zdata', get(H(k),'zdata') + DELTA(3) )
end

%% all pau!   )
% end function
