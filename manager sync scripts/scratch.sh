
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

gam ous_and_children "$MANGRASS" print primaryEmail | gam csv - gam update group testgroup@santafeschool.org sync manager ~primaryEmail