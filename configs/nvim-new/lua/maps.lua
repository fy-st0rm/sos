-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Mimic shell movements
map("i", "<C-E>", "<ESC>A")
map("i", "<C-A>", "<ESC>I")

-- Load recent sessions
map("n", "<leader>sl", "<CMD>SessionLoad<CR>")

-- Keymaps for terminal
map("n", "tt", "<CMD>term<CR>")
vim.keymap.set("n", "TT", function()
  vim.cmd("13sp")     -- horizontal split
  vim.cmd("term")
end)
map("t", "<Esc>", "<C-\\><C-n>")

-- Startify maps
map("n", "<C-s>", "<CMD>SSave<CR>")
map("n", "<C-c>", "<CMD>SClose<CR>")
map('n', '<C-b>', '<CMD>Telescope sessions_picker<CR>')

-- Treetoggle
map("n", "<C-o>", "<CMD>NvimTreeToggle<CR>")

-- Remaping split movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Keybindings for tabs
map("n", "nt", "<CMD>tabnew<CR>")
map("n", "<C-w>", "<CMD>q!<CR>")

-- Tab navigations
map("n", "n1", "<CMD>tabnext 1<CR>")
map("n", "n2", "<CMD>tabnext 2<CR>")
map("n", "n3", "<CMD>tabnext 3<CR>")
map("n", "n4", "<CMD>tabnext 4<CR>")
map("n", "n5", "<CMD>tabnext 5<CR>")
map("n", "n6", "<CMD>tabnext 6<CR>")
map("n", "n7", "<CMD>tabnext 7<CR>")
map("n", "n8", "<CMD>tabnext 8<CR>")
map("n", "n9", "<CMD>tabnext 9<CR>")

-- Keybindings for telescope
map("n", "<C-p>", "<CMD>Telescope find_files hidden=true<CR>")

-- Keybindings for CMake
-- map("n", "<C-g>", "<CMD>CMakeGenerate<CR>")
-- map("n", "<C-b>", "<CMD>CMakeBuild<CR>")
-- map("n", "<C-x>", "<CMD>CMakeClose<CR>")

-- Keybinding to c builder
-- map("n", "<C-b>", "<CMD>sp | term ipm run<CR>")
-- map("n", "<C-b>", "<CMD>sp | term cargo run<CR>")
-- map("n", "<C-b>", "<CMD>sp | term make<CR>")
