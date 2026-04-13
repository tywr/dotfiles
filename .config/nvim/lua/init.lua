-- Install lazy, and use it as plugin manager
vim.pack.add { "https://github.com/folke/lazy.nvim.git" }
require("lazy").setup("plugins")

-- Make sure to start treesitter
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end
})
