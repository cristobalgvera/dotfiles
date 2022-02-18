local M = {}

M.keymap = function(mode, keybinding, command, options)
  local global_keymap = vim.api.nvim_set_keymap

  local default_opts = { noremap = true, silent = true }
  local opts = options or default_opts

  global_keymap(mode, keybinding, command, opts)
end

M.buf_keymap = function(bufnr, mode, keybinding, command, options)
  local buffer_keymap = vim.api.nvim_buf_set_keymap

  local default_opts = { noremap = true, silent = true }
  local opts = options or default_opts

  buffer_keymap(bufnr, mode, keybinding, command, opts)
end

M.is_windows = vim.fn.has("win32") == 1

M.Set = function(items)
  local set = {}

  for _, item in ipairs(items) do
    set[item] = true
  end

  return set
end

M.notify = function(title, message, level)
  local default_message = "Unable to load required module"
  local default_level = vim.lsp.log_levels.WARN

  local msg = message or default_message
  local lvl = level or default_level

  vim.notify(msg, lvl, { title = title })
end

M.require = function(module, options)
  local default_opts = {
    throws = true,
    error_title = nil,
    error_message = nil,
    error_level = nil,
  }
  local opts = vim.tbl_deep_extend("force", default_opts, options or {})

  local status_ok, result = pcall(require, module)

  if not status_ok then
    M.notify(opts.error_title or module, opts.error_message, opts.error_level)

    if opts.throws then
      error("Unable to load " .. module, opts.error_level or vim.lsp.log_levels.WARN)
    end
  end

  return result
end

return M
