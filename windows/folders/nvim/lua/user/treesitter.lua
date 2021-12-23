local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {              -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    "bash",
    "css",
    "go",
    "gomod",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "lua",
    "markdown",
    "prisma",
    "python",
    "regex",
    "scss",
    "tsx",
    "typescript",
    "yaml",
  },
  sync_install = false,             -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" },          -- List of parsers to ignore installing
  highlight = {
    enable = true,                  -- false will disable the whole extension
    disable = { "" },               -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "tsx" },  -- disable on specific files
    extended_mode = true,           -- also highlight non-brackets delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil,           -- disable when file lines are greater than n (int)
  }
}
