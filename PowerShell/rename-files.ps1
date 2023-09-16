<#
 .SYNOPSIS
  Function to rename files
 .DESCRIPTION
  This function renames a file or files withing a folder to lowercase and replacing special characters to a hyphen.
  .PARAMETER path
  The full path to a folder or file.
  .PARAMETER includeFolders
  Rename folders in addition to files.
  .PARAMETER echo
  Display the rename status
  .EXAMPLE
  rename-files "c:\temp" $false $true
  rename-files "c:\temp\aMt 2.txt"
 #>
Function rename-files {
    param (
        [Parameter(Mandatory = $true)]
        [string]$path,
        [bool]$includeFolders = $false,
        [bool]$echo = $false
    )

    if (Test-Path -Path $path) {
        Get-ChildItem -path $path | Foreach-Object {
            if ((($_ -is [System.IO.DirectoryInfo]) -and $includeFolders) -or ($_ -is [System.IO.FileInfo])) {
                $newName = $_.Name -replace '[^A-Za-z0-9- \.\[\]]', ' '
                $newName = $newName.ToLower() -replace ' ', '-'

                if (-not ($_.Name -ceq $newName)){
                    if ($echo) {
                        echo "renaming: $($_.Name)  to: $newName"
                     }
                    Rename-Item -Path $_.fullname -newname $($newName)
                }
            }

            if ($_ -is [System.IO.DirectoryInfo]) {
                rename-files $_.FullName $echo
            }
        }
    }
}
