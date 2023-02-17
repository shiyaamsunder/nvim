local themes = {}
function themes.rose_pine()
    require('rose-pine').setup({
        disable_background = true,
        disable_float_background = true,
    })
    return "rose-pine"
end

function themes.gruvbox_baby()
	vim.g.gruvbox_baby_transparent_mode = 1
    return "gruvbox-baby"
end

function themes.gruvbox()
    require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
    })
    vim.o.background = "dark"
    return "gruvbox"

end


vim.cmd.colorscheme(themes.gruvbox())
