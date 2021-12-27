local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  diagnostics = {
    enable = true,
    show_on_dirs = true,          -- show diagnostics in parent folder when child is hidden
  },
  view = {
    -- hide_root_folder = true,
  }
}
