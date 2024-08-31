-- Set up plugin manager (vim-plug)
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug 'https://github.com/Abstract-IDE/Abstract-cs.git'
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug "kylechui/nvim-surround"

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'


Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' })

-- Plug 'neovim/nvim-lspconfig'
-- Plug 'jose-elias-alvarez/null-ls.nvim'
-- Plug 'MunifTanjim/prettier.nvim'
-- Flutter
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'akinsho/flutter-tools.nvim'
-- Plug 'natebosch/vim-lsc'
-- Plug 'natebosch/vim-lsc-dart'
Plug('neoclide/coc.nvim', { branch = 'release' })

Plug "olrtg/nvim-emmet"

vim.call('plug#end')
