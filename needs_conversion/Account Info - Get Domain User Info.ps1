$UserEmail = Read-Host -Prompt 'Input the user email to get user info'
if ($UserEmail) {
    Write-Host "Getting account info for [$UserEmail]"
} else {
    Write-Warning -Message "No user email input."
}

gam info user $UserEmail

pause