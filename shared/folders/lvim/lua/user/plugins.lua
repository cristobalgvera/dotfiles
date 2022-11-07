lvim.plugins = {
  -- Fidget
  "j-hui/fidget.nvim",

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
