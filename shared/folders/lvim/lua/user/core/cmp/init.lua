local features = {
  "tabnine",
  "copilot",
}

for _, feature in ipairs(features) do
  reload("user.core.cmp." .. feature)
end
