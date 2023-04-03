--LSP ZERO config
return {
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
  config = function()
    local lsp = require('lsp-zero').preset({
      name = 'recommended',
      set_lsp_keymaps = true,
      manage_nvim_cmp = {
        set_extra_mappings = true,
      },
      suggest_lsp_servers = false,
    })


    -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    lsp.ensure_installed({
      'tsserver',
      'tailwindcss',
      'clangd',
      'lua_ls',
      'rust_analyzer',
      'pyright',
      'jdtls',
    })

    lsp.nvim_workspace()

    lsp.configure('lua_ls', {
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } }
        }
      }
    })


    -- Auto format on save
    lsp.configure('tsserver', {
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "lua vim.lsp.buf.format()"
        })
      end,
    })


    -- Key bindings using lsp zero
    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set('n', '<leader>=', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
    end)


    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
    })
  end
}
