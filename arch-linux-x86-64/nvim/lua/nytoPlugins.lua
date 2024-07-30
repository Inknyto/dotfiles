-- Set up plugin manager (vim-plug)
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug 'https://github.com/Abstract-IDE/Abstract-cs.git'
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.8'})

vim.call('plug#end')

