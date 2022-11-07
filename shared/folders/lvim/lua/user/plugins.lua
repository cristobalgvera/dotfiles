lvim.plugins = {
  -- Fidget
  "j-hui/fidget.nvim",

  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
  },

  -- Hop
  "phaazon/hop.nvim",

  -- LspSignature
  "ray-x/lsp_signature.nvim",

  -- TabNine
  {
    "tzachar/cmp-tabnine",
    after = "nvim-cmp",
    run = "./install.sh",
  },

  -- Treesitter
  "p00f/nvim-ts-rainbow",
  "windwp/nvim-ts-autotag",
  "RRethy/nvim-treesitter-textsubjects",

  -- Trouble
  {
    "folke/trouble.nvim",
  },

  -- TypeScript
  "jose-elias-alvarez/typescript.nvim",

  -- Wakatime
  "wakatime/vim-wakatime",
}
