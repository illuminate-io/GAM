#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam

#calculation of mailing list years

# Graduation Year variables

source config.sh
#read -p "what is the the two digit year for this year's graduation class?" gradyear


let PK1=$gradyear+10
let PK2=$gradyear+9
let K=$gradyear+8
let STAR1=$gradyear+7
let STAR2=$gradyear+6
let CENT3=$gradyear+5
let CENT4=$gradyear+4
let BADG5=$gradyear+3
let BADG6=$gradyear+2
let MS7=$gradyear+1
let MS8=$gradyear


##Print class years for verification


echo "This year's graduation class is 20$MS8"
echo "Unicorns include years 20$PK1 and 20$PK2 (pre-k)"
echo "Grasshopper includes year 20$K (kindergarten)"
echo "Stargazer includes years 20$STAR1 (1st Grade) and 20$STAR2 (2nd Grade)"
echo "Centaur includes years 20$CENT3 (3rd Grade) and 20$CENT4 (4th Grade)"
echo "Badger includes years 20$BADG5 (5th Grade) and 20$BADG6 (6th Grade)"
echo "Middle School includes years 20$MS7 (7th Grade) and 20$MS8 (8th Grade)"

###########################################################################

# PAUSE BEFORE CONTINUING

read -n 1 -s -r -p "Press any key to continue..."


#Define the Google Sheet and Tab
GSHEET="10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g"
MTAB="family-managers"

#Stargazer groups
#Stargazer families

groupSTARFAMstatic=family-stargazer@santafeschool.org
group1FAMstatic=family-first@santafeschool.org
group2FAMstatic=family-second@santafeschool.org
groupSTARFAMnest1=family-$STAR1@santafeschool.org
groupSTARFAMnest2=family-$STAR2@santafeschool.org

#FAMILY GROUPS
STARGROUPS=("$groupSTARFAMstatic" "$group1FAMstatic" "$group2FAMstatic" "$groupSTARFAMnest1" "$groupSTARFAMnest2")

#STARGAZER
for STARGROUP in "${STARGROUPS[@]}"; do
    echo "Updating group: $STARGROUP"
    gam update group "$STARGROUP" sync managers csvfile gsheet:all-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8
    gam update group "$STARGROUP" add managers csvfile gsheet:all-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8
    gam update group "$STARGROUP" add managers csvfile gsheet:stargazer-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8
    gam update group "$STARGROUP" add managers csvfile gsheet:stargazer-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8
#    gam update group "$STARGROUP" sync members csvfile gsheet:
done