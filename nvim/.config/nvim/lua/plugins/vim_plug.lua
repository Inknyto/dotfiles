--  ~/.config/nvim/lua/plugins/vim_plug.lua :01 Jun at 04:52:58 PM
-- Set up plugin manager (vim-plug)
local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- colorscheme
Plug 'https://github.com/Abstract-IDE/Abstract-cs.git'
-- status bar
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'

-- surround
Plug "kylechui/nvim-surround"

-- treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

-- telescope
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })

-- Plug 'neovim/nvim-lspconfig'
-- Plug 'jose-elias-alvarez/null-ls.nvim'
-- Plug 'MunifTanjim/prettier.nvim'
-- Flutter
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'akinsho/flutter-tools.nvim'
-- Plug 'natebosch/vim-lsc'
-- Plug 'natebosch/vim-lsc-dart'

-- coc as out of the box lsp
Plug('neoclide/coc.nvim', { branch = 'release' })

-- emmet because html is a programming language
Plug "olrtg/nvim-emmet"

-- noice nvim
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
-- end noice nvim

vim.call('plug#end')
