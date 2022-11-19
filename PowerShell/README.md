# PowerShell

##  Table of Contents
1.

***
## Credentials
    $UserName = 'admin'
    $Password = 'password'
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($UserName,$SecurePassword)
    
## Files
### Delete all files from folder and subfolders
    Get-ChildItem -Path $targetFolder -Include *.* -File -Recurse | foreach { $_.Delete()}
    Remove-Item -Path "$targetFolder\*" -Recurse

### Copy all files from folder to folder and subfolders
    Copy-Item -Path $sourceFolder\* -Destination $targetFolder -Recurse -Force
