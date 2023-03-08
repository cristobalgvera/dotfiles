local M = {}

local function map_which_key()
  local which_key = lvim.builtin.which_key

  which_key.mappings["r"] = {
    name = "+Replace",
    s = { "<CMD>SearchReplaceSingleBufferSelections<CR>", "Selection list" },
    o = { "<CMD>SearchReplaceSingleBufferOpen<CR>", "Open" },
    w = { "<CMD>SearchReplaceSingleBufferCWord<CR>", "Word" },
    W = { "<CMD>SearchReplaceSingleBufferCWORD<CR>", "WORD" },
    e = { "<CMD>SearchReplaceSingleBufferCExpr<CR>", "Expression" },
    f = { "<CMD>SearchReplaceSingleBufferCFile<CR>", "File" },
    m = {
      name = "+MultiBuffer",
      s = { "<CMD>SearchReplaceMultiBufferSelections<CR>", "Selection list" },
      o = { "<CMD>SearchReplaceMultiBufferOpen<CR>", "Open" },
      w = { "<CMD>SearchReplaceMultiBufferCWord<CR>", "Word" },
      W = { "<CMD>SearchReplaceMultiBufferCWORD<CR>", "WORD" },
      e = { "<CMD>SearchReplaceMultiBufferCExpr<CR>", "Expression" },
      f = { "<CMD>SearchReplaceMultiBufferCFile<CR>", "File" },
    },
  }
end

local function map_visual_block_mode()
  local visual_block_mode = lvim.keys.visual_block_mode

  visual_block_mode["<C-r>"] = [[<CMD>SearchReplaceSingleBufferVisualSelection<CR>]]
  visual_block_mode["<C-s>"] = [[<CMD>SearchReplaceWithinVisualSelection<CR>]]
  visual_block_mode["<C-b>"] = [[<CMD>SearchReplaceWithinVisualSelectionCWord<CR>]]
end

M.setup = function()
  map_which_key()
  map_visual_block_mode()

  -- show the effects of a search / replace in a live preview window
  vim.o.inccommand = "split"
end

return M
