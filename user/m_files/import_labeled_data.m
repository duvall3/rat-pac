function import_labeled_data( FILENAME )
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

% init
f_import = fopen(FILENAME);
header_line = textscan( f_import, "%s", 1, "Delimiter", "\n" );
headers = textscan(header_line{1}{1}, "%s");
headers = headers{1};
fclose(f_import);
clear header_line

% read
data_import = dlmread(FILENAME, "", 1, 0);

% organize
N_import = length(headers);
for k = 1:N_import
  cmdstr = sprintf( "%s = data_import(:,%d);", headers{k}, k );
  eval cmdstr
end

% cleanup
clear data_import

% all pau!   )

