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

### Strings
    "Helo World!"
    
    $msg = "Hello World!"
    
    $firstName = "Jane"
    $lastName = "Doe"
    $fullName = $firstName + " " + $lastName
    
## Dictionaries (key-value)
    $name = @{ firstName = "John"; lastName = "Doe"}
    "Name First Name " + $name.firstName;
    "Name Full Name " + $name.firstName + " " + $name.lastName;

    $students = @{}
    $students.Add("10","Jane Doe")
    $students.Add("20", "Bob Smith")
    $students.Add("30", "John Smith")

    $students.Keys | ForEach-Object { "$_ is a key"}

    $students.Values | ForEach-Object { "$_ is the value"}

    Write-Host -ForegroundColor blue $students["20"]

    $students["30"] = "Mike Smith"

    $students.GetEnumerator() | ForEach-Object{
        $message = '{0} is id {1} is name' -f $_.key, $_.value
        Write-Output $message
    }

    $id = "30"
    $student = $students[$id]
    Write-Host -ForegroundColor Green $student 


## Lists     
 
     $colors = @("red","orange","yellow","green","blue")

     #first
     Write-Host -ForegroundColor $colors[0] $colors[0]
     #last
     Write-Host -ForegroundColor $colors[-1] $colors[-1]

     $colors += "violet"

     foreach($color in $colors){
          Write-Host $color
     }   
      
     $names = "John","Jane","Bob"
   
     $namesubset = $names[0..1]
    
     foreach($subset in $namesubset){
          Write-Host $subset
     }

## Input 
     $name = Read-Host "What is your name?"
     "Hi $name!"

     [int]$age = Read-Host "How old are you?"
     "Wow! You are $age"

     [decimal]$price = Read-Host "What is the price?"
     "The price of $price is too expensive" 

## Conditional
     $number = 10

     if ($number -eq 10) {"equal"}
     if ($number -ne 10) {"not equal"}
     if ($number -gt 10) {"greater than"}
     if ($number -ge 10) {"greater than or equal to"}
     if ($number -lt 10) {"less than"}
     if ($number -le 10) {"less than or equal to"}

     if ("red" -in "red","green","blue"){
          "In"
     } else {
          "Not in"
     }

     if ("yellow" -notin "red","green","blue") {
          "Not in"
     } else {
          "In"
     }

     # boolean values
     $isActive = $true
     $isGood = $false

     if ($isActive) {
          "Active"
     } 
