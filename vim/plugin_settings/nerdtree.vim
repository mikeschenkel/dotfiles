" ==============================================================================
" GENERAL
" ==============================================================================

let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 40

let NERDTreeHijackNetrw = 0
let g:NERDTreeDirArrowExpandable  = "▷"
let g:NERDTreeDirArrowCollapsible = "◢"

let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeUpdateOnWrite      = 0

" ==============================================================================
" FUNCTIONS
" ==============================================================================

function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

function MyNerdToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction

" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufEnter * call NERDTreeRefresh()

" ==============================================================================
" MAPPINGS
" ==============================================================================

nnoremap <C-b> :call MyNerdToggle()<CR>
