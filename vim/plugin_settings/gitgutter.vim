" ==============================================================================
" GENERAL
" ==============================================================================

set updatetime=100

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" ==============================================================================
" MAPPINGS
" ==============================================================================

nmap ]g :GitGutterNextHunk<CR>
nmap [g :GitGutterPrevHunk<CR>
