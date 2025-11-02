-- ============================================================================
-- LSP CONFIGURATION (SERVERS & UI)
-- ============================================================================

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- Floating window borders
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Set default root markers for all clients
vim.lsp.config("*", {
    root_markers = { ".git" },
})

vim.lsp.config("vtsls", {
    cmd = { "vtsls", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = { -- Pyright autocomplete only (diagnostics handled by Ruff)
                diagnosticMode = "off",
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                    reportUnusedImport = "none",
                    reportUnusedVariable = "none",
                    reportGeneralTypeIssues = "none",
                    reportOptionalMemberAccess = "none",
                    reportAttributeAccessIssue = "none",
                    reportUndefinedVariable = "none",
                },
            },
        },
    },
})

vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    init_options = {
        settings = {
            args = { "--line-length", "79" },
        },
    },
})

vim.lsp.config("lua_ls", {
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.config("terraformls", {
    filetypes = { "terraform", "tf" },
})

vim.lsp.config("ansiblels", {
    filetypes = { "yaml.ansible" },
})

local servers = { "ruff", "pyright", "lua_ls", "vtsls", "terraformls", "ansiblels" }

for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
