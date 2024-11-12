return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                char = {
                    enabled = false
                }
            }
        },
        config = function()
            vim.api.nvim_command("hi clear FlashLabel")
            vim.api.nvim_command("hi FlashLabel cterm=bold ctermbg=5 ctermfg=0")
        end,
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
            { "S", mode = { "n", "o" },      function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
    },
}
