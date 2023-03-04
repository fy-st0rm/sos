
-- Startup of plugins
require('lualine').setup()

require('gitsigns').setup({
	signs = {
		add			 = { text = '+' },
		change		 = { text = '~' },
		delete		 = { text = '_' },
		topdelete	 = { text = '‾' },
		changedelete = { text = '~' },
	}
})

require('transparent').setup({
	enable=true
})

vim.g.python_highlight_all=1

-- Startify startup
vim.cmd([[
let g:startify_bookmarks = [
	\ {'v': '~/.vimrc'},
	\ {'n': '~/.config/nvim/init.lua'},
	\ {'i': '~/.config/i3/config'},
	\ {'b': '~/.bashrc'},
	\ {'a': '~/.config/alacritty/alacritty.yml'}
	\]

let g:startify_lists = [
	\ { 'header': ['   Bookmarks:'], 'type':'bookmarks'},
	\ { 'header': ['   Sessons:'], 'type':'sessions'}
	\]
]])

-- Setting up treesitter
require('nvim-treesitter.configs').setup {
	-- Languages for syntax highlight
	ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'help', 'vim' },

	-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
	auto_install = false,

	highlight = { enable = true },
	indent    = { enable = true, disable = { 'python' } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<M-space>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
}
