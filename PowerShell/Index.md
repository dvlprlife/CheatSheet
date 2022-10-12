# PowerShell

##  Table of Contents
1.

***
## Credentials
    $UserName = 'admin'
    $Password = 'password'
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($UserName,$SecurePassword)
