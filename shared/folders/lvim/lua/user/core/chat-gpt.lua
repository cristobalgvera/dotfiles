local chat_gpt = reload("chatgpt")

local WELCOME_MESSAGE = [[
      _____
     /    /|_ ___________________________________________
    /    // /|                                          /|
   (====|/ //  If you don't ask the right questions,   / |
    (=====|/       you don't get the right answers.   / .|
   (====|/                           ~ Robert Half   / /||
  /_________________________________________________/ / ||
  |  _____________________________________________  ||  ||
  | ||                                            | ||
  | ||                                            | ||
  | |                                             | |
]]

chat_gpt.setup({
  welcome_message = WELCOME_MESSAGE,
})
