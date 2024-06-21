
-- Setting up packer
local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
  augroup packer_user_config
     autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use('williamboman/mason.nvim')
	use('williamboman/mason-lspconfig.nvim')

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Startify
	use("mhinz/vim-startify")

	-- Language server
	use("neovim/nvim-lspconfig")

	-- Cmake plugin
	use('cdelledonne/vim-cmake')

	-- Autocompletion
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-nvim-lsp')
	use('L3MON4D3/LuaSnip')
	use('saadparwaiz1/cmp_luasnip')

	-- Adds git releated signs to the gutter, as well as utilities for managing changes
	use("lewis6991/gitsigns.nvim")

	-- Treesitter Syntax Highlighting
	use("nvim-treesitter/nvim-treesitter")

	-- Tab line
	use("kyazdani42/nvim-web-devicons")
	use('nanozuki/tabby.nvim')

	-- A better statusline
	use("nvim-lualine/lualine.nvim") 

	-- File management --
	use({
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	})
	use("ryanoasis/vim-devicons")

	-- Syntax Highlighting and Colors --
	use("PotatoesMaster/i3-vim-syntax")
	use("tikhomirov/vim-glsl")
	use("kovetskiy/sxhkd-vim")
	use("vim-python/python-syntax")
	use("ap/vim-css-color")
	use("nickeb96/fish.vim")

	-- Junegunn Choi Plugins --
	use("junegunn/goyo.vim")
	use("junegunn/limelight.vim")
	use("junegunn/vim-emoji")

	-- Colorschemes --
	use("kyazdani42/nvim-palenight.lua")
	use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use('AlexvZyl/nordic.nvim')
	use('franbach/miramare')
	use('kaiuri/nvim-juliana')
	use('shaunsingh/nord.nvim')
	use("EdenEast/nightfox.nvim")
	use("sainnhe/sonokai")
	use("neanias/everforest-nvim")
	use("sainnhe/gruvbox-material")
	use("ellisonleao/gruvbox.nvim")
	use("fcpg/vim-farout")
	use("kristijanhusak/vim-hybrid-material")
	use("alligator/accent.vim")
	use {
		"jesseleite/nvim-noirbuddy",
		requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
	}
	use("kvrohit/rasmus.nvim")
	use("Yazeed1s/oh-lucy.nvim")
	use("navarasu/onedark.nvim")
	use {
		"mcchrish/zenbones.nvim",
		requires = "rktjmp/lush.nvim"
	}
	use('andreypopp/vim-colors-plain')
	use("Shatur/neovim-ayu")
	use("rebelot/kanagawa.nvim")

	-- Transparent background
	use("xiyaowong/nvim-transparent")

	-- Other stuff --
	use("frazrepo/vim-rainbow")

	if packer_bootstrap then
		packer.sync()
	end
end)
