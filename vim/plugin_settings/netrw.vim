" netrw

" Initialize netrw with dot files hidden. Press `gh` to toggle dot file hiding.
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:netrw_liststyle=3

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" Open vertical splits on the right
let g:netrw_altv=1

" Open preview windows in a vertical split
let g:netrw_preview=1
