local theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}
return {
  'nanozuki/tabby.nvim',
  -- 'romgrk/barbar.nvim',
  -- dependencies = {
  --   'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
  --   'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  -- },
  init = function()
    require('tabby.tabline')
  end
  -- opts = {
  --   animation = true,
  --   hide = { extensions = true }
  -- },
  -- version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
