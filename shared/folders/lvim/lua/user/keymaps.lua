lvim.leader = "space"

-- Buffer cycling
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<TAB>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-TAB>"] = ":BufferLineCyclePrev<CR>"

-- Hop
lvim.keys.normal_mode["f"] = "<cmd>HopChar1<CR>"
lvim.keys.normal_mode["F"] = "<cmd>HopWord<CR>"
