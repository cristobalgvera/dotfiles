# Oh My Posh theme support
function LoadOhMyPoshTheme() {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $theme
  )

  oh-my-posh --init --shell pwsh --config `
    "~/scoop/apps/oh-my-posh/current/themes/${theme}.omp.json" |
  Invoke-Expression
}

# Import module only if it exists
function ImportModule {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ModuleName
  )

  $Module = Get-Module -ListAvailable -Name $ModuleName

  if ($null -ne $Module) {
    Import-Module $ModuleName
  }
}

# Helper to set proper theme due JetBrains IDEs terminal issues
function SetConsoleTheme {
  if (Test-Path Env:JetBrains) {
    LoadOhMyPoshTheme("material")
  }
  else {
    LoadOhMyPoshTheme("star")
  }
}

function SetLocationToRepositoriesFolder { Set-Location D:\crist\Documents\Repositorios }

# Start executions
SetConsoleTheme

# Alias
New-Alias repos SetLocationToRepositoriesFolder 
New-Alias v nvim

# Z port to PowerShell
ImportModule z

# Custom icons in terminal
ImportModule Terminal-Icons

# History based auto-completion
ImportModule PSReadLine
Set-PSReadLineOption -PredictionSource History

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
