vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")


-- Fix * (Keep the cursor position, don't move to next match)
vim.keymap.set("n", "*", '*N')

-- Fix n and N. Keeping cursor in center
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Keep the curosor centered while scrolling
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-s>", "<C-d>zz")

-- Move to the next/previous buffer
vim.keymap.set("n", '<leader>[', ':bp<CR>')
vim.keymap.set("n", '<leader>]', ':bn<CR>')

-- Move to last buffer
vim.keymap.set("n", "''", ':b#<CR>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, {})
