local map = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Remap space as leader key

map("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugin for showing a popup that contains the keybinds
map("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>")

-- Normal
map("n", "<C-p>", ":Files<CR>")
map("n", "<C-h>", ":Helptags<CR>")
map("n", "<Leader>ck", ":tabe ~/.config/nvim/lua/shiyaam/keymaps.lua<CR>")
map("n", "<Leader>tt", ":tabclose<CR>")
map("n", "<Leader>e", ":NvimTreeToggle<CR>") -- Opens File Explorer

-- keymap for compiling c++ code. Needs some working
map("n", "<Leader>b", ":TermExec cmd='g++ -std=c++17 % -o bin/%< && bin/%<'<CR>")

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Keep the curosor centered while scrolling
map("n", "j", "jzz")
map("n", "k", "kzz")

-- Move to the next/previous buffer
map('n', '<leader>[', ':bp<CR>')
map('n', '<leader>]', ':bn<CR>')

-- Move to last buffer
map('n', "''", ':b#<CR>')

--Windows
-- Copying the vscode behaviour of making window splits
map('n', '<C-\\>', ':vsplit<CR>')
map('n', '<A-\\>', ':split<CR>')

-- Better Window navigation
map("n", "<m-h>", "<C-w>h") -- Move to the left window
map("n", "<m-j>", "<C-w>j") -- Move to bottom window
map("n", "<m-k>", "<C-w>k") -- Move to top window
map("n", "<m-l>", "<C-w>l") -- Move to right window

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Tabs --
map("n", "<m-t>", ":tabnew %<cr>") -- Open current file in new tab
map("n", "<m-y>", ":tabclose<cr>") -- Close current tab
map("n", "<m-\\>", ":tabonly<cr>") -- Closes all tabs except the current one
map("n", "<Tab>", "gt") -- Move to Next tab
map("n", "<S-Tab>", "gT") -- Move to previous tab

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<Leader>l", ":set hlsearch!<CR>")
