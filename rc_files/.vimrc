"-- Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'niklaas/lightline-gitdiff'
Plug 'vim-python/python-syntax'
Plug 'preservim/nerdtree'
Plug 'wfxr/minimap.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'flw-cn/vim-nerdtree-l-open-h-close'

"-- Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'projekt0n/github-nvim-theme'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'ayu-theme/ayu-vim'

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
set encoding=UTF-8

"-- Enabling the tabs in python files
autocmd FileType * setlocal noexpandtab

"-- Turing on tabs and space indicators
set listchars=tab:»\ ,space:.
set invlist

"-- Minimap stuff
let g:minimap_width = 10
let g:minimap_auto_start_win_enter = 1
nmap mi :MinimapToggle<CR>  " Toggle minimap

"-- Highlighting cursor line
hi CursorLineNr guifg=#af00af
set cursorline
set cursorlineopt=number

"-- Key Bindings
nmap nt :tabnew<CR>			" To open new tab
nmap tt :term<CR>			" To open terminal
nmap <C-w> :wq<CR>
:tnoremap <Esc> <C-\><C-n>  " To go to normal mode in terminal

"-- Remapping of split screens
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"-- Tab toggle
nmap ts :set showtabline=1<CR>
nmap th :set showtabline=0<CR>

"-- Remaping tab switch
nmap 1 :tabnext 1<CR>
nmap 2 :tabnext 2<CR>
nmap 3 :tabnext 3<CR>
nmap 4 :tabnext 4<CR>
nmap 5 :tabnext 5<CR>
nmap 6 :tabnext 6<CR>
nmap 7 :tabnext 7<CR>
nmap 8 :tabnext 8<CR>
nmap 9 :tabnext 9<CR>
nmap 0 :tabnext 0<CR>

"-- Keybindings for nerd tree
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeMapOpenDirNode = 'l'
let g:NERDTreeMapCloseDirNode = 'h'

"-- Startify Keybindings
nmap <c-n> :Startify <cr>
nmap <C-s> :SSave<CR>
nmap <C-c> :SClose<CR>

"-- Fold function
let g:FoldMethod = 0
map <C-f> :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe 'set foldmethod=indent'
        let g:FoldMethod = 1
    else
        exe 'set foldmethod=marker'
        let g:FoldMethod = 0
    endif
endfun


"-- Lighline config
let g:lightline = {
	\ 'colorscheme': 'onedark',
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
    \'separator': { 'left': "\ue0b4", 'right': "\ue0b6" },
    \ 'subseparator': { 'left': "\ue0b5", 'right': "\ue0b7" }
    \ }

"-- lightline vars
set laststatus=2
set background=dark
set noshowmode
let g:gh_color="soft"

"-- Enabling terminal transparency
autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            \ |    highlight SignColumn   ctermbg=NONE guibg=NONE
            \ |    highlight LineNr       ctermbg=NONE guibg=NONE


"-- Colorscheme
set termguicolors  
"let ayucolor="mirage" 
colorscheme ayu
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

"-- Startify config
let g:startify_bookmarks = [
	\ {'v': '~/.vimrc'},
	\ {'i': '~/.config/i3/config'},
	\ {'b': '~/.bashrc'},
	\ {'a': '~/.config/alacritty/alacritty.yml'}
	\]

let g:startify_lists = [
	\ { 'header': ['   Bookmarks:'], 'type':'bookmarks'},
	\ { 'header': ['   Sessons:'], 'type':'sessions'}
	\]

"let g:startify_custom_header = [
"		\'   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ',
"		\'    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
"    	\'          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ',
"    	\'           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
"    	\'          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
"    	\'   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
"    	\'  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
"    	\' ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
"    	\' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ',
"    	\'      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
"    	\'       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
"		\]

