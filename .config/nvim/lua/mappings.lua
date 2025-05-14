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
vim.keymap.set("n", "<S-Tab>", ":bp<cr>", { silent = true })
vim.keymap.set("n", "<Tab>", ":bn<cr>", { silent = true })
vim.keymap.set("n", "<leader>j", "mzJ`z")
vim.keymap.set("n", "<Right>", "$")
vim.keymap.set("n", "<Left>", "^")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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

vim.keymap.set("n", "<leader>no", "<cmd>:noh<cr>")

-- Vim Doge
vim.keymap.set("n", "<leader>dg", "<cmd>:DogeGenerate numpy<cr>")
vim.keymap.set({ 'n', 'x' }, '<leader>dn', '<Plug>(doge-comment-jump-forward)')
vim.keymap.set({ 'n', 'x' }, '<leader>dp', '<Plug>(doge-comment-jump-backward)')

-- Copilot
vim.api.nvim_set_keymap("i", "<Right>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatOpen<cr>")
