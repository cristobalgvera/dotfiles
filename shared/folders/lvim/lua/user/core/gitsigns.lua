local gitsigns = lvim.builtin.gitsigns.opts

gitsigns.current_line_blame = false
gitsigns.current_line_blame_opts.delay = 300

gitsigns.current_line_blame_formatter_opts.relative_time = true
gitsigns.current_line_blame_formatter = function(name, blame_info, opts)
  if blame_info.author == name then
    blame_info.author = "You"
  end
  local text
  -- Default author name when none commit were created
  if blame_info.author == "Not Committed Yet" then
    text = "ﰜ Not commited yet"
  else
    local date_time
    if opts.relative_time then
      date_time = require("gitsigns.util").get_relative_time(tonumber(blame_info["author_time"]))
    else
      date_time = os.date("%Y-%m-%d", tonumber(blame_info["author_time"]))
    end
    text = string.format("ﰖ %s, %s • %s", blame_info.author, date_time, blame_info.summary)
  end
  return { { " " .. text, "GitSignsCurrentLineBlame" } }
end
