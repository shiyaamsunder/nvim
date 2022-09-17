local nvim_lsp = require('lspconfig')


-- Column signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function(client, bufnr)

  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormatting", {}),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end
    })
  end

end


local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local luadev = require("lua-dev").setup({
  lspconfig = {
    on_attach = on_attach,
    handlers = handlers,
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
  -- filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.emmet_ls.setup {
  on_attach = on_attach
}
-- Attaching the capablities of cmp to lspconfig
nvim_lsp.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
