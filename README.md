# Installation
The files on this repo are managed with [gnu stow](http://www.gnu.org/software/stow/), a symlink farm manager. It is available for most unix based distributions:

- `sudo apt install stow`
- `brew install stow`

Once stow is installed, just cd into this repository and create symlinks using stow like this:

- `cd ~`
- `git clone https://github.com/cvans/dotfiles.git .dotfiles`
- `cd .dotfiles`
- `stow vim`

This will symlink vim. 
