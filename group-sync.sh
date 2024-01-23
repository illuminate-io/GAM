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

##Sync managers

$gam update group helpdesk@santafeschool.org sync managers csvfile gsheet:manager gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "helpdesk"

##Sync families static years

$gam update group family-pre15@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-pre15"
$gam update group family-15@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-15"
$gam update group family-16@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-16"
$gam update group family-17@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-17"
$gam update group family-18@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-18"
$gam update group family-19@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-19"
$gam update group family-20@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-20"
$gam update group family-21@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-21"
$gam update group family-22@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-22"
$gam update group family-23@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-23"
$gam update group family-24@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-24"
$gam update group family-25@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-25"
$gam update group family-26@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-26"
$gam update group family-27@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-27"
$gam update group family-28@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-28"
$gam update group family-29@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-29"
$gam update group family-30@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-30"
$gam update group family-31@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-31"
$gam update group family-32@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-32"
$gam update group family-33@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-33"
$gam update group family-34@santafeschool.org sync members csvfile gsheet:member gam@santafeschool.org 10vu7t1Ojk0c8hXUUMglMl4jzmvX2oS1j5kig_tK413g "family-34"