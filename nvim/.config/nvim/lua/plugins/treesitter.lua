-- ~/dotfiles/nvim/.config/nvim/lua/plugins/treesitter.lua 04 May 2026 at 09:13:08 AM
-- nvim-treesitter is archived. Using native Neovim treesitter instead.

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('TreesitterConfig', { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype

        if ft == 'text' or ft == '' then
            return
        end

        local lang = vim.treesitter.language.get_lang(ft) or ft

        -- Safe parser check without deprecated has_parser
        local ok = pcall(vim.treesitter.get_parser, bufnr, lang)
        if not ok then
            return
        end

        local max_filesize = 100 * 1024 -- 100 KB
        local stat_ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if stat_ok and stats and stats.size < max_filesize then
            -- pcall here too, so a bad query file won't crash the buffer
            pcall(vim.treesitter.start, bufnr, lang)
        end

        vim.bo[bufnr].indentexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
    end,
})

-- Textobjects (nvim-treesitter-textobjects still works standalone)
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
                ['@parameter.outer'] = 'v',
                ['@function.outer'] = 'V',
                ['@class.outer'] = '<c-v>',
            },
            include_surrounding_whitespace = true,
        },
    }
end

-- simple startup 

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "*" },
--   callback = function(ctx)
--     -- Check if the buffer has a valid parser to avoid errors on unsupported filetypes
--     if vim.treesitter.get_parser(nil, nil, { error = false }) then
--       vim.treesitter.start()
--     end
--   end,
-- })   
