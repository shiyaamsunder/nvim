local options = {
  background = "dark",
  termguicolors = true,
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in neovim command line
  conceallevel = 0, -- so that `` is visbile in markdown files
  cursorline = true, -- highlights the current line the cursor is on
  hlsearch = true, -- highlight all matches on previous search
  ignorecase = true, -- ignore case in search patterns
  relativenumber = true,
  number = true,
  showtabline = 2, -- always show the tabs
  signcolumn = "yes:1",
  swapfile = false, -- stops creating swapfile
  undofile = true, -- persistent undo
  updatetime = 100, -- faster completion
  wrap = false, -- disables wrap
  sidescrolloff = 4,
  title = true,
  fileencoding = "utf-8", -- the encoding written to a file
  completeopt = { "menuone", "noselect" },

  -- Tabs and Spaces
  expandtab = true, -- convert spaces to tabs
  shiftwidth = 2, -- no of spaces to be inserted for indentation
  tabstop = 2, -- 2 spaces for a tab
  smartindent = true, -- Do smart autoindenting when starting a new line.

  --Splits
  splitbelow = true,
  splitright = true,

  --List chars
  list = true,
  -- guifont = "CaskaydiaCove_NF:h12"
}

vim.opt.listchars:append "space:."
vim.cmd "set whichwrap+=<,>,h,l,[,]"
vim.cmd [[set t_Co=256]]

for k, v in pairs(options) do
  vim.opt[k] = v
end
