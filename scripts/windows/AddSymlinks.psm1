Import-Module $PSScriptRoot\NewSymlink

function AddSymlinks {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    [PSCustomObject[]]
    $Files 
  )

  foreach ($File in $Files) {
    NewSymlink `
      -FromPath $File.From `
      -ToPath   $File.To `
      -IsFolder $($File.IsFolder ?? $false) `
      -Force    $File.Force
  }
}
