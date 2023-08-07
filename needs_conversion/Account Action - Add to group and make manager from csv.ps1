#gam csv groupmanagers.csv gam update group ~group add member 
#gam csv groupmanagers.csv gam update group ~group update manager user 


$UserEmail = Read-Host -Prompt 'Input the user to make manager of groupmanagers.csv'
if ($UserEmail) {
    Write-Host "Adding member to group"
} else {
    Write-Warning -Message "No user email input."
}

gam csv groupmanagers.csv gam update group ~group add member $UserEmail

Write-Host "Completed Successfully. Now updating as manager for groups"

Start-Sleep -Seconds 3

gam csv groupmanagers.csv gam update group ~group update manager user $UserEmail

pause