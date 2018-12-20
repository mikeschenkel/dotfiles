" ==============================================================================
" GENERAL
" ==============================================================================

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

call ncm2#register_source({'name' : 'css',
  \ 'priority': 9,
  \ 'subscope_enable': 1,
  \ 'scope': ['css', 'scss', 'less'],
  \ 'mark': 'css',
  \ 'word_pattern': '[\w\-]+',
  \ 'complete_pattern': ':\s*',
  \ 'on_complete': [
  \   'ncm2#on_complete#omni',
  \   'csscomplete#CompleteCSS'
  \ ],
\ })

" ==============================================================================
" MAPPINGS
" ==============================================================================

" `<Tab>` -- select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

