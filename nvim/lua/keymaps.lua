-- ============================================================================
-- KEYMAPS CONFIGURATION
-- ============================================================================

vim.g.mapleader = " " -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key (NEW)

-- Normal mode mappings
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Y to EOL
-- vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Center screen when jumping
-- vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
-- vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
-- vim.keymap.set("n", "<C-d>", "5j", { desc = "Half page down (centered)" })
-- vim.keymap.set("n", "<C-u>", "5k", { desc = "Half page up (centered)" })
--
vim.keymap.set("n", "<C-e>", "5<C-e>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-y>", "5<C-y>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-q>", "5<C-y>", { noremap = true, silent = true })

-- Change without yanking
-- vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true })
-- vim.keymap.set({ "n", "v" }, "C", '"_C', { noremap = true })

-- Better paste behavior
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Switch to other window" })
vim.keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Delete/Close window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })

-- Persistance Session Management
vim.keymap.set("n", "<leader>qs", function()
	require("persistence").load()
end)

vim.keymap.set("n", "<leader>qS", function()
	require("persistence").select()
end)

vim.keymap.set("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end)

vim.keymap.set("n", "<leader>qd", function()
	require("persistence").stop()
end)

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Alternative navigation (more intuitive)
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })

-- Tab moving
vim.keymap.set("n", "<leader>tm", ":tabmove<CR>", { desc = "Move tab" })
vim.keymap.set("n", "<leader>t>", ":tabmove +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader>t<", ":tabmove -1<CR>", { desc = "Move tab left" })

-- LSP diagnostic keymaps (always available)
-- vim.keymap.set("n", "pd", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
-- vim.keymap.set("n", "nd", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })
-- vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- Close all buffers except current
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

-- Rename current file
vim.keymap.set("n", "<leader>rr", function()
	local old_name = vim.fn.expand("%")
	local new_name = vim.fn.input("New file name: ", old_name)
	if new_name ~= "" and new_name ~= old_name then
		vim.cmd("saveas " .. new_name)
		vim.fn.delete(old_name)
		print("File renamed to: " .. new_name)
	end
end, { desc = "Rename current file" })

-- Copy file path variations
vim.keymap.set("n", "<leader>pf", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("Full path: " .. path)
end, { desc = "Copy full file path" })

vim.keymap.set("n", "<leader>pr", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	print("Relative path: " .. path)
end, { desc = "Copy relative file path" })

vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- FZF keymaps
vim.keymap.set("n", "<Leader><Leader>", "<Cmd>Files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<Leader>,", "<Cmd>Buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<Leader>/", "<Cmd>Rg<CR>", { desc = "Search project" })

-- Diffview keymaps
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Git Diff Open" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "Git File History" })

-- Map <leader>1..9 to switch to buffers 1 through 9
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, "<Cmd>b " .. i .. "<CR>", { desc = "Ga naar buffer " .. i })
end

-- Tab & Buffer management (see tabs.lua)
local fn = require("tabs")
vim.keymap.set("n", "<leader>tO", fn.open_file_in_tab, { desc = "Open file in new tab" })
vim.keymap.set("n", "<leader>td", fn.duplicate_tab, { desc = "Duplicate current tab" })
vim.keymap.set("n", "<leader>tr", fn.close_tabs_right, { desc = "Close tabs to the right" })
vim.keymap.set("n", "<leader>tL", fn.close_tabs_left, { desc = "Close tabs to the left" })
vim.keymap.set("n", "<leader>bd", fn.smart_close_buffer, { desc = "Smart close buffer/tab" })

-- Keymaps for selection of functions and classes
-- You can use the capture groups defined in `textobjects.scm`
vim.keymap.set({ "x", "o" }, "am", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
end)

-- Keymaps for jumping functions and classes
vim.keymap.set({ "n", "x", "o" }, "]m", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]]", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
-- You can also pass a list to group multiple queries.
vim.keymap.set({ "n", "x", "o" }, "]o", function()
	require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
vim.keymap.set({ "n", "x", "o" }, "]s", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
end)
vim.keymap.set({ "n", "x", "o" }, "]z", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end)

vim.keymap.set({ "n", "x", "o" }, "]M", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[M", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[]", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end)

-- Selecteer een heel if-blok (inclusief if/else en conditie)
vim.keymap.set({ "x", "o" }, "ad", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
end)

-- Selecteer alleen de binnenkant van het if-blok (de regels code binnen de accolades of indentatie)
vim.keymap.set({ "x", "o" }, "id", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
end)

-- Go to either the start or the end, whichever is closer.
-- Use if you want more granular movements
vim.keymap.set({ "n", "x", "o" }, "]d", function()
	require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[d", function()
	require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
end)

-- vim.keymap.set({ "n", "i", "v", "x" }, "<D-c>", '"+y', { desc = "MacOS copy" })
