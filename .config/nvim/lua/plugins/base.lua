return {
    { "psliwka/vim-smoothie",      lazy = false },
    { "svermeulen/vim-subversive", lazy = false },
    { "godlygeek/tabular",         lazy = false },
    { "dahu/vim-fanfingtastic",    lazy = false },
    { "airblade/vim-gitgutter",    lazy = false },
    { "tpope/vim-sensible",        lazy = false },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    {
        "chriskempson/base16-vim",
    }
}
