-- Main neovim configuration
vim.opt.termguicolors = true

-- Import plugins configuration
require('nytoPlugins')
-- Import basic configuration
require('nytoBase')
-- Import the statusline configuration
require('status')

-- Neovim settings vim.opt.relativenumber = true

-- Color scheme
vim.cmd('colorscheme abscs')
vim.cmd('highlight LineNr guifg=gold')
vim.cmd('highlight CursorLineNr guifg=white guibg=#0065cb')

-- Uncomment if you want to use these:
-- vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
-- vim.opt.cursorline = true

