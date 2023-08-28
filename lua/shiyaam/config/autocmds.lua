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
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
  end,
})


vim.api.nvim_create_autocmd({ "TermOpen" }, {
  callback = function()
    vim.cmd ":startinsert"
  end,
})



Current_Term_Buf = 0
function Get_Bufs()
  local bufs_loaded = {}
  for i, buf_handl in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf_handl) then
      bufs_loaded[i] = buf_handl
      print(buf_handl)
    end
  end

  return bufs_loaded
end

vim.api.nvim_create_user_command('Term', ':bot sp | term', {})
vim.api.nvim_create_user_command('Test', ':lua Get_Bufs()', {})
