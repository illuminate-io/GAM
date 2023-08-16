#!/bin/bash

gam=/home/isaac/bin/gamadv-xtd3/gam

$gam csv CreateUsers.csv gam create user "~useremail" firstname "~firstname" lastname "~lastname" ou "~ou" password "~password" notify "~~notifyemail~~" changepassword "~changepassword" >> createusers.log
