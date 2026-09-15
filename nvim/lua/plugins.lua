-- ============================================================================
-- PLUGINS INSTALLATION & SETUP
-- ============================================================================

vim.pack.add({
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/stevearc/conform.nvim" },
    -- { src = "https://github.com/folke/flash.nvim" },
    { src = "https://github.com/junegunn/fzf" },
    { src = "https://github.com/junegunn/fzf.vim" },
    { src = "https://github.com/akinsho/bufferline.nvim" },
    { src = "https://github.com/nvim-mini/mini.ai" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/sindrets/diffview.nvim" },
    { src = "https://github.com/meanderingprogrammer/render-markdown.nvim" },
    { src = "https://github.com/mofiqul/vscode.nvim" },
    { src = "https://github.com/navarasu/onedark.nvim" },
    { src = "https://github.com/craftzdog/solarized-osaka.nvim" }
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
        timeout_ms = 5000,
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

-- Conform formatting keymap
vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- Setup mini.ai
local ai = require("mini.ai")

-- Setup bufferline
require("bufferline").setup({
    options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        custom_areas = {
            right = function()
                local result = {}
                local seve = vim.diagnostic.severity
                local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

                if error ~= 0 then
                    table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
                end

                if warning ~= 0 then
                    table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
                end

                if hint ~= 0 then
                    table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
                end

                if info ~= 0 then
                    table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
                end
                return result
            end,
        },
        --separator_style = "slant", -- "slant" | "slope" | "thick" | "thin"
        show_buffer_close_icons = false,
        show_close_icon = false,
        numbers = function(opts)
            return string.format("%s", opts.raise(opts.ordinal))
        end,
        -- numbers = function(opts)
        --     return string.format('%s', opts.raise(opts.id))
        -- end,

    },
})

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
