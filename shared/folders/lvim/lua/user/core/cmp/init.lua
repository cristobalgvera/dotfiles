local features = {
  "tabnine",
}

for _, feature in ipairs(features) do
  reload("user.core.cmp." .. feature)
end
