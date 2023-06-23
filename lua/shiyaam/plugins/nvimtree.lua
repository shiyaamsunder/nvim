return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  config = function()
    require('nvim-tree').setup(
      {
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
  end
}
