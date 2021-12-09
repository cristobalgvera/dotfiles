Import-Module $PSScriptRoot\GetModule

function AddModules {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [PSCustomObject[]]
        $Modules
    )
    
    $Modules | ForEach-Object {
        $Module = $_
        $CurrentModule = GetModule $Module.Name
        if ($null -eq $CurrentModule) {
            try {
                Write-Host "Installing $($Module.Name)..."
                if ($Module.AllowPrerelease) {
                    Install-Module -AllowPrerelease -Name $Module.Name -AllowClobber -Confirm:$False -Force -ErrorAction Stop  
                    return
                }

                Install-Module -Name $Module.Name -AllowClobber -Confirm:$False -Force -ErrorAction Stop  
            }
            catch {
                Write-Error "Module '$($Module.Name)' was not found: $_"
            }
        }
    }
}
