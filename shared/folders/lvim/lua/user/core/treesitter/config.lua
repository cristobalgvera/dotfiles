local M = {}

local function setup_angular()
  vim.filetype.add({
    pattern = {
      [".*%.component%.html"] = "angular.html", -- Sets the filetype to `angular.html` if it matches the pattern
    },
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "angular.html",
    callback = function()
      vim.treesitter.language.register("angular", "angular.html") -- Register the filetype with treesitter for the `angular` language/parser
    end,
  })
end

M.setup = function()
  local treesitter = lvim.builtin.treesitter

  treesitter.auto_install = true

  treesitter.autotag.enable = true

  treesitter.textsubjects.enable = true

  setup_angular()
end

return M
