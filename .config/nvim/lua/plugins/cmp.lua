return {
    {
        "saghen/blink.cmp",
        build = "cargo build --release",
        opts = {
            keymap = {
                ['<C-e>'] = false,
                ['<Tab>'] = { 'accept', 'fallback' },
                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<cr>'] = { 'accept', 'fallback' },
            },
        },
    }
    -- { 'hrsh7th/nvim-cmp' },
    -- { 'L3MON4D3/LuaSnip' },
    -- { "hrsh7th/cmp-buffer" }, -- source for text in buffer
    -- { "hrsh7th/cmp-path" },   -- source for file system paths
}
