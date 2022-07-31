local opt = vim.opt
local g = vim.g

vim.cmd([[let mapleader=" "]])
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.signcolumn = "yes:1"

opt.termguicolors = true
opt.background = 'dark'
g.gruvbox_material_better_performance = 1
vim.cmd([[ colorscheme gruvbox-material]])
-- vim.cmd([[ colorscheme oxocarbon]])
vim.cmd([[ command! MakeTags !ctags -R . ]])
