--  ~/.config/nvim/lua/plugins/vim_plug.lua :01 Jun at 04:52:58 PM

-- Auto-install vim-plug if not found
local plug_path = vim.fn.expand('~/.config/nvim/autoload/plug.vim')
if vim.fn.filereadable(plug_path) == 0 then
  vim.notify('vim-plug not found. Installing...', vim.log.levels.INFO)
  vim.fn.system({
    'curl', '-fLo', plug_path,
    '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim'
  })
  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
      vim.cmd('PlugInstall --sync')
    end,
  })
end

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
