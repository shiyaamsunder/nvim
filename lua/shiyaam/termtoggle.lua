-- https://github.com/akinsho/toggleterm.nvim
require("toggleterm").setup({
  size = 15,
  open_mapping = [[tt]],
  direction = "horizontal",
  start_in_insert = true
})

--https://github.com/akinsho/toggleterm.nvim#terminal-window-mappings
-- function _G.set_terminal_keymaps()
--   local map = function(mode, lhs, rhs)
--     vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
--   end
--   map('t', '<esc>', [[<C-\><C-n>]])
--   map('t', '<C-h>', [[<C-\><C-n><C-W>h]])
--   map('t', '<C-j>', [[<C-\><C-n><C-W>j]])
--   map('t', '<C-k>', [[<C-\><C-n><C-W>k]])
--   map('t', '<C-l>', [[<C-\><C-n><C-W>l]])
-- end
--
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- Lazygit keymaps
-- https://github.com/akinsho/toggleterm.nvim#custom-terminal-usage
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
