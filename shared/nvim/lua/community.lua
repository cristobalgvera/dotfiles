-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- UI
  { import = "astrocommunity.colorscheme.nightfox-nvim" },

  -- Recipes
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.heirline-clock-statusline" },
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },

  -- LSP
  { import = "astrocommunity.pack.lua" },

  -- Completion
  { import = "astrocommunity.completion.copilot-cmp" },
}
