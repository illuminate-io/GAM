
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
BADGGROUPS=("$groupBADGFAMstatic" "$group1FAMstatic" "$group2FAMstatic" "$groupBADGFAMnest1" "$groupBADGFAMnest2" "$groupBADGSTUDstatic" "$group5STUDstatic" "$group6STUDstatic" "$groupBADGSTUDnest5" "$groupBADGSTUDnest6")

#BADGER
for BADGGROUP in "${BADGGROUPS[@]}"; do
    echo "Updating group: $BADGGROUP"
    gam ous_and_children "$MANBADG" print primaryEmail | gam csv - gam update group "$BADGGROUP" sync manager ~primaryEmail
    echo "sleep for 8s"
    sleep 8
    echo "complete"
done
