-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------

-- Colorscheme setup
require('base16-colorscheme').with_config({
    telescope = false,
})

require('onedark').setup {
  style = 'darker',
  transparent = false,
  lualine = {
    transparent = true,
  },
}

-- Uncomment just ONE of the following colorschemes!
-- local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-gruvbox-dark-hard')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-dark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-ayu-dark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme naysayer')
-- local ok, _ = pcall(vim.cmd, 'colorscheme plain')
-- local ok, _ = pcall(vim.cmd, 'colorscheme paradise')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-atelier-cave')
-- local ok, _ = pcall(vim.cmd, 'colorscheme farout')
-- local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox')
local ok, _ = pcall(vim.cmd, 'colorscheme onedark')

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})

-- Transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
