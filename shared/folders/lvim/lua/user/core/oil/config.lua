local M = {}

M.setup = function()
  local oil = reload("oil")

  oil.setup({
    colums = { "icon", "size" },
    keymaps = {
      ["<C-s>"] = false, -- "actions.select_vsplit"
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-h>"] = false, -- "actions.select_split"
      ["<C-x>"] = "actions.select_split",
      ["<C-t>"] = false, -- "actions.select_tab"
      ["<C-l>"] = false, -- "actions.refresh"
      ["<C-f>"] = "actions.refresh",
      ["`"] = false, -- "actions.cd"
      ["~"] = false, -- "actions.tcd"
      ["g\\"] = false, -- "actions.toggle_trash"
    },
    view_options = {
      is_hidden_file = function(filename)
        local hidden_files = {
          ".git",
          "node_modules",
        }

        return vim.tbl_contains(hidden_files, filename)
      end,
      is_always_hidden = function(filename)
        local always_hidden_stars_with = { ".." }

        for _, starts_with in ipairs(always_hidden_stars_with) do
          if vim.startswith(filename, starts_with) then
            return true
          end
        end

        return false
      end,
    },
  })
end

return M
