-- ============================================================================
-- COLORSCHEME & TABLINE HIGHLIGHTS
-- ============================================================================

local function setup_tabline_colors()
    -- Koppel mini.tabline aan de standaard Vim/Neovim TabLine highlight groups
    -- Hiermee liften de kleuren direct mee met ALLES wat je colorscheme (zoals OneDark) instelt.
    vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "TabLineSel" }) -- Actieve tab
    vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "TabLine" }) -- Zichtbare tab (in split)
    vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "TabLineFill" }) -- Inactieve achtergrond tab

    -- Gewijzigde bestanden (met opslaan-indicator)
    vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { link = "TabLineSel" })
    vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { link = "TabLineFill" })
end

-- Zorg dat de kleuren herberekend worden elke keer als je van colorscheme wisselt
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = setup_tabline_colors,
})

-- Laad het thema en stel de tabline in
require("onedark").setup({ style = "deep" })
require("onedark").load()
setup_tabline_colors()

-- ============================================================================
-- COLORSCHEME & TRANSPARENCY CONFIGURATION
-- ============================================================================

-- Apply transparent background to core UI highlight groups
-- local function apply_transparency()
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
-- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
--
-- if vim.o.background == "dark" then
-- 	vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
-- 		fg = "#6FBFF9",
-- 		bg = "#393939",
-- 		bold = false,
-- 	})
-- 	vim.api.nvim_set_hl(0, "MiniTablineVisible", {
-- 		fg = "#ffffff",
-- 		bg = "#313244",
-- 	})
-- 	vim.api.nvim_set_hl(0, "MiniTablineHidden", {
-- 		fg = "#6c7086",
-- 		bg = "none",
-- 	})
-- else
-- 	vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
-- 		fg = "#b57614",
-- 		bg = "#d5c4a1",
-- 		bold = true,
-- 	})
-- 	vim.api.nvim_set_hl(0, "MiniTablineVisible", {
-- 		fg = "#4c505a",
-- 		bg = "#ebdbb2",
-- 	})
-- 	vim.api.nvim_set_hl(0, "MiniTablineHidden", {
-- 		fg = "#7c6f64",
-- 		bg = "none",
-- 	})
-- end

-- -- Configure mini.tabline colors
-- vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
--     fg = "#d79921",
--     bg = "#393939",
--     bold = true,
-- })
--
-- -- Buffers open in other active windows (splits)
-- vim.api.nvim_set_hl(0, "MiniTablineVisible", {
--     fg = "#cdd6f4",
--     bg = "#313244",
-- })
--
-- -- Buffers that are open in the background
-- vim.api.nvim_set_hl(0, "MiniTablineHidden", {
--     fg = "#6c7086",
--     bg = default,
-- })
-- end

-- Make sure transparency is always reapplied when the theme changes
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     callback = apply_transparency,
-- })

-- Set the colorscheme and apply the transparent background settings
vim.cmd.colorscheme("onedark")
-- apply_transparency()
