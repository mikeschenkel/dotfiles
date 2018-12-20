" ==============================================================================
" GENERAL
" ==============================================================================

let g:ale_sign_error   = '✗'
let g:ale_sign_warning = '⚠'
" highlight ALEErrorSign   guifg=#DF8C8C
" highlight ALEWarningSign guifg=#F2C38F

" ==============================================================================
" LINTERS
" ==============================================================================

let g:ale_linters = {
\  'css': [ 'prettier', 'stylelint' ],
\  'scss': [ 'prettier', 'stylelint' ],
\  'javascript': [ 'eslint', 'prettier' ]
\}

" ==============================================================================
" FIXERS
" ==============================================================================

let g:ale_fixers = {
\  'css': [ 'prettier', 'stylelint' ],
\  'scss': [ 'prettier', 'stylelint' ],
\  'javascript': [ 'prettier', 'eslint' ],
\  'markdown': [ 'prettier' ],
\}

let g:ale_pattern_options = {
\  '.*\.twig$': { 'ale_enabled': 0 }
\}

" let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma es5'
" let g:ale_fix_on_save = 1

" ==============================================================================
" MAPPINGS
" ==============================================================================

nmap ]w :ALENextWrap<CR>
nmap [w :ALEPreviousWrap<CR>
nmap <Leader>f <Plug>(ale_fix)

