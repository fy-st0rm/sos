local g = vim.g
local o = vim.o
local opt = vim.opt

vim.env.NVIM_LISTEN_ADDRESS = vim.fn.stdpath("run") .. "/nvim.sock"

-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')

-- Enabled for nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.rust_recommended_style = false

-- Shell
o.shell = "bash"

o.termguicolors = true
-- o.background = 'dark'

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number         = false
o.numberwidth    = 2
o.relativenumber = false
o.signcolumn     = "no"
o.cursorline     = true
o.showtabline    = 0

-- Setting tabs instead of spaces
vim.cmd("autocmd FileType * setlocal noexpandtab")
vim.cmd("let g:python_recommended_style = 0")

-- Some basic features
opt.mouse     = "a"
o.expandtab   = true
o.hlsearch    = false
o.smarttab    = true
o.cindent     = true
o.autoindent  = true
o.wrap        = true
o.textwidth   = 300
o.tabstop     = 2
o.shiftwidth  = 2
vim.bo.softtabstop = 2 -- If negative, shiftwidth value is used
o.list        = true
o.listchars   = "trail:·,nbsp:◇,tab:┊ ,extends:▸,precedes:◂"
-- ┊ »

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase  = true

-- Undo and backup options
o.backup      = false
o.writebackup = false
o.undofile    = true
o.swapfile    = false

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Map <leader> to space
g.mapleader      = " "
g.maplocalleader = " "

o.guifont = "TerminessTTF Nerd Font Mono:h10"
