local M = {}

--- Format the datetime of the current line blame
--- @param author_time string
--- @param is_relative_time boolean
local function format_date_time(author_time, is_relative_time)
  if is_relative_time then
    return require("gitsigns.util").get_relative_time(tonumber(author_time))
  end

  return os.date("%Y-%m-%d", tonumber(author_time))
end

M.format_current_line_blame = function(current_user, blame_info, opts)
  local text, date_time

  local author = blame_info.author == current_user and "You" or blame_info.author

  -- Default author name when none commit were created
  if blame_info.author == "Not Committed Yet" then -- Not working in LunarVim
    text = "ﰜ Not commited yet"
  else
    date_time = format_date_time(blame_info.author_time, opts.relative_time)
    text = string.format("ﰖ %s, %s • %s", author, date_time, blame_info.summary)
  end

  return { { " " .. text, "GitSignsCurrentLineBlame" } }
end

return M
