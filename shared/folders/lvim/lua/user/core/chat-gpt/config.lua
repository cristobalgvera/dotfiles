local M = {}

M.setup = function()
  local chat_gpt = reload("chatgpt")
  local chat_gpt_utils = require("user.core.chat-gpt.utils")

  chat_gpt.setup({
    welcome_message = chat_gpt_utils.WELCOME_MESSAGE,
  })
end

return M
