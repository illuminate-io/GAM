#!/bin/sh

gam=/home/isaac/bin/gamadv-xtd3/gam


# Google Workspace Organizational Unit Variables

OU3=Users/Students/Centaur/3rdGrade
OU4=Users/Students/Centaur/4thGrade
OU5=Users/Students/Badger/5thGrade
OU6=Users/Students/Badger/6thGrade
OU7=Users/Students/MS/7thGrade
OU8=Users/Students/MS/8thGrade

# Groups

G3=student-third@santafeschool.org
G4=student-fourth@santafeschool.org
G5=student-fifth@santafeschool.org
G6=student-sixth@santafeschool.org
G7=student-seventh@santafeschool.org
G8=student-eighth@santafeschool.org

# Centaur Preview

while true; do
    read -p "Continue with Centaur Manager Sync PREVIEW (y/n)? " yn
    case $yn in
        [Yy]* ) 
        #$gam update group $groupUNIFAMstatic clear manager preview
        $gam update group $G3 add member preview ou_and_children_ns $OU3;
        $gam update group $G4 add member preview ou_and_children_ns $OU4; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Centaur for realsies

while true; do
    read -p "Continue with Centaur Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) 
        $gam update group $G3 add member ou_and_children_ns $OU3;
        $gam update group $G4 add member ou_and_children_ns $OU4; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Badger Preview

while true; do
    read -p "Continue with Badger Manager Sync PREVIEW (y/n)? " yn
    case $yn in
        [Yy]* ) 
        #$gam update group $groupUNIFAMstatic clear manager preview
        $gam update group $G5 add member preview ou_and_children_ns $OU5;
        $gam update group $G6 add member preview ou_and_children_ns $OU6; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Badger for realsies

while true; do
    read -p "Continue with Badger Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) 
        $gam update group $G5 add member ou_and_children_ns $OU5;
        $gam update group $G6 add member ou_and_children_ns $OU6; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Middle School Preview

while true; do
    read -p "Continue with Middle School Manager Sync PREVIEW (y/n)? " yn
    case $yn in
        [Yy]* ) 
        #$gam update group $groupUNIFAMstatic clear manager preview
        $gam update group $G7 add member preview ou_and_children_ns $OU7;
        $gam update group $G8 add member preview ou_and_children_ns $OU8; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done

#Middle School for realsies

while true; do
    read -p "Continue with Middle School Manager Sync (y/n)? " yn
    case $yn in
        [Yy]* ) 
        $gam update group $G7 add member ou_and_children_ns $OU7;
        $gam update group $G8 add member ou_and_children_ns $OU8; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n";;
    esac
done


echo "done"
