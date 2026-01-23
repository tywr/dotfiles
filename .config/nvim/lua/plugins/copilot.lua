return {
    -- {
    --
    --     "github/copilot.vim",
    --     config = function()
    --         vim.g.copilot_no_tab_map = true
    --         vim.keymap.set("i", "<right>", 'copilot#Accept("<right>")',
    --             { noremap = true, expr = true, silent = true, replace_keycodes = false })
    --     end,
    -- },
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                panel = { enabled = false },
                suggestion = { auto_trigger = true, keymap = { accept = "<right>" } },
            })
        end,
    },
}
