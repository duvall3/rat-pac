function [ H ] = human2( S = 1 )

% [ H ] = human2( S ) -- generate / draw a "human for scale" stick figure
% -- [ H ] is a vector of graphics handles
% -- S is a float value for the number of Octave units equal to 1 meter
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

% init
currentfig = gcf;
currentax = gca;
hold on
S = S * 1/(14/3+1/1.5) * 1.7; % rescale to 1.7-m average human adult

% main
H = zeros(1,6);
H(1) = circle(S/1.5,0,(14/3)*S);
bodx = S * [0 0 0 -0.5 0 0.5 0 -0.5 0 0.5];
body = S * ( [-1 -3 -3 -5 -3 -5 -1 -2.5 -1 -2.5] + 5 );
for k = [1:5]
  H(k+1) = line( bodx((2*k-1):(2*k)), body((2*k-1):(2*k)) );
end

% adjust
set(H, 'linewidth', 2)
set(H, 'color', 'blue')

%% all pau!   )
%% endfunction
