-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "github_dark",
}

M.ui = {
	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal
		-- Override the default modules to show relative path
		order = nil, -- use default order
		modules = {
			file = function()
				local icon = " 󰈚 "
				local path = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
				local name = (path == "" and "Empty ") or path:match("([^/\\]+)[/\\]*$")

				-- Get relative path from current working directory
				local cwd = vim.fn.getcwd()
				local relative_path = vim.fn.fnamemodify(path, ":~:.")

				if relative_path == "" then
					relative_path = "Empty"
				end

				return "%#St_file#" .. icon .. relative_path .. " "
			end,
		},
	},
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

-- Disabled in favor of neo-tree
-- M.nvimtree = {
--   view = {
--     width = 45,
--   },
--   renderer = {
--     indent_markers = {
--       enable = true,
--     },
--   },
-- }

return M
