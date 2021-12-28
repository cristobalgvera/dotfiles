# Windows dotfiles

Bootstrap Windows configuration.

In administrator mode.

```powershell
install.ps1
```

## What will be installed?

Installation process will bootstrap following applications and configurations:

### Apps

- Chocolatey:
  - git
  - go
  - googlechrome
  - google-drive-file-stream
  - lazygit
  - lightshot.install
  - microsoft-windows-terminal
  - neovim
  - powershell-core
  - powertoys
  - python
  - vscode
  - whatsapp
  - winrar

- Scoop:
  - aria2
  - fzf
  - psutils
  - oh-my-posh
  - 7zip
  - wget
  - gzip
  - ripgrep
  - fd
  - zig

### Modules

- PowerShell:
  - PSReadLine
  - z
  - Terminal-Icons
  - PSFzf

### Dotfiles

- Git config
- IdeaVim config
- PowerShell profile
- Neovim
- Windows Terminal settings
- WinRAR lifetime key

#### Recommendations

## Flags

You can provide special flags to avoid certain processes.
Available flags are:

| Flag       | Description                             |
| ---------- | --------------------------------------- |
| NoApps     | Doesn't install any Windows application |
| NoModules  | Doesn't install any PowerShell module   |
| NoSymlinks | Doesn't install any Windows symlinks    |
| Force      | Force symbolic links creation           |

### Usage

```powershell
install.ps1 [-Flags]

# Example:
# Just will create symbolic links and overwrite backups if exists.
install.ps1 -NoApps -NoModules -Force
```
