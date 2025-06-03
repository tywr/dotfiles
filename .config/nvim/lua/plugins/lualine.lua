return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
        -- stylua: ignore
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
        }

        local bubbles_theme = {
            normal = {
                a = { fg = colors.black, bg = colors.main2 },
                b = { fg = colors.white, bg = colors.grey },
                c = { fg = colors.white },
            },

            insert = { a = { fg = colors.black, bg = colors.accent } },
            visual = { a = { fg = colors.black, bg = colors.accent2 } },
            replace = { a = { fg = colors.black, bg = colors.main2 } },

            inactive = {
                a = { fg = colors.white, bg = colors.black },
                b = { fg = colors.white, bg = colors.black },
                c = { fg = colors.white },
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
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'filename', 'branch' },
                lualine_c = {
                    '%=', --[[ add your center components here in place of this comment ]]
                },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
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
            tabline = {},
            extensions = {},
        }
    end,
    -- config = function()
    --     local theme = require 'lualine.themes.16color'
    --
    --     theme.normal.a.bg = 3
    --     theme.normal.a.fg = 0
    --     theme.visual.a.bg = 2
    --     theme.visual.a.fg = 0
    --     theme.insert.a.bg = 2
    --     theme.insert.a.fg = 0
    --     theme.normal.b.bg = 0
    --     theme.normal.b.fg = 15
    --     theme.normal.c.bg = 0
    --     theme.normal.c.fg = 15
    --
    --     require("lualine").setup({
    --         options = {
    --             icons_enabled = false,
    --             theme = theme,
    --             component_separators = { left = '', right = '' },
    --             section_separators = { left = '', right = '' },
    --             tabline = {},
    --             winbar = {},
    --             inactive_winbar = {},
    --             extensions = {},
    --             sections = {
    --                 lualine_a = { 'mode' },
    --                 lualine_b = { 'branch' },
    --                 lualine_c = { 'filename' },
    --                 lualine_x = { 'encoding', 'fileformat', 'filetype' },
    --                 lualine_y = { 'progress' },
    --                 lualine_z = { 'location' }
    --             },
    --             inactive_sections = {
    --                 lualine_a = {},
    --                 lualine_b = {},
    --                 lualine_c = { 'filename' },
    --                 lualine_x = { 'location' },
    --                 lualine_y = {},
    --                 lualine_z = {}
    --             },
    --         }
    --     })
    -- end
}
