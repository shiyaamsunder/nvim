local g = vim.g
-- local colorscheme = "ayu-mirage"

-- Gruvbox
g.gruvbox_material_better_performance = 1
g.gruvbox_material_foreground="hard"
g.gruvbox_material_background="hard"
g.gruvbox_material_disable_italic_comment=1
g.gruvbox_material_diagnostic_text_highlight=1
g.gruvbox_material_diagnostic_line_highlight=1
local colorscheme = "gruvbox-material"

-- g.ayuprefermirage=true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

