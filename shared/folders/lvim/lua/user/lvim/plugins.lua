local M = {}

M.setup = function()
  lvim.plugins = {
    -- Catppuccin (Theme)
    { "catppuccin/nvim", name = "catppuccin" },

    -- Dressing
    "stevearc/dressing.nvim",

    -- GitHub Copilot
    {
      "zbirenbaum/copilot.lua",
      event = { "VimEnter" },
    },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = { "copilot.lua", "nvim-cmp" },
    },

    -- Hop
    "phaazon/hop.nvim",

    -- LspSignature
    "ray-x/lsp_signature.nvim",

    -- MarkdownPreview
    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },

    -- Neodim
    "zbirenbaum/neodim",

    -- Noice
    {
      "folke/noice.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
      },
    },

    -- Nvim Coverage
    {
      "andythigpen/nvim-coverage",
      dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Nvim Highlight Colors
    "brenoprata10/nvim-highlight-colors",

    -- Nvim Numbertoggle
    "sitiom/nvim-numbertoggle",

    -- Package Info
    {
      "vuki656/package-info.nvim",
      dependencies = { "MunifTanjim/nui.nvim" },
    },

    -- Scrollbar
    "petertriho/nvim-scrollbar",

    -- Search Replace
    "roobert/search-replace.nvim",

    -- Surround
    "kylechui/nvim-surround",

    -- TabNine
    {
      "tzachar/cmp-tabnine",
      build = "./install.sh",
      dependencies = { "nvim-cmp" },
    },

    -- Todo Comments
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Treesitter
    "HiPhish/nvim-ts-rainbow2",
    "windwp/nvim-ts-autotag",
    "RRethy/nvim-treesitter-textsubjects",
    {
      "elgiano/nvim-treesitter-angular",
      branch = "topic/jsx-fix",
    },

    -- Trouble
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- TypeScript
    "jose-elias-alvarez/typescript.nvim",

    -- Wakatime
    "wakatime/vim-wakatime",
  }
end

return M
