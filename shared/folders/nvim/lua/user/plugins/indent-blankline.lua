local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup({
  show_current_context = true,
  show_current_context_start = true,
  use_treesitter = true,
  buftype_exclude = {
    "terminal",
    "nofile"
  },
  filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
  }
})