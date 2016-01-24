""" Ivan Charles
""" .vimrc
""" Remember to type :help COMMAND to review help for a specific command
"""
""" To install in Windows, put your vimrc and gvimrc under the vimfiles
""" directory on your userfolder. The vimfiles folder acts as the .vim
""" folder on unix.
"""
""" To switch buffers, remember to use :b plus the name of the buffer.

" Tabs and Identation ---------------------------------------------------------

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

" Colors ----------------------------------------------------------------------

if has('syntax') && !exists('g:syntax_on')
  syntax enable
  set background=dark
  colorscheme Tomorrow-Night
endif

" Misc Stuff ------------------------------------------------------------------

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


"" Powerline stuff

set encoding=utf-8
let g:airline_powerline_fonts = 1 " Airline font configuration
let g:airline#extensions#tabline#enabled = 1

" Working folders -------------------------------------------------------------

if has("win32") || has("win64")
  set directory=$TMP\\
  set backupdir=$TMP\\
else
  set directory=/tmp//
  set backupdir=/tmp//
end

" Pathogen --------------------------------------------------------------------
execute pathogen#infect()
