-- ============================================================================
-- PLUGINS INSTALLATION & SETUP
-- ============================================================================

vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/junegunn/fzf" },
	{ src = "https://github.com/junegunn/fzf.vim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.tabline" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
})

-- Setup nvim-web-devicons
require("nvim-web-devicons").setup({})

-- Setup nvim-autopairs
require("nvim-autopairs").setup({})

-- Setup conform.nvim
require("conform").setup({
	formatters_by_ft = {
		python = { "ruff_format", "ruff_organize_imports" },
		hcl = { "terraform_fmt" },
		yaml = { "prettier" },
		["yaml.ansible"] = { "prettier" },
		javascript = { "prettier", stop_after_first = true },
		typescript = { "prettier", stop_after_first = true },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})

-- Add the :ConformInfo command
vim.api.nvim_create_user_command("ConformInfo", function()
	require("conform.info").show_info()
end, {})

-- ============================================================================
-- PLUGINS CONFIGURATION (Flash, Conform, etc.)
-- ============================================================================

-- Setup flash.nvim
require("flash").setup({
	-- modes = {
	-- 	char = {
	-- 		enabled = false, -- Zet de overname van f, t, F, T uit om crashes bij ct/cf te voorkomen
	-- 	},
	-- },
})

-- Flash keymaps & treesitter incremental selection
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "o", "x" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })

vim.keymap.set({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

vim.keymap.set("c", "<c-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })

vim.keymap.set({ "n", "o", "x" }, "<c-space>", function()
	require("flash").treesitter({
		actions = {
			["<c-space>"] = "next",
			["<BS>"] = "prev",
		},
	})
end, { desc = "Treesitter Incremental Selection" })

-- Conform formatting keymap
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- Setup mini.icons
require("mini.icons").setup({})

-- Setup mini.tabline
require("mini.tabline").setup({
	show_icons = true,
	format = function(buf_id, label)
		local default_label = require("mini.tabline").default_format(buf_id, label)
		return default_label:sub(1, -2) .. ":" .. buf_id .. " "
	end,
})

-- Setup mini.ai
local ai = require("mini.ai")

ai.setup({
	n_lines = 500,
	custom_textobjects = {
		i = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
		l = ai.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }),
		o = ai.gen_spec.treesitter({
			a = { "@block.outer", "@conditional.outer", "@loop.outer" },
			i = { "@block.inner", "@conditional.inner", "@loop.inner" },
		}),
		f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
		t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
		d = { "%f[%d]%d+" },
		g = function()
			local n_lines = vim.api.nvim_buf_line_count(0)
			return {
				from = { line = 1, col = 1 },
				to = { line = n_lines, col = math.max(vim.fn.getline(n_lines):len(), 1) },
			}
		end,
		u = ai.gen_spec.function_call(),
		U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
	},
})

-- Setup gitsigns.nvim
require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	signcolumn = true,
	numhl = false,
	linehl = false,
	word_diff = false,
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil,
	max_file_length = 40000,
	preview_config = {
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		vim.keymap.set("n", "]g", gs.next_hunk, { buffer = bufnr, desc = "Next Git hunk" })
		vim.keymap.set("n", "[g", gs.prev_hunk, { buffer = bufnr, desc = "Prev Git hunk" })
		vim.keymap.set("n", "gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
	end,
})

-- Setup diffview.nvim
require("diffview").setup({})
