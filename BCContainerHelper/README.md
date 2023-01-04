# BCContainerHelper

##  Table of Contents
1.  [BCContainerHelper Installation](#BCContainerHelper-Installation)
2.  [Container Management](#container-management)
3.  [App Management](#app-management)
4.  [Extension Management](#extension-management) 

***

## BCContainerHelper Installation

### Install BCContainerHelper

    Install-Module BcContainerHelper (-force) (-allowPrerelease)

### Uninstall BCContainerHelper

    Uninstall-Module BCContainerHelper

## Container Management

### Import-BcContainerLicense
     Import-BcContainerLicense -licenseFile $licensefile -containerName $containerName

###  Remove-BcContainer
      Remove-BcContainer $containername

### Get-BCArtifactUrl
    $artifactUrl = Get-BCArtifactUrl -version 21 -country "us" -select Latest -type Sandbox
    $artifactUrl = Get-BCArtifactUrl -version 20.4.0.0 -country "us" -select Closest -type OnPrem 
    $artifactUrl = Get-BCArtifactUrl  -country "us" -select Latest -type Sandbox -storageAccount BcPublicPreview

### Flush-ContainerHelperCache
    Flush-ContainerHelperCache -cache bcartifacts -keepDays 7
    
### Setup-BcContainerTestUsers 
    $Password = 'password'
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($UserName, $SecurePassword)

    Setup-BcContainerTestUsers -containerName $containerName -select Premium -Password $SecurePassword -credential $Credential 



## App Management

### Get-BcContainerAppRuntimePackage 
     Get-BcContainerAppRuntimePackage -appFile $appFilePathName -appName $appName -containerName $containerName 

## Extension Management

###  Publish-BcContainerApp 
     Publish-BcContainerApp -appFile $appFilePathName -containerName $containerName (-skipVerification) (-install) (-sync)
     


Install-NAVSipCryptoProviderFromBcContainer
