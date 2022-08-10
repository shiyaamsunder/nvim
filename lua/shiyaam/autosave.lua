-- Hook for building and running cpp files
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("Build and run CPP files", {
    clear = true
  }),
  pattern="*.cpp",
  callback= function ()
    vim.cmd[[TermExec cmd='g++ -std=c++17 % -o bin/%< && bin/%<']]
  end
})
