" TODO: Parametrize setup directory
source ~/.SpaceVim.d/autoload/setup/hop.vim
source ~/.SpaceVim.d/autoload/setup/autosave.vim
source ~/.SpaceVim.d/autoload/setup/floaterm.vim
source ~/.SpaceVim.d/autoload/setup/coc.vim

function! init#before() abort
  call CocSetupBefore()
  call HopSetupBefore()
  call FloatermSetupBefore()
endfunction

function! init#after() abort
  call HopSetupAfter()
  call AutoSaveSetupAfter()
endfunction 
