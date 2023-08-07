#gam print group-members group <Group Email Address> recursive noduplicates todrive

$GroupEmail = Read-Host -Prompt 'Input the name of the group to print list (includes members from nested groups)'
if ($GroupEmail) 

{ Write-Host "Printing Group [$GroupEmail]" 

    }

    else {

    Write-Warning -Message "No group email input."

}

gam print group-members group $GroupEmail recursive noduplicates todrive

Write-Host "Completed Successfully."


pause