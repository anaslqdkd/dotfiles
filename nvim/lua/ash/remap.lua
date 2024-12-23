vim.g.mapleader = ","
vim.keymap.set("n", "<leader>²", vim.cmd.Oil)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "C-d", "C-d>zz")
vim.keymap.set("n", "C-u", "C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-J>", "<C-W>j", opts)
vim.keymap.set("n", "<C-K>", "<C-W>k", opts)
vim.keymap.set("n", "<C-L>", "<C-W>l", opts)
vim.keymap.set("n", "<C-H>", "<C-W>h", opts)
-- Key mapping for manual formatting
vim.api.nvim_set_keymap("n", "<leader>f", '<cmd>lua require("conform").format()<CR>', { noremap = true, silent = true })
