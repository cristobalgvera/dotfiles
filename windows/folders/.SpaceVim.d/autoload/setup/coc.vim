function! CocSetupBefore() abort
  call SpaceVim#custom#SPCGroupName(['C'], '+CoC')
  call SpaceVim#custom#SPC('nnoremap', ['C', 'a'], 'CocAction', 'Code actions', 1)
  call SpaceVim#custom#SPC('nnoremap', ['C', 'c'], 'CocCommand', 'CoC commands', 1)
  call SpaceVim#custom#SPC('nnoremap', ['C', 'd'], 'CocDiagnostics', 'Code diagnostics', 1)
endfunction
