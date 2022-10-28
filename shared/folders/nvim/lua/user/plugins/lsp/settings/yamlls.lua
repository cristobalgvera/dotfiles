local schemas = {
  ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "/*",
}

local custom_tags = {}

local opts = {
  settings = {
    yaml = {
      format = { enable = true },
      validate = true,
      hover = true,
      completion = true,
      customTags = custom_tags,
      schemas = schemas,
      -- `schemaStore` parameter doesn't work
      --[[ schemaStore = { ]]
      --[[   enable = true, ]]
      --[[ }, ]]
    },
  },
}

return opts
