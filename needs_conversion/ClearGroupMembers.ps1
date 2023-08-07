$GroupEmail = Read-Host -Prompt 'Input the name of the group to clear members'
if ($GroupEmail) {
    Write-Host "Removing all users with "member" designation from [$GroupEmail]"
} else {
    Write-Warning -Message "No user email input."
}

gam update group $GroupEmail clear member

Write-Host "Completed Successfully. Getting updated group info"

Start-Sleep -Seconds 10 

gam info group $GroupEmail

pause