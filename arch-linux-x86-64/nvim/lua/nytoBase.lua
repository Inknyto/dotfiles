vim.opt.undofile = true  -- Enable persistent undo
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.mmp = 5000
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.shada = "!,'100,<50,s10,h"
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

