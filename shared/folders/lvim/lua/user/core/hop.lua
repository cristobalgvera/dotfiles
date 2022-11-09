local hop = reload("hop")

hop.setup()

lvim.keys.normal_mode["f"] = "<cmd>HopChar1<CR>"
lvim.keys.normal_mode["F"] = "<cmd>HopWord<CR>"
