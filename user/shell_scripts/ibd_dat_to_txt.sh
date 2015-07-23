#!/bin/bash
# ibd_dat_to_txt -- creates a table of initial 4-momenta  (& times) for both e+'s & n0's
#  -- intended for use with duvall3/rat-pac/user/IBD_Test.cxx
#  -- suggested usage: IBD_Test.sh FILENAME.ibd.dat | column -t > FILENAME.ibd.txt
#  -- read into octave/MATLAB:  data = dlmread( 'FILENAME.ibd.txt', '', 1, 0 );
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


echo "e+_KE0 e+_x0 e+_y0 e+_z0 e+_x1 e+_y1 e+_z1 e+_t1 neutron_KE0  neutron_x0 neutron_y0 neutron_z0 neutron_x1 neutron_y1 neutron_z1 neutron_t1"
# IBD_Test.cxx currently uses the ROOT GlobalTime for 't', so 'begin_t' is zero by definition

paste \
	<(awk '$1 ~ /e\+_KE0/ {print $3}' $1 ) \
	<(awk '$1 ~ /e\+_r0/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$1 ~ /e\+_r1/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$1 ~ /e\+_t1/ {print $3}' $1) \
	<(awk '$1 ~ /neutron_KE0/ {print $3}' $1) \
	<(awk '$1 ~ /neutron_r0/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$1 ~ /neutron_r1/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$1 ~ /neutron_t1/ {print $3}' $1 )
exit 0
