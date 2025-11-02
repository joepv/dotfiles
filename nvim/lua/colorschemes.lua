-- ============================================================================
-- COLORSCHEME & TRANSPARENCY CONFIGURATION
-- ============================================================================

-- Apply transparent background to core UI highlight groups
local function apply_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
	vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })

	if vim.o.background == "dark" then
		vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
			fg = "#d79921",
			bg = "#393939",
			bold = true,
		})
		vim.api.nvim_set_hl(0, "MiniTablineVisible", {
			fg = "#cdd6f4",
			bg = "#313244",
		})
		vim.api.nvim_set_hl(0, "MiniTablineHidden", {
			fg = "#6c7086",
			bg = "none",
		})
	else
		vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
			fg = "#b57614",
			bg = "#d5c4a1",
			bold = true,
		})
		vim.api.nvim_set_hl(0, "MiniTablineVisible", {
			fg = "#4c505a",
			bg = "#ebdbb2",
		})
		vim.api.nvim_set_hl(0, "MiniTablineHidden", {
			fg = "#7c6f64",
			bg = "none",
		})
	end

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
end

-- Make sure transparency is always reapplied when the theme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = apply_transparency,
})

-- Set the colorscheme and apply the transparent background settings
vim.cmd.colorscheme("retrobox")
apply_transparency()
