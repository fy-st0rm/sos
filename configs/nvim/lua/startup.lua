-- Startup of plugins

require('mini.indentscope').setup()
require("battery").setup({})

local nvimbattery = {
	function()
		return require("battery").get_status_line()
	end,
}

------------------------
-- Lua Line
------------------------

require('lualine').setup({
	options = {
		theme = bubbles_theme,
		component_separators = '',
		section_separators = { left = '', right = '' },
		globalstatus = true,
	},
	sections = {
		lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
		lualine_b = { 'filename', 'branch' },
		lualine_c = {
			'%=', --[[ add your center compoentnts here in place of this comment ]]
		},
		lualine_x = {},
		lualine_y = {
			'filetype',
			{
				'datetime',
				style = '%I:%M %p', -- 12-hour format with AM/PM
			},
			-- nvimbattery
		},
		lualine_z = {
			{ 'location', separator = { left = '', right = '' }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { 'location' },
	},
	tabline = {},
	extensions = {},
})


------------------------
-- Telescope
------------------------

require('telescope').setup{ 
	defaults = { 
		file_ignore_patterns = { 
			"node_modules",
			".git",
			"target",
			".venv",
			"venv"
		}
	},
	extensions = {
		sessions_picker = {
			sessions_dir = vim.fn.stdpath('data') ..'/session/',
		}
	},
}
require('telescope').load_extension('sessions_picker')


------------------------
-- Tabby
------------------------

-- Tabby theme
local theme = {
	fill = 'TabLineFill',
	-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
	head = 'TabLine',
	current_tab = 'TabLineSel',
	tab = 'TabLine',
	win = 'TabLine',
	tail = 'TabLine',
}

-- Starting tabby
require('tabby.tabline').set(function(line)
	return {
		{
			{ '  ', hl = theme.head },
			line.sep('', theme.head, theme.fill),
		},
		line.tabs().foreach(function(tab)
			local hl = tab.is_current() and theme.current_tab or theme.tab
			return {
				line.sep('', hl, theme.fill),
				tab.is_current() and '' or '',
				tab.number(),
				tab.name(),
				tab.close_btn(''),
				line.sep('', hl, theme.fill),
				hl = hl,
				margin = ' ',
			}
		end),
		line.spacer(),
		line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
			return {
				line.sep('', theme.win, theme.fill),
				win.is_current() and '' or '',
				win.buf_name(),
				line.sep('', theme.win, theme.fill),
				hl = theme.win,
				margin = ' ',
			}
		end),
		{
			line.sep('', theme.tail, theme.fill),
			{ '  ', hl = theme.tail },
		},
		hl = theme.fill,
	}
end)

------------------------
-- Gitsigns
------------------------

require('gitsigns').setup({
	signs = {
		add			 = { text = '+' },
		change		 = { text = '~' },
		delete		 = { text = '_' },
		topdelete	 = { text = '‾' },
		changedelete = { text = '~' },
	}
})


------------------------
-- Nvim Tree
------------------------

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

vim.g.python_highlight_all=1

------------------------
-- Startify
------------------------

-- vim.cmd([[
-- let g:startify_bookmarks = [
--	\ {'v': '~/.vimrc'},
--	\ {'n': '~/.config/nvim/init.lua'},
--	\ {'i': '~/.config/i3/config'},
--	\ {'b': '~/.bashrc'},
--	\ {'a': '~/.config/alacritty/alacritty.toml'}
--	\]
-- 
-- let g:startify_lists = [
--	\ { 'header': ['	 Bookmarks:'], 'type':'bookmarks'},
--	\ { 'header': ['	 Sessons:'], 'type':'sessions'}
--	\]
-- ]])


------------------------
-- Mini Neovim
------------------------

local header_art = 
[[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]

-- using the mini plugins
require('mini.sessions').setup({
	autoread = false,
	autowrite = true,
	directory =  '~/.local/share/nvim/session',
	file = ''
})

local starter = require('mini.starter')
starter.setup({
	-- evaluate_single = true,
	items = {
		starter.sections.sessions(77, true),
		starter.sections.builtin_actions(),
	},
	content_hooks = {
		function(content)
			local blank_content_line = { { type = 'empty', string = '' } }
			local section_coords = starter.content_coords(content, 'section')
			-- Insert backwards to not affect coordinates
			for i = #section_coords, 1, -1 do
				table.insert(content, section_coords[i].line + 1, blank_content_line)
			end
			return content
		end,
		starter.gen_hook.adding_bullet("» "),
		starter.gen_hook.aligning('center', 'center'),
	},
	header = header_art,
	footer = '',
})


------------------------
-- Treesitter
------------------------

require('nvim-treesitter.configs').setup {
	-- Languages for syntax highlight
	ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim', 'odin', 'javascript', 'dart' },

	-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
	auto_install = false,

	highlight = { enable = true },
	indent		= { enable = true, disable = { 'python' } },
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

-- require("mason").setup({
--	ui = {
--		icons = {
--			package_installed = "",
--			package_pending = "",
--			package_uninstalled = "",
--		},
--	}
-- })
-- require("mason-lspconfig").setup()
