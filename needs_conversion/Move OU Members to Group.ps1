#gam update group <Group Email Address> sync member ou "</Path/To/OU>"

$OU = Read-Host -Prompt 'Input the name of the OU to copy members from (e.g., /Users/Students/)'
if ($OU) 

{
    Write-Host "OU [$OU] selected"
}

    else 

{
    Write-Warning -Message "No OU input."
}

$GroupEmail = Read-Host -Prompt 'Input the name of the group to send emails to'
if ($GroupEmail)

{

    Write-Host "Copying all Members from OU [$OU] to Group [$GroupEmail]"

} else {
    Write-Warning -Message "No group email input."
}

gam update group $GroupEmail sync member ou $OU

Write-Host "Completed Successfully."

Start-Sleep -Seconds 10 

gam info group $GroupEmail

pause