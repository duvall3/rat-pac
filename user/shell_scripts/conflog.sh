#!/bin/bash
# conflog -- brief script to record experimental & run configurations
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #

echo "run.mac:"
cat ./run.mac
echo -e "\n\n# # # # #\n\n"
echo "gen:"
cat ./gen/*.mac
echo -e "\n\n# # # # #\n\n"
echo "geo:"
cat ./*.geo
echo -e "\n\n# # # # #\n\n"
echo "ratdb:"
cat ./*.ratdb
echo -e "\n\n# # # # #\n\n"
echo "setup.mac:"
cat ./setup.mac
echo -e "\n\n# # # # #\n\n"
echo "init.mac:"
cat ./init.mac

exit 0
