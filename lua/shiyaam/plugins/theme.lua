local function loadTheme(themeUrl, themeName, themeConfig)
  local tbl = {
    themeUrl,
    lazy = false,
    priority = 1000,
    config = function()
      themeConfig()
      vim.cmd([[colorscheme ]] .. themeName)
    end
  }
  return tbl
end


local config = function()
  require('material').setup({ disable = { background = true } })
end

vim.g.material_style = "deep ocean"

return {
  --   {
  --   "Mofiqul/vscode.nvim",
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme vscode]])
  --   end,
  -- }
  -- loadTheme("christianchiarulli/nvcode-color-schemes.vim", "gruvbox")
  loadTheme("marko-cerovac/material.nvim", "material", config)


}
