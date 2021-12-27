local general_options = {
  backup = false,                               -- creates a backup file
  clipboard = "unnamedplus",                    -- allows neovim to access the system clipboard
  cmdheight = 2,                                -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" },			-- mostly just for cmp
  conceallevel = 0,                             -- so that `` is visible in markdown files
  fileencoding = "utf-8",                       -- the encoding written to a file
  hlsearch = true,                              -- highlight all matches on previous search pattern
  ignorecase = true,                            -- ignore case in search patterns
  mouse = "a",                                  -- allow the mouse to be used in neovim
  pumheight = 10,                               -- pop up menu height
  showmode = false,                             -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                              -- always show tabs
  smartcase = true,                             -- smart case
  smartindent = true,                           -- make indenting smarter again
  splitbelow = true,                            -- force all horizontal splits to go below current window
  splitright = true,                            -- force all vertical splits to go to the right of current window
  swapfile = false,                             -- creates a swapfile
  termguicolors = true,                         -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                            -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                              -- enable persistent undo
  updatetime = 300,                             -- faster completion (4000ms default)
  writebackup = false,                          -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                             -- convert tabs to spaces
  shiftwidth = 2,                               -- the number of spaces inserted for each indentation
  tabstop = 2,                                  -- insert 2 spaces for a tab
  cursorline = true,                            -- highlight the current line
  number = true,                                -- set numbered lines
  relativenumber = true,                        -- set relative numbered lines
  numberwidth = 4,                              -- set number column width to 2 {default 4}
  signcolumn = "yes",                           -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                                 -- display lines as one long line
  scrolloff = 8,                                -- scroll the file when top or bottom are X lines away
  sidescrolloff = 8,                            -- scrool the file when left or rigth are X lines away
  guifont = "monospace:h17",                    -- the font used in graphical neovim applications
}

local globals = {
  general = {
    transparent_background = true,              -- transparent background (Default: false)
    italic_comments = true,                     -- italic comments (Default: true)
    italic_keywords = true,                     -- italic keywords (Default: true)
  },
  tokyonight = {
    style = "storm",                            -- can be 'storm', 'night' or 'day'
    trasparent = true,                          -- disable setting the background color
  },

  blamer = {
    enabled = 1,
    delay = 500,
    prefix = " ﰖ ",
  }
}

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- Set each entry in options variable
for option, value in pairs(general_options) do
  vim.opt[option] = value
end

-- Set each entry in globals variable
for category, options in pairs(globals) do
  for option, value in pairs(options) do
    if category == "general" then
      vim.g[option] = value
      return
    end

    local full_option = category .. "_" .. option
    vim.g[full_option] = value
  end
end
