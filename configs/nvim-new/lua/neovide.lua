-- Helper to change font size
local function change_font_size(delta)
	local fontname, size = string.match(vim.o.guifont, "^(.*):h(%d+)")
	size = tonumber(size) + delta
	if size < 6 then size = 6 end -- prevent tiny unreadable text
	vim.o.guifont = string.format("%s:h%d", fontname, size)
end

-- Function to set font size without hardcoding the font name
local function set_font_size(size)
	-- Extract font name (everything before :h)
	local fontname = vim.o.guifont:match("^(.*):h%d+")
	if not fontname then
		-- If no :h found, use the whole string
		fontname = vim.o.guifont
	end
	vim.o.guifont = string.format("%s:h%d", fontname, size)
end

-- Keymap: Ctrl+0 resets to size 14, keeping the current font name
vim.keymap.set("n", "<C-0>", function()
	set_font_size(11)
end)

-- Keymaps: Ctrl + and Ctrl -
vim.keymap.set("n", "<C-=>", function() change_font_size(1) end)
vim.keymap.set("n", "<C-->", function() change_font_size(-1) end)

-- fullscreen
vim.keymap.set("n", "<F11>", function()
	vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end)

vim.o.guifont = "Consolas:h11"
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_length = 0.8
vim.g.neovide_cursor_antialiasing = true
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.g.neovide_cursor_smooth_blink = true
