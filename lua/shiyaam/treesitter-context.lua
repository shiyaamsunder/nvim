local status_ok, nvim_treesitter_context = pcall(require, "treesitter_context")
if not status_ok then
  return
end

nvim_treesitter_context.setup()
