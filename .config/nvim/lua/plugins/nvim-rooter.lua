return {
    "notjedi/nvim-rooter.lua",
    lazy = false,
    config = function()
        require("nvim-rooter").setup({
            rooter_patterns = { ".git", ".hg" },
            manual = false,
            fallback_to_parent = false,
        })
    end
}
