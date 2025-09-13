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

    -- Get buffer lines
    local lines = api.nvim_buf_get_lines(bufnr, 0, -1, false)

    -- Determine the comment syntax, considering multi-line comments
    local comment_leader, comment_trailer = commentstring:match("^(.-)%%s(.-)$")
    comment_leader = comment_leader or ""
    comment_trailer = comment_trailer or ""

    -- Generate the new comment with current timestamp
    local save_time = os.date('%d %b at %I:%M:%S %p')
    local filename_comment
    if comment_trailer == '' then
        filename_comment = comment_leader .. ' ' .. filename .. ' :' .. save_time
    else
        filename_comment = comment_leader .. ' ' .. filename .. ' ' .. save_time .. ' ' .. comment_trailer
    end

    -- Check for shebang in first line
    local has_shebang = lines[1]:match("^#!")
    local insert_position = has_shebang and 1 or 0

    -- Function to check if a line is a filename comment
    local function is_filename_comment(line)
        -- Escape special pattern characters in the filename
        local escaped_filename = filename:gsub("[%-%.%+%[%]%(%)%$%^%%%?%*]", "%%%1")
        local pattern = "^" .. comment_leader:gsub("%-", "%%-") .. "%s+" .. escaped_filename .. ".*"
        return line:match(pattern) ~= nil
    end

    -- Find and replace existing filename comment if it exists
    local found = false
    for i, line in ipairs(lines) do
        if is_filename_comment(line) then
            api.nvim_buf_set_lines(bufnr, i - 1, i, false, { filename_comment })
            found = true
            break
        end
    end

    -- If no existing comment found, insert at appropriate position
    if not found then
        api.nvim_buf_set_lines(bufnr, insert_position, insert_position, false, { filename_comment })
    end
end

-- Autocmd to run the function before saving the file
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = add_filename_comment,
})
