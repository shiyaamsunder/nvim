local g = vim.g


-- Gruvbox
g.gruvbox_material_background = "hard"
g.gruvbox_material_foreground = "mix"
g.gruvbox_material_better_performance = 1
g.gruvbox_material_diagnostic_text_highlight = 0
g.gruvbox_material_diagnostic_line_highlight = 0
local colorscheme = "gruvbox-material"

vim.cmd([[
try
  colorscheme ]] .. colorscheme .. 
[[ 
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
  highlight FloatBorder guibg=NONE ctermbg=NONE
  highlight link NormalFloat Normal
  highlight NormalFloat ctermbg=NONE guibg=NONE
  highlight Pmenu ctermbg=NONE guibg=NONE
]])
