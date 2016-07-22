# point_neutrons_along_z.awk -- redirect particles in HEPEVT text format files to point along z-axis
# -- usage:  user@host:~$ awk -f point_neutrons_along_z.awk INPUTFILE > OUTPUTFILE
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2016 ~ #


# check formattting
BEGIN{getline; if (NF>1) 
  {
    space="";
    $7=sqrt( $5^2 + $6^2 + $7^2 );
    $5=0;
    $6=0;
    print space $0;
  }
  else {space=" "; print $0;}
}

# more formatting
$2 !~ /./ {print $0}

# MAIN: reassign z-component to be the total momentum and set x- and y-components to zero
$2 ~ /./ {

  $7=sqrt( $5^2 + $6^2 + $7^2 )
  
  $5=0

  $6=0

  print space $0

}

# all pau!   )
