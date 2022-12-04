local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
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



local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  }
})


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'


  -- Gruvbox colorscheme
  use { 'sainnhe/gruvbox-material', commit = '2807579bd0a9981575dbb518aa65d3206f04ea02' }

  -- Lsp stuff
  use { 'williamboman/mason.nvim', commit = '604c2a3' }
  use { 'williamboman/mason-lspconfig.nvim', commit = '1534b610c5e8afaa2cc4231f0715354dc2d9688b' }
  use 'neovim/nvim-lspconfig'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'

  -- Snippets (I hate this but unfortunately tab completetion doesnt work as expected without this)

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Telescope stuff
  use 'nvim-lua/plenary.nvim'
  use {
    "nvim-telescope/telescope.nvim", tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }


  -- FZF
  use { -- Fuzzy Finder binary
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }
  use 'junegunn/fzf.vim'

  -- Harpoon
  use 'theprimeagen/harpoon'

  use 'andweeb/presence.nvim'

  use {
  'lewis6991/gitsigns.nvim',
}

  -- Debug Adapter Protocol stuff
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
