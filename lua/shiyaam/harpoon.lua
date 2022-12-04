
local status_ok, harpoon = pcall(require, "harpoon")
local utils = require("shiyaam.utils")
local nnoremap = utils.nnoremap

if not status_ok then
  return
end

harpoon.setup({})

nnoremap("<leader>q", "<cmd>lua require('harpoon.mark').add_file()<CR>")
nnoremap("<leader>qr", "<cmd>lua require('harpoon.mark').remove_file()<CR>")
nnoremap("<leader>qf","<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")

nnoremap("<leader>q1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
nnoremap("<leader>q2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
nnoremap("<leader>q3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")



