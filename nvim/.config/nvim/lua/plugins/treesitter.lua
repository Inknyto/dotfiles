-- ~/dotfiles/nvim/.config/nvim/lua/plugins/treesitter.lua 06 Mar at 12:29:48 PM
-- ~/.config/nvim/lua/plugins/treesitter.lua
local ts = require('nvim-treesitter')

-- Directory to install parsers and queries to
ts.setup {
    -- install_dir = vim.fn.stdpath('data') .. '/site'
}

-- Install parsers (no-op if already installed)
ts.install({ "bash", "python", "dart", "javascript", "c", "vim", "vimdoc", "query", "markdown", "markdown_inline" })

-- Enable highlighting and other features via autocommands
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('TreesitterConfig', { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft

        -- Check if parser is installed for this language
        local has_parser = pcall(vim.treesitter.get_parser, bufnr, lang)
        if not has_parser then
            return
        end

        -- Treesitter highlighting with file size check
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if ok and stats and stats.size < max_filesize then
            vim.treesitter.start(bufnr, lang)
        end

        -- Treesitter indentation (experimental)
        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- Treesitter folding
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
    end,
})

-- Textobjects configuration (requires nvim-treesitter-textobjects plugin)
local ok_to, to = pcall(require, 'nvim-treesitter-textobjects')
if ok_to then
    to.setup {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
        },
    }
end
