local nvim_lsp = require('lspconfig')

-- Column signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function(client)

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end

  -- if client.name == "sumneko_lua" then
  --   client.server_capabilities.document_formatting = false
  --   client.server_capabilities.document_range_formatting = fallback_severity
  -- end
end

local luadev = require("lua-dev").setup({
  lspconfig = {
    on_attach = on_attach,
    format = {
      enable = true,
      defaultConfig = {
        indent_style = "space",
        indent_size = "2",
      }
    }
  }
})

nvim_lsp.sumneko_lua.setup(luadev)

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
}

-- Attaching the capablities of cmp to lspconfig
nvim_lsp.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
