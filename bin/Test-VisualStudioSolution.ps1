#!/usr/bin/env powershell
<#
.SYNOPSIS Helps to protect against calling `start` on rogue files with a .sln extension
#>
[CmdletBinding()]
Param (
    [Parameter(Mandatory=$true)]
    [string]$Path
)

Add-Type -Path "C:\Program Files (x86)\Reference Assemblies\Microsoft\MSBuild\v14.0\Microsoft.Build.dll"

$absolutePath
Try
{
    $resolvedPath = Resolve-Path $Path -ErrorAction Stop
    $absolutePath = $resolvedPath.Path
    Write-Verbose "$Path -> $absolutePath"
    $solutionFile = [Microsoft.Build.Construction.SolutionFile]::Parse($absolutePath)

    Write-Verbose "$Path is a valid Visual Studio Soltuion"
}
Catch
{
    if ($absolutePath -ne $null) {
        Write-Warning "$absolutePath is not a valid Visual Studio Soltuion"
    } else {
        Write-Warning "$Path is not a valid Visual Studio Soltuion"
    }

    $ErrorMessage = $_.Exception.Message
    Write-Error $ErrorMessage
    Exit 1
}

Exit 0
