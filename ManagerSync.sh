#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam


# Google Workspace Organizational Unit Variables

OUUNI=Users/Staff/Teachers/Unicorn
OUGRASS=Users/Staff/Teachers/Grasshopper
OUSTAR=Users/Staff/Teachers/Stargazer
OUCENT=Users/Staff/Teachers/Centaur
OUBADG=Users/Staff/Teachers/Badger
OUMS=Users/Staff/Teachers/MS
OUSPEC=Users/Staff/Teachers/Specials
OUADM=Users/Staff/Admin
OUUND=Users/Staff/Underhill

#
# One day you need to make a list for IT staff and perhaps counselors 
# (and any other teams that need mass mailing list ability)
#

# List Managers

MANUNI="'$OUUNI','$OUUND','$OUADM'"
MANGRASS="'$OUGRASS','$OUUND','$OUADM'"
MANSTAR="'$OUSTAR','$OUUND','$OUADM'"
MANCENT="'$OUCENT','$OUSPEC','$OUUND','$OUADM'"
MANBADG="'$OUBADG','$OUSPEC','$OUUND','$OUADM'"
MANMS="'$OUMS','$OUSPEC','$OUUND','$OUADM'"
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
groupSTARFAMnest1=family-$STAR1@santafeschool.org
groupSTARFAMnest2=family-$STAR2@santafeschool.org

#Centaur groups
#Centaur families
groupCENTFAMmstatic=family-centaur@santafeschool.org
groupCENTFAMnest3=family-$CENT3@santafeschool.org
groupCENTFAMnest4=family-$CENT4@santafeschool.org

#Centaur students
groupCENTSTUDstatic=student-centaur@santafeschool.org
groupCENTSTUDnest3=student-$CENT3@santafeschool.org
groupCENTSTUDnest4=student-$CENT4@santafeschool.org

#Badger groups
#Badger families
groupBADGFAMstatic=family-badger@santafeschool.org
groupBADGFAMnest5=family-$BADG5@santafeschool.org
groupBADGFAMnest6=family-$BADG6@santafeschool.org

#Badger students
groupBADGSTUDstatic=student-badger@santafeschool.org
groupBADGSTUDnest5=student-$BADG5@santafeschool.org
groupBADGSTUDnest6=student-$BADG6@santafeschool.org

#Middle school groups
#Middle school families
groupMSFAMstatic=family-ms@santafeschool.org
groupMSFAMnest7=family-$MS7@santafeschool.org
groupMSFAMnes8=family-$MS8@santafeschool.org

#Middle school students
groupMSSTUDstatic=student-ms@santafeschool.org
groupMSSTUDnest7=student-$MS7@santafeschool.org
groupMSSTUDnes8=student-$MS8@santafeschool.org
groupMSFACULTY=midschoolfaculty@santafeschool.org

groupUNDERHILL=underhill@santafeschool.org
groupWHOLESCHOOL=wholeschool@santafeschool.org
groupSTUDENTS=students@santafeschool.org
groupSTAFF=staff@santafeschool.org
groupHELPDESK=helpdesk@santafeschool.org
groupALUMNI=alumni@santafeschool.org
groupFAMILIES=families@santafeschool.org

echo "This year's graduation class is 20$MS8"
echo "Unicorns include years 20$PK1 and 20$PK2 (pre-k)"
echo "Grasshopper includes year 20$K (kindergarten)"
echo "Stargazer includes years 20$STAR1 (1st Grade) and 20$STAR2 (2nd Grade)"
echo "Centaur includes years 20$CENT3 (3rd Grade) and 20$CENT4 (4th Grade)"
echo "Badger includes years 20$BADG5 (5th Grade) and 20$BADG6 (6th Grade)"
echo "Middle School includes years 20$MS7 (7th Grade) and 20$MS8 (8th Grade)"



#Unicorn Preview

while true; do
    read -p "Continue with Unicorn Manager Sync Preview (y/n)? " yn
    case $yn in
        [Yy]* ) 
        #$gam update group $groupUNIFAMstatic clear manager preview
        $gam update group $groupUNIFAMstatic sync manager preview ous_and_children $MANUNI;
        $gam update group $groupUNIFAMnestPK1 sync manager preview ous_and_children $MANUNI;
        $gam update group $groupUNIFAMnestPK2 sync manager preview ous_and_children $MANUNI; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Unicorn for realsies

while true; do
    read -p "Continue with Unicorn Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) 
        #$gam update group $groupUNIFAMstatic clear manager preview
        $gam update group $groupUNIFAMstatic sync manager ous_and_children $MANUNI;
        $gam update group $groupUNIFAMnestPK1 sync manager ous_and_children $MANUNI;
        $gam update group $groupUNIFAMnestPK2 sync manager ous_and_children $MANUNI; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done


#Grasshopper Preview

while true; do
    read -p "Continue with Grasshopper Manager Sync Preview (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupGRASSFAMstatic sync manager preview ous_and_children $MANGRASS;
        $gam update group $groupGRASSFAMnestK sync manager preview ous_and_children $MANGRASS; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Grasshopper for realsies

while true; do
    read -p "Continue with Grasshopper Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupGRASSFAMstatic sync manager ous_and_children $MANGRASS;
        $gam update group $groupGRASSFAMnestK sync manager ous_and_children $MANGRASS; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done
#Stargazer Preview

while true; do
    read -p "Continue with Stargazer Manager Sync Preview (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupSTARFAMnest1 sync manager preview ous_and_children $MANSTAR;
        $gam update group $groupSTARFAMnest1 sync manager preview ous_and_children $MANSTAR;
        $gam update group $groupSTARFAMnest2 sync manager preview ous_and_children $MANSTAR; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Stargazer for realsies

while true; do
    read -p "Continue with Stargazer Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupSTARFAMnest1 sync manager ous_and_children $MANSTAR;
        $gam update group $groupSTARFAMnest1 sync manager ous_and_children $MANSTAR;
        $gam update group $groupSTARFAMnest2 sync manager ous_and_children $MANSTAR; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Centaur Preview

while true; do
    read -p "Continue with Centaur Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupCENTFAMmstatic sync manager preview ous_and_children $MANCENT;
        $gam update group $groupCENTFAMnest3 sync manager preview ous_and_children $MANCENT;
        $gam update group $groupCENTFAMnest4 sync manager preview ous_and_children $MANCENT;
        $gam update group $groupCENTSTUDnest3 sync manager preview ous_and_children $MANCENT;
        $gam update group $groupCENTSTUDnest4 sync manager preview ous_and_children $MANCENT; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Centaur for realsies

while true; do
    read -p "Continue with Centaur Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupCENTFAMmstatic sync manager ous_and_children $MANCENT;
        $gam update group $groupCENTFAMnest3 sync manager ous_and_children $MANCENT;
        $gam update group $groupCENTFAMnest4 sync manager ous_and_children $MANCENT;
        $gam update group $groupCENTSTUDnest3 sync manager ous_and_children $MANCENT;
        $gam update group $groupCENTSTUDnest4 sync manager ous_and_children $MANCENT; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done


#Badger Preview

while true; do
    read -p "Continue with Badger Manager Sync Preview (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupBADGFAMstatic sync manager preview ous_and_children $MANBADG;
        $gam update group $groupBADGFAMnest5 sync manager preview ous_and_children $MANBADG;
        $gam update group $groupBADGFAMnest6 sync manager preview ous_and_children $MANBADG;
        $gam update group $groupBADGSTUDstatic sync manager preview ous_and_children $MANBADG;
        $gam update group $groupBADGSTUDnest5 sync manager preview ous_and_children $MANBADG;
        $gam update group $groupBADGSTUDnest6 sync manager preview ous_and_children $MANBADG; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Badger for realsies

while true; do
    read -p "Continue with Badger Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupBADGFAMstatic sync manager ous_and_children $MANBADG;
        $gam update group $groupBADGFAMnest5 sync manager ous_and_children $MANBADG;
        $gam update group $groupBADGFAMnest6 sync manager ous_and_children $MANBADG;
        $gam update group $groupBADGSTUDstatic sync manager ous_and_children $MANBADG;
        $gam update group $groupBADGSTUDnest5 sync manager ous_and_children $MANBADG;
        $gam update group $groupBADGSTUDnest6 sync manager ous_and_children $MANBADG; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Middle School Preview

while true; do
    read -p "Continue with Middle School Manager Sync preview (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupMSFAMstatic sync manager preview ous_and_children $MANMS;
        $gam update group $groupMSFAMnest7 sync manager preview ous_and_children $MANMS;
        $gam update group $groupMSFAMnes8 sync manager preview ous_and_children $MANMS;
        $gam update group $groupMSSTUDstatic sync manager preview ous_and_children $MANMS;
        $gam update group $groupMSSTUDnest7 sync manager preview ous_and_children $MANMS;
        $gam update group $groupMSSTUDnes8 sync manager preview ous_and_children $MANMS;
        $gam update group $groupMSFACULTY sync manager preview ous_and_children $MANMS; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Middle School for realsies

while true; do
    read -p "Continue with Middle School Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupMSFAMstatic sync manager ous_and_children $MANMS;
        $gam update group $groupMSFAMnest7 sync manager ous_and_children $MANMS;
        $gam update group $groupMSFAMnes8 sync manager ous_and_children $MANMS;
        $gam update group $groupMSSTUDstatic sync manager ous_and_children $MANMS;
        $gam update group $groupMSSTUDnest7 sync manager ous_and_children $MANMS;
        $gam update group $groupMSSTUDnes8 sync manager ous_and_children $MANMS;
        $gam update group $groupMSFACULTY sync manager ous_and_children $MANMS; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Mass mailing lists preview

while true; do
    read -p "Continue with Mass Lists Manager Sync preview (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupUNDERHILL sync manager preview ous_and_children $MANUND;
        $gam update group $groupWHOLESCHOOL sync manager preview ous_and_children $MANUND;
        $gam update group $groupSTAFF sync manager preview ous_and_children $MANUND;
        $gam update group $groupSTUDENTS sync manager preview ous_and_children $MANUND;
        $gam update group $groupALUMNI sync manager preview ous_and_children $MANUND;
        $gam update group $groupFAMILIES sync manager preview ous_and_children $MANUND;
         break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Mass mailing lists for realsies

while true; do
    read -p "Continue with Mass Lists Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupUNDERHILL sync manager ous_and_children $MANUND;
        $gam update group $groupWHOLESCHOOL sync manager ous_and_children $MANUND;
        $gam update group $groupSTAFF sync manager ous_and_children $MANUND;
        $gam update group $groupSTUDENTS sync manager ous_and_children $MANUND;
        $gam update group $groupALUMNI sync manager ous_and_children $MANUND;
        $gam update group $groupFAMILIES sync manager ous_and_children $MANUND;
         break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#IT helpdesk


while true; do
    read -p "Continue with helpdesk lists Manager Sync preview (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupHELPDESK sync manager preview user isaac@santafeschool.org;
         break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

while true; do
    read -p "Continue with helpdesk lists Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) $gam update group $groupHELPDESK sync manager user isaac@santafeschool.org;
         break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

echo "done"