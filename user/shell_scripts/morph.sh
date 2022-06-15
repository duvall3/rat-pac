#!/bin/bash
# morph.sh -- simple script to create an interpolated GIF
#   from a sequence of images
# -- Settings:
#      NFRAMES: frames to interpolate between image files
#      DELAY: hundredths of a second between animation frames
# USAGE: morph.sh <FILES>
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ #

#Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
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

# init
if [[ ($# -lt 1) || ($1 =~ "-h") ]]; then
  echo  'USAGE: morph.sh <FILES>'
  exit 2
fi

# settings
NFRAMES=16
DELAY=10

# MAIN
convert -morph $NFRAMES $@ %d_frame.png
FILES=($(ls *_frame.png | sort -n))
convert -loop 0 -delay $DELAY ${FILES[*]} morph.gif

# all pau!   )
exit 0
