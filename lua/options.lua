require "nvchad.options"

-- add yours here!

local o = vim.o
o.termguicolors = true
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Enable clipboard over SSH using OSC 52
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
