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
map("t", "<Esc>", "<C-\\><C-n>")

-- Startify maps
map("n", "<C-n>", "<CMD>Startify<CR>")
map("n", "<C-s>", "<CMD>SSave<CR>")
map("n", "<C-c>", "<CMD>SClose<CR>")

-- Keybindings for tabs
map("n", "nt", "<CMD>tabnew<CR>")
map("n", "<C-w>", "<CMD>wq<CR>")

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
map("n", "<C-p>", "<CMD>Telescope find_files<CR>")
map("n", "<C-h>", "<CMD>NERDTreeToggle<CR>")

-- LSP mapping

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
	  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- Setting up the lsp
local servers = { 'pyright' }
for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup{
		on_attach = on_attach,
		flags = lsp_flags,
	}
end

-- Adding extra paths to python lsp analyzer
require("lspconfig").pyright.setup {
  settings = {
    python = {
      analysis = {
        extraPaths = {"/usr/lib/python3.10/site-packages"}
      }
    }
  }
}
