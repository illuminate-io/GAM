$UserEmail = Read-Host -Prompt 'Input the user email to get member groups'
if ($UserEmail) {
    Write-Host "Getting Groups info for [$UserEmail]"
} else {
    Write-Warning -Message "No user email input."
}

gam print groups domain santafeschool.org member | gam print group-members | Select-String $UserEmail

pause