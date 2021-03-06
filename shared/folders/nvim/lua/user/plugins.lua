local util = require("user.util")
local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local packer = util.require("packer")

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  auto_clean = true,
  compile_on_sync = true,
})

local tabnine_run = util.is_windows and "powershell ./install.ps1" or "./install.sh"

-- Install your plugins here
return packer.startup({
  function(use)
    -- My plugins here
    use({
      -- Autocompletion plugins
      "hrsh7th/nvim-cmp", -- completion plugin
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "windwp/nvim-autopairs", -- autopairs when possible
      {
        "hrsh7th/cmp-nvim-lua", -- autocompletion support for lua
        ft = { "lua" },
      },
      {
        "tzachar/cmp-tabnine", -- tabnine ai autocompletion
        after = "nvim-cmp",
        run = tabnine_run,
      },

      -- Snippets
      "L3MON4D3/LuaSnip", -- snippet engine
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use

      -- LSP
      "neovim/nvim-lspconfig", -- enable lsp
      "hrsh7th/cmp-nvim-lsp", -- autocompletion support for lsp
      "williamboman/nvim-lsp-installer", -- simple to use language server installer
      "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
      "ray-x/lsp_signature.nvim", -- show method's signature

      -- Null-ls
      "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters

      -- Rust tools
      "simrat39/rust-tools.nvim", -- rust language adition tools

      -- Comments
      "numToStr/Comment.nvim", -- fast comment toggle

      -- Fidget
      "j-hui/fidget.nvim", -- nvim-lsp progress ui

      -- Telescope
      "nvim-telescope/telescope.nvim", -- telescope support
      "nvim-telescope/telescope-fzy-native.nvim", -- fzf finder

      -- TreeSitter
      {
        "nvim-treesitter/nvim-treesitter", -- treesitter support
        run = ":TSUpdate",
      },
      "p00f/nvim-ts-rainbow", -- rainbow brackets
      "windwp/nvim-ts-autotag", -- auto close html tags
      "JoosepAlviste/nvim-ts-context-commentstring", -- js world improvement to context support

      -- Nvim GPS
      "SmiteshP/nvim-navic", -- show current position un buffer

      -- Neogen
      "danymat/neogen", -- annotations toolkit

      -- Lualine
      "nvim-lualine/lualine.nvim", -- statuline

      -- Hop
      "phaazon/hop.nvim", -- easymotion-like to nvim

      -- Git signs
      "lewis6991/gitsigns.nvim", -- shows git changes

      -- Troubles manager
      "folke/trouble.nvim", -- troubles easy management

      -- Bufferline
      "akinsho/bufferline.nvim", -- tabs-like buffer usage

      -- BDelete
      "kazhala/close-buffers.nvim", -- easily close buffers

      -- Colorschemes
      "folke/tokyonight.nvim", -- tokyonight colorscheme
      "haishanh/night-owl.vim", -- night-owl colorscheme
      -- "olimorris/onedarkpro.nvim",                -- onedarkpro colorscheme

      -- Throws an error that opens CMD windows randomly
      -- Wakatime
      "wakatime/vim-wakatime", -- vim wakatime

      -- Github Copilot
      "github/copilot.vim", -- github copilot

      -- Neovim Scroll
      -- "karb94/neoscroll.nvim", -- smooth scroll

      -- Sorround
      "tpope/vim-surround", -- surround words

      -- Multiple cursor
      "mg979/vim-visual-multi", -- easily create multiple cursors

      -- NvimTree
      "kyazdani42/nvim-tree.lua", -- file tree explorer

      -- Alpha
      "goolord/alpha-nvim", -- fancy welcome page

      -- ToggleTerm
      "akinsho/toggleterm.nvim", -- terminal in nvim as popup

      -- Which Key
      "folke/which-key.nvim", -- key bindings helper

      -- Dressing
      "stevearc/dressing.nvim", -- selection popup

      -- Session manager
      "Shatur/neovim-session-manager", -- manage sessions in neovim

      -- Indent Blankline
      "lukas-reineke/indent-blankline.nvim", -- style to indented blanklines

      -- Nvim Notify
      "rcarriga/nvim-notify", -- notification manager

      -- Focus
      "beauwilliams/focus.nvim", -- manage focused buffers sizes

      -- Vimspector
      -- "puremourning/vimspector", -- debug adapter for vim

      -- Markdown Previoew
      {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
          vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
      },

      -- EditorConfig
      "gpanders/editorconfig.nvim", -- consistent coding style

      -- Common plugins
      "nvim-lua/popup.nvim", -- an implementation of the popup api from vim in neovim
      "nvim-lua/plenary.nvim", -- useful lua functions used ny lots of plugins
      "lewis6991/impatient.nvim", -- speed up startup time

      -- Web development icons
      "kyazdani42/nvim-web-devicons", -- icons pack

      -- Packer base
      "wbthomason/packer.nvim", -- have packer manage itself
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  },
})
