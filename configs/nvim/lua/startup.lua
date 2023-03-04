
-- Startup of plugins

------------------------
-- Lua Line
------------------------

require('lualine').setup()


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


------------------------
-- Transparency
------------------------

require('transparent').setup({
	enable=true
})

vim.g.python_highlight_all=1


------------------------
-- Startify
------------------------

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


------------------------
-- Treesitter
------------------------

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
