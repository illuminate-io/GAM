
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

# Google Workspace Organizational Unit Variables

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

# Lists

#Unigazer groups
#Unigazer families
groupUNIFAMstatic=family-unicorn@santafeschool.org
groupUNIFAMnestPK1=family-$PK1@santafeschool.org
groupUNIFAMnestPK2=family-$PK2@santafeschool.org

#Grasshopper groups
#Grasshopper families
groupGRASSFAMstatic=family-grasshopper@santafeschool.org 
groupGRASSFAMnestK=family-$K@santafeschool.org

#Stargazer groups
#Stargazer families
groupSTARFAMstatic=family-stargazer@santafeschool.org
group1FAMstatic=family-first@santafeschool.org
group2FAMstatic=family-second@santafeschool.org
groupSTARFAMnest1=family-$STAR1@santafeschool.org
groupSTARFAMnest2=family-$STAR2@santafeschool.org

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

#MS Faculty
groupMSFACULTY=midschoolfaculty@santafeschool.org
groupUNDERHILL=underhill@santafeschool.org
groupWHOLESCHOOL=wholeschool@santafeschool.org
groupSTUDENTS=students@santafeschool.org
groupSTAFF=staff@santafeschool.org
groupHELPDESK=helpdesk@santafeschool.org
groupALUMNI=alumni@santafeschool.org
groupFAMILIES=families@santafeschool.org


# List nomail Managers (these managers will not receive any mail from the group)

nmUNI="'$OUWELL','$OUSHAR'"
nmGRASS="'$OUWELL','$OUSHAR'"
nmSTAR="'$OUWELL','$OUSPA','$OUSHAR'"
nmCENT="'$OUSPA','$OUWELL','$OUART1','$OUPE','$OUDRA2','$OUSHAR'"
nmBADG="'$OUSPA','$OUART2','$OUPE','$OUDRA2','$OUSHAR'"
nmMS="'$OUJAP','$OUART2','$OUDRA2','$OUSHAR'"
nmUND="'$OUSHAR'"


# List allmail Managers (these managers will receive all mail sent to the group)

MANUNI="'$OUADM','$OUUNI','$OUUND'"
MANGRASS="'$OUADM','$OUGRASS','$OUUND'"
MANSTAR="'$OUADM','$OUSTAR','$OUUND',"
MANCENT="'$OUADM','$OUCENT','$OUUND',"
MANBADG="'$OUADM','$OUBADG','$OUUND','$OUWELL'"
MANMS="'$OUADM','$OUMS','$OUUND','$OUSPA','$OUPE','$OUWELL'"
MANUND="'$OUUND','$OUADM'"

#gam ous_and_children "$MANGRASS" print primaryEmail | gam csv - gam update group testgroup@santafeschool.org sync manager ~primaryEmail


#FAMILY GROUPS
UNIGROUPS=("$groupUNIFAMstatic" "$groupUNIFAMnestPK1" "$groupUNIFAMnestPK2")
GRASSGROUPS=("$groupGRASSFAMstatic" "$groupGRASSFAMnestK")
STARGROUPS=("$groupSTARFAMstatic" "$group1FAMstatic" "$group2FAMstatic" "$groupSTARFAMnest1" "$groupSTARFAMnest2")
CENTGROUPS=("$groupCENTFAMstatic" "$group3FAMstatic" "$group4FAMstatic" "$groupCENTFAMnest3" "$groupCENTFAMnest4" "$groupCENTSTUDstatic" "$group3STUDstatic" "$group4STUDstatic" "$groupCENTSTUDnest3" "$groupCENTSTUDnest4")
BADGGROUPS=("$groupBADGFAMstatic" "$group5FAMstatic" "$group6FAMstatic" "$groupBADGFAMnest5" "$groupBADGFAMnest6" "$groupBADGSTUDstatic" "$group5STUDstatic" "$group6STUDstatic" "$groupBADGSTUDnest5" "$groupBADGSTUDnest6")
MSGROUPS=("$groupMSFAMstatic" "$group7FAMstatic" "$group8FAMstatic" "$groupMSFAMnest7" "$groupMSFAMnest8" "$groupMSSTUDstatic" "$group7STUDstatic" "$group8STUDstatic" "$groupMSSTUDnest7" "$groupMSSTUDnest8")
MASSGROUPS=("$groupMSFACULTY" "$groupUNDERHILL" "$groupWHOLESCHOOL" "$groupSTUDENTS" "$groupSTAFF" "$groupHELPDESK" "$groupALUMNI" "$groupFAMILIES")

#UNICORN
for UNIGROUP in "${UNIGROUPS[@]}"; do
    echo "Updating group: $UNIGROUP"
    gam ous_and_children "$MANUNI" print primaryEmail | gam csv - gam update group "$UNIGROUP" sync manager ~primaryEmail
    gam ous_and_children "$nmUNI" print primaryEmail | gam csv - gam update group "$UNIGROUP" add manager nomail ~primaryEmail
    echo "sleep for 5s"
#    sleep 5
    echo "complete"
done

#GRASSHOPPER
for GRASSGROUP in "${GRASSROUPS[@]}"; do
    echo "Updating group: $GRASSGROUP"
    gam ous_and_children "$MANGRASS" print primaryEmail | gam csv - gam update group "$GRASSGROUP" sync manager ~primaryEmail
    gam ous_and_children "$nmGRASS" print primaryEmail | gam csv - gam update group "$GRASSGROUP" add manager nomail ~primaryEmail
    echo "sleep for 5s"
#    sleep 5
    echo "complete"
done

#STARGAZER
for STARGROUP in "${STARROUPS[@]}"; do
    echo "Updating group: $STARGROUP"
    gam ous_and_children "$MANSTAR" print primaryEmail | gam csv - gam update group "$STARGROUP" sync manager ~primaryEmail
    gam ous_and_children "$nmSTAR" print primaryEmail | gam csv - gam update group "$STARGROUP" add manager nomail ~primaryEmail
    echo "sleep for 5s"
#    sleep 5
    echo "complete"
done

#CENTAUR
for CENTGROUP in "${CENTGROUPS[@]}"; do
    echo "Updating group: $CENTGROUP"
    gam ous_and_children "$MANCENT" print primaryEmail | gam csv - gam update group "$CENTGROUP" sync manager ~primaryEmail
    gam ous_and_children "$nmCENT" print primaryEmail | gam csv - gam update group "$CENTGROUP" add manager nomail ~primaryEmail
    echo "sleep for 5s"
#    sleep 5
    echo "complete"
done

#BADGER
for BADGGROUP in "${BADGGROUPS[@]}"; do
    echo "Updating group: $BADGGROUP"
    gam ous_and_children "$MANBADG" print primaryEmail | gam csv - gam update group "$BADGGROUP" sync manager ~primaryEmail
    gam ous_and_children "$nmBADG" print primaryEmail | gam csv - gam update group "$BADGGROUP" add manager nomail ~primaryEmail
    echo "sleep for 5s"
#    sleep 5
    echo "complete"
done

#MIDDLE SCHOOL
for MSGROUP in "${MSGROUPS[@]}"; do
    echo "Updating group: $MSGROUP"
    gam ous_and_children "$MANMS" print primaryEmail | gam csv - gam update group "$MSGROUP" sync manager ~primaryEmail
    gam ous_and_children "$nmMS" print primaryEmail | gam csv - gam update group "$MSGROUP" add manager nomail ~primaryEmail
    echo "sleep for 5s"
 #   sleep 5
    echo "complete"
done