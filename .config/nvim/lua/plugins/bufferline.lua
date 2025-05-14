return {
    "akinsho/bufferline.nvim",
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup({
            options = {
                numbers = "ordinal",
                indicator = {
                    style = "none"
                },
                style_present = bufferline.style_preset.minimal,
                modified_icon = "+",
                show_buffer_icons = false,
                show_buffer_close_icons = false,
                auto_toggle_bufferline = true,
                separator_style = { "", "" }
            },
            highlights = {
                duplicate = {
                    ctermbg = 0,
                    ctermfg = 8,
                },
                fill = {
                    ctermbg = 0,
                },
                background = {
                    ctermfg = 8,
                    ctermbg = 0,
                },
                numbers = {
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
                    ctermbg = 5,
                    ctermfg = 0,
                    bold = true,
                },
                numbers_selected = {
                    ctermbg = 5,
                    ctermfg = 0,
                    bold = true,
                },
                modified_selected = {
                    ctermbg = 5,
                    ctermfg = 0,
                    bold = true,
                },
                indicator_selected = {
                    ctermfg = 0,
                    ctermbg = 0,
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
                    ctermfg = 15,
                    ctermbg = 0,
                    bold = true,
                },
                numbers_visible = {
                    ctermfg = 15,
                    ctermbg = 0,
                    bold = true,
                },
                modified_visible = {
                    ctermfg = 15,
                    bold = true,
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
