return {
  -- Fugitive
  {
    'tpope/vim-fugitive',
    lazy = true,
    keys = "<leader>gg",
    config = function()
      vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
    end
  },

  -- Rust Tools
  {
    'simrat39/rust-tools.nvim',
  },

  -- Misc
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    ft = "typescriptreact",
    config = function()
      require('nvim-treesitter.configs').setup({
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        }
      }
      )
    end
  },

  {
    'numToStr/Comment.nvim',
    event = "InsertEnter",
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  },

  {
    'mfussenegger/nvim-jdtls',
    lazy = true,
    ft = "java",
  },

  -- Harpoon
  {
    'ThePrimeagen/harpoon',
    lazy = true,
    keys = { "<leader>hf", "<leader>ha", "<leader>hn", "<leader>hp" },
    config = function()
      require("harpoon").setup()
      vim.keymap.set('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', {})
      vim.keymap.set('n', '<leader>hf', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {})

      -- nav btw files
      vim.keymap.set('n', '<leader>hn', ':lua require("harpoon.ui").nav_next()<CR>', {})
      vim.keymap.set('n', '<leader>hp', ':lua require("harpoon.ui").nav_prev()<CR>', {})
    end
  },

  -- Icon for autocompeletion
  { "onsails/lspkind.nvim" },

  -- Mini nvim
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require("mini.basics").setup()
      require("mini.surround").setup()
      require("mini.indentscope").setup()
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end
  },
}
