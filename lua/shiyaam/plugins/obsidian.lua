return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  event = { "BufReadPre /mnt/d/Docs/obsidian/sem2/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    dir = "/mnt/d/Docs/obsidian/sem2", -- no need to call 'vim.fn.expand' here
  },
}
