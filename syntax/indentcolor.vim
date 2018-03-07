" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif


let s:highlight_colors = ['Title', 'Constant', 'Identifier', 'Statement', 'PreProc', 'Type', 'Special']

let s:i = 0
let s:j = len(s:highlight_colors)
while s:i < s:j
  exec 'syntax match cid' . s:i . ' /^ \{' . &shiftwidth*s:i . '\}[^ #].*/'
  exec 'hi def link cid' . s:i . ' ' . s:highlight_colors[s:i]
  let s:i += 1
endwhile
unlet! s:i s:j

let b:current_syntax = "cid"

" vim: ts=8 sw=2
