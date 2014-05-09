syntax on
color desert
filetype plugin indent on

set laststatus=2
set encoding=utf8
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

set wildmode=longest,list,full
set wildmenu

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
else
  if ( hostname() == 'stj-desktop' )
    set guifont=Envy\ Code\ R\ 9
    "set guifont=Terminus\ for\ Powerline\ 8
  elseif ( hostname() == 'BRONCO' )
    set guifont=Lucida_Console:h9:cANSI
  else
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
  endif
endif

if ( hostname() == 'stj-desktop' )
  set printdevice=oki-ps
endif

" Completion of tags and buffers, but don't scan included files.
set complete=.,w,b,u,t

let g:SuperTabCompletionAfterWhiteSpace = 0
let g:SuperTabMidWordCompletion = 0

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['c'],
                           \ 'passive_filetypes': ['java'] }

" let g:clang_complete_copen = 1
" let g:clang_complete_macros = 1
nnoremap <F5> :call g:ClangUpdateQuickFix()<Return>
nnoremap <F8> :TagbarToggle<CR>

au BufNewFile,BufRead SConscript set ft=python

function! g:AddDiffTab(f1, f2)
  :tabnew
  :edit a:f1
  :diffthis
  :vsplit
  :wincmd l
  :edit a:f2
  :diffthis
endf
