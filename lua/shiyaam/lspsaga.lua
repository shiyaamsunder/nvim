local action = require("lspsaga.codeaction")
local saga = require('lspsaga')

saga.init_lsp_saga({
border_style = "rounded",
})

local map = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end
map("n", "gd", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "gr", "<cmd>Lspsaga rename<CR>")
map("n", "gs", "<cmd>Lspsaga signature_help<CR>")
map("i", "<C-K>", "<cmd>Lspsaga signature_help<CR>")
map("n", "gp", "<cmd>Lspsaga preview_definition<CR>")
map("n", "ga", "<cmd>Lspsaga code_action<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")

-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
  action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
  action.smart_scroll_with_saga(-1)
end, { silent = true })
