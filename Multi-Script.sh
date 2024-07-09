#! /bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam #set this to the location of your GAM binaries
start_date=`date +%Y-%m-%d` # sets date for vacation message in proper formate   
end_date=`date -v+90d +%Y-%m-%d` #adds 90 days to todays date for vacation message


# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'




newuser(){
   echo "     gApps Admin"
  read -p "Enter email address to admin: " email
    if [[ -z $email ]];
      then echo "Please enter an email address to proceed";
      read -p "Enter email address to admin: " email
    fi  
   }

clear
newuser
while :
do
 clear

echo -e "${green}   _____              __  __ 
  / ____|     /\     |  \/  |
 | |  __     /  \    | \  / |
 | | |_ |   / /\ \   | |\/| |
 | |__| |  / ____ \  | |  | |
  \_____| /_/    \_\ |_|  |_| ${clear}
${magenta}
   _____          __             ____      _________      .__                                   
  /  _  \________/  |_  ______  /  _ \    /   _____/ ____ |__| ____   ____   ____  ____   ______
 /  /_\  \_  __ \   __\/  ___/  >  _ </\  \_____  \_/ ___\|  |/ __ \ /    \_/ ___\/ __ \ /  ___/
/    |    \  | \/|  |  \___ \  /  <_\ \/  /        \  \___|  \  ___/|   |  \  \__\  ___/ \___ \ 
\____|__  /__|   |__| /____  > \_____\ \ /_______  /\___  >__|\___  >___|  /\___  >___  >____  >
        \/                 \/         \/         \/     \/        \/     \/     \/    \/     \/ 
        
        ${clear}"

 echo -e "Currently Managing ${yellow}$email${clear}"
 echo " "
 echo "1. Check Group Membership"
 echo "2. Delete All Other Contacts"
 echo "3. Check Last Login Time"
 echo "4. Yearly Grade Shift (Mid-July)"
 echo "5. Reset Password"
 echo "6. Suspend User"
 echo "7. Offboarding Student"
 echo "8. Offboarding Staff"
 echo "9. Offboarding Family"
 echo "10. Admin Another User"
 echo "11. Exit"
 echo "Please enter option [1 - 10]"
    read opt
    case $opt in
    
     1) echo "************ Check Group Membership ************";
        $gam print groups domain santafeschool.org members managers owners | $gam print group-members | grep "$email"
        echo "Groups have been checked [enter] key to continue. . .";
        read enterKey;;
     
     2) echo "************ Delete All Other Contacts ************";
        $gam user $email delete othercontacts emailmatchpattern ".*"
        echo "Other Contacts have been deleted. Press [enter] key to continue. . .";
        read enterKey;;
   
     
     3) echo "************ Check Last Login Time ************";
        $gam report users select users $email parameters accounts:last_login_time;
        echo "Press [enter] key to continue. . .";
        read enterKey;;
   
        
     4) echo "************ Once-a-year grade year shift ************";

         #calculation of mailing list years

         #Graduation Year variables


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



         echo "Updating groups"
         #unicorn
         gam update group "$groupUNIFAMstatic" sync members "$groupUNIFAMnestPK1,$groupUNIFAMnestPK2"
         #grasshopper
         gam update group "$groupGRASSFAMstatic" sync members "$groupGRASSFAMnestK"
         #stargazer
         gam update group "$groupSTARFAMstatic" sync members "$group1FAMstatic,$group2FAMstatic"
         gam update group "$group1FAMstatic" sync members "$groupSTARFAMnest1"
         gam update group "$group2FAMstatic" sync members "$groupSTARFAMnest2"
         #centaur
#         gam update group "$GROUP" sync members "$groupGRASSFAMnestK"
         #badger
#         gam update group "$GROUP" sync members "$groupGRASSFAMnestK"
         #middle school
#         gam update group "$GROUP" sync members "$groupGRASSFAMnestK"
         #mass lists

         echo "nested groups year shift is complete [enter] key to continue...";
         read enterKey;;
        
     5) echo "************ Reset Password ************";
        randpassword=$(env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 8) #creates random 8 charecter password
        $gam update user $email password $randpassword
        echo "Password has been reset to $randpassword [enter] key to continue. . .";
        read enterKey;;  

     6) echo "************ Suspend  User ************";
        $gam update user $email suspended on
        echo "User is now suspended press [enter] key to continue. . .";
        read enterKey;;

     7) echo "************ Offboarding Student ************";
        $gam user $email delete groups;
        $gam update org '/Users/Suspended-Users/Withdrawn Students' add users $email;
        $gam update user $email suspended on
        echo "$email has been removed from all groups, suspended, and placed in Withdrawn Students OU  [enter] key to continue. . .";
        read enterKey;;

     8) echo "************ Offboarding Staff ************";
        $gam user $email delete groups;
        $gam update org '/Users/Suspended-Users/Archive Staff' add users $email;
        $gam update user $email suspended on
        echo "$email has been removed from all groups, suspended, and placed in Withdrawn Staff OU  [enter] key to continue. . .";
        read enterKey;;

     9) echo "************ Offboarding Family ************";
        $gam user $email delete groups;
        echo "$email has been removed from all groups  [enter] key to continue. . .";
        read enterKey;;
      
     10) echo "************ Admin Another User ************";
        newuser;       
        echo "Press [enter] key to continue. . .";
        read enterKey;;
    
     11) echo "Bye $USER";
        exit 1;; 
        
     *) echo "$opt is an invaild option. Please select option between 1-15 only"
       echo "Press [enter] key to continue. . .";
        read enterKey;;
esac
done