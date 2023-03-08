local formatters = reload("lvim.lsp.null-ls.formatters")

formatters.setup({
  { command = "stylua" }, -- cargo install stylua
  { command = "shellharden" }, -- cargo install shellharden
  { command = "prettierd" }, -- npm install -g @fsouza/prettierd
  {
    command = "rustfmt", -- rustup component add rustfmt
    extra_args = function(params)
      local Path = require("plenary.path")
      local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

      if cargo_toml:exists() and cargo_toml:is_file() then
        for _, line in ipairs(cargo_toml:readlines()) do
          local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
          if edition then
            return { "--edition=" .. edition }
          end
        end
      end
      -- default edition when we don't find `Cargo.toml` or the `edition` in it.
      return { "--edition=2021" }
    end,
  },
})
