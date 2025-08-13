-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------

-- Colorscheme setup

require('ayu').setup({
	mirage = true
})

require('nightfox').setup({
	options = {
		transparent = false
	}
})

require('nordic').setup({
	transparent = true,
	telescope = {
		style = 'classic',
	},
})

require('github-theme').setup({
	transparent = true
})

require('everforest').setup({
	transparent_background_level = 1
})

require('noirbuddy').setup {
  preset = 'slate',
}

require('onedark').setup {
	style = 'dark',
	transparent = true
}

require("catppuccin").setup({
	transparent_background = true
})

require("kanagawa").setup({
	transparent = true
})

require("gruv-vsassist").setup({
	transparent = true,
	italic_comments = true,
	disable_nvimtree_bg = true,
})

vim.g.miramare_transparent_background = 1
vim.g.gruvbox_material_transparent_background = 2
vim.g.kanagawabones_transparent_background = true

vim.g.nord_disable_background = true
vim.g.nord_italic = false
vim.g.nord_bold = false


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
local ok, _ = pcall(vim.cmd, 'colorscheme miramare')
-- local ok, _ = pcall(vim.cmd, 'colorscheme juliana')
-- local ok, _ = pcall(vim.cmd, 'colorscheme terafox')
-- vim.g.sonokai_style="maia"
-- local ok, _ = pcall(vim.cmd, 'colorscheme sonokai')
-- local ok, _ = pcall(vim.cmd, 'colorscheme everforest')
-- local ok, _ = pcall(vim.cmd, 'colorscheme nightfox')
-- local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox-material')
-- local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox')
-- local ok, _ = pcall(vim.cmd, 'colorscheme nordic')
-- local ok, _ = pcall(vim.cmd, 'colorscheme nord')
-- local ok, _ = pcall(vim.cmd, 'colorscheme paradise')
-- local ok, _ = pcall(vim.cmd, 'colorscheme farout')
-- local ok, _ = pcall(vim.cmd, 'colorscheme rasmus')
-- local ok, _ = pcall(vim.cmd, 'colorscheme paradise')
-- local ok, _ = pcall(vim.cmd, 'colorscheme oh-lucy')
-- local ok, _ = pcall(vim.cmd, 'colorscheme onedark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme plain')
-- local ok, _ = pcall(vim.cmd, 'colorscheme ayu')
-- local ok, _ = pcall(vim.cmd, 'colorscheme kanagawabones')
-- local ok, _ = pcall(vim.cmd, 'colorscheme kanagawa-dragon')
-- local ok, _ = pcall(vim.cmd, 'colorscheme neobones')
-- local ok, _ = pcall(vim.cmd, 'colorscheme tokyobones')
-- local ok, _ = pcall(vim.cmd, 'colorscheme plain')
-- local ok, _ = pcall(vim.cmd, 'colorscheme gruv-vsassist')

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})
