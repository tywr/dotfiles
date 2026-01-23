-- Remove tmux shortcut
vim.keymap.set({ "n", "i", "v" }, "<C-B>", "<nop>")
vim.keymap.set({ "n", "i", "v" }, "<C-N>", "<nop>")

-- Panel switching shortcuts
vim.keymap.set('n', "<C-J>", "<C-W><C-J>")
vim.keymap.set('n', "<C-K>", "<C-W><C-K>")
vim.keymap.set('n', "<C-L>", "<C-W><C-L>")
vim.keymap.set('n', "<C-H>", "<C-W><C-H>")

-- General shortcuts
vim.keymap.set({ "n", "v" }, "Y", '"+y')
vim.keymap.set("n", "++", ":vsp<cr>", { silent = true })
vim.keymap.set("n", "M", "q")
vim.keymap.set("n", "à", "@a")
vim.keymap.set({ "n", "v" }, "q", "<nop>")
vim.keymap.set({ "n", "v" }, "Q", "<nop>")
vim.keymap.set("n", "mm", ":w<cr>", { silent = true })
vim.keymap.set("n", "qq", ":wq<cr>", { silent = true })
vim.keymap.set("n", "QQ", ":bd<cr>", { silent = true })
vim.keymap.set("n", "U", ":redo<cr>")
vim.keymap.set("n", "<leader>j", "mzJ`z")
vim.keymap.set("n", "<Right>", "$")
vim.keymap.set("n", "<Left>", "^")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>no", "<cmd>:noh<cr>")
vim.keymap.set("n", "<S-Tab>", ":bp<cr>", { silent = true })
vim.keymap.set("n", "<Tab>", ":bn<cr>", { silent = true })

vim.keymap.set("n", "gs", "<plug>(SubversiveSubstitute)")

-- Smoothie shortcuts
vim.keymap.set("n", "<Down>", ":call smoothie#downwards()<cr>", { silent = true })
vim.keymap.set("n", "<Up>", ":call smoothie#upwards()<cr>", { silent = true })

vim.keymap.set("n", "<leader>zz", function() require('zen-mode').toggle({}) end)
vim.keymap.set("n", "<leader>ss", "<cmd>LspZeroFormat<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>LspZeroFormat<cr>")
vim.keymap.set("n", "μ", "%")
vim.keymap.set("n", "ù", "%")


-- Obsidian paste image
vim.keymap.set("n", "<leader>pi", "<cmd>:ObsidianPasteImg<cr>")

-- Vim Doge
vim.keymap.set("n", "<leader>dg", "<cmd>:DogeGenerate numpy<cr>")
vim.keymap.set({ 'n', 'x' }, '<leader>dn', '<Plug>(doge-comment-jump-forward)')
vim.keymap.set({ 'n', 'x' }, '<leader>dp', '<Plug>(doge-comment-jump-backward)')


-- Claude Code
vim.keymap.set("n", "<leader>cc", "<cmd>:ClaudeCode<cr>")
vim.keymap.set("n", "<leader>co", "<cmd>:ClaudeCodeContinue<cr>")

-- Quick Path Copying
vim.keymap.set("n", "<leader>cp",
    function() vim.api.nvim_call_function("setreg", { "+", vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.") }) end,
    { desc = "Copy relative path" })

vim.keymap.set("n", "<leader>cm", function()
    local path = vim.fn.expand("%:p")
    local module_path = vim.fn.fnamemodify(path, ":r"):gsub("/", "."):gsub("\\", ".")
    vim.fn.setreg("+", module_path)
    print("Copied: " .. module_path)
end, { desc = "Copy relative path as python module" })

-- Custom stuff
vim.keymap.set("n", "<leader>sn", function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local word = vim.fn.expand('<cword>')
    local word_start = vim.fn.matchstrpos(vim.fn.getline('.'), '\\k*\\%' .. (col + 1) .. 'c\\k*')[2]

    -- Detect camelCase
    if word:find('[a-z][A-Z]') then
        -- Convert camelCase to snake_case
        local snake_case_word = word:gsub('([a-z])([A-Z])', '%1_%2'):lower()
        vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { snake_case_word })
        -- Detect snake_case
    elseif word:find('_[a-z]') then
        -- Convert snake_case to camelCase
        local camel_case_word = word:gsub('(_)([a-z])', function(_, l) return l:upper() end)
        vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { camel_case_word })
    else
        print("Not a snake_case or camelCase word")
    end
end, { desc = "Switch case" }
)
