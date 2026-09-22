
-- Startup of plugins


--------------------------
---- Battery
--------------------------

require("battery").setup({})


--------------------------
---- Lua Line
--------------------------

local nvimbattery = {
  function()
    return require("battery").get_status_line()
  end
}

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


--------------------------
---- Telescope
--------------------------

require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "node_modules",
      ".git",
      "target",
      ".venv",
      "venv",
      ".vendor",
    }
  },
  extensions = {
    sessions_picker = {
      sessions_dir = vim.fn.stdpath('data') ..'/session/',
    }
  },
}
require('telescope').load_extension('sessions_picker')


--------------------------
---- Indent Scope
--------------------------

require('mini.indentscope').setup()


--------------------------
---- Treesitter
--------------------------

require('nvim-treesitter.configs').setup {
  -- Languages for syntax highlight
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim', 'odin', 'javascript', 'dart', 'php' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = {
    enable = true,
    disable = {
      'python',
      'typescript',
      'tsx',
      'javascript',
      'jsx',
    },
  },
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


--------------------------
---- Nvim Tree
--------------------------

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  update_cwd = true,
  respect_buf_cwd = true,
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
})


--------------------------
---- Startify
--------------------------

vim.cmd([[
let g:startify_bookmarks = [
  \ {'v': '~/.vimrc'},
  \ {'n': '~/.config/nvim/init.lua'},
  \ {'i': '~/.config/i3/config'},
  \ {'b': '~/.bashrc'},
  \ {'a': '~/.config/alacritty/alacritty.toml'},
  \ {'p': '~/.config/polybar/config.ini'}
  \]

let g:startify_lists = [
  \ { 'header': ['   Bookmarks:'], 'type':'bookmarks'},
  \ { 'header': ['   Sessons:'], 'type':'sessions'}
  \]
]])
