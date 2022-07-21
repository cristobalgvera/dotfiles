local util = require("user.util")
local configs = util.require("nvim-treesitter.configs")
local install = util.require("nvim-treesitter.install")

install.compilers = { "clang", "gcc" }

configs.setup({
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc", "rnoweb" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "tsx" },  -- disable on specific files
    extended_mode = true, -- also highlight non-brackets delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- disable when file lines are greater than n (int)
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
