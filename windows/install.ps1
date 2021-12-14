[CmdletBinding()]
param
(
    [Parameter()]
    [switch]
    $Force,

    [Parameter()]
    [switch]
    $NoApps,

    [Parameter()]
    [switch]
    $NoModules,

    [Parameter()]
    [switch]
    $NoSymlinks
)

if (-not ([Security.Principal.WindowsPrincipal] `
            [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole( `
            [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

$SCRIPTS = "$PSScriptRoot\..\scripts\windows"

Import-Module $SCRIPTS\AddModules
Import-Module $SCRIPTS\AddSymlinks
Import-Module $SCRIPTS\InstallApplications
Import-Module $PSScriptRoot\resources

# Install base applications
if ($NoApps) { Write-Host "Skipping installation of base applications" -ForegroundColor Blue }
else { 
    Write-Host "Installing base applications" -ForegroundColor Green
    InstallApplications 
}

# Install all required modules
if ($NoModules) { Write-Host "Skipping installation of modules" -ForegroundColor Blue }
else { 
    Write-Host "Installing modules" -ForegroundColor Green 
    AddModules (GetModules)
}

# Add symbolic links to each dotfile
if ($NoSymlinks) { Write-Host "Skipping creation of symbolic links" -ForegroundColor Blue }
else { 
    Write-Host "Creating symbolic links" -ForegroundColor Green
    AddSymlinks (GetSharedFiles $Force) 
    AddSymlinks (GetWindowsFiles $Force)
}