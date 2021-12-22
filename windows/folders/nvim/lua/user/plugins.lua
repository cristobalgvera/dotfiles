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
      "hrsh7th/cmp-nvim-lua",                     -- autocompletion support for lua
      ft = { "lua" }
    },
    "hrsh7th/cmp-nvim-lsp",                     -- autocompletion support for lsp

    -- Snippets
    "L3MON4D3/LuaSnip",                         -- snippet engine
    "rafamadriz/friendly-snippets",             -- a bunch of snippets to use

    -- LSP
    "neovim/nvim-lspconfig",                    -- enable lsp
    "williamboman/nvim-lsp-installer",          -- simple to use language server installer

    -- Telescope
    "nvim-telescope/telescope.nvim",            -- telescope support
    "nvim-telescope/telescope-media-files.nvim",-- telescope for media files
    "nvim-telescope/telescope-fzy-native.nvim", -- fzf finder

    -- Web development icons
    "kyazdani42/nvim-web-devicons",             -- icons pack

    -- Colorschemes
    "folke/tokyonight.nvim",                    -- tokyonight colorscheme

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
