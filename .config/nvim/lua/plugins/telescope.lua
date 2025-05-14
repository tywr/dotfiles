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
                        hidden = true
                    }
                },
                defaults = {
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

            require("telescope").load_extension("ui-select")
        end
    },
}
