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



-- Set last cursor position in reopened file
vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "text",
  callback = function()
    vim.bo.textwidth = 92
  end,
})

