-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------

-- Colorscheme setup
require('base16-colorscheme').with_config({
    telescope = false,
})

-- Uncomment just ONE of the following colorschemes!
-- local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-gruvbox-dark-hard')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-selenized-dark')
local ok, _ = pcall(vim.cmd, 'colorscheme naysayer')
-- local ok, _ = pcall(vim.cmd, 'colorscheme plain')

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})
