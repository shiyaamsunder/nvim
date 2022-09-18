-- ======================================= Setting options ================================================
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

}


for k, v in pairs(options) do
  vim.opt[k] = v
end

-- ==========================================  Autocommands ============================================

-- Disable autocommenting when entering a new line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})


-- Highlight yankedtext
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Close by hitting either q  or esc when inside of these buffers
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "lspsagafinder",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "Markdown",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      nnoremap <silent> <buffer> <esc> :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- ==========================  Enabling plugins and setting colorscheme =============================
require("plugins")
require("colorscheme")
require("keymaps")
