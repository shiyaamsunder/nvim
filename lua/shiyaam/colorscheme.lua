local g = vim.g


-- Gruvbox
g.gruvbox_material_background = "medium"
g.gruvbox_material_foreground = "original"
g.gruvbox_material_better_performance = 1
g.gruvbox_material_diagnostic_text_highlight = 1
g.gruvbox_material_diagnostic_line_highlight = 0
g.gruvbox_material_diagnostic_virtual_text = 'colored'
g.gruvbox_material_visual = 'blue background'
g.gruvbox_material_menu_selection_background = 'orange'
g.gruvbox_material_transparent_background = 2
g.gruvbox_material_ui_contrast='high'

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
