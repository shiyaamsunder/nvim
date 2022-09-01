local g = vim.g

-- Gruvbox
g.gruvbox_material_foreground="hard"
g.gruvbox_material_better_performance = 1
g.gruvbox_material_background="hard"
g.gruvbox_material_disable_italic_comment=1
g.gruvbox_material_diagnostic_text_highlight=1
g.gruvbox_material_diagnostic_line_highlight=1
local colorscheme = "gruvbox-material"



-- Ayu Mirage
-- local colorscheme = "ayu-mirage"
-- g.ayuprefermirage=true


-- resetting highlight colors for good looking float windows
vim.cmd ([[
    try
        colorscheme ]]..colorscheme .. [[ 
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
    endtry
        highlight FloatBorder guibg=NONE ctermbg=NONE
        highlight link NormalFloat Normal
        highlight NormalFloat ctermbg=NONE guibg=NONE
        highlight Pmenu ctermbg=NONE guibg=NONE
]])

