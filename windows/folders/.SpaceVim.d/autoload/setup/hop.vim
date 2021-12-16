function! HopSetupBefore() abort
  nnoremap <silent><nowait> ns :HopChar2<CR>
  nnoremap <silent><nowait> nS :HopWord<CR>
endfunction

function! HopSetupAfter() abort
lua << EOF
  local hop = require('hop')
  hop.setup()
EOF
endfunction
