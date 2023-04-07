--LSP ZERO config
-- TODO tidy up the config
return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
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
        set_sources = "recommended",
        set_basic_mappings = true,
        set_extra_mappings = true,
        use_luasnip = true,
        set_format = true,
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
      'html',
    })


    lsp.nvim_workspace()

    lsp.configure('lua_ls', {
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } }
        }
      }
    })


    lsp.format_on_save({
      servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['tsserver'] = { 'typescriptreact', 'javascriptreact', 'javascript', 'css' },
        ['html'] = { 'html' },
      }
    })

    lsp.on_attach(function(_, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
    end)

    lsp.skip_server_setup({ 'rust_analyzer' })
    lsp.setup()

    local rust_tools = require('rust-tools')

    rust_tools.setup({
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end
      }
    })
    require('lsp-zero').extend_cmp()

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },

      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
        })
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      }
    })
    vim.diagnostic.config({
      virtual_text = true,
    })
  end
}
