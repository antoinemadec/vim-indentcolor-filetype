if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< cms< fo<"

setlocal comments=:# commentstring=#\ %s formatoptions-=t formatoptions+=croql
setlocal shiftwidth=4 tabstop=4

nnoremap <buffer> <CR> :call <SID>cycle()<CR>

function s:cycle() abort
  let match = matchlist(getline('.'), '^\s*\([❌✅]\) .*$')
  if !empty(match)
    if match[1] == '❌'
      s/❌ /✅ /
    else
      s/✅ //
    endif
  else
    s/^\(\s*\)/\1❌ /
  endif
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
