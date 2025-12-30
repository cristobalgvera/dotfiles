---@type LazySpec
return {
  "Davidyz/VectorCode",
  build = function()
    if vim.fn.executable "uv" == 0 then error "The VectorCode pack requires `uv` installed" end

    local action = vim.fn.executable "vectorcode" == 0 and "install" or "upgrade"
    vim.system { "uv", "tool", action, "vectorcode" }
  end,
}
