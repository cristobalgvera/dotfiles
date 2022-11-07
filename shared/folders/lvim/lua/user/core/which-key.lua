local which_key = lvim.builtin.which_key

which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  t = { "<cmd>Trouble lsp_type_definitions<cr>", "Type Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

which_key.mappings.g["t"] = {
  "<cmd>Gitsigns toggle_current_line_blame<cr>",
  "Toggle current line blame",
}
