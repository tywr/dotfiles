return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
        local colors = {
            white = 7,
            accent = 2,
            accent2 = 5,
            main = 3,
            main2 = 4,
            black = 0,
            grey = 8,
            black2 = 16,
            black3 = 17,
            background = 22,
        }

        local bubbles_theme = {
            normal = {
                a = { fg = colors.black, bg = colors.main2, gui = "bold" },
                b = { fg = colors.white, bg = colors.black3 },
                c = { bg = colors.background },
            },
            insert = { a = { fg = colors.black, bg = colors.accent, gui = "bold" } },
            visual = { a = { fg = colors.black, bg = colors.accent2, gui = "bold" } },
            replace = { a = { fg = colors.black, bg = colors.main2, gui = "bold" } },

            inactive = {
                a = { fg = colors.white, bg = colors.background },
                b = { fg = colors.white, bg = colors.background },
                c = { bg = colors.background },
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
