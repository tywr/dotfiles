vim.opt.signcolumn = 'yes'
vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin:' .. vim.env.PATH

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.lsp.config('ruff', {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.git' },
    on_attach = function(client)
        client.server_capabilities.hoverProvider = false
    end,
    init_options = {
        settings = { logLevel = 'error' }
    },
})

vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', '.git' },
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            pythonPath = vim.fn.expand('~/.python/nvim/bin/python'),
            analysis = {
                diagnosticSeverityOverrides = {
                    reportUnusedVariable = 'warning',
                },
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                typeCheckingMode = 'basic',
                useLibraryCodeForTypes = true,
                ignore = { '*' },
            },
        },
    },
})

vim.lsp.config('clangd', {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
})

vim.lsp.config('texlab', {
    cmd = { 'texlab' },
    filetypes = { 'tex', 'bib' },
    root_markers = { '.git', 'latexmkrc', '.latexmkrc' },
})

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.git' },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'require' },
            },
        },
    },
})

vim.lsp.enable({ 'clangd', 'ruff', 'pyright', 'texlab', 'lua_ls' })
vim.api.nvim_exec_autocmds('FileType', { buffer = 0 })

