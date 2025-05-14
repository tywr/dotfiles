local lsp_zero = require('lsp-zero')

lsp_zero.preset({
    name = "minimal",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false
})

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })

    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr }) -- see available code actions, in visual mode will apply to selection
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { buffer = bufnr })
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>rs', ":LspRestart<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
end)


local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    }),
    window = {
        completion = {
            winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat,CursorLine:PmenuSel,Search:None"
        },
        documentation = {
            winhighlight = "Normal:NormalFloat"
        }
    }
})

cmp.config.sources({
    { name = "nvim-lsp" },
    { name = "buffer" },
    { name = "path" },
})

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})


local on_attach = function(client, bufnr)
    if client.name == 'ruff' then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
    end
end

require('lspconfig').ruff.setup {
    interpreter = "~/.python/nvim/bin/python",
    on_attach = on_attach,
}

require('lspconfig').pyright.setup {
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
            reportMissingModuleSource = "none",
            reportMissingImports = "none",
            reportUndefinedVariable = "none",
        },
        python = {
            pythonPath = "~/.python/nvim/bin/python",
            analysis = {
                diagnosticSeverityOverrides = {
                    reportUnusedVariable = "warning",
                },
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    },
}

require('lspconfig').texlab.setup {}
require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                    'require',
                }
            }
        }
    }
}
