--  ~/.config/nvim/lua/plugins/ollama-copilot.lua :13 May at 06:57:34 PM
-- Custom configuration (defaults shown)
require("Ollama-Copilot").setup({
  opts = {
    model_name = "deepseek-coder:base",
    stream_suggestion = false,
    python_command = "python3",
    filetypes = {'python', 'lua','vim', "markdown"},
    ollama_model_opts = {
        num_predict = 40,
        temperature = 0.1,
    },
    keymaps = {
        suggestion = '<leader>os',
        reject = '<leader>or',
        insert_accept = '<Tab>',
    },
}
})
