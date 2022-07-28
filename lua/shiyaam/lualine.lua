require('lualine').setup{
    options = {
        theme='gruvbox-material'
    },
    tabline = {
        lualine_a = {
            {
                'tabs',
                max_length = vim.o.columns, 
                mode=1, 
                tabs_color = {

                }
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }

}

