return {
    -- { "dylanaraps/wal.vim",          lazy = false, priority = 1000 },
    { "fcpg/vim-orbital",          lazy = false, priority = 1000 },
    { "psliwka/vim-smoothie",      lazy = false },
    -- { "tywr/minimalist-status-line", lazy = false },
    { "svermeulen/vim-subversive", lazy = false },
    { "godlygeek/tabular",         lazy = false },
    -- { "ap/vim-buftabline",           lazy = false },
    { "dahu/vim-fanfingtastic",    lazy = false },
    { "airblade/vim-gitgutter",    lazy = false },
    { "tpope/vim-sensible",        lazy = false },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    }
}
