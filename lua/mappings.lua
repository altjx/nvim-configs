require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Neo-tree mappings (override NvChad's default nvim-tree mappings)
map("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
map("n", "<leader>e", "<cmd>Neotree focus<cr>", { desc = "Focus Neo-tree" })

-- Git diff mappings
-- Toggle inline diffs (show_deleted and word_diff)
map("n", "<leader>gd", function()
  require("gitsigns").toggle_deleted()
  require("gitsigns").toggle_word_diff()
  vim.notify("Toggled inline git diffs", vim.log.levels.INFO)
end, { desc = "Toggle inline git diffs" })
map("n", "<leader>gD", "<cmd>Gitsigns diffthis<cr>", { desc = "Git diff this file (split view)" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk (float)" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset buffer" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage buffer" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo stage hunk" })
map("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })
map("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })

-- Telescope git mappings
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
map("n", "<leader>gt", "<cmd>Telescope git_status<cr>", { desc = "Git status (changed files)" })

-- Window navigation with Option/Alt keys (works in SSM sessions)
-- These complement the default Ctrl-h/j/k/l mappings from NvChad
map("n", "<M-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<M-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<M-k>", "<C-w>k", { desc = "Switch window up" })
map("n", "<M-l>", "<C-w>l", { desc = "Switch window right" })

-- Terminal mode navigation with Option/Alt keys
map("t", "<M-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal: Navigate left" })
map("t", "<M-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal: Navigate down" })
map("t", "<M-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal: Navigate up" })
map("t", "<M-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal: Navigate right" })

-- Terminal mappings (alternative to <M-i> for Warp users)
map({ "n", "t" }, "<leader>tf", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle floating terminal" })

-- Format current file with Rubocop
map("n", "<leader>fm", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format current file" })

-- Copy file paths
map("n", "<leader>yf", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy relative file path" })
map("n", "<leader>yF", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy absolute file path" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
