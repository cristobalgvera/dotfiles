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
        }

        # SpaceVim configuration
        [PSCustomObject]@{
            From     = "$WINDOWS\folders\.SpaceVim.d";
            To       = "$HOME\.SpaceVim.d";
            IsFolder = $true;
            Force    = $Force
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
