#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam

#Define the Google Sheet and Tab
GSHEET="10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g"
MTAB="family-managers"

#mass groups
#MASSGROUPS=("" "")

#MS Faculty
groupMSFACULTY=midschoolfaculty@santafeschool.org
groupUNDERHILL=underhill@santafeschool.org
groupWHOLESCHOOL=wholeschool@santafeschool.org
groupSTUDENTS=students@santafeschool.org
groupSTAFF=staff@santafeschool.org
groupHELPDESK=helpdesk@santafeschool.org
groupALUMNI=alumni@santafeschool.org
groupFAMILIES=families@santafeschool.org

MASSGROUPS=("$groupMSFACULTY" "$groupUNDERHILL" "$groupWHOLESCHOOL" "$groupSTUDENTS" "$groupSTAFF" "$groupHELPDESK" "$groupALUMNI" "$groupFAMILIES")


# Loop through each group and execute the command for managers that will receive mail
for MASSGROUP in "${MASSGROUPS[@]}"; do
    echo "Updating group: $MASSGROUP"
    gam update group "$MASSGROUP" sync managers csvfile gsheet:all-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8
    gam update group "$MASSGROUP" add managers nomail csvfile gsheet:all-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 8s"
    sleep 8