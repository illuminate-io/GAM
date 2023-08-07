#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam

gam csv suspend-students.csv gam update user ~email ou '/Users/Suspended Users/Withdrawn Students'
gam csv suspend-students.csv gam user ~email delete groups
gam csv suspend-students.csv gam update user ~email suspended on

echo "Completed Successfully."

pause