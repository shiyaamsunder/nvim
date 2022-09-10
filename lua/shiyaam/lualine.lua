local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
lualine.setup({
  options = {
    section_separators = {left = '', right=''},
    component_separators= {left = '', right=''},
  },
	tabline = {
		lualine_a = {
			{
				"tabs",
				max_length = vim.o.columns,
				mode = 1,
				tabs_color = {},
		},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
  extensions = {"nvim-tree"}
})

