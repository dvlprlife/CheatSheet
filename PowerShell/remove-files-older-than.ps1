<#
 .SYNOPSIS
  Function to remove files older than a specified age
 .DESCRIPTION
  Removes files from the supplied folder (recursively) when their last write time is older than the supplied number of hours.
 .PARAMETER sourcePath
  The full path to a folder to process.
 .PARAMETER olderThanHours
  Number of hours a file must be older than to match the filter.
 .PARAMETER action
  Choose whether matching files are printed or removed.
 .EXAMPLE
  remove-files-older-than 'D:\Archive\' 1200
  remove-files-older-than -sourcePath 'D:\Archive\' -olderThanHours 1200 -action Remove
 #>

Function remove-files-older-than {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$sourcePath,
        [Parameter(Mandatory = $true)]
        [ValidateRange(0, [double]::MaxValue)]
        [double]$olderThanHours,
        [ValidateSet('Print', 'Remove')]
        [string]$action = 'Print'
    )

    $cutoff = (Get-Date).AddHours(-1 * $olderThanHours)

    # Remove files that fall before the cutoff timestamp
    Get-ChildItem -Path $sourcePath -File -Recurse | Where-Object { $_.LastWriteTime -lt $cutoff } | ForEach-Object {
        if ($action -eq 'Print') {
            Write-Output $_.FullName
        }
        else {
            if ($PSCmdlet.ShouldProcess($_.FullName, 'Remove file')) {
                Remove-Item -LiteralPath $_.FullName
            }
        }
    }
}