function! config#before() abort

endfunction

function! config#after() abort
lua << EOF
  local hop = require('hop')
  hop.setup()
  vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
EOF
endfunction 
  
" vim: foldmethod=marker nospell
