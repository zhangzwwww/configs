imap jk <Esc>
set nu

set showmatch
set tabstop=4
set shiftwidth=4
set autoindent

call plug#begin()

Plug 'junegunn/vim-easy-align'

Plug 'Valloric/YouCompleteMe'

Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'dgryski/vim-godef'

call plug#end()

:syntax on
:hi Visual term=reverse cterm=reverse guibg=Grey

nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
