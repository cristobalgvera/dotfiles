local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use {
    -- Autocompletion plugins
    "hrsh7th/nvim-cmp",                         -- completion plugin
    "hrsh7th/cmp-buffer",                       -- buffer completions
    "hrsh7th/cmp-path",                         -- path completions
    "hrsh7th/cmp-cmdline",                      -- cmdline completions
    "saadparwaiz1/cmp_luasnip",                 -- snippet completions
    {
      "hrsh7th/cmp-nvim-lua",                   -- autocompletion support for lua
      ft = { "lua" }
    },
    "hrsh7th/cmp-nvim-lsp",                     -- autocompletion support for lsp
    "windwp/nvim-autopairs",                    -- autopairs when possible

    -- Snippets
    "L3MON4D3/LuaSnip",                         -- snippet engine
    "rafamadriz/friendly-snippets",             -- a bunch of snippets to use

    -- LSP
    "neovim/nvim-lspconfig",                    -- enable lsp
    "williamboman/nvim-lsp-installer",          -- simple to use language server installer
    "tamago324/nlsp-settings.nvim",             -- language server settings defined in json for

    -- Comments
    "terrortylor/nvim-comment",                 -- fast comment toggle

    -- Telescope
    "nvim-telescope/telescope.nvim",            -- telescope support
    "nvim-telescope/telescope-fzy-native.nvim", -- fzf finder

    -- TreeSitter
    {
      "nvim-treesitter/nvim-treesitter",        -- treesitter support
      run = ":TSUpdate"
    },
    "p00f/nvim-ts-rainbow",                     -- rainbow brackets
    "windwp/nvim-ts-autotag",                   -- auto close html tags

    -- TODO: To be used when a statusline is packed
    -- {
    --   "SmiteshP/nvim-gps",                      -- show current position un buffer
    --   requires = "nvim-treesitter/nvim-treesitter"
    -- },

    -- Hop
    "phaazon/hop.nvim",                         -- easymotion-like to nvim

    -- Git signs
    {
      "lewis6991/gitsigns.nvim",                -- shows git changes
      requires = "nvim-lua/plenary.nvim",
    },

    -- Troubles manager
    {
      "folke/trouble.nvim",                     -- troubles easy management
      requires = "kyazdani42/nvim-web-devicons",
    },

    -- Web development icons
    "kyazdani42/nvim-web-devicons",             -- icons pack

    -- Bufferline
    {
      "akinsho/bufferline.nvim",                -- tabs-like buffer usage
      requires = "kyazdani42/nvim-web-devicons"
    },

    -- Colorschemes
    "folke/tokyonight.nvim",                    -- tokyonight colorscheme
    -- Github Copilot
    "github/copilot.vim",                       -- github copilot

    -- Neovim Scroll
    "karb94/neoscroll.nvim",                    -- smooth scroll
    -- Common plugins
    "nvim-lua/popup.nvim",                      -- an implementation of the popup api from vim in neovim
    "nvim-lua/plenary.nvim",                    -- useful lua functions used ny lots of plugins

    -- Packer base
    "wbthomason/packer.nvim",                   -- have packer manage itself
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
