-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {"bash", "javascript", "json", "lua", "python", "typescript", "css", "java",
                                            "yaml", "go"}

lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = { -- Adds a fast way of movement on the screen based on character looking
{
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
        require("hop").setup()
        vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", {
            silent = true
        })
        vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", {
            silent = true
        })
    end
}, -- Adds a minimap on lateral of buffers
{
    'wfxr/minimap.vim',
    run = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function()
        vim.cmd("let g:minimap_width = 10")
        vim.cmd("let g:minimap_auto_start = 0")
        vim.cmd("let g:minimap_auto_start_win_enter = 0")
    end
}, -- Autocloses tags on HTML-based elements
{
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
        require("nvim-ts-autotag").setup()
    end
}, -- Adds rainbow colors on brackets
{"p00f/nvim-ts-rainbow"}, -- Tracks your per file and project used time
{"wakatime/vim-wakatime"}, -- GitHub Copilot plugin
{
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
        vim.g.copilot_tab_fallback = ""
    end
}, -- Adds ML helper tooltips in some languages
{
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    event = "InsertEnter"
}, -- When GO-TO command are used, create a mini window to easily show definition
{
    "rmagatti/goto-preview",
    config = function()
        -- Explicitly set keybindings
        vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
        require('goto-preview').setup {
            width = 120, -- Width of the floating window
            height = 25, -- Height of the floating window
            default_mappings = false, -- Bind default mappings
            debug = false, -- Print debug information
            opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
            post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
            -- You can use "default_mappings = true" setup option
        }
    end
}, -- Adds tooltip to know any method's signature
{
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
        require"lsp_signature".setup()
    end
}, -- Shows buffer symbols in lateral and do actions on them
{
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline"
}, -- Expands a buffer to list all troubles found in any buffer
{
    "folke/trouble.nvim",
    cmd = "TroubleToggle"
}, -- Adds indentation guides
{
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
        vim.g.indent_blankline_buftype_exclude = {"terminal"}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
        vim.g.space_char_blankline = " "
        vim.g.show_current_context = true
    end
}, -- Starts a server to preview markdown files
{
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
        vim.g.mkdp_auto_start = 1
    end
}, -- Adds smooth scrolling
{
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
        require('neoscroll').setup({
            -- All these keys will be mapped to their corresponding default scrolling animation
            mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
            hide_cursor = true, -- Hide cursor while scrolling
            stop_eof = true, -- Stop at <EOF> when scrolling downwards
            use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
            respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil, -- Default easing function
            pre_hook = nil, -- Function to run before the scrolling animation starts
            post_hook = nil -- Function to run after the scrolling animation ends
        })
    end
}, -- Shows a buffer with any TODO, PERF, HACK, NOTE, FIX or WARNING comment on current buffer
{
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
        require("todo-comments").setup()
    end
}, -- Adds 'gx' command to open URLs
{
    "felipec/vim-sanegx",
    event = "BufRead"
}, -- Adds session management API
{
    "folke/persistence.nvim",
    event = "BufRead",
    module = "persistence",
    config = function()
        require("persistence").setup {
            dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
            options = {"buffers", "curdir", "tabpages", "winsize"}
        }
    end
}, -- Shows git diff of current buffer
{
    "sindrets/diffview.nvim",
    event = "BufRead"
}, -- Search and replace words
{
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
        require("spectre").setup()
    end
}, -- Golang full Vim integration
{"fatih/vim-go"}}

-- Personal config

-- Make terminal windows transparent when LunarVim is active
lvim.transparent_window = true

-- Automatically install LSP when unsupported file type is open
lvim.lsp.automatic_servers_installation = true

-- Relative numbers
vim.opt.relativenumber = true

-- Formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {{
    exe = 'prettier'
}}

-- Linter
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {{
    exe = 'eslint'
}}

-- Keybindings
lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = {"<cmd>TroubleToggle<cr>", "trouble"},
    w = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace"},
    d = {"<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document"},
    q = {"<cmd>TroubleToggle quickfix<cr>", "quickfix"},
    l = {"<cmd>TroubleToggle loclist<cr>", "loclist"},
    r = {"<cmd>TroubleToggle lsp_references<cr>", "references"}
}

lvim.builtin.which_key.mappings["S"] = {
    name = "Session",
    c = {"<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir"},
    l = {"<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session"},
    Q = {"<cmd>lua require('persistence').stop()<cr>", "Quit without saving session"}
}

-- Remap TAB key to work with GitHub Copilot

local cmp = require("cmp")
lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    else
        local copilot_keys = vim.fn["copilot#Accept"]()
        if copilot_keys ~= "" then
            vim.api.nvim_feedkeys(copilot_keys, "i", true)
        else
            fallback()
        end
    end
end

