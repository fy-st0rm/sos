syntax on

"-- Plugins
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'niklaas/lightline-gitdiff'
Plug 'dracula/vim', { 'as': 'dracula' }

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

"-- Enabling dracula color scheme
colorscheme nord

" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

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

"-- Enabling the tabs in python files
:autocmd FileType python setlocal noexpandtab

