
" OS Specific -----------------------------------------------------------------

if has("gui_macvim")

  set guifont=PragmataPro:h15 
  set guioptions-=T  " remove toolbar
  set stal=2 " turn on tabs by default
  set transparency=0

elseif has("gui_gtk2")

  set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13
  set guioptions-=T  " remove toolbar

elseif has("x11")
elseif has("gui_win32")

  set guifont=Consolas:h11
  set guioptions-=T " remove toolbar
  set guioptions-=r " remove right-hand scroll bar
  set clipboard=unnamed " copy and paste to the windows clipboard by default
  set go+=a " visual selections automatically copy to the clipboard

end

" General ---------------------------------------------------------------------

set anti " Antialias font

" Default size of window
set columns=84
set lines=40

" Tab headings
set gtl=%t gtt=%F

set encoding=utf-8
