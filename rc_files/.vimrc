syntax on

"-- Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'niklaas/lightline-gitdiff'

call plug#end()


"-- Basic settings
set belloff=all
set shiftwidth=4
set number
set backspace=indent,eol,start " more powerfull backspacing
set autoindent
set tabstop=4
set nowrap
set clipboard=unnamedplus
set mouse=a

"-- Highlighting cursor line
"hi CursorLineNr guifg=#af00af
set cursorline
"set cursorlineopt=number

"-- Enabling dracula color scheme
packadd! dracula
syntax enable
colorscheme dracula

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

"-- Lighline color
let g:lightline = {
      \ 'colorscheme': 'dracula',
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

"-- Enalbing lightline color
set laststatus=2
