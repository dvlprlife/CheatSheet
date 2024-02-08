<#
 .SYNOPSIS
  Function to remove files
 .DESCRIPTION
  This function removes all files from a folder, recursively, older than a specified number of hours.
  .PARAMETER sourcePath
  The full path to a folder to proces.
  .PARAMETER maxHours
  The number of hours to use as the check for a file being older than. The parameter should be a negative number.
  .EXAMPLE
  remove-files-older-than 'D:\Archive\' -1200
  remove-files-older-than -sourcePath 'D:\Archive\' -maxHours -1200
 #>

Function remove-files-older-than {
    param (
        [Parameter(Mandatory = $true)]
        [string]$sourcePath,
        [Parameter(Mandatory = $true)]
        [int16]$maxHours
    )

    foreach ($folder in (Get-ChildItem $sourcePath -Recurse  | Where-Object { $_.PSIsContainer })) {
        #"Folder: $folder"
        foreach ($file in (Get-ChildItem $folder.fullname | Where-Object { ! $_.PSIsContainer })) {
            #"File: $file"
            if ($file.LastWriteTime -lt ($CurrDate).AddHours($maxHours)) {
                #"Filter File: $file"
                Remove-Item $file.fullname
            }
        }
    }
}