local util = require("user.util")
local navic = util.require("nvim-navic")
local M = {}

local max_width = math.max(math.floor(vim.o.columns * 0.7), 100)
local max_height = math.max(math.floor(vim.o.lines * 0.3), 30)

M.setup = function()
  local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = "",
  }

  for type, icon in pairs(signs) do
    local name = "DiagnosticSign" .. type
    vim.fn.sign_define(name, { texthl = name, text = icon, numhl = "" })
  end

  vim.diagnostic.config({
    virtual_text = true,
    signs = { active = signs }, -- show signs
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    max_width = max_width,
    max_height = max_height,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    max_width = max_width,
    max_height = max_height,
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local keymap = util.buf_keymap

  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  keymap(bufnr, "n", "<Leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  keymap(bufnr, "n", "<Leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>")
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  keymap(bufnr, "n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
  keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
  keymap(bufnr, "n", "<Leader>cd", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  keymap(bufnr, "n", "<Leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
end

local function define_capabilities(client, opts)
  local capabilities = client.server_capabilities

  if not opts then
    return capabilities
  end

  if opts.disable_formatting then
    capabilities.documentFormattingProvider = false
    capabilities.documentRangeFormattingProvider = false
  end

  return capabilities
end

local function define_client_capabilities(client)
  local base_opts = {
    disable_formatting = true,
  }

  local custom_capabilities_langs = util.Set({
    "tsserver",
    "rust_analyzer",
    "html",
    "sumneko_lua",
  })

  if custom_capabilities_langs[client.name] then
    define_capabilities(client, base_opts)
  end
end

local function make_signature_help(bufnr)
  local lsp_signature = util.require("lsp_signature")

  lsp_signature.on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded",
    },
    hint_prefix = "📝 ", -- virtual text prefix icon
    floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
    transparency = nil, -- disabled by default, allow floating win transparent value 1~100
    toggle_key = "<C-s>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    max_height = max_height, -- max height of signature floating_window, if content is more than max_height, can scroll down
    max_width = max_width, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  }, bufnr)
end

local function attach_navic(client, bufnr)
  navic.attach(client, bufnr)
end

M.on_attach = function(client, bufnr)
  define_client_capabilities(client)
  lsp_highlight_document(client)
  lsp_keymaps(bufnr)
  make_signature_help(bufnr)
  attach_navic(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = util.require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
