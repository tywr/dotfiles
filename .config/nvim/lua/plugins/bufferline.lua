return {
    "akinsho/bufferline.nvim",
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup({
            options = {
                indicator = {
                    icon = " ",
                    style = "icon"
                },
                style_present = bufferline.style_preset.minimal,
                modified_icon = "*",
                show_buffer_icons = false, show_buffer_close_icons = false,
                show_tab_indicators = false,
                show_close_icon = false,
                auto_toggle_bufferline = true,
                separator_style = { " ", " " },
            },
            highlights = {
                fill = {
                    ctermfg = 0,
                    ctermbg = 0,
                },
                duplicate = {
                    ctermbg = 0,
                    ctermfg = 8,
                },
                background = {
                    ctermfg = 8,
                    ctermbg = 0,
                },
                modified = {
                    ctermfg = 8,
                    ctermbg = 0,
                },
                separator = {
                    ctermfg = 0,
                    ctermbg = 0,
                },
                buffer_selected = {
                    ctermbg = 2,
                    ctermfg = 0,
                },
                modified_selected = {
                    ctermbg = 2,
                    ctermfg = 0,
                },
                indicator_selected = {
                    ctermfg = 22,
                    ctermbg = 2,
                },
                separator_selected = {
                    ctermbg = 0,
                    ctermfg = 0,
                },
                duplicate_selected = {
                    ctermbg = 2,
                    ctermfg = 0,
                },
                buffer_visible = {
                    ctermfg = 7,
                    ctermbg = 0,
                },
                modified_visible = {
                    ctermfg = 7,
                    ctermbg = 0,
                },
                separator_visible = {
                    ctermfg = 0,
                    ctermbg = 0,
                },
                indicator_visible = {
                    ctermfg = 0,
                    ctermbg = 0,
                }
            }
        })

        local keymap = vim.keymap
        keymap.set("n", "<leader>&", function() require("bufferline").go_to(1, true) end)
        keymap.set("n", "<leader>é", function() require("bufferline").go_to(2, true) end)
        keymap.set("n", '<leader>"', function() require("bufferline").go_to(3, true) end)
        keymap.set("n", "<leader>'", function() require("bufferline").go_to(4, true) end)
        keymap.set("n", "<leader>(", function() require("bufferline").go_to(5, true) end)
        keymap.set("n", "<leader>-", function() require("bufferline").go_to(6, true) end)
        keymap.set("n", "<leader>è", function() require("bufferline").go_to(7, true) end)
        keymap.set("n", "<leader>_", function() require("bufferline").go_to(8, true) end)
        keymap.set("n", "<leader>ç", function() require("bufferline").go_to(9, true) end)
    end
}
