cd " space and tabs
set tabstop=4 "number of visual spaces per TAB
""set shiftwidth=4 " indent size
set softtabstop=4 "number of spaces in tab when editing
set shiftwidth=4

" ui config
set number " show line numbers
set relativenumber
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

set wrap

"start python config

"edit
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=160
au Filetype python set expandtab
au Filetype python set autoindent
"au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

"end python config

"golang config
au Filetype go set tabstop=4
au Filetype go set softtabstop=4
au Filetype go set shiftwidth=4
au Filetype go set expandtab
"end golang config

"auto exec
map<Leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
		exec "w"
		if &filetype == 'python'
				exec "!clear"
				exec "!time python3 %"
		elseif &filetype == 'go'
				exec "!clear"
				exec "!time go run %"
		endif
endfunc

map<Leader>R :call DebugRun()<CR>
func! DebugRun()
		exec "w"
		if &filetype == 'python'
				exec "!clear"
				exec "!time python3 -m pdb %"
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
Plug 'preservim/nerdcommenter'
Plug 'Valloric/YouCompleteMe'

Plug 'nathanaelkane/vim-indent-guides'

"deoplete.nvim
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

"python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

"golang
Plug 'fatih/vim-go', {'for':'go', 'tag': '*' }
Plug 'dgryski/vim-godef', {'for': 'go'}

"markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

"format
Plug 'Chiel92/vim-autoformat'

"parentheses
Plug 'kien/rainbow_parentheses.vim'

"vdebug
Plug 'vim-vdebug/vdebug'

"highlight
Plug 'lfv89/vim-interestingwords'

"auto pairs
Plug 'jiangmiao/auto-pairs'

"air-line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"ctags
Plug 'ludovicchabant/vim-gutentags'

"LaTeX
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
"Plug 'lervag/vimtex'

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

" ctags
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_right_Window=1

"F10 auto format
noremap <leader>f :Autoformat<CR>:w<CR>
let g:autoformat_verbosemode=1

"auto format python files
"au BufWrite *.py :Autoformat

"Ycm goto
map gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
map gr :YcmCompleter GoToReferences<CR>

"ycm config file
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'

"LaTeX
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

"indent
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"tags
set tags=./tags,./TAGS,tags;~,TAGS;~

"python line length
let g:pymode_run = 1
let g:pymode_options_max_line_length = 160
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'

"start ctags

"signs for root project
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
"tags name
let g:gutentags_ctags_tagfile = '.tags'
"tag file location
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"args
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"airline
let g:airline_theme='raven'
