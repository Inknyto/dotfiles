vim.g.mapleader = ' '
-- print('leader is set to: ',vim.g.mapleader)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Make 'gotofile (gf)' create the file if it does not exist
vim.cmd("map gf :e <cfile><CR>")
