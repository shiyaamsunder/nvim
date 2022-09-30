local status_ok, telescope = pcall(require, 'telescope')


if not status_ok then
  return
end

local utils = require("shiyaam.utils")

telescope.setup({
  defaults = {
    path_display = { "tail" }
  },

  pickers = {
    find_files = {
      theme = "dropdown"
    }
  },
})

utils.nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")
utils.nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>")
utils.nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>")
utils.nnoremap("<leader>fc", "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>")
utils.nnoremap("<leader>m", "<cmd>Telescope marks<CR>")
