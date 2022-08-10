local map = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Normal
map("n", "<C-p>", ":Files<CR>")
map("n", "<C-h>", ":Helptags<CR>")
map("n", "<Leader>ck", ":tabe ~/.config/nvim/lua/shiyaam/keymaps.lua<CR>")
map("n", "<Leader>tt", ":tabclose<CR>")

map("n", "<Leader>b", ":TermExec cmd='g++ -std=c++17 % -o bin/%< && bin/%<'<CR>")
-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Move to the next/previous buffer
map('n', '<leader>[', ':bp<CR>')
map('n', '<leader>]', ':bn<CR>')

-- Move to last buffer
map('n', "''", ':b#<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-\\>', ':vsplit<CR>')
map('n', '<A-\\>', ':split<CR>')
