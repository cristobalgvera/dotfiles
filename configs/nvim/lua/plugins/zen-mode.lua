---@type LazySpec
return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      width = function() return math.min(120, vim.o.columns * 0.75) end,
      height = 0.9,
      options = {
        signcolumn = "no", -- Disable signcolumn
        number = false, -- Disable number column
        relativenumber = false, -- Disable relative numbers
        cursorline = false, -- Disable cursorline
        cursorcolumn = false, -- Disable cursor column
        foldcolumn = "0", -- Disable fold column
        list = false, -- Disable whitespace characters
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false, -- Disables the ruler text in the cmd line area
        showcmd = false, -- Disables the command in the last line of the screen
        laststatus = 0, -- Turn off the status-line in zen mode
      },
      gitsigns = { enabled = true }, -- Disables Git signs
      todo = { enabled = true }, -- TODO highlights will be disabled
      tmux = { enabled = true }, -- Disables the tmux status-line
    },
    on_open = function() -- Disable diagnostics, winbar, hardtime
      local astrocore_avail, astrocore = pcall(require, "astrocore")
      if astrocore_avail then
        vim.g.diagnostics_mode_old = vim.g.diagnostics_mode
        vim.g.diagnostics_mode = 0
        vim.diagnostic.config(astrocore.diagnostics[vim.g.diagnostics_mode])
      end

      vim.g.winbar_old = vim.o.winbar
      vim.api.nvim_create_autocmd({ "BufWinEnter", "BufNew" }, {
        pattern = "*",
        callback = function() vim.o.winbar = nil end,
        group = vim.api.nvim_create_augroup("disable_winbar", { clear = true }),
        desc = "Ensure winbar stays disabled when writing to file, switching buffers, opening floating windows, etc.",
      })

      local hardtime_avail, hardtime = pcall(require, "hardtime")
      if hardtime_avail then hardtime.disable() end
    end,
    on_close = function() -- Restore diagnostics, winbar, hardtime
      local astrocore_avail, astrocore = pcall(require, "astrocore")
      if astrocore_avail then
        vim.g.diagnostics_mode = vim.g.diagnostics_mode_old
        vim.diagnostic.config(
          astrocore.diagnostics[vim.g.diagnostics_mode or astrocore.config.features.diagnostics_mode]
        )
      end

      vim.api.nvim_clear_autocmds { group = "disable_winbar" }
      vim.o.winbar = vim.g.winbar_old

      local hardtime_avail, hardtime = pcall(require, "hardtime")
      if hardtime_avail then hardtime.enable() end
    end,
  },
  dependencies = {
    { "folke/twilight.nvim", lazy = true },
    {
      "AstroNvim/astrocore",
      optional = true,
      opts = function(_, opts)
        local maps = opts.mappings

        maps.n["<Leader>z"] = { "<Cmd>ZenMode<CR>", desc = "Zen mode" }
      end,
    },
  },
}
