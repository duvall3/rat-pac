#!/bin/bash
# n0_dat_to_txt -- creates table of neutron-track endpoints, capture times, & gamma productions
#  -- intended for use with duvall3/rat-pac/user/NeutronCaptures.cxx
#  -- suggested usage:  user@host:~$ endpoints FILENAME.n0.dat | column -t > FILENAME.n0.txt
#  -- read into octave/MATLAB:  data = dlmread( 'FILENAME.n0.txt', '', 1, 0 );
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #

echo "begin_x begin_y begin_z end_x end_y end_z end_t gammas gamma_KE_total num_scatters_total"
# NeutronCaptures.cxx currently uses the ROOT GlobalTime for 't', so 'begin_t' is zero by definition

paste \
	<(awk '$1 ~ /Begin/ {print $2"\t"$3"\t"$4}' $1) \
	<(awk '$1 ~ /End/ {print $2"\t"$3"\t"$4}' $1) \
	<(awk '$1 ~ /Time/ {print $2}' $1) \
	<(awk '$1 ~ /Gammas/ {print $2}' $1) \
	<(awk '$0 ~ /Total Gamma Energy/ {print $4}' $1) \
	<(awk '$0 ~ /Total Scatters/ {print $3}' $1)
exit 0
