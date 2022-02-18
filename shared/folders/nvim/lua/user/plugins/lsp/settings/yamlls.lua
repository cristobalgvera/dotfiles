local schemas = {
  ["https://s3.amazonaws.com/cfn-resource-specifications-us-east-1-prod/schemas/2.15.0/all-spec.json"] = "*.yml",
}

local custom_tags = {
  "!And",
  "!If",
  "!Not",
  "!Equals",
  "!Or",
  "!FindInMap",
  "!Base64",
  "!Cidr",
  "!Ref",
  "!Sub",
  "!GetAtt",
  "!GetAZs",
  "!ImportValue",
  "!Select",
  "!Split",
  "!Join",
}

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
