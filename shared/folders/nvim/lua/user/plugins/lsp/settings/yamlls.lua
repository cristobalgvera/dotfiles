local schemas = {}

local custom_tags = {}

local opts = {
  settings = {
    yaml = {
      format = { enable = true },
      hover = true,
      completion = true,
      customTags = custom_tags,
      schemas = schemas,
    },
  },
}

return opts
