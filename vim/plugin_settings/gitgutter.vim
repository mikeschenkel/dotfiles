" ==============================================================================
" GENERAL
" ==============================================================================

set updatetime=300

" GitGutter styling to use · instead of +/-
" let g:gitgutter_sign_added = '∙'
" let g:gitgutter_sign_modified = '∙'
" let g:gitgutter_sign_removed = '∙'
" let g:gitgutter_sign_modified_removed = '∙'
let g:gitgutter_grep                    = 'rg'
let g:gitgutter_map_keys                = 0
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_modified_removed   = '▶'
let g:gitgutter_sign_removed            = '▶'
let g:gitgutter_sign_removed_first_line = '◥'

" ==============================================================================
" MAPPINGS
" ==============================================================================

nmap ]g :GitGutterNextHunk<CR>
nmap [g :GitGutterPrevHunk<CR>
nmap <Leader>p <Plug>(GitGutterPreviewHunk)
