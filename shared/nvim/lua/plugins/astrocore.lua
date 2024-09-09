-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---Format `cmd` to be used in mappings, adding
---useful options like `noremap` and `silent`.
---@param cmd string The command to run
local function create_map(cmd) return { cmd = cmd, noremap = true, silent = true } end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      notifications = false,
    },
    mappings = {
      n = {
        -- navigate buffer tabs
        ["<S-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- move current line
        ["<A-j>"] = create_map ":m .+1<CR>==",
        ["<A-k>"] = create_map ":m .-2<CR>==",

        -- resize buffers
        ["<A-Up>"] = create_map ":resize -2<CR>",
        ["<A-Down>"] = create_map ":resize +2<CR>",
        ["<A-Left>"] = create_map ":vertical resize -2<CR>",
        ["<A-Right>"] = create_map ":vertical resize +2<CR>",
      },
      v = {
        -- don't copy text when overwriting with p
        ["p"] = create_map [["_dP]],

        -- move current line / block
        ["<A-j>"] = create_map ":m '>+1<CR>gv-gv",
        ["<A-k>"] = create_map ":m '<-2<CR>gv-gv",
      },
    },
  },
}
