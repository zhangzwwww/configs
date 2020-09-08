cd " space and tabs
set tabstop=4 "number of visual spaces per TAB
""set shiftwidth=4 " indent size
set softtabstop=4 "number of spaces in tab when editing

" ui config
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set showmatch " show brackets match

" searching
set incsearch " search as characters are entered
set hlsearch " highlight matches

set clipboard=unnamed

" set default dir
set autochdir

"start python config

"edit
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

"end python config

"auto exec
map<F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
		exec "w"
		if &filetype == 'python'
				exec "!clear"
				exec "!time python3 %"
		endif
endfunc

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

Plug 'liuchengxu/space-vim-dark'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Valloric/YouCompleteMe'

"deoplete.nvim
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

"js
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"golang
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'dgryski/vim-godef'

Plug 'marijnh/tern_for_vim'

"markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

"format
Plug 'Chiel92/vim-autoformat'

"parentheses
Plug 'kien/rainbow_parentheses.vim'

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

"parentheses theme
let g:rbpt_colorpairs= [
	\ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"close nerdtree when close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab

"key bind
map <F8> :NERDTreeFind<CR>

" ctags
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_right_Window=1

"F10 auto format
noremap <F10> :Autoformat<CR>:w<CR>
let g:autoformat_verbosemode=1

"auto format python files
"au BufWrite *.py :Autoformat

