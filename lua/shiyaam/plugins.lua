local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
	max_jobs=1,
	display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300
  }
}

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --My plugins
  -- Lua Dev
  use "folke/lua-dev.nvim"                                        -- NVIM API lua completion
  use "nvim-lua/plenary.nvim"                                     -- Useful lua functions used by lots of plugins
  use "nvim-lua/popup.nvim"                                       -- Lua API for popup in vim

  -- LSP
  use "williamboman/nvim-lsp-installer"                          -- for installing lsp servers quickly
  use "neovim/nvim-lspconfig"                                    -- quickstart configs for lsp
  use "jose-elias-alvarez/null-ls.nvim"                          -- for formatters and linters
  use "RRethy/vim-illuminate"                                    -- For highlighting the other uses of current word

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'                                          -- Completion plugin
  use "hrsh7th/cmp-buffer"                                        -- buffer completions
  use "hrsh7th/cmp-path"                                          -- path completions
  use "hrsh7th/cmp-cmdline"                                       -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"                                  -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'

  use 'lewis6991/impatient.nvim'                                  -- Plugin to load neovim faster
  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',                                   -- Nvim Tree, File explorer
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }


  -- Fuzzy Finder
  use {                                                           -- Fuzzy Finder binary
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }
  use 'junegunn/fzf.vim'                                          -- Fzf vim plugin

  use { 'windwp/nvim-autopairs',                                  -- Auto closing for braces and quotes
  config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'nvim-lualine/lualine.nvim',                                  -- Bottom status bar
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "glepnir/lspsaga.nvim",                                       -- UI for autocompletion, diagnostics, docs
    branch = "main"
  }
  use {
    'nvim-treesitter/nvim-treesitter',                            -- Good 'ol treesitter for parsing programming languages
    run = ':TSUpdate'
  }
  use {
    "akinsho/toggleterm.nvim", tag = 'v2.*',
    config = function() require("toggleterm").setup() end
  }

  -- Comment plugin
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  --Snippet
  use 'L3MON4D3/LuaSnip'                                          -- Snippet engine
  use "rafamadriz/friendly-snippets"

  -- Colorschemes
  use 'sainnhe/gruvbox-material'                                  -- Colorscheme 
  use { "ellisonleao/gruvbox.nvim" }
  use 'B4mbus/oxocarbon-lua.nvim'
  use "Shatur/neovim-ayu"

  -- Misc
  use 'wakatime/vim-wakatime'                                     -- Code stats



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
