function FindPath {
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]
    $Path
  )

  return Test-Path -Path $Path -PathType Any 
}

