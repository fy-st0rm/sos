syntax on

"-- Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'niklaas/lightline-gitdiff'
Plug 'vim-python/python-syntax'
Plug 'preservim/nerdtree'
Plug 'wfxr/minimap.vim'
"Plug 'severin-lemaignan/vim-minimap'

"-- Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'wojciechkepka/vim-github-dark'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'projekt0n/github-nvim-theme'

call plug#end()

"-- Basic settings
set belloff=all
set number
set relativenumber
set backspace=indent,eol,start " more powerfull backspacing
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=0
set wrap
set clipboard=unnamedplus
set mouse=a
set shell=bash

"-- Neovide font
set guifont=Jetbrains\ Mono:h9

"-- Minimap stuff
let g:minimap_width = 10
"let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
nmap mi :MinimapToggle<CR>  " Toggle minimap

"-- Highlighting cursor line
hi CursorLineNr guifg=#af00af
set cursorline
set cursorlineopt=number

"-- Key Bindings
nmap nt :tabnew<CR>			" To open new tab
nmap tt :term<CR>			" To open terminal
:tnoremap <Esc> <C-\><C-n>  " To go to normal mode in terminal

"-- Remapping of split screens
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"-- Keybindings for nerd tree
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"-- Lighline config

let g:lightline = {
	\ 'colorscheme': 'gruvbox',
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
let g:gh_color="soft"

"-- Colorscheme
let g:github_function_style = "italic"
colorscheme paradise 
autocmd BufRead,BufNewFile *.porth set filetype=porth
autocmd BufRead,BufNewFile *.slug set filetype=slug

"-- Python highlight stuff 
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 1
let g:python_highlight_space_errors = 0

"-- Enabling the tabs in python files
autocmd FileType * setlocal noexpandtab

"-- Enabling terminal transparency
"autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
"            \ |    highlight SignColumn   ctermbg=NONE guibg=NONE
"            \ |    highlight LineNr       ctermbg=NONE guibg=NONE


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1


" Some fancy things
let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_curser_vfx_particle_density = 10
let g:neovide_transparency = 1 
