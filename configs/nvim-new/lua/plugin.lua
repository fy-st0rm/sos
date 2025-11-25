
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

  -- External packages
  use("kyazdani42/nvim-web-devicons")
  use("ryanoasis/vim-devicons")
  use("nvim-lualine/lualine.nvim") 
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use('JoseConseco/telescope_sessions_picker.nvim')
  use("mhinz/vim-startify")
  use("nvim-treesitter/nvim-treesitter")
  use("echasnovski/mini.indentscope")
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  })
  use("gpanders/editorconfig.nvim")

  -- Colorschemes
  use("ellisonleao/gruvbox.nvim")
  use("RRethy/base16-nvim")
  use('RostislavArts/naysayer.nvim')
  use('andreypopp/vim-colors-plain')

  if packer_bootstrap then
    packer.sync()
  end
end)
