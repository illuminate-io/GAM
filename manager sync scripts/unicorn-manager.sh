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

#Unigazer groups
#Unigazer families
groupUNIFAMstatic=family-unicorn@santafeschool.org
groupUNIFAMnestPK1=family-$PK1@santafeschool.org
groupUNIFAMnestPK2=family-$PK2@santafeschool.org

#FAMILY GROUPS
UNIGROUPS=("$groupUNIFAMstatic" "$groupUNIFAMnestPK1" "$groupUNIFAMnestPK2")

# Loop through each group and execute the command for managers that will receive mail
for UNIGROUP in "${UNIGROUPS[@]}"; do
    echo "Updating group: $UNIGROUP"
    gam update group "$UNIGROUP" sync managers csvfile gsheet:all-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8
    gam update group "$UNIGROUP" add managers nomail csvfile gsheet:all-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8
    gam update group "$UNIGROUP" add managers csvfile gsheet:unicorn-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8
    gam update group "$UNIGROUP" add managers nomail csvfile gsheet:unicorn-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8
#    gam update group "$UNIGROUP" sync members csvfile gsheet:
done