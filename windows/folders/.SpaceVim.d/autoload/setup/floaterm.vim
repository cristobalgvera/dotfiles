function! FloatermSetupBefore() abort
  let g:floaterm_autoclose = 1
  let g:floaterm_shell = 'pwsh -NoLogo'
  let g:floaterm_title = 'PowerShell 7 ($1/$2)'
  let g:floaterm_width = 0.75
  let g:floaterm_height = 0.75

  tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
  noremap <silent> <F12> :FloatermToggle<CR>
endfunction
