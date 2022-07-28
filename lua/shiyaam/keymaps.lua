local map = function(mode, lhs, rhs)
          vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap = true, silent = true})
end


-- Normal
map("n", "<C-p>", ":Files<CR>")
map("n", "<Leader>ck", ":tabe ~/.config/nvim/lua/shiyaam/keymaps.lua<CR>")
map("n", "<Leader>tt" ,":tabclose<CR>")

-- Insert


-- Terminal
-- TODO: Add terminal commands

