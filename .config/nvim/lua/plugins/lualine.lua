return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
        local bubbles_theme = {
            normal = {
                a = { fg = vim.g.colors.background, bg = vim.g.colors.selected, gui = "bold" },
                b = { fg = vim.g.colors.foreground, bg = vim.g.colors.background },
                c = { bg = vim.g.colors.background },
            },
            insert = { a = { fg = vim.g.colors.background, bg = vim.g.colors.primary, gui = "bold" } },
            visual = { a = { fg = vim.g.colors.background, bg = vim.g.colors.primary, gui = "bold" } },
            replace = { a = { fg = vim.g.colors.background, bg = vim.g.colors.error, gui = "bold" } },

            inactive = {
                a = { fg = vim.g.colors.selected, bg = vim.g.colors.background },
                b = { fg = vim.g.colors.selected, bg = vim.g.colors.background },
                c = { bg = vim.g.colors.background },
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
