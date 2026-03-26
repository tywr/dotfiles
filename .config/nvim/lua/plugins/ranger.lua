return {
    {
        "kelly-lin/ranger.nvim",
        config = function()
            require("ranger-nvim").setup({
                replace_netrw = true,
                enable_cmds = true,
                ui = {
                    height = 0.75,
                    width = 0.75,
                    border = "single",
                }
            })
            vim.api.nvim_set_keymap("n", "<C-r>", "", {
                noremap = true,
                callback = function()
                    require("ranger-nvim").open(true)
                end,
            })
        end,
    },
}
