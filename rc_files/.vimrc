syntax on

"-- Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'niklaas/lightline-gitdiff'
Plug 'vim-python/python-syntax'

"-- Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'wojciechkepka/vim-github-dark'

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
	\ 'colorscheme': 'nord',
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
set background=dark
set noshowmode

"-- Enabling color scheme
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
colorscheme nord

"-- Enabling the tabs in python files
autocmd FileType * setlocal noexpandtab

"-- Enabling terminal transparency
autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            \ |    highlight LineNr       ctermbg=NONE guibg=NONE
            \ |    highlight SignColumn   ctermbg=NONE guibg=NONE


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

