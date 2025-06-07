return {
    {
        "nvim-telescope/telescope-ui-select.nvim"
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "sopa0/telescope-makefile",
            "akinsho/toggleterm.nvim",
        },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        prompt_title = "files",
                        results_title = "",
                        preview_title = "",
                        hidden = true,
                        disable_devicons = true,
                    },
                    live_grep = {
                        prompt_title = "grep",
                        results_title = "",
                        preview_title = "",
                        disable_devicons = true,
                    },
                    buffers = {
                        prompt_title = "buffers",
                        results_title = "",
                        preview_title = "",
                        disable_devicons = true,
                    }
                },
                defaults = {
                    borderchars = {
                        prompt = { " ", " ", "─", "│", "│", " ", "─", "╰" },
                        results = { "─", " ", " ", "│", "╭", "─", " ", "│" },
                        preview = { "─", "│", "─", "│", "┬", "╮", "╯", "┴" },
                    },
                    mappings = {
                        i = {
                            ["<Tab>"] = "move_selection_next",
                            ["<S-Tab>"] = "move_selection_previous",
                        },
                        n = {
                            ["dd"] = "delete_buffer",
                            ["<Tab>"] = "move_selection_next",
                            ["<S-Tab>"] = "move_selection_previous",

                        }
                    },
                    file_ignore_patterns = { ".git/",
                        ".cache",
                        "%.o",
                        "%.a",
                        "%.out",
                        "%.class",
                        "%.pdf",
                        "%.mkv",
                        "%.mp4",
                        "%.zip"
                    },
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '--hidden',
                        '-g',
                        '!.git/',
                    }
                },
            })
            local builtin = require('telescope.builtin')
            local keymap = vim.keymap

            keymap.set("n", "<leader>fg", function() builtin.live_grep() end)
            keymap.set("n", "<leader>ff", function() builtin.find_files() end)
            keymap.set("n", "<leader>fp", function() builtin.git_files() end)
            keymap.set("n", "<leader>fb", function() builtin.buffers() end)
            keymap.set("n", "<leader>ft", function() builtin.help_tags() end)
            keymap.set("n", "<leader>gg", function() builtin.grep_string() end)
            keymap.set("n", "<leader>fm", "<cmd>Telescope make<cr>")
            keymap.set("n", "<tab>",
                function()
                    builtin.buffers(
                        require("telescope.themes").get_dropdown({
                            prompt_title = "",
                            initial_mode = "normal",
                            layout_config = {
                                width = 0.25,
                                height = 0.4,
                            },
                            previewer = false,
                            sort_lastused = true,
                            bufnr_width = 3,
                            -- ignore_current_buffer = true,
                            disable_devicons = true,
                            path_display = { "tail" },
                        }))
                end
            )
            require("telescope").load_extension("ui-select")
        end
    },
}
