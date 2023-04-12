-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------

-- Colorscheme setup

require('nightfox').setup({
	options = {
		transparent = true
	}
})

require('nordic').setup({
	transparent_bg = false,
	telescope = {
		style = 'classic',
	},
})


-- Uncomment just ONE of the following colorschemes!
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-dracula')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-gruvbox-dark-medium')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-monokai')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-nord')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-oceanicnext')
-- local ok, _ = pcall(vim.cmd, "colorscheme base16-onedark")
-- local ok, _ = pcall(vim.cmd, 'colorscheme palenight')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-dark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-light')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-tomorrow-night')
-- local ok, _ = pcall(vim.cmd, 'colorscheme github_dimmed')
-- local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-frappe')
-- local ok, _ = pcall(vim.cmd, 'colorscheme miramare')
-- local ok, _ = pcall(vim.cmd, 'colorscheme juliana')
-- local ok, _ = pcall(vim.cmd, 'colorscheme terafox')
-- vim.g.sonokai_style="maia"
-- local ok, _ = pcall(vim.cmd, 'colorscheme sonokai')
-- local ok, _ = pcall(vim.cmd, 'colorscheme everforest')
-- local ok, _ = pcall(vim.cmd, 'colorscheme nightfox')
-- local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox-material')
-- local ok, _ = pcall(vim.cmd, 'colorscheme nordic')
local ok, _ = pcall(vim.cmd, 'colorscheme farout')

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})
