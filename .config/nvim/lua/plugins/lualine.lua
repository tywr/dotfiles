return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
        local theme = require 'lualine.themes.16color'

        theme.normal.a.bg = 1
        theme.normal.b.bg = 15
        theme.normal.c.bg = 15
        theme.normal.b.fg = 7

        require("lualine").setup({
            options = {
                icons_enabled = false,
                theme = theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'diff' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
            }
        })
    end
}
