#!/bin/bash
# endpoints -- creates table of endpoints (ready for octave/matlab's "dlmread", for example)
#  -- intended for use with duvall3/rat-pac/user/NeutronCaptures.cxx or similar
#  -- usage: endpoints INPUT_FILE

#	begin_x begin_y begin_z end_x end_y end_z end_t
#	-- NeutronCaptures.cxx currently uses the ROOT GlobalTime for 't', so 'begin_t' is zero by definition

paste \
	<(awk '$1 ~ /Begin/ {print $2"\t"$3"\t"$4}' $1) \
	<(awk '$1 ~ /End/ {print $2"\t"$3"\t"$4}' $1) \
	<(awk '$1 ~ /Time/ {print $2}' $1)
