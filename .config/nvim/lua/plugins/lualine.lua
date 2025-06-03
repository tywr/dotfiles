return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
        local theme = require 'lualine.themes.16color'

        theme.normal.a.bg = 3
        theme.normal.a.fg = 0
        theme.visual.a.bg = 2
        theme.visual.a.fg = 0
        theme.insert.a.bg = 2
        theme.insert.a.fg = 0
        theme.normal.b.bg = 0
        theme.normal.b.fg = 15
        theme.normal.c.bg = 0
        theme.normal.c.fg = 15

        require("lualine").setup({
            options = {
                icons_enabled = false,
                theme = theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
            }
        })
    end
}
