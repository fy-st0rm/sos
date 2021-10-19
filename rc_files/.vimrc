syntax on

"-- Plugins
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'niklaas/lightline-gitdiff'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lifepillar/vim-gruvbox8'

call plug#end()

"-- Basic settings
set belloff=all
set number
set backspace=indent,eol,start " more powerfull backspacing
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=0
set nowrap
set clipboard=unnamedplus
set mouse=a

"-- Highlighting cursor line
"hi CursorLineNr guifg=#af00af
set cursorline
"set cursorlineopt=number

"-- Lighline config
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night', 
	  \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'readonly', 'modified' ],
      \             [ 'gitdiff' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename', 'gitversion' ] ],
      \ },
	  \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"-- lightline vars
set laststatus=2
set noshowmode

"-- Enabling color scheme
colorscheme gruvbox8


"-- Enabling the tabs in python files
autocmd FileType * setlocal noexpandtab

"-- Enabling terminal transparency
autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            \ |    highlight LineNr       ctermbg=NONE guibg=NONE
            \ |    highlight SignColumn   ctermbg=NONE guibg=NONE
