return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
        local colors = {
            white = 7,
            accent = 1,
            main = 2,
            black = 0,
            alt = 8,
            background = 16,
        }

        local bubbles_theme = {
            normal = {
                a = { fg = vim.g.colors.bg, bg = vim.g.colors.subtle, gui = "bold" },
                b = { fg = vim.g.colors.fg, bg = vim.g.colors.bg },
                c = { bg = vim.g.colors.bg },
            },
            insert = { a = { fg = colors.black, bg = colors.main, gui = "bold" } },
            visual = { a = { fg = colors.black, bg = colors.main, gui = "bold" } },
            replace = { a = { fg = colors.black, bg = colors.accent, gui = "bold" } },

            inactive = {
                a = { fg = vim.g.colors.fg, bg = vim.g.colors.bg },
                b = { fg = vim.g.colors.fg, bg = vim.g.colors.bg },
                c = { bg = vim.g.colors.bg },
            },
        }

        require('lualine').setup {
            options = {
                icons_enabled = false,
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
                theme = bubbles_theme,
                component_separators = '',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { { 'mode', separator = { right = '', left = '' }, right_padding = 2 } },
                lualine_b = { 'filename' },
                lualine_c = {
                    '%=', --[[ add your center components here in place of this comment ]]
                },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '', left = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            extensions = {},
        }
    end,
}
