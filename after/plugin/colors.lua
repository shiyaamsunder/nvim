require('rose-pine').setup({
    -- disable_background = true
    disable_float_background = true,
})

function Color(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Cursor", {fg = "black"})
end

Color()
