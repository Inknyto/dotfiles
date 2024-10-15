--  ~/.config/nvim/lua/core/save_filename.lua
-- Save the filename as a comment
local api = vim.api

-- Function to add the full path of the file as a comment
local function add_filename_comment()
    -- Get the current buffer
    local bufnr = api.nvim_get_current_buf()
    -- Return early if the buffer has no 'commentstring' option
    local commentstring = vim.bo[bufnr].commentstring
    if commentstring == '' then
        return
    end

    -- Get the current filename
    local filename = api.nvim_buf_get_name(bufnr)
    -- Replace home path with ~/
    local home_dir = vim.fn.expand("~")
    filename = filename:gsub("^" .. home_dir, "~")

    local lines = api.nvim_buf_get_lines(bufnr, 0, -1, false)


    -- Determine the comment syntax, considering multi-line comments
    local comment_leader, comment_trailer = commentstring:match("^(.-)%%s(.-)$")
    comment_leader = comment_leader or ""
    comment_trailer = comment_trailer or ""
    local filename_comment
    if comment_trailer == '' then
        -- Construct the full path comment
        filename_comment = comment_leader .. ' ' .. filename
    else
        -- Construct the full path comment
        filename_comment = comment_leader .. ' ' .. filename .. ' ' .. comment_trailer
    end

    -- Check if the comment already exists at the start of the file
    local has_shebang = lines[1]:match("^#!")
    if (has_shebang and lines[2] == filename_comment) or (not has_shebang and lines[1] == filename_comment) then
        return
    end

    -- Insert the comment at the appropriate position
    if has_shebang then
        -- Insert on the second line if there's a shebang
        api.nvim_buf_set_lines(bufnr, 1, 1, false, { filename_comment })
    else
        -- Insert on the first line if there's no shebang
        api.nvim_buf_set_lines(bufnr, 0, 0, false, { filename_comment })
    end
end

-- Autocmd to run the function before saving the file
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = add_filename_comment,
})
