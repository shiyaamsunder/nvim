local action = require("lspsaga.action")

local map = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "<Leader>r", "<cmd>Lspsaga rename<CR>")
map("n", "gs", "<cmd>Lspsaga signature_help<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")


-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
  action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
  action.smart_scroll_with_saga(-1)
end, { silent = true })
