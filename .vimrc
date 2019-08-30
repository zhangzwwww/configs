cd " space and tabs
set tabstop=4 "number of visual spaces per TAB
set shiftwidth=4 " indent size
set softtabstop=4 "number of spaces in tab when editing

" ui config
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu

" searching
set incsearch " search as characters are entered
set hlsearch " highlight matches

" maps
:inoremap jk <esc>

syntax on
" vim-plug plugin management
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" color scheme
Plug 'liuchengxu/space-vim-dark'

call plug#end()

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

" color scheme
colorscheme space-vim-dark
hi Comment guifg=#5C6370 ctermfg=59

