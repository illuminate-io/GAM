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
 echo "3. ------------------------"
 echo "4. ------------------------"
 echo "5. Reset Password"
 echo "6. Suspend User"
 echo "7. Offboarding Student"
 echo "8. Offboarding Staff"
 echo "9. Admin Another User"
 echo "10. Exit"
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
   
     
     3) echo "************ CHANGE THIS TO SOMETHING ELSE ************";
        purge_groups=$($gam info user $email | grep -A 100 "Groups:" |cut -d '<' -f2 |cut -d '>' -f1 |grep -v 'Groups:')
           for i in $purge_groups
            do
               echo removing $i
               $gam update group $i remove member $email
            done;
        echo "All groups removed press [enter] key to continue. . .";
        read enterKey;;
   
        
     4) echo "************ CHANGE THIS TO SOMETHING ELSE ************";
        $gam user $email profile unshared
        echo "User is now hidden from the GAL Press [enter] key to continue. . .";
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
        echo "$email has been removed from all groups and placed in Withdrawn Students OU  [enter] key to continue. . .";
        read enterKey;;

     8) echo "************ Offboarding Staff ************";
        $gam user $email delete groups;
        $gam update org '/Users/Suspended-Users/Archive Staff' add users $email;
        echo "$email has been removed from all groups and placed in Withdrawn Staff OU  [enter] key to continue. . .";
        read enterKey;;
      
     9) echo "************ Admin Another User ************";
        newuser;       
        echo "Press [enter] key to continue. . .";
        read enterKey;;
    
     10) echo "Bye $USER";
        exit 1;; 
        
     *) echo "$opt is an invaild option. Please select option between 1-15 only"
       echo "Press [enter] key to continue. . .";
        read enterKey;;
esac
done