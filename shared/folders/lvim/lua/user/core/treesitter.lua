local treesitter = lvim.builtin.treesitter

treesitter.autotag.enable = true
treesitter.rainbow.enable = true

treesitter.textsubjects.enable = true
treesitter.textsubjects.keymaps[";"] = "textsubjects-container-outer"
treesitter.textsubjects.keymaps["i;"] = "textsubjects-container-inner"
