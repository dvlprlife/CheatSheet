<#
 .SYNOPSIS
  Function to list files filtered by a size comparison
 .DESCRIPTION
  This function lists files whose size satisfies the provided comparison (less than or equal, or greater than or equal) against the specified threshold.
  .PARAMETER sourcePath
  The full path to a folder to process.
  .PARAMETER sizeThreshold
  The size, in bytes, a file must be compared against.
  .PARAMETER comparison
  Determines whether files are returned when their size is less than or equal, or greater than or equal, to the threshold.
  .EXAMPLE
  Get-FileListSize -sourcePath 'c:\windows\temp\' -sizeThreshold 1048576 -comparison LessOrEqual
 #>

Function Get-FileListSize {
    param (
        [Parameter(Mandatory = $true)]
        [string]$sourcePath,
        [Parameter(Mandatory = $true)]
        [long]$sizeThreshold,
        [ValidateSet('LessOrEqual', 'GreaterOrEqual')]
        [string]$comparison = 'LessOrEqual'
    )

    Get-ChildItem -Path $sourcePath -Recurse | Where-Object { -not $_.PSIsContainer } | ForEach-Object {
        $matchesThreshold = switch ($comparison) {
            'LessOrEqual' { $_.Length -le $sizeThreshold }
            'GreaterOrEqual' { $_.Length -ge $sizeThreshold }
            default { $false }
        }

        if ($matchesThreshold) {
            Write-Host ("{0} {1}" -f $_.FullName, $_.Length)
        }
    }
}