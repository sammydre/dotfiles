syntax on
color desert
filetype plugin indent on

set nocompatible
set hlsearch
set incsearch
set mouse=a
set ruler
set ignorecase
set smartcase
set number
set modeline
set bs=2

set expandtab
set shiftwidth=2
set sts=2

set makeprg=scons\ -Qu

set tags+=~/.vim/systags
set tags+=tags

let pascal_gpc=1

if !has("gui_running")
  if $COLORTERM == "gnome-terminal"
    set t_Co=256
    color desert256
  else
    " Would be nice to find a better colour scheme here, but at least it is
    " decently readable.
    color elflord
  endif
endif

" Completion of tags and buffers, but don't scan included files.
set complete=.,w,b,u,t

let g:SuperTabCompletionAfterWhiteSpace = 0
let g:SuperTabMidWordCompletion = 0
