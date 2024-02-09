<#
 .SYNOPSIS
  Function to list files less than or equal to a specified size
 .DESCRIPTION
  This function lists files less than or equal to a specified size.
  .PARAMETER sourcePath
  The full path to a folder to proces.
  .PARAMETER maxSize
  The size that a file must be less than or equal to in order to be listed.
  .EXAMPLE
  Get-FileListSize -sourcePath 'c:\windows\temp\' -maxSize -0
 #>

Function Get-FileListSize {
    param (
        [Parameter(Mandatory = $true)]
        [string]$sourcePath,
        [Parameter(Mandatory = $true)]
        [int16]$maxSize
    )

    Get-Childitem $sourcePath -Recurse | foreach-object {
        if (!$_.PSIsContainer -and $_.length -le $maxSize) {
            write-host (“{0} {1}” -f $_.FullName, $_.Length)
        }
    }
}