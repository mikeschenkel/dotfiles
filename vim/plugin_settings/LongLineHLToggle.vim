nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>

hi OverLength ctermbg=none cterm=none
match OverLength /\%>81v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>81v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction
