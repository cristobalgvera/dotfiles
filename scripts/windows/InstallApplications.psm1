function AppExists {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $AppName
    )

    return Test-Path ((where.exe $AppName) ?? '')
}

function InstallScoop {
    Write-Host "Installing Scoop..."

    if (AppExists "scoop") {
        Write-Warning "Scoop is already installed."
        return
    }

    try {
        Set-ExecutionPolicy RemoteSigned -scope CurrentUser
        Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
    }
    catch { Write-Error "Failed to install scoop: $_" }
}

function ConfigureScoop {
    $Commands = @(
        "scoop update *"
    )

    Write-Host "Configuring Scoop..."

    $Commands | ForEach-Object {
        try { Invoke-Expression $_ }
        catch { Write-Error "Failed to configure scoop: $_" }
    }
}

function AddScoopApps {
    $Applications = @(
        [PSCustomObject]@{
            CLI  = "aria2";
            Name = "aria2";
        },
        [PSCustomObject]@{
            CLI  = "fzf";
            Name = "fzf";
        },
        [PSCustomObject]@{
            CLI  = "sudo";
            Name = "psutils";
        },
        [PSCustomObject]@{
            CLI  = "oh-my-posh";
            Name = "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json";
        },
        [PSCustomObject]@{
            CLI  = "7zip";
            Name = "7zip";
        }
    )

    Write-Host "Adding Scoop apps..." -ForegroundColor Green

    $Applications | ForEach-Object {
        Write-Host "Adding $($_.Name)..."

        if (AppExists $_.CLI) {
            Write-Warning "Scoop app '$($_.Name)' is already installed."
            return
        }

        try { Invoke-Expression "scoop install $($_.Name)" }
        catch { Write-Error "Failed to add scoop app: $_" }
    }
}

function InstallChocolatey {
    Write-Host "Installing Chocolatey..."

    if (AppExists "choco") {
        Write-Warning "Chocolatey is already installed."
        return
    }

    try {
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://community.chocolatey.org/install.ps1"))
    }
    catch { Write-Error "Failed to install chocolatey: $_" }
}

function ConfigureChocolatey {
    $Commands = @(
        "choco feature enable -n=useRememberedArgumentsForUpgrades"
    )

    Write-Host "Configuring Chocolatey..."

    $Commands | ForEach-Object { 
        try { Invoke-Expression $_ }
        catch { Write-Error "Failed to configure chocolatey: $_" }
    }
}

function AddChocolateyApps {
    $Applications = @(
        "git",
        "googlechrome",
        "google-drive-file-stream",
        "lightshot.install",
        "microsoft-windows-terminal",
        "neovim",
        "powershell-core",
        "powertoys",
        "python",
        "vscode",
        "whatsapp",
        "winrar"
    )

    Write-Host "Adding Chocolatey apps..." -ForegroundColor Green

    $ApplicationList = ($Applications -join ' ')

    try { Invoke-Expression "choco install $ApplicationList" }
    catch { Write-Error "Failed to add chocolatey app: $_" }
}

function InstallPackageManagers {
    InstallScoop
    InstallChocolatey
}

function ConfigurePackageManagers {
    ConfigureScoop
    ConfigureChocolatey
}

function AddApplications {
    AddScoopApps
    AddChocolateyApps
}

function InstallApplications {
    InstallPackageManagers
    ConfigurePackageManagers
    AddApplications
}

Export-ModuleMember -Function InstallApplications 