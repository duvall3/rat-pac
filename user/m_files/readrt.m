% readrt -- mini-script to read in a .rt file produced by shell_sripts/process_rat_run.sh
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ %

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

% filename check
if ~exist('filename')
  filename = input("Enter filename: ", "s");
  if filename(end) == ' '
    filename(end) = [];
  endif
endif

% read file
if isfile(filename)
  data = dlmread(filename);
else
  error("File not found.")
endif

% organize data
event = data(:,1);
t_event_start = data(:,2);
wall_time = data(:,3);
en = data(:,4);
en_q = data(:,5);
x = data(:,6);
y = data(:,7);
z = data(:,8);

% free memory
clear data

% all pau!   )
