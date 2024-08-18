local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
      "python",
      "javascript",
      "bash",
      "zsh",
      "c",
      "lua",
    "dart",
    "css",
    "html",
    "javascript",
    "javascriptreact",
  },
})

-- This indents the entire document
-- Define a custom function to run Prettier
 function FormatWithPrettier()
   vim.cmd("silent! Prettier")
 end
 
 -- Remap the = key to call the custom function
 vim.api.nvim_set_keymap('n', '=', ':lua FormatWithPrettier()<CR>', { noremap = true, silent = true })
 vim.api.nvim_set_keymap('v', '=', ':lua FormatWithPrettier()<CR>', { noremap = true, silent = true })
-- 
-- Define a custom function to run Prettier

