local utils = require "user.community.utilities"

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  utils.add_colorscheme "night-owl-nvim",
  utils.add_completion "copilot-cmp",
  utils.add_diagnostics "trouble-nvim",
  utils.add_debugging "nvim-dap-repl-highlights",
  utils.add_debugging "nvim-dap-virtual-text",
  utils.add_debugging "persistent-breakpoints-nvim",
  utils.add_docker "lazydocker",
  utils.add_editing_support "conform-nvim",
  utils.add_editing_support "rainbow-delimiters-nvim",
  utils.add_file_explorer "oil-nvim",
  utils.add_fuzzy_finder "fzf-lua",
  utils.add_git "blame-nvim",
  utils.add_indent "mini-indentscope",
  utils.add_markdown_and_latex "markview-nvim",
  utils.add_media "vim-wakatime",
  utils.add_motion "flash-nvim",
  utils.add_motion "nvim-surround",
  utils.add_pack "angular",
  utils.add_pack "bash",
  utils.add_pack "docker",
  utils.add_pack "gleam",
  utils.add_pack "html-css",
  utils.add_pack "lua",
  utils.add_pack "markdown",
  utils.add_pack "tailwindcss",
  utils.add_pack "typescript",
  utils.add_pack "yaml",
  utils.add_recipes "heirline-clock-statusline",
  utils.add_recipes "heirline-mode-text-statusline",
  utils.add_scrolling "nvim-scrollbar",
  utils.add_test "nvim-coverage",
  utils.add_test "neotest",
  utils.add_utility "lua-json5",
  utils.add_utility "neodim",
  utils.add_utility "noice-nvim",
  utils.add_utility "mason-tool-installer-nvim",
  utils.add_workflow "hardtime-nvim",
}
