# Dotfiles install script for Windows. 
# To use this, open powershell and execute the script. 

#Variables
$vimPath = "$home\vimfiles"
$vimDotfilePath = Join-Path -Path $pwd -ChildPath "..\vim"

# PS Profile ---------------------------------------------------------


# VIM ------------------------------------------------------------------------
If (!(Test-Path $vimPath)) {
    New-Item -Path $vimPath -ItemType Directory
}

New-Item -ItemType SymbolicLink -Path "$vimDotfilePath\vimrc" -ChildPath "$home\vimfiles\vimrc"
New-Item -ItemType SymbolicLink -Path "$vimDotfilePath\gvimrc" -ChildPath "$home\vimfiles\gvimrc"