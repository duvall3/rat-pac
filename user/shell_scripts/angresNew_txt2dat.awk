# angresNew_txt2dat -- convert text output of angresNew.cxx to table format
# -- recommend piping into 'column -t'
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2024 ~ #

#Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

$1 ~ /Exper/ {exper=$3}
$1 ~ /N/ {n=$3}
$1 ~ /^Phi$/ {phi=$3}
$1 ~ /DeltaPhi/ {dphi=$3; print exper" "n" "phi" "dphi}

