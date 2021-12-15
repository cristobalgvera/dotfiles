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
endfunction 
  
" vim: foldmethod=marker nospell
