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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
