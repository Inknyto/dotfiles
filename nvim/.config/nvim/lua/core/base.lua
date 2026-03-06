-- ~/dotfiles/nvim/.config/nvim/lua/core/base.lua 06 Mar at 12:04:54 PM
--  ~/.config/nvim/lua/core/base.lua :13 Sep at 04:19:14 PM
local opt = vim.opt

opt.termguicolors = true
opt.shiftwidth = 4
opt.backup = true
opt.tabstop = 4
opt.undofile = true -- Enable persistent undo
opt.relativenumber = true
opt.number = true
opt.wrap = true
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 8
opt.colorcolumn = "80"
opt.hlsearch = false
opt.guicursor = "n-v-c-i:block"
opt.mmp = 5000
opt.expandtab = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorcolumn = true
opt.shada = "!,'100,<50,s10,h"

-- Folding
opt.foldlevelstart = 99
opt.viewoptions = "folds,cursor,curdir,slash,unix"

-- Persist cursor and folds using views
local view_group = vim.api.nvim_create_augroup('ViewPersistence', { clear = true })

vim.api.nvim_create_autocmd('BufWinLeave', {
    group = view_group,
    pattern = '*',
    callback = function()
        -- Skip for empty or special buffers
        if vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
            vim.cmd('silent! mkview')
        end
    end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
    group = view_group,
    pattern = '*',
    callback = function()
        if vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
            vim.cmd('silent! loadview')
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {

  pattern = "text",
  callback = function()
    vim.bo.textwidth = 92
  end,
})

