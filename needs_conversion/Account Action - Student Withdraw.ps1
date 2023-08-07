$UserEmail = Read-Host -Prompt 'Input the user email of withdrawn student'
if ($UserEmail) {
    Write-Host "Removing [$UserEmail] from all groups, suspending user, and placing in 'Withdrawn Students' OU"
} else {
    Write-Warning -Message "No user email input."
}

gam user $UserEmail delete groups
gam update org '/Users/Suspended Users/Withdrawn Students' add users $UserEmail
gam update user $UserEmail suspended on

Write-Host "Completed Successfully. Getting updated user info"

Start-Sleep -Seconds 10 

gam info user $UserEmail

pause