-- prettier.lua

local prettier = require("prettier")

prettier.setup({
    bin = 'prettier', -- or `'prettierd'`
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

-- Function to format the current buffer with Prettier
function FormatWithPrettier()
    vim.cmd("silent! Prettier")
end

-- Map the = key to format the entire file
vim.api.nvim_set_keymap('n', '=', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

-- Map the = key in visual mode to format the selected region with Prettier
vim.api.nvim_set_keymap('v', '=', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })
