return {
    "akinsho/bufferline.nvim",
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup({
            options = {
                style_present = bufferline.style_preset.default,
                indicator = {
                    icon = "",
                    style = "icon"
                },
                numbers = "ordinal",
                show_buffer_icons = false,
                modified_icon = '',
                left_trunc_marker = ' ',
                right_trunc_marker = ' ',
                buffer_close_icon = '',
                show_tab_indicators = false,
                show_close_icon = false,
                auto_toggle_bufferline = true,
                separator_style = { '', '' },
                move_wraps_at_end = true,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                    }
                },
            },
            highlights = {
                fill = {
                    ctermfg = 22,
                    ctermbg = 22,
                },
                numbers = {
                    ctermfg = 8,
                    ctermbg = 22,
                },
                duplicate = {
                    ctermbg = 22,
                    ctermfg = 8,
                },
                background = {
                    ctermfg = 8,
                    ctermbg = 22,
                },
                modified = {
                    ctermfg = 0,
                    ctermbg = 22,
                },
                separator = {
                    ctermfg = 22,
                    ctermbg = 22,
                },
                close_button = {
                    ctermbg = 22,
                    ctermfg = 22,
                },
                buffer_selected = {
                    ctermbg = 2,
                    ctermfg = 22,
                },
                modified_selected = {
                    ctermbg = 22,
                    ctermfg = 2,
                },
                indicator_selected = {
                    ctermfg = 2,
                    ctermbg = 22,
                },
                separator_selected = {
                    ctermbg = 22,
                    ctermfg = 2,
                },
                duplicate_selected = {
                    ctermbg = 2,
                    ctermfg = 0,
                },
                close_button_selected = {
                    ctermbg = 22,
                    ctermfg = 2,
                },
                numbers_selected = {
                    ctermbg = 2,
                    ctermfg = 22,
                },
                buffer_visible = {
                    ctermfg = 7,
                    ctermbg = 22,
                },
                numbers_visible = {
                    ctermfg = 7,
                    ctermbg = 22,
                },
                modified_visible = {
                    ctermfg = 22,
                    ctermbg = 22,
                },
                separator_visible = {
                    ctermfg = 22,
                    ctermbg = 22,
                },
                indicator_visible = {
                    ctermfg = 0,
                    ctermbg = 0,
                },
                close_button_visible = {
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
