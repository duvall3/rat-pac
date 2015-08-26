#!/bin/bash
# ibd_dat_to_txt -- creates table of positron- & neutron-track endpoints, capture/annihilation times, gamma productions, & more
#  -- intended for use with duvall3/rat-pac/user/IBD.cxx
#  -- read into octave/MATLAB:  data = dlmread( 'FILENAME.ibd.txt', '', 1, 0 );
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #

echo "positron_begin_x positron_begin_y positron_begin_z positron_step1_x positron_step1_y positron_step1_z positron_end_x positron_end_y positron_end_z positron_end_t positron_gammas positron_gamma_KE_total neutron_begin_x neutron_begin_y neutron_begin_z neutron_step1_x neutron_step1_y neutron_step1_z neutron_end_x neutron_end_y neutron_end_z neutron_total_scatters neutron_end_t neutron_alpha_KE neutron_gammas neutron_gamma_KE_total neutron_num_scatters_total"
# NeutronCaptures.cxx currently uses the ROOT GlobalTime for 't', so 'begin_t' is zero by definition

paste \
# positron data
	<(awk '$0 ~ /positron Begin/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$0 ~ /positron Step 1/ {print $4"\t"$5"\t"$6}' $1) \
	<(awk '$0 ~ /positron End/ {print $3"\t"$4"\t"$5}' $1) \
	<(awk '$0 ~ /positron Time/ {print $3}' $1) \
	<(awk '$0 ~ /positron Gammas/ {print $3}' $1) \
	<(awk '$0 ~ /positron Total Gamma Energy/ {print $5}' $1) \
# neutron data
	<(awk '$0 ~ /neutron Begin/ {print $2"\t"$3"\t"$4}' $1) \
	<(awk '$0 ~ /neutron Step 1/ {print $4"\t"$5"\t"$6}' $1) \
	<(awk '$0 ~ /neutron End/ {print $2"\t"$3"\t"$4}' $1) \
	<(awk '$0 ~ /neutron Total Scatters/ {print $4}' $1) \
	<(awk '$0 ~ /neutron Time/ {print $2}' $1) \
	<(awk '$0 ~ /neutron Alpha/ {print $2}' $1)
	<(awk '$0 ~ /neutron Gammas/ {print $2}' $1) \
	<(awk '$0 ~ /neutron Total Gamma Energy/ {print $4}' $1) \
exit 0
