local util = require("user.util")
local nvim_tree = util.require("nvim-tree")
local nvim_tree_config = util.require("nvim-tree.config")

local tree_cb = nvim_tree_config.nvim_tree_callback

local options = {
  indent_markers = 1,
  git_hl = 1,
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0,
  },
  -- add_trailing = 1,
  -- group_empty = 1,
}

for option, value in pairs(options) do
  vim.g["nvim_tree_" .. option] = value
end

nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = true,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("close_node") },
        { key = "v", cb = tree_cb("vsplit") },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      exclude = {
        filetype = {
          "notify",
          "packer",
          "Alpha",
        },
      },
    },
  },
})
