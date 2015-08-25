#!/bin/bash
# conflog -- brief script to record experimental & run configurations
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #

cat ./run.mac
echo -e "\n\n# # # # #\n\n"
cat ./gen/*.mac
echo -e "\n\n# # # # #\n\n"
cat ./*.geo
echo -e "\n\n# # # # #\n\n"
cat ./*.ratdb
echo -e "\n\n# # # # #\n\n"
cat ./setup.mac
echo -e "\n\n# # # # #\n\n"
cat ./init.mac

exit 0
