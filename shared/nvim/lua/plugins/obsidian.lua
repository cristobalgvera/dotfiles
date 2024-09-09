local utils = require "user.community.utilities"

local VAULTS_BASE_PATH = vim.env.HOME .. "/obsidian-vaults"

---@type LazySpec
return {
  utils.add_fuzzy_finder "fzf-lua",
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- NOTE: Use latest release
    event = {
      string.format("BufReadPre %s/*.md", VAULTS_BASE_PATH),
      string.format("BufNewFile %s/*.md", VAULTS_BASE_PATH),
    },
    opts = {
      workspaces = {
        { name = "personal", path = VAULTS_BASE_PATH .. "/personal" },
        { name = "work", path = VAULTS_BASE_PATH .. "/work" },
      },

      -- INFO: Choose the picker to use when doing Obsidian's actions
      picker = { name = "fzf-lua" },

      -- INFO: Disabled to avoid conflicts with other markdown renderers
      ui = { enable = false },

      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },

      -- INFO: Keep notes in a specific subdirectory of your vault
      notes_subdir = "notes",
      new_notes_location = "notes_subdir",
      daily_notes = {
        folder = "notes/dailies",
        alias_format = "%B %-d, %Y",
        template = "daily-note",
      },

      ---Format the file name of the note based on the title provided by the user.
      ---@param title string The title of the note written by the user.
      ---@return string file_name The file name of the note formatted as `timestamp-title.md`.
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end

        return tostring(os.time()) .. "-" .. suffix
      end,

      -- INFO: Open when you follow an external link. It will be ignored by default
      follow_url_func = vim.ui.open,
      follow_img_func = vim.ui.open,

      ---Format the frontmatter fields to be added to the note.
      ---@param note table Note with existing metadata.
      ---@return table note_metadata Frontmatter fields to be added to the note.
      note_frontmatter_func = function(note)
        if note.title then note:add_alias(note.title) end

        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,

      attachments = {
        ---@return string img_name_suffix The suffix of the image file formatted as `suffix-`.
        img_name_func = function()
          local client = require("obsidian").get_client()

          local note = client:current_note()
          local suffix = note and note.id or os.time()

          return string.format("%s-", suffix)
        end,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim", -- NOTE: Required dependency
      { "hrsh7th/nvim-cmp", optional = true },
      { "nvim-treesitter/nvim-treesitter", optional = true },
      {
        "AstroNvim/astrocore",
        optional = true,
        opts = function(_, opts)
          local maps = opts.mappings

          maps.n["gf"] = {
            function()
              if not require("obsidian").util.cursor_on_markdown_link() then return "gf" end

              return "<Cmd>ObsidianFollowLink<CR>"
            end,
            desc = "Obsidian Follow Link",
          }
        end,
      },
    },
  },
}
