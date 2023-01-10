function [ S ] = mktimes( T, UNIX=false )
% mktimes -- extract a vector of timestamps from a TM_STRUCT struct array
% -- If UNIX is set to true, return seconds since epoch (00:00:00 UTC, 1 Jan 1970);
%      otherwise, return seconds since timestamp of first element in T
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

% init
N = length(T);
S = zeros(N,1);
t = 0;
T0 = mktime(T(1));

% main
for k=1:N
  if UNIX
    S(k) = mktime(T(k));
  else
    S(k) = mktime(T(k)) - T0;
  endif
end

% all pau!   )
endfunction
