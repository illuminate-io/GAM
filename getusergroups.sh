#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam

read -p "What is the email to remove?" UserEmail

$gam print groups domain santafeschool.org member | $gam print group-members | grep $UserEmail