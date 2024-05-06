# Ensure the script can run with elevated privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as an Administrator!"
    break
}

function install_dotfiles{
    return 0
}

Write-host "$env:USERPROFILE"

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install Scoop
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
scoop bucket add main
scoop bucket add extras

# Install custom 
scoop install msys2 syncthing glazewm
scoop install main/neovim

msys2
pacman -S --noconfirm --needed base-devel mingw-w64-ucrt-x86_64-toolchain

# executes Winutil
irm https://christitus.com/win | iex
