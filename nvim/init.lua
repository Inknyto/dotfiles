-- Main neovim configuration file
-- Import basic configuration
require('core')
-- Import plugins configuration
require('plugins')

require('ui_colors')


-- Color scheme (defined those in plugins/init.lua)
-- vim.cmd('colorscheme abscs')
-- vim.cmd('highlight LineNr guifg=gold')
-- vim.cmd('highlight CursorLineNr guifg=white guibg=#0065cb')

-- Uncomment if you want to use these:
-- vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
