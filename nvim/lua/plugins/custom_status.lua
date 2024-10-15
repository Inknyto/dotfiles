--  ~/.config/nvim/lua/plugins/custom_status.lua
local feline = require('feline')
local vi_mode_utils = require('feline.providers.vi_mode')

-- Function to get current working directory
local function get_cwd()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end

-- Function to get current time and appropriate icon
local function get_time_with_icon()
    local time = os.date("%H:%M")
    local hour = tonumber(os.date("%H"))
    local icon = (hour >= 6 and hour < 18) and '☀️' or ''
    return icon .. ' ' .. time
end

-- Define components
local components = {
    active = {},
    inactive = {},
}

table.insert(components.active, {}) -- Left section
table.insert(components.active, {}) -- Middle section
table.insert(components.active, {}) -- Right section

-- Components for the active statusline
-- Vim mode
table.insert(components.active[1], {
    provider = function()
        return vi_mode_utils.get_vim_mode()
    end,
    hl = function()
        return {
            name = vi_mode_utils.get_mode_highlight_name(),
            fg = vi_mode_utils.get_mode_color(),
            style = 'bold',
        }
    end,
    right_sep = ' ',
})

-- Current working directory
table.insert(components.active[1], {
    provider = get_cwd,
    icon = ' ',
    hl = {
        fg = 'skyblue',
        bg = 'NONE',
        style = 'bold',
    },
    right_sep = '  ',
})

-- Time with sun/moon icon
table.insert(components.active[3], {
    provider = get_time_with_icon,
    hl = {
        fg = 'gold',
        bg = 'NONE',
        style = 'bold',
    },
    left_sep = '  ',
})

-- Set up Feline
feline.setup({
    components = components,
    theme = {
        bg = 'NONE',
        fg = 'white',
    },
})

-- Set up winbar (optional)
feline.winbar.setup()

-- Uncomment if you need statuscolumn setup later
-- feline.statuscolumn.setup()
