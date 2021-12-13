Import-Module $PSScriptRoot\NewBackup
Import-Module $PSScriptRoot\FindPath

function NewSymlink {
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]
    $FromPath,
  
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]
    $ToPath,

    [Parameter()]
    [bool]
    $IsFolder = $false,

    [Parameter()]
    [bool]
    $Force = $false
  )

  if (FindPath $ToPath) {
    NewBackup -Path $ToPath -Force $Force
  }

  try {
    New-Item `
      -Path $ToPath `
      -ItemType $($IsFolder ? "Junction" : "SymbolicLink") `
      -Value (Get-Item "$FromPath").FullName `
      -ErrorAction Stop
  }
  catch {
    $SeparatedFromPath = $FromPath.Split("\")
    $FromFileName = $SeparatedFromPath[-1]

    Write-Warning "`nWas not created '$FromFileName': $_"
  }
}
