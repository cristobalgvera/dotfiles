$WINDOWS = $PSScriptRoot
$SHARED = "$WINDOWS\..\shared"

function GetSharedFiles {
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [bool]
        $Force = $false
    )

    return @(
        # JetBrains .ideavimrc
        [PSCustomObject]@{
            From  = "$SHARED\.ideavimrc";
            To    = "$HOME\.ideavimrc";
            Force = $Force
        },

        # Git configuration
        [PSCustomObject]@{
            From  = "$SHARED\.gitconfig";
            To    = "$HOME\.gitconfig";
            Force = $Force
        },

        # Lazygit configuration
        [PSCustomObject]@{
            From  = "$SHARED\config.lazygit.yml";
            To    = "$Env:AppData\lazygit\config.yml";
            Force = $Force
        },

        # Lazydocker configuration
        [PSCustomObject]@{
            From  = "$SHARED\config.lazydocker.yml";
            To    = "$Env:AppData\lazydocker\config.yml";
            Force = $Force
        },

        # LunarVim configuration
        [PSCustomObject]@{
            From     = "$SHARED\folders\lvim";
            To       = "$Env:LocalAppData\lvim";
            IsFolder = $true;
            Force    = $Force
        }
    )
}

function GetWindowsFiles {
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [bool]
        $Force = $false
    )

    return @(
        # PowerShell profile
        [PSCustomObject]@{
            From  = "$WINDOWS\files\Microsoft.PowerShell_profile.ps1";
            To    = $PROFILE;
            Force = $Force
        },

        # Git configuration (Windows only)
        [PSCustomObject]@{
            From  = "$WINDOWS\files\.gitconfig-windows";
            To    = "$HOME\.gitconfig-windows";
            Force = $Force
        },

        # Windows Terminal configuration
        [PSCustomObject]@{
            From  = "$WINDOWS\files\wt-settings.json";
            To    = "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json";
            Force = $Force
        },

        # Winrar key
        [PSCustomObject]@{
            From  = "$WINDOWS\files\rarreg.key";
            To    = "$Env:ProgramFiles\winRAR\rarreg.key";
            Force = $Force
        }
    )
}

function GetModules {
    return @(
        [PSCustomObject]@{
            Name            = "PSReadline";
            AllowPrerelease = $true;
        },

        [PSCustomObject]@{
            Name = "z";
        },

        [PSCustomObject]@{
            Name = "Terminal-Icons";
        },

        [PSCustomObject]@{
            Name = "PSFzf";
        }
    )
}
