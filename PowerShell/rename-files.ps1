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
    if (Test-Path -LiteralPath $path) {
        Get-ChildItem -LiteralPath $path | Foreach-Object {
            $currentItem = $_
            if ((($currentItem -is [System.IO.DirectoryInfo]) -and $includeFolders) -or ($currentItem -is [System.IO.FileInfo])) {
                $newName = $currentItem.Name -replace '[^A-Za-z0-9- \.\[\]]', ' '
                $newName = $newName.ToLower() -replace ' ', '-'
                if ($currentItem.Name -cne $newName) {
                    if ($echo) {
                        Write-Output "renaming: $($currentItem.Name)  to: $($newName)"
                    }
                    # names match ignoring case => only the casing changed.
                    # rename to a temp name first, then to the target, to avoid
                    # "Source and destination path must be different"
                    if ($currentItem.Name -eq $newName) {
                        $randomname = [System.IO.Path]::GetRandomFileName()
                        $tempItem    = Rename-Item -LiteralPath $currentItem.FullName -NewName $randomname -PassThru
                        $currentItem = Rename-Item -LiteralPath $tempItem.FullName    -NewName $newName    -PassThru
                    }
                    else {
                        $currentItem = Rename-Item -LiteralPath $currentItem.FullName -NewName $newName -PassThru
                    }
                }
            }
            if ($currentItem -is [System.IO.DirectoryInfo]) {
                rename-files $currentItem.FullName $includeFolders $echo
            }
        }
    }
}
