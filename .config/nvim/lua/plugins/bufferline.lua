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
                    ctermfg = vim.g.colors.background,
                    ctermbg = vim.g.colors.background,
                },
                numbers = {
                    ctermfg = 8,
                    ctermbg = vim.g.colors.background,
                },
                duplicate = {
                    ctermbg = vim.g.colors.background,
                    ctermfg = 8,
                },
                background = {
                    ctermfg = 8,
                    ctermbg = vim.g.colors.background,
                },
                modified = {
                    ctermfg = 0,
                    ctermbg = vim.g.colors.background,
                },
                separator = {
                    ctermfg = vim.g.colors.background,
                    ctermbg = vim.g.colors.background,
                },
                close_button = {
                    ctermbg = vim.g.colors.background,
                    ctermfg = vim.g.colors.background,
                },
                buffer_selected = {
                    ctermbg = vim.g.colors.selected,
                    ctermfg = vim.g.colors.background,
                },
                modified_selected = {
                    ctermbg = vim.g.colors.selected,
                    ctermfg = vim.g.colors.foreground,
                },
                indicator_selected = {
                    ctermfg = vim.g.colors.selected,
                    ctermbg = vim.g.colors.background,
                },
                separator_selected = {
                    ctermbg = vim.g.colors.background,
                    ctermfg = vim.g.colors.selected,
                },
                duplicate_selected = {
                    ctermbg = vim.g.colors.selected,
                    ctermfg = 0,
                },
                close_button_selected = {
                    ctermbg = vim.g.colors.background,
                    ctermfg = vim.g.colors.selected,
                },
                numbers_selected = {
                    ctermbg = vim.g.colors.selected,
                    ctermfg = vim.g.colors.background,
                },
                buffer_visible = {
                    ctermfg = 7,
                    ctermbg = vim.g.colors.background,
                },
                numbers_visible = {
                    ctermfg = 7,
                    ctermbg = vim.g.colors.background,
                },
                modified_visible = {
                    ctermfg = vim.g.colors.background,
                    ctermbg = vim.g.colors.background,
                },
                separator_visible = {
                    ctermfg = vim.g.colors.background,
                    ctermbg = vim.g.colors.background,
                },
                indicator_visible = {
                    ctermfg = vim.g.colors.background,
                    ctermbg = vim.g.colors.background,
                },
                close_button_visible = {
                    ctermfg = vim.g.colors.background,
                    ctermbg = vim.g.colors.background,
                }
            }
        })

        local keymap = vim.keymap
        keymap.set("n", "<leader>&", function() require("bufferline").go_to(1, true) end)
        keymap.set("n", "<leader>é", function() require("bufferline").go_to(vim.g.colors.foreground, true) end)
        keymap.set("n", '<leader>"', function() require("bufferline").go_to(3, true) end)
        keymap.set("n", "<leader>'", function() require("bufferline").go_to(4, true) end)
        keymap.set("n", "<leader>(", function() require("bufferline").go_to(5, true) end)
        keymap.set("n", "<leader>-", function() require("bufferline").go_to(6, true) end)
        keymap.set("n", "<leader>è", function() require("bufferline").go_to(7, true) end)
        keymap.set("n", "<leader>_", function() require("bufferline").go_to(8, true) end)
        keymap.set("n", "<leader>ç", function() require("bufferline").go_to(9, true) end)
    end
}
