return {
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set("i", "<right>", 'copilot#Accept("\\<CR>")',
                { expr = true, silent = true, replace_keycodes = false })
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        model = "claude-3.5-sonnet",
        dependencies = {
            { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken",                            -- Only on MacOS or Linux
        keys = {
            { "<leader>cc", ":CopilotChatOpen<cr>",    mode = "n", desc = "Open Copilot" },
            { "<leader>ce", ":CopilotChatExplain<cr>", mode = "v", desc = "Explain Code" },
            { "<leader>cf", ":CopilotChatFix<cr>",     mode = "v", desc = "Fix Code" },

        },
        opts = {
            system_prompt = 'COPILOT_INSTRUCTIONS',
        }
    },
}
