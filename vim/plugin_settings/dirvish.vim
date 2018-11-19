let g:dirvish_mode = ':sort ,^.*[\/],'

augroup dirvish_config

  autocmd!

  " `gr` -- Reload dirvish buffer
  autocmd FileType dirvish nnoremap <silent><buffer>
    \ gr :<C-U>Dirvish %<CR>

  " `gh` -- Hide dot-prefixed files
  " `R` -- "toggle" (reload)
  autocmd FileType dirvish nnoremap <silent><buffer>
    \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<CR>:setl cole=3<CR>

  " `cd` -- Change directory
  autocmd FileType dirvish nnoremap <buffer>
    \ cd :Dirvish 

augroup END
