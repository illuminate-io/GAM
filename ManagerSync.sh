#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam


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


#calculation of mailing list years

echo "This year's graduation class is 20$MS8"
echo "Unicorns include years 20$PK1 and 20$PK2 (pre-k)"
echo "Grasshopper includes year 20$K (kindergarten)"
echo "Stargazer includes years 20$STAR1 (1st Grade) and 20$STAR2 (2nd Grade)"
echo "Centaur includes years 20$CENT3 (3rd Grade) and 20$CENT4 (4th Grade)"
echo "Badger includes years 20$BADG5 (5th Grade) and 20$BADG6 (6th Grade)"
echo "Middle School includes years 20$MS7 (7th Grade) and 20$MS8 (8th Grade)"



#Unicorn for realsies

#clear managers

        $gam update group $groupUNIFAMstatic clear manager;
        $gam update group $groupUNIFAMnestPK1 clear manager;
        $gam update group $groupUNIFAMnestPK2 clear manager;

#allmail managers

        $gam update group $groupUNIFAMstatic add manager ous_and_children $MANUNI;
        $gam update group $groupUNIFAMnestPK1 add manager ous_and_children $MANUNI;
        $gam update group $groupUNIFAMnestPK2 add manager ous_and_children $MANUNI;

#nomail managers

        $gam update group $groupUNIFAMstatic add manager nomail ous_and_children $nmUNI;
        $gam update group $groupUNIFAMnestPK1 add manager nomail ous_and_children $nmUNI;
        $gam update group $groupUNIFAMnestPK2 add manager nomail ous_and_children $nmUNI;

#clear grasshopper managers

        $gam update group $groupGRASSFAMstatic clear manager;
        $gam update group $groupGRASSFAMnestK clear manager;

#allmail grasshopper managers

        $gam update group $groupGRASSFAMstatic add manager ous_and_children $MANGRASS;
        $gam update group $groupGRASSFAMnestK add manager ous_and_children $MANGRASS;

#nomail grasshopper managers

        $gam update group $groupGRASSFAMstatic add manager nomail ous_and_children $nmGRASS;
        $gam update group $groupGRASSFAMnestK add manager nomail ous_and_children $nmGRASS;

#Stargazer for realsies

#clear stargazer managers

        $gam update group $group1FAMstatic clear manager;
        $gam update group $group2FAMstatic clear manager;
        $gam update group $groupSTARFAMnest1 clear manager;
        $gam update group $groupSTARFAMnest2 clear manager;

#allmail stargazer managers

        $gam update group $group1FAMstatic add manager ous_and_children $MANSTAR;
        $gam update group $group2FAMstatic add manager ous_and_children $MANSTAR;
        $gam update group $groupSTARFAMnest1 add manager ous_and_children $MANSTAR;
        $gam update group $groupSTARFAMnest2 add manager ous_and_children $MANSTAR;

#nomail stargazer managers

        $gam update group $group1FAMstatic add manager nomail ous_and_children $nmSTAR;
        $gam update group $group2FAMstatic add manager nomail ous_and_children $nmSTAR;
        $gam update group $groupSTARFAMnest1 add manager nomail ous_and_children $nmSTAR;
        $gam update group $groupSTARFAMnest2 add manager nomail ous_and_children $nmSTAR;

#Centaur for realsies

#clear centaur managers

        $gam update group $groupCENTFAMmstatic clear manager;
        $gam update group $group3STUDstatic clear manager;
        $gam update group $group4STUDstatic clear manager;
        $gam update group $group3FAMstatic clear manager;
        $gam update group $group4FAMstatic clear manager;
        $gam update group $groupCENTFAMnest3 clear manager;
        $gam update group $groupCENTFAMnest4 clear manager;
        $gam update group $groupCENTSTUDnest3 clear manager;
        $gam update group $groupCENTSTUDnest4 clear manager;

#allmail centaur managers

        $gam update group $groupCENTFAMmstatic add manager ous_and_children $MANCENT;
        $gam update group $group3STUDstatic add manager ous_and_children $MANCENT;
        $gam update group $group4STUDstatic add manager ous_and_children $MANCENT;
        $gam update group $group3FAMstatic add manager ous_and_children $MANCENT;
        $gam update group $group4FAMstatic add manager ous_and_children $MANCENT;
        $gam update group $groupCENTFAMnest3 add manager ous_and_children $MANCENT;
        $gam update group $groupCENTFAMnest4 add manager ous_and_children $MANCENT;
        $gam update group $groupCENTSTUDnest3 add manager ous_and_children $MANCENT;
        $gam update group $groupCENTSTUDnest4 add manager ous_and_children $MANCENT;

#nomail centaur managers
        $gam update group $groupCENTFAMmstatic add manager nomail ous_and_children $nmCENT;
        $gam update group $group3STUDstatic add manager nomail ous_and_children $nmCENT;
        $gam update group $group4STUDstatic add manager nomail ous_and_children $nmCENT;
        $gam update group $group3FAMstatic add manager nomail ous_and_children $nmCENT;
        $gam update group $group4FAMstatic add manager nomail ous_and_children $nmCENT;
        $gam update group $groupCENTFAMnest3 add manager nomail ous_and_children $nmCENT;
        $gam update group $groupCENTFAMnest4 add manager nomail ous_and_children $nmCENT;
        $gam update group $groupCENTSTUDnest3 add manager nomail ous_and_children $nmCENT;
        $gam update group $groupCENTSTUDnest4 add manager nomail ous_and_children $nmCENT;

#Badger for realsies

#clear badger managers

        $gam update group $groupBADGFAMstatic clear manager;
        $gam update group $group5STUDstatic clear manager;
        $gam update group $group6STUDstatic clear manager;
        $gam update group $group5FAMstatic clear manager;
        $gam update group $group6FAMstatic clear manager;
        $gam update group $groupBADGFAMnest5 clear manager;
        $gam update group $groupBADGFAMnest6 clear manager;
        $gam update group $groupBADGSTUDstatic clear manager;
        $gam update group $groupBADGSTUDnest5 clear manager;
        $gam update group $groupBADGSTUDnest6 clear manager;       

#allmail badger managers

        $gam update group $groupBADGFAMstatic add manager ous_and_children $MANBADG;
        $gam update group $group5STUDstatic add manager ous_and_children $MANBADG;
        $gam update group $group6STUDstatic add manager ous_and_children $MANBADG;
        $gam update group $group5FAMstatic add manager ous_and_children $MANBADG;
        $gam update group $group6FAMstatic add manager ous_and_children $MANBADG;
        $gam update group $groupBADGFAMnest5 add manager ous_and_children $MANBADG;
        $gam update group $groupBADGFAMnest6 add manager ous_and_children $MANBADG;
        $gam update group $groupBADGSTUDstatic add manager ous_and_children $MANBADG;
        $gam update group $groupBADGSTUDnest5 add manager ous_and_children $MANBADG;
        $gam update group $groupBADGSTUDnest6 add manager ous_and_children $MANBADG;


#nomail badger managers

        $gam update group $groupBADGFAMstatic add manager nomail ous_and_children $nmBADG;
        $gam update group $group5STUDstatic add manager nomail ous_and_children $nmBADG;
        $gam update group $group6STUDstatic add manager nomail ous_and_children $nmBADG;
        $gam update group $group5FAMstatic add manager nomail ous_and_children $nmBADG;
        $gam update group $group6FAMstatic add manager nomail ous_and_children $nmBADG;
        $gam update group $groupBADGFAMnest5 add manager nomail ous_and_children $nmBADG;
        $gam update group $groupBADGFAMnest6 add manager nomail ous_and_children $nmBADG;
        $gam update group $groupBADGSTUDstatic add manager nomail ous_and_children $nmBADG;
        $gam update group $groupBADGSTUDnest5 add manager nomail ous_and_children $nmBADG;
        $gam update group $groupBADGSTUDnest6 add manager nomail ous_and_children $nmBADG;

#Middle School for realsies

#clear ms managers

        $gam update group $groupMSFAMstatic clear manager;
        $gam update group $group7FAMstatic clear manager;
        $gam update group $group8FAMstatic clear manager;
        $gam update group $groupMSFAMnest7 clear manager;
        $gam update group $groupMSFAMnest8 clear manager;
        $gam update group $groupMSSTUDstatic clear manager;
        $gam update group $groupMSSTUD7static clear manager;
        $gam update group $groupMSSTUD8static clear manager;
        $gam update group $groupMSSTUDnest7 clear manager;
        $gam update group $groupMSSTUDnest8 clear manager;
        $gam update group $groupMSFACULTY clear manager;    

#allmail ms managers

        $gam update group $groupMSFAMstatic add manager ous_and_children $MANMS;
        $gam update group $group7FAMstatic add manager ous_and_children $MANMS;
        $gam update group $group8FAMstatic add manager ous_and_children $MANMS;
        $gam update group $groupMSFAMnest7 add manager ous_and_children $MANMS;
        $gam update group $groupMSFAMnest8 add manager ous_and_children $MANMS;
        $gam update group $groupMSSTUDstatic add manager ous_and_children $MANMS;
        $gam update group $groupMSSTUD7static add manager ous_and_children $MANMS;
        $gam update group $groupMSSTUD8static add manager ous_and_children $MANMS;
        $gam update group $groupMSSTUDnest7 add manager ous_and_children $MANMS;
        $gam update group $groupMSSTUDnest8 add manager ous_and_children $MANMS;
        $gam update group $groupMSFACULTY add manager ous_and_children $MANMS;

#nomail ms managers

        $gam update group $groupMSFAMstatic add manager nomail ous_and_children $nmMS;
        $gam update group $group7FAMstatic add manager nomail ous_and_children $nmMS;
        $gam update group $group8FAMstatic add manager nomail ous_and_children $nmMS;
        $gam update group $groupMSFAMnest7 add manager nomail ous_and_children $nmMS;
        $gam update group $groupMSFAMnest8 add manager nomail ous_and_children $nmMS;
        $gam update group $groupMSSTUDstatic add manager nomail ous_and_children $nmMS;
        $gam update group $groupMSSTUD7static add manager nomail ous_and_children $nmMS;
        $gam update group $groupMSSTUD8static add manager nomail ous_and_children $nmMS;
        $gam update group $groupMSSTUDnest7 add manager nomail ous_and_children $nmMS;
        $gam update group $groupMSSTUDnest8 add manager nomail ous_and_children $nmMS;
        $gam update group $groupMSFACULTY add manager nomail ous_and_children $nmMS;

#Mass mailing lists for realsies

#clear managers

        $gam update group $groupUNDERHILL clear manager;
        $gam update group $groupWHOLESCHOOL clear manager;
        $gam update group $groupSTAFF clear manager;
        $gam update group $groupSTUDENTS clear manager;
        $gam update group $groupALUMNI clear manager;
        $gam update group $groupFAMILIES clear manager;
        
#add managers

        $gam update group $groupUNDERHILL add manager ous_and_children $MANUND;
        $gam update group $groupWHOLESCHOOL add manager ous_and_children $MANUND;
        $gam update group $groupSTAFF add manager ous_and_children $MANUND;
        $gam update group $groupSTUDENTS add manager ous_and_children $MANUND;
        $gam update group $groupALUMNI add manager ous_and_children $MANUND;
        $gam update group $groupFAMILIES add manager ous_and_children $MANUND;


#IT helpdesk for realsies

        
        $gam update group $groupHELPDESK sync manager user isaac@santafeschool.org;
        

echo "done"