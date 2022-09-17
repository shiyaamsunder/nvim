local g = vim.g
-- Catppuccin theme (Damn this looks nice!!)
g.catppuccin_flavour = "macchiato"
require("catppuccin").setup({
  styles = { comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = { "italic" },
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {} }
})


vim.cmd [[colorscheme catppuccin]]


-- Gruvbox
-- g.gruvbox_material_background = "hard"
-- g.gruvbox_material_foreground = "mix"
-- g.gruvbox_material_better_performance = 1
-- g.gruvbox_material_diagnostic_text_highlight = 0
-- g.gruvbox_material_diagnostic_line_highlight = 0
-- local colorscheme = "gruvbox-material"

-- resetting highlight colors for good looking float windows
--   vim.cmd([[
--     try
--         colorscheme ]] .. colorscheme .. [[
--     catch /^Vim\%((\a\+)\)\=:E185/
--         colorscheme default
--         set background=dark
--     endtry
--         highlight FloatBorder guibg=NONE ctermbg=NONE
--         highlight link NormalFloat Normal
--         highlight NormalFloat ctermbg=NONE guibg=NONE
--         highlight Pmenu ctermbg=NONE guibg=NONE
-- ]] )

-- Ayu Mirage
-- local colorscheme = "ayu-mirage"
-- g.ayuprefermirage=true
