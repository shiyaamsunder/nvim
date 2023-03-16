local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  -- Themes
  {
    "Mofiqul/vscode.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme vscode]])
    end,
  },


  -- Telescope and config
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fs', function()
        builtin.grep_string({search = vim.fn.input("Grep > ")})
      end)
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  },


  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build =  ':TSUpdate',
    config = function ()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "rust", "javascript", "typescript", "help" },
        ignore_install = {"bash"},
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },

  -- Fugitive
  {
    'tpope/vim-fugitive',
    config = function ()
      vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
    end
  },


  -- Discord Rich Presence
  {'andweeb/presence.nvim'},


  --LSP ZERO config
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function ()
      local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = false,
      })

      lsp.ensure_installed({
        'tsserver',
        'clangd',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'pyright',
        'jdtls',
      })

      lsp.nvim_workspace()

      lsp.configure('lua_ls', {
        settings = {
          Lua = {
            diagnostics = { globals = {'vim'}}
          }
        }
      })

      lsp.configure('eslint', {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      lsp.setup()
    end
  },

  -- Lualine

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require('lualine').setup({
        options = {
          theme = "vscode",
        }
      })
    end
  },


  -- Misc
  -- Rust Tools
  {'simrat39/rust-tools.nvim'},

  {'mfussenegger/nvim-jdtls'}
}

local opts  = {}

require("lazy").setup(plugins, opts)
