return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { highlight = { "IndentBlankline1", "IndentBlankline2" }, char = "┃" },
            scope = {
                show_start = false,
                show_end = false,
                char = "┃",
                highlight = "IndentBlanklineSelector",
            }
        },
    }
}
