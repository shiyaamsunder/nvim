local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local augroup = vim.api.nvim_create_augroup("Format", { clear = true })
--
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
  -- debug = true,
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
  -- on_attach = function(client, bufnr)
  --   if client.server_capabilities.documentFormattingProvider then
  --     vim.api.nvim_command [[augroup Format]]
  --     vim.api.nvim_command [[autocmd! * <buffer>]]
  --     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
  --     vim.api.nvim_command [[augroup END]]
  --   end
  -- end,
  sources = {
    diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
  }
})
