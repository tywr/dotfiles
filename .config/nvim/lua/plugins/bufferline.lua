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
                    ctermfg = vim.g.colors.bg,
                    ctermbg = vim.g.colors.bg,
                },
                numbers = {
                    ctermfg = 8,
                    ctermbg = vim.g.colors.bg,
                },
                duplicate = {
                    ctermbg = vim.g.colors.bg,
                    ctermfg = 8,
                },
                background = {
                    ctermfg = 8,
                    ctermbg = vim.g.colors.bg,
                },
                modified = {
                    ctermfg = 0,
                    ctermbg = vim.g.colors.bg,
                },
                separator = {
                    ctermfg = vim.g.colors.bg,
                    ctermbg = vim.g.colors.bg,
                },
                close_button = {
                    ctermbg = vim.g.colors.bg,
                    ctermfg = vim.g.colors.bg,
                },
                buffer_selected = {
                    ctermbg = vim.g.colors.fg,
                    ctermfg = vim.g.colors.bg,
                },
                modified_selected = {
                    ctermbg = vim.g.colors.bg,
                    ctermfg = vim.g.colors.fg,
                },
                indicator_selected = {
                    ctermfg = vim.g.colors.fg,
                    ctermbg = vim.g.colors.bg,
                },
                separator_selected = {
                    ctermbg = vim.g.colors.bg,
                    ctermfg = vim.g.colors.fg,
                },
                duplicate_selected = {
                    ctermbg = vim.g.colors.fg,
                    ctermfg = 0,
                },
                close_button_selected = {
                    ctermbg = vim.g.colors.bg,
                    ctermfg = vim.g.colors.fg,
                },
                numbers_selected = {
                    ctermbg = vim.g.colors.fg,
                    ctermfg = vim.g.colors.bg,
                },
                buffer_visible = {
                    ctermfg = 7,
                    ctermbg = vim.g.colors.bg,
                },
                numbers_visible = {
                    ctermfg = 7,
                    ctermbg = vim.g.colors.bg,
                },
                modified_visible = {
                    ctermfg = vim.g.colors.bg,
                    ctermbg = vim.g.colors.bg,
                },
                separator_visible = {
                    ctermfg = vim.g.colors.bg,
                    ctermbg = vim.g.colors.bg,
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
        keymap.set("n", "<leader>é", function() require("bufferline").go_to(vim.g.colors.fg, true) end)
        keymap.set("n", '<leader>"', function() require("bufferline").go_to(3, true) end)
        keymap.set("n", "<leader>'", function() require("bufferline").go_to(4, true) end)
        keymap.set("n", "<leader>(", function() require("bufferline").go_to(5, true) end)
        keymap.set("n", "<leader>-", function() require("bufferline").go_to(6, true) end)
        keymap.set("n", "<leader>è", function() require("bufferline").go_to(7, true) end)
        keymap.set("n", "<leader>_", function() require("bufferline").go_to(8, true) end)
        keymap.set("n", "<leader>ç", function() require("bufferline").go_to(9, true) end)
    end
}
