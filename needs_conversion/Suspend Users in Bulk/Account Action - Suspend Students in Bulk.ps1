gam csv suspend-students.csv gam update user ~email ou '/Users/Suspended Users/Withdrawn Students'
gam csv suspend-students.csv gam user ~email delete groups
gam csv suspend-students.csv gam update user ~email suspended on

Write-Host "Completed Successfully."

pause