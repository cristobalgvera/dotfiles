local function get_volta_neovim_node_host()
  if not vim.fn.executable("volta") then
    return
  end

  local neovim_node_host_path = vim.trim(vim.fn.system("volta which neovim-node-host"))

  if not vim.fn.has("windows") then
    return neovim_node_host_path
  end

  local neovim_node_host_locations = {}

  for location in string.gmatch(neovim_node_host_path, "[^/\\]+") do
     table.insert(neovim_node_host_locations, location)
  end

  table.remove(neovim_node_host_locations, #neovim_node_host_locations)

  local common_filepath = "/node_modules/neovim/bin/cli.js"
  local neovim_node_host = table.concat(neovim_node_host_locations, "/") .. common_filepath

  return neovim_node_host
end

local function set_node_host()
  local neovim_node_host = get_volta_neovim_node_host()
  if neovim_node_host then
    vim.g.node_host_prog = neovim_node_host
  end
end

set_node_host()
