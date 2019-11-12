""" .vimrc
""" Type :help COMMAND to review help for a specific command
"""
"""
""" To switch buffers, remember to use :b plus the name of the buffer.

" Plug  ----------------------------------------------------------------------

" Boostrap installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" General plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'

" Language specific
Plug 'pangloss/vim-javascript'
Plug 'elixir-lang/vim-elixir'

" Theming
Plug 'vim-airline/vim-airline'

call plug#end()

" Tabs and Identation --------------------------------------------------------

if exists('autocmd')
  filetype plugin indent on
endif

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set shiftround " Round to a multiple of shiftwidth

set autoindent " Automatically set the indent of a new line (local to buffer)
set backspace=indent,eol,start " Backspace deletes characters in insert mode
set complete-=i " Disable scanning included files for autocomplete

" Misc Stuff -----------------------------------------------------------------

set nrformats-=octal " Dont use octals when doing calculations <C-a> or <C-x>

" Reduce lag when switching modes
set ttimeout
set ttimeoutlen=100

set incsearch " Highlight words during search

set laststatus=2 " Show status bar
set ruler " Show line and column numbers
set showcmd " Show command while typing
set wildmenu " Display options when using tab
set ignorecase " Ignore case when searching
set number "Show line numbers

set autoread " Automatically read changes from files

set display+=lastline " Don't go lower than the last line

" Powerline stuff
let g:airline#extensions#tabline#enabled = 1
