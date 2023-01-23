% import_labeled_data -- script to create vectors/structs from a numerical ASCII table
%   with a header row of column labels
% -- NOTE: *Numerical data only* -- for string data, see 'textscan' or 'importdata'
% -- Imported variables can be listed at any time using 'whos(vars_imported{:})'
% -- The fields of a 'struct'-type variable can be printed using 'fieldnames(VARIABLE)'
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
fflush(stdout);
if ~exist(FILENAME) FILENAME = input("Enter filename: ", "s"); endif
FILENAME = deblank(FILENAME);
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
  eval(cmdstr);
end

% cleanup
clear data_import

% display results
vars_imported = headers;
for k = 1:length(vars_imported)
  if any( strfind( vars_imported{k}, "." ) )
    vars_imported{k} = vars_imported{k}( 1 : index(vars_imported{k},".")-1 );
  endif
end
vars_imported = unique(vars_imported);
printf("\n\nData imported successfully! Contents stored in the variables below.\n\n");
whos(vars_imported{:});

% all pau!   )

