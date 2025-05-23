local M = {}

---Create a function that adds a community module to the LazySpec
---@param scope string The scope of the community module
local create_scope_adder = function(scope)
  ---Add a community module to the LazySpec
  ---@param name string The name of the community module
  ---@return LazySpec lazy_spec The community spec to add
  return function(name)
    ---@type LazySpec
    return {
      import = "astrocommunity." .. scope .. "." .. name,
    }
  end
end

M.add_colorscheme = create_scope_adder "colorscheme"
M.add_comment = create_scope_adder "comment"
M.add_completion = create_scope_adder "completion"
M.add_diagnostics = create_scope_adder "diagnostics"
M.add_debugging = create_scope_adder "debugging"
M.add_docker = create_scope_adder "docker"
M.add_editing_support = create_scope_adder "editing-support"
M.add_file_explorer = create_scope_adder "file-explorer"
M.add_fuzzy_finder = create_scope_adder "fuzzy-finder"
M.add_git = create_scope_adder "git"
M.add_indent = create_scope_adder "indent"
M.add_lsp = create_scope_adder "lsp"
M.add_markdown_and_latex = create_scope_adder "markdown-and-latex"
M.add_media = create_scope_adder "media"
M.add_motion = create_scope_adder "motion"
M.add_neovim_lua_development = create_scope_adder "neovim-lua-development"
M.add_pack = create_scope_adder "pack"
M.add_recipes = create_scope_adder "recipes"
M.add_search = create_scope_adder "search"
M.add_scrolling = create_scope_adder "scrolling"
M.add_test = create_scope_adder "test"
M.add_utility = create_scope_adder "utility"
M.add_workflow = create_scope_adder "workflow"

return M
