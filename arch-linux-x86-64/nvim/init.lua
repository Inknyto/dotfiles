-- Main neovim configuration file
-- Import basic configuration
require('nytoBase')
-- Import plugins configuration
require('nytoPlugins')
-- Import the statusline configuration
require('nytoStatus')
-- Import the Prettier configuration
require('nytoPrettier')
-- Import the Nulljs configuration
require('nytoNulljs')

-- Import the treesitter configuration
require('nytoTreesitter')

-- Import the flutter configuration
require('nytoFlutter')

-- Import the surround configuration
require('nytoSurround')

-- Import the surround configuration
require('nytoTelescope')

-- Neovim settings vim.opt.relativenumber = true
require('nytoCoc')

-- configuration from theprimeagen
require('nytoNew')


-- Color scheme
vim.cmd('colorscheme abscs')
vim.cmd('highlight LineNr guifg=gold')
vim.cmd('highlight CursorLineNr guifg=white guibg=#0065cb')

-- Uncomment if you want to use these:
-- vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
-- vim.opt.cursorline = true

