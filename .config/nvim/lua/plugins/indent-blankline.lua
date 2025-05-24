return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { highlight = "NonText", char = "│" },
            scope = {
                show_start = false,
                show_end = false,
                char = "┃",
                highlight = "NvimIdentifierKey",
            }
        },
    }
}
