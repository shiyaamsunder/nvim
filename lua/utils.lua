local Utils = {}

function Utils.nnoremap(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
end

function Utils.inoremap(lhs, rhs)
  vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true, silent = true })
end

function Utils.vnoremap(lhs, rhs)
  vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true, silent = true })
end

function Utils.xnoremap(lhs, rhs)
  vim.api.nvim_set_keymap("x", lhs, rhs, { noremap = true, silent = true })
end

function Utils.map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, {})
end

function Utils.nmap(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, {})
end

function Utils.imap(lhs, rhs)
  vim.api.nvim_set_keymap("i", lhs, rhs, {})
end

function Utils.vmap(lhs, rhs)
  vim.api.nvim_set_keymap("v", lhs, rhs, {})
end

return Utils
