#!/bin/bash
gam=/home/isaac/bin/gamadv-xtd3/gam

# Read the graduation year
read -p "Enter the two-digit year for this year's graduation class: " gradyear

# Calculate class years based on input
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

# Define groups and managers
groupUNIFAMstatic="family-unicorn@santafeschool.org"
groupUNIFAMnestPK1="family-$PK1@santafeschool.org"
groupUNIFAMnestPK2="family-$PK2@santafeschool.org"
groupGRASSFAMstatic="family-grasshopper@santafeschool.org"
groupGRASSFAMnestK="family-$K@santafeschool.org"
# ... (include all other groups as per your original script)

# Generate CSV file for updating group managers
csvFile="update-managers-$gradyear.csv"
echo "groupEmail,managerEmail" > $csvFile
echo "$groupUNIFAMstatic,manager-unicorn@santafeschool.org" >> $csvFile
echo "$groupUNIFAMnestPK1,manager-unicornPK1@santafeschool.org" >> $csvFile
echo "$groupUNIFAMnestPK2,manager-unicornPK2@santafeschool.org" >> $csvFile
echo "$groupGRASSFAMstatic,manager-grasshopper@santafeschool.org" >> $csvFile
echo "$groupGRASSFAMnestK,manager-grasshopperK@santafeschool.org" >> $csvFile
# ... (continue adding lines for other groups with their respective managers)

# Use GAM with CSV for bulk operations
while IFS=, read -r groupEmail managerEmail
do
    $gam update group "$groupEmail" add manager user "$managerEmail"
done < "$csvFile"

echo "Manager updates for the year 20$gradyear completed."
