
local options = {
  background="dark",
  --clipboard="unnamedplus",      -- allows neovim to access the system clipboard
  cmdheight=1,                  -- more space in neovim command line
  conceallevel=0,               -- so that `` is visbile in markdown files
  cursorline = true,            -- highlights the current line the cursor is on
  hlsearch=true,                -- highlight all matches on previous search
  ignorecase=true,              -- ignore case in search patterns
  relativenumber=true,
  showtabline=2,                -- always show the tabs
  signcolumn="yes:1",
  termguicolors = true,
  swapfile=false,               -- stops creating swapfile
  undofile=true,                -- persistent undo
  updatetime=100,               -- faster completion
  wrap=false,                   -- disables wrap
  sidescrolloff=8,
  title=true,
  fileencoding = "utf-8",       -- the encoding written to a file
  completeopt = { "menuone", "noselect" },

  -- Tabs and Spaces
  expandtab=true,               -- convert spaces to tabs
  shiftwidth=2,                 -- no of spaces to be inserted for indentation
  tabstop=2,                    -- 2 spaces for a tab
  smartindent=true,             -- Do smart autoindenting when starting a new line.

  --Splits
  splitbelow=true,
  splitright=true
}

vim.g.gruvbox_material_better_performance = 1
vim.cmd([[ colorscheme gruvbox-material]])
vim.cmd "set whichwrap+=<,>,h,l,[,]"
for k, v in pairs(options) do
  vim.opt[k] = v
end
