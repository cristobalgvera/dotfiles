local which_key = lvim.builtin.which_key
local gitsigns_opts = lvim.builtin.gitsigns.opts

which_key.mappings.g["t"] = {
  "<cmd>Gitsigns toggle_current_line_blame<cr>",
  "Toggle current line blame",
}

local function format_current_line_blame(name, blame_info, opts)
  if blame_info.author == name then
    blame_info.author = "You"
  end

  local text

  -- Default author name when none commit were created
  if blame_info.author == "Not Committed Yet" then -- Not working in LunarVim
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

gitsigns_opts.current_line_blame = false
gitsigns_opts.current_line_blame_opts.delay = 300

gitsigns_opts.current_line_blame_formatter_opts.relative_time = true
gitsigns_opts.current_line_blame_formatter = format_current_line_blame
