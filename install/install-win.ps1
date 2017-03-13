# Dotfiles install script for Windows. 
# To use this, open powershell and execute the script. 

# Script Variables
$vimPath = "~\vimfiles"
$vimDotfilePath = Join-Path -Path $pwd -ChildPath "..\vim"

# PS Profile -----------------------------------------------------------------
# Install posh-git
If (!(Get-Module -ListAvailable -Name posh-git)) {
    Install-Module posh-git -Scope CurrentUser
}

# Install oh-my-posh
If (!(Get-Module -ListAvailable -Name oh-my-posh)) {
    Install-Module oh-my-posh -Scope CurrentUser
}

# VIM ------------------------------------------------------------------------
If (!(Test-Path $vimPath)) {
    New-Item -Path $vimPath -ItemType Directory
}

If (!(Test-Path "$vimPath\autoload")) {
    New-Item -Path "$vimPath\autoload" -ItemType Directory
}

New-Item -ItemType SymbolicLink -Path "$vimDotfilePath\vimrc" -ChildPath "$vimPath\vimrc"
New-Item -ItemType SymbolicLink -Path "$vimDotfilePath\gvimrc" -ChildPath "$vimPath\gvimrc"

# Install vim-plug
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("$vimPath\autoload\plug.vim"))