" nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gm :Gmove<cr>
nnoremap <Leader>gr :Gremove<cr>
nnoremap <Leader>gps :Gpush<cr>
nnoremap <Leader>gpl :Gpull<cr>
nnoremap <Leader>gh :Gbrowse<cr>

nnoremap <silent> <Leader>B :Gblame<CR>
nnoremap <silent> <Leader>C :Gclog %<CR>
nnoremap <silent> <Leader>G :Gstatus<CR>

let g:fugitive_git_executable='hub'
