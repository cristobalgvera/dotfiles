local util = require("user.util")
local null_ls = util.require("null-ls")
local null_helpers = util.require("null-ls.helpers")

local cfn_lint = {
  name = "cfn-lint",
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "yaml" },
  generator = null_helpers.generator_factory({
    command = "cfn-lint",
    to_stdin = true,
    to_stderr = true,
    args = { "--format", "parseable", "-" },
    format = "line",
    check_exit_code = function(code)
      return code == 0 or code == 255
    end,
    on_output = function(line, params)
      local row, col, end_row, end_col, code, message = line:match(":(%d+):(%d+):(%d+):(%d+):(.*):(.*)")
      local severity = null_helpers.diagnostics.severities["error"]

      if message == nil then
        return nil
      end

      if vim.startswith(code, "E") then
        severity = null_helpers.diagnostics.severities["error"]
      elseif vim.startswith(code, "W") then
        severity = null_helpers.diagnostics.severities["warning"]
      else
        severity = null_helpers.diagnostics.severities["information"]
      end

      return {
        message = message,
        code = code,
        row = row,
        col = col,
        end_col = end_col,
        end_row = end_row,
        severity = severity,
        source = "cfn-lint",
      }
    end,
  }),
}

return cfn_lint
