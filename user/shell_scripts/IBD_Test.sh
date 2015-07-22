#!/bin/bash
# IBD_Test -- creates a table of initial 4-momenta for both e+'s & n0's
#  -- intended for use with duvall3/rat-pac/user/IBD_Test.cxx or similar
#  -- suggested usage: IBD_Test.sh INPUT_FILE > OUTPUT_FILE.txt
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


#!!!! NOT YET READY FOR USE !!!!#


#	e+_KE0 e+_x0 e+_y0 e+_z0 e+_x1 e+_y1 e+_z1 e+_t1 n0_x0 n0_y0 n0_z0 n0_KE0 n0_x1 n0_y1 n0_z1 n0_t1
#	-- IBD_Test.cxx currently uses the ROOT GlobalTime for 't', so 'begin_t' is zero by definition

paste \
	<(awk '$1 ~ /e\+_KE0/ {print $3}'
	<(awk '$1 ~ /e\+_r0/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$1 ~ /e\+_r1/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$1 ~ /e\+_t1/ {print $2}' $1) \
	<(awk '$1 ~ /n0_KE0/ {print $2}' $1) \
	<(awk '$1 ~ /n0_r0/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$1 ~ /n0_r1/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$1 ~ /n0_t1/ {print $3}'
