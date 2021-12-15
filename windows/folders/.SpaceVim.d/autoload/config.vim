function! config#before() abort

endfunction

function! config#after() abort
lua << EOF
  -- Hop setup
  local hop = require('hop')
  hop.setup()
  vim.api.nvim_set_keymap('n', 's', ':HopChar2<cr>', { silent = true })
  vim.api.nvim_set_keymap('n', 'S', ':HopWord<cr>', { silent = true })

  -- AutoSave setup
  local autosave = require('autosave')
  autosave.setup({
    enabled = true,
    execution_message = 'AutoSave: saved at ' .. vim.fn.strftime('%H:%M:%S'),
    events = {'InsertLeave', 'TextChanged'},
    conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
  })
EOF

  " Floaterm config
  let g:floaterm_autoclose = 1
  let g:floaterm_shell = 'pwsh -NoLogo'
  let g:floaterm_title = 'PowerShell ($1/$2)'
  let g:floaterm_width = 0.75
  let g:floaterm_height = 0.75

  tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
  noremap <silent> <F12> :FloatermToggle<CR>
endfunction 
  
" vim: foldmethod=marker nospell
