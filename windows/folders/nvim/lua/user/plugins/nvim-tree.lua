local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
	hijack_cursor = true,           -- put the cursor at the start of the filename
	ignore_ft_on_setup = {          -- will not open on setup if the filetype is in this list
    "aerial", "alpha", "dashboard",
    "startify", "terminal", "quickfix"
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,          -- show diagnostics in parent folder when child is hidden
  },
  view = {
    allow_resize = true,
    width = 35
  }
}
