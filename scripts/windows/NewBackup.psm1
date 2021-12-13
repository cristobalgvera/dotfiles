Import-Module $PSScriptRoot\FindPath

function NewBackup {
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]
    $Path,

    [Parameter()]
    [bool]
    $Force = $false
  )

  if (-not(FindPath $Path)) {
    return
  }

  $BackupFilePath = "$Path.backup"

  try {
    if (FindPath $BackupFilePath) {
      if ($Force) {
        Remove-Item -Path $BackupFilePath -Force -Recurse -ErrorAction Stop
      }
      else {
        Write-Information "`nThere is already a backup file in '$BackupFilePath'. If you want to override backups, use -Force flag."
        return
      }
    }

    Rename-Item -Path $Path -NewName $BackupFilePath -ErrorAction Stop
  }
  catch {
    Write-Error "`nAn error ocurred when doing backup for '$Path': $_"
  }
}
