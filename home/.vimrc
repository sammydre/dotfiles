" {{{ Plugins
" Install Plug : https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim')) && empty(glob('~/vimfiles/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" And the Vim integration itself
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim'
Plug 'flazz/vim-colorschemes'
Plug 'ervandew/supertab'
Plug 'Quramy/tsuquyomi'
Plug 'https://gn.googlesource.com/gn', { 'rtp': 'misc/vim' }
Plug 'keith/swift.vim'
call plug#end()
" }}}
" {{{ Basic settings
syntax on
" color desert
color southernlights
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
set expandtab

set wildmode=longest,list,full
set wildmenu

set foldmethod=marker

set bs=2
set shiftwidth=2
set sts=2
set makeprg=scons\ -Qu

set tags+=~/.vim/systags
set tags+=tags
" }}}
" Key bindings
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>


" Other, TBD

let pascal_gpc=1

if !has("gui_running")
  if $TERM == "screen"
    set t_Co=256
  endif
  "if $COLORTERM == "gnome-terminal"
  "  set t_Co=256
  "  color desert256
  "else
    " Would be nice to find a better colour scheme here, but at least it is
    " decently readable.
  "  color elflord
  "endif
else
  if ( hostname() == 'stj-desktop' )
    set guifont=Envy\ Code\ R\ 9
    "set guifont=Terminus\ for\ Powerline\ 8
  elseif ( hostname() == 'BRONCO' )
    set guifont=Lucida_Console:h9:cANSI
  elseif ( hostname() == 'stj-laptop' )
    set guifont=Monospace\ 11
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
