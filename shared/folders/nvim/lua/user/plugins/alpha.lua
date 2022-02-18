local util = require("user.util")
local alpha = util.require("alpha")

local dashboard = util.require("alpha.themes.dashboard")
local button = dashboard.button

local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local date = os.date(" %d-%m-%Y")
  local time = os.date(" %H:%M")
  return {
    [[                     ]] .. total_plugins .. [[ plugins]],
    [[                                                       ]],
    [[                    ]] .. date .. [[                   ]],
    [[                       ]] .. time .. [[                ]],
  }
end

local function header()
  return {
    "   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣶⣶⣶⣶⣶⠶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⠁⠀⢀⠈⢿⢀⣀⠀⠹⣿⣿⣿⣦⣄⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⠿⠀⠀⣟⡇⢘⣾⣽⠀⠀⡏⠉⠙⢛⣿⣷⡖⠀ ",
    " ⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⠷⠶⠤⠙⠒⠀⠒⢻⣿⣿⡷⠋⠀⠴⠞⠋⠁⢙⣿⣄ ",
    " ⠀⠀⠀⠀⢸⣿⣿⣯⣤⣤⣤⣤⣤⡄⠀⠀⠀⠀⠉⢹⡄⠀⠀⠀⠛⠛⠋⠉⠹⡇ ",
    " ⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣼⣇⣀⣀⣀⣛⣛⣒⣲⢾⡷ ",
    " ⢀⠤⠒⠒⢼⣿⣿⠶⠞⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⣼⠃ ",
    " ⢮⠀⠀⠀⠀⣿⣿⣆⠀⠀⠻⣿⡿⠛⠉⠉⠁⠀⠉⠉⠛⠿⣿⣿⠟⠁⠀⣼⠃⠀ ",
    " ⠈⠓⠶⣶⣾⣿⣿⣿⣧⡀⠀⠈⠒⢤⣀⣀⡀⠀⠀⣀⣀⡠⠚⠁⠀⢀⡼⠃⠀⠀ ",
    " ⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣤⣭⣭⣭⣭⣭⣥⣤⣤⣤⣴⣟⠁    ",
    "                                ",
    "                         ",
    "          Dani y Cris           ",
    "                         ",
  }
end

-- local function header()
--   return {
--     [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
--     [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
--     [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
--     [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
--     [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
--     [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
--   }
-- end

-- Header
dashboard.section.header.val = header()
dashboard.section.header.opts.hl = "Function"

-- Menu
dashboard.section.buttons.val = {
  button("s", "  Load session", "<cmd>SessionManager load_session<CR>"),
  button("n", "  New file", "<cmd>ene<CR>"),
  button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
  button("r", "  Recently opened files", "<cmd>Telescope oldfiles<CR>"),
  button("w", "  Find word", "<cmd>Telescope live_grep<CR>"),
  button("u", "  Update plugins", "<cmd>PackerSync<CR>"),
  button("S", "  Settings", "<cmd>e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  button("q", "  Quit Neovim", "<cmd>qa<CR>"),
}

-- Footer
dashboard.section.footer.val = footer()

dashboard.config.opts.noautocmd = true

-- hide tabline on startup screen
vim.cmd([[
augroup alpha_tabline
  au!
  au FileType alpha set showtabline=0 | au BufUnload <buffer> set showtabline=2
augroup END
]])

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

alpha.setup(dashboard.config)
