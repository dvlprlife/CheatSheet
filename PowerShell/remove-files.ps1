<#
 .SYNOPSIS
  Function to remove files of a certain extension from a path
 .DESCRIPTION
  This function removes files, based on extension, from the specified path.
  .PARAMETER path
  The full path to a folder.
.PARAMETER filters
  File extension filters; comma separated.
  .PARAMETER echo
  Display the filename
  .EXAMPLE
  clean-folders "c:\temp" $false
 #>
Function Remove-Files {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string] $filters,
        [bool]$echo = $true
    )

    $arrayOfFilters = $filters -split ","

    if (Test-Path -Path $Path) {
        foreach ($filter in $arrayOfFilters) {
            Get-ChildItem -Path $Path -Filter $filter -Recurse | Remove-Item -WhatIf
        }
    } else {
        write-Host "Path not found: $filePath"
    }
}

Remove-Files -filters "*.xlf" -path "C:\Users\BradPrendergast\Documents\git\dnw" 