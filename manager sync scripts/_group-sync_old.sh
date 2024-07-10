#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam

#Google Sheet ID for families

#GSHEET=10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g

#Google Sheet ID for faculty groups


#Google Sheet ID for student groups



#Google Workspace Organizational Unit Variables

#Classes
OUUNI=Users/Staff/Teachers/Unicorn
OUGRASS=Users/Staff/Teachers/Grasshopper
OUSTAR=Users/Staff/Teachers/Stargazer
OUCENT=Users/Staff/Teachers/Centaur
OUBADG=Users/Staff/Teachers/Badger
OUMS=Users/Staff/Teachers/MS

#Admin
OUADM=Users/Staff/Admin
OUUND=Users/Staff/Underhill
OUCOUN=Users/Staff/Counselor
OUSHAR=Users/Staff/SharedAccounts

#Specials
OUJAP=Users/Staff/Teachers/Japanese
OUSPA=Users/Staff/Teachers/Spanish
OUWELL=Users/Staff/Counselors
OUART1=Users/Staff/Teachers/Art-1
OUART2=Users/Staff/Teachers/Art-2
OUPE=Users/Staff/Teachers/PE
OUDRA1=Users/Staff/Teachers/Drama-1
OUDRA2=Users/Staff/Teachers/Drama-2
OUMUS=Users/Staff/Teachers/Music

#calculation of mailing list years

# Graduation Year variables


read -p "what is the the two digit year for this year's graduation class?" gradyear


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

MASSGROUPS=("$groupMASSFAMstatic" "$group1FAMstatic" "$group2FAMstatic" "$groupMASSFAMnest1" "$groupMASSFAMnest2")



#Define the Google Sheet and Tab
GSHEET="10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g"
MTAB="family-managers"

#Grasshopper groups
#Grasshopper families
groupGRASSFAMstatic=family-grasshopper@santafeschool.org 
groupGRASSFAMnestK=family-$K@santafeschool.org

#FAMILY GROUPS
GRASSGROUPS=("$groupGRASSFAMstatic" "$groupGRASSFAMnestK")

# Loop through each group and execute the command for managers that will not receive mail
for GRASSGROUP in "${GRASSGROUPS[@]}"; do
    echo "Updating group: $GRASSGROUP"
    gam update group "$GRASSGROUP" sync managers csvfile gsheet:all-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$GRASSGROUP" add managers nomail csvfile gsheet:all-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$GRASSGROUP" add managers csvfile gsheet:grasshopper-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$GRASSGROUP" add managers nomail csvfile gsheet:grasshopper-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
done


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
    echo "sleep for 5s"
    sleep 5
    gam update group "$STARGROUP" add managers csvfile gsheet:all-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$STARGROUP" add managers csvfile gsheet:stargazer-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$STARGROUP" add managers csvfile gsheet:stargazer-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
#    gam update group "$STARGROUP" sync members csvfile gsheet:
done

#Define the Google Sheet and Tab
GSHEET="10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g"
MTAB="family-managers"

#Centaur groups
#Centaur families
groupCENTFAMmstatic=family-centaur@santafeschool.org
group3FAMstatic=family-third@santafeschool.org
group4FAMstatic=family-fourth@santafeschool.org
groupCENTFAMnest3=family-$CENT3@santafeschool.org
groupCENTFAMnest4=family-$CENT4@santafeschool.org

#Centaur students
groupCENTSTUDstatic=student-centaur@santafeschool.org
group3STUDstatic=student-third@santafeschool.org
group4STUDstatic=student-fourth@santafeschool.org
groupCENTSTUDnest3=student-$CENT3@santafeschool.org
groupCENTSTUDnest4=student-$CENT4@santafeschool.org

#FAMILY-GROUPS
CENTGROUPS=("$groupCENTFAMstatic" "$group1FAMstatic" "$group2FAMstatic" "$groupCENTFAMnest1" "$groupCENTFAMnest2")
#STUDENT GROUPS
CENTGROUPS=("$groupCENTSTUDstatic" "$group3STUDstatic" "$group4STUDstatic" "$groupCENTSTUDnest3" "$groupCENTSTUDnest4")

#CENTAUR
for CENTGROUP in "${CENTGROUPS[@]}"; do
    echo "Updating group: $CENTGROUP"
    gam update group "$CENTGROUP" sync managers csvfile gsheet:all-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$CENTGROUP" add managers nomail csvfile gsheet:all-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$CENTGROUP" add managers csvfile gsheet:centaur-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$CENTGROUP" add managers nomail csvfile gsheet:centaur-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
done

#Define the Google Sheet and Tab
GSHEET="10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g"
MTAB="family-managers"

#Badger groups
#Badger families
groupBADGFAMstatic=family-badger@santafeschool.org
group5FAMstatic=family-fifth@santafeschool.org
group6FAMstatic=family-sixth@santafeschool.org
groupBADGFAMnest5=family-$BADG5@santafeschool.org
groupBADGFAMnest6=family-$BADG6@santafeschool.org

#Badger students
groupBADGSTUDstatic=student-badger@santafeschool.org
group5STUDstatic=student-fifth@santafeschool.org
group6STUDstatic=student-sixth@santafeschool.org
groupBADGSTUDnest5=student-$BADG5@santafeschool.org
groupBADGSTUDnest6=student-$BADG6@santafeschool.org

#FAMILY GROUPS
BADGGROUPS=("$groupBADGFAMstatic" "$group1FAMstatic" "$group2FAMstatic" "$groupBADGFAMnest1" "$groupBADGFAMnest2")
#STUDENT GROUPS
BADGGROUPS=("$groupBADGSTUDstatic" "$group5STUDstatic" "$group6STUDstatic" "$groupBADGSTUDnest5" "$groupBADGSTUDnest6")

#BADGER
for BADGGROUP in "${BADGGROUPS[@]}"; do
    echo "Updating group: $BADGGROUP"
    gam update group "$BADGGROUP" sync managers csvfile gsheet:all-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$BADGGROUP" add managers nomail csvfile gsheet:all-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$BADGGROUP" add managers csvfile gsheet:badger-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    echo "sleep for 5s"
    sleep 5
    gam update group "$BADGGROUP" add managers nomail csvfile gsheet:badger-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    sleep 5
done



#Define the Google Sheet and Tab
GSHEET="10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g"
MTAB="family-managers"

#Middle school groups
#Middle school families
groupMSFAMstatic=family-ms@santafeschool.org
group7FAMstatic=family-seventh@santafeschool.org
group8FAMstatic=family-eighth@santafeschool.org
groupMSFAMnest7=family-$MS7@santafeschool.org
groupMSFAMnest8=family-$MS8@santafeschool.org

#Middle school students
groupMSSTUDstatic=student-ms@santafeschool.org
groupMSSTUD7static=student-seventh@santafeschool.org
groupMSSTUD8static=student-eighth@santafeschool.org
groupMSSTUDnest7=student-$MS7@santafeschool.org
groupMSSTUDnest8=student-$MS8@santafeschool.org

#FAMILY GROUPS
MSGROUPS=("$groupMSFAMstatic" "$group1FAMstatic" "$group2FAMstatic" "$groupMSFAMnest1" "$groupMSFAMnest2")
#STUDENT GROUPS
MSGROUPS=("$groupMSSTUDstatic" "$group7STUDstatic" "$group8STUDstatic" "$groupMSSTUDnest7" "$groupMSSTUDnest8")

#MIDDLE SCHOOL
for MSGROUP in "${MSGROUPS[@]}"; do
    echo "Updating group: $MSGROUP"
    gam update group "$MSGROUP" sync managers csvfile gsheet:all-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    sleep 8
    gam update group "$MSGROUP" add managers nomail csvfile gsheet:all-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
    sleep 8
    gam update group "$MSGROUP" add managers csvfile gsheet:ms-mail gam@santafeschool.org "$GSHEET" "$MTAB"
    sleep 8
    gam update group "$MSGROUP" add managers nomail csvfile gsheet:ms-nomail gam@santafeschool.org "$GSHEET" "$MTAB"
done




#gam update group "$GROUP" sync members csvfile gsheet:member gam@santafeschool.org "$GSHEET" "$TAB"

#$gam update group $groupUNIFAMnestPK1 add manager ous_and_children $MANUNI;

##Sync managers

#$gam update group helpdesk@santafeschool.org sync managers csvfile gsheet:manager gam@santafeschool.org $GSHEET "helpdesk"

##Sync families rotating years

#$gam update group family-$PK1@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org $GSHEET "family-$PK1"