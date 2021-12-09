[CmdletBinding()]
param
(
    [Parameter()]
    [switch]
    $Force
)

If (-NOT ([Security.Principal.WindowsPrincipal] `
            [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole( `
            [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

$SCRIPTS = "$PSScriptRoot\..\scripts\windows"

Import-Module $SCRIPTS\AddModules
Import-Module $SCRIPTS\AddSymlinks
Import-Module $PSScriptRoot\resources

# Install all required modules
AddModules (GetModules)

# Add symbolic links to each dotfile
AddSymlinks (GetSharedFiles $Force) 
AddSymlinks (GetWindowsFiles $Force)
