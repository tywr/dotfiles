return {
    {
        "github/copilot.vim",
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken",                            -- Only on MacOS or Linux
        opts = {
            system_prompt = 'COPILOT_INSTRUCTIONS',
            agent = 'copilot',
            context = 'files:`*`',
            sticky = nil,
            temperature = 0.1, -- GPT result temperature
            headless = false,
            stream = nil,
            callback = nil,
            remember_as_sticky = true,

            window = {
                layout = 'vertical',
                width = 0.5,
                height = 0.5,
                relative = 'editor',
                border = 'single',
                row = nil,
                col = nil,
                title = 'Copilot Chat',
                footer = nil,
                zindex = 1,
            },

            mappings = {
                complete = {
                    insert = '<Tab>',
                },
                close = {
                    normal = 'q',
                    insert = '<C-c>',
                },
                reset = {
                    normal = '<C-r>',
                    insert = '<C-r>',
                },
                submit_prompt = {
                    normal = '<CR>',
                    insert = '<C-s>',
                },
                toggle_sticky = {
                    normal = 'grr',
                },
                clear_stickies = {
                    normal = 'grx',
                },
                accept_diff = {
                    normal = '<C-y>',
                    insert = '<C-y>',
                },
                jump_to_diff = {
                    normal = 'gj',
                },
                quickfix_answers = {
                    normal = 'gqa',
                },
                quickfix_diffs = {
                    normal = 'gqd',
                },
                yank_diff = {
                    normal = 'gy',
                    register = '"', -- Default register to use for yanking
                },
                show_diff = {
                    normal = 'gd',
                    full_diff = false, -- Show full diff instead of unified diff when showing diff window
                },
                show_info = {
                    normal = 'gi',
                },
                show_context = {
                    normal = 'gc',
                },
                show_help = {
                    normal = 'gh',
                },
            },
        }
    },
}
