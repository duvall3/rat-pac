function [ X ] = extract_struct_field( S, F )
% extract_struct_field -- extract a field from a struct array as a column vector

% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2023 ~ %

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

% S -- struct array
% F -- field name as sq_string
% Example: hours = extract_struct_field( TM_STRUCT_array, 'hour' );

% function [ X ] = extract_struct_field( S, F )

% init
N = length(S);
X = zeros(N,1);

% main
for k = 1:N
  X(k) = S(k).(F);
end

% all pau!   )
endfunction
