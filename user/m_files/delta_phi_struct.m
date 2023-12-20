function [dphi] = delta_phi_struct( P, l, N )
% [dphi] = delta_phi_struct( P, l, N )
% Struct for calculating the angular uncertainty via the equation 
%   used by the Double CHOOZ collaboration:
%   For an angle phi given by phi = arctan( DeltaR_perp / DeltaR_par ):
%   DeltaPhi = arctan( (P/l) / sqrt(N) ), where:
%   P = mean position resolution
%   l = mean magnitude of DeltaR
%   N = sample size

% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2023 ~ %

%Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
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
dphi.P = P;
dphi.l = l;
dphi.N = N;

% angular uncertainty
dphi.DeltaPhi = atand( (dphi.P/dphi.l) / sqrt(dphi.N) );

% all pau!   )
end
