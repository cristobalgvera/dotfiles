-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

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
        ["<A-j>"] = { ":m .+1<CR>==", noremap = true, silent = true },
        ["<A-k>"] = { ":m .-2<CR>==", noremap = true, silent = true },

        -- resize buffers
        ["<A-Up>"] = { ":resize -2<CR>", noremap = true, silent = true },
        ["<A-Down>"] = { ":resize +2<CR>", noremap = true, silent = true },
        ["<A-Left>"] = { ":vertical resize -2<CR>", noremap = true, silent = true },
        ["<A-Right>"] = { ":vertical resize +2<CR>", noremap = true, silent = true },
      },
      v = {
        -- don't copy text when overwriting with p
        ["p"] = { [["_dP]], noremap = true, silent = true },

        -- move current line / block
        ["<A-j>"] = { ":m '>+1<CR>gv-gv", noremap = true, silent = true },
        ["<A-k>"] = { ":m '<-2<CR>gv-gv", noremap = true, silent = true },
      },
    },
  },
}
