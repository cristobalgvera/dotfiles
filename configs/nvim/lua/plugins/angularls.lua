---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      if not opts.config then opts.config = {} end

      opts.config.angularls = {
        root_dir = function(filename)
          local util = require "lspconfig.util"

          local find_file_in_root = function(file_to_find)
            return function(startpath)
              return util.search_ancestors(startpath, function(path)
                local jsonpath = util.path.join(path, file_to_find)
                if (vim.loop.fs_stat(jsonpath) or {}).type == "file" then return path end
              end)
            end
          end

          local find_angular_json = find_file_in_root "angular.json"
          local find_nx_json = find_file_in_root "nx.json"

          return find_angular_json(filename) or find_nx_json(filename)
        end,
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        htmlangular = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
