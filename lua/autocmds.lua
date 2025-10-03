require "nvchad.autocmds"

-- Open Neo-tree automatically on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only open if no file was specified
    if vim.fn.argc() == 0 then
      vim.cmd("Neotree show")
    else
      -- Open neo-tree when a file is specified
      vim.cmd("Neotree show")
    end
  end,
})
