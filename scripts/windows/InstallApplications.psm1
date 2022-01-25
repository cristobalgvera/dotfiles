function AppExists {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $AppName
    )

    return Test-Path ((where.exe $AppName) ?? '')
}

function RefreshEnvironment {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
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
        },
        [PSCustomObject]@{
            CLI  = "wget";
            Name = "wget";
        },
        [PSCustomObject]@{
            CLI  = "gzip";
            Name = "gzip";
        },
        [PSCustomObject]@{
            CLI  = "rg";
            Name = "ripgrep";
        },
        [PSCustomObject]@{
            CLI  = "fd";
            Name = "fd";
        }
        # [PSCustomObject]@{
        #     CLI  = "zig";
        #     Name = "zig";
        # }
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
        "golang",
        "googlechrome",
        "google-drive-file-stream",
        "lazygit",
        "lightshot.install",
        "llvm",
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

function PostAddApplications {
    # Create GO working directory
    New-Item -ItemType Directory -Path $HOME\go\bin
    New-Item -ItemType Directory -Path $HOME\go\src

    # Add GO bin folder to PATH
    setx PATH "$($Env:PATH);$GOPATH\bin" /m
}

function InstallApplications {
    InstallPackageManagers
    RefreshEnvironment

    ConfigurePackageManagers
    RefreshEnvironment

    AddApplications
    RefreshEnvironment

    PostAddApplications
}

Export-ModuleMember -Function InstallApplications 

