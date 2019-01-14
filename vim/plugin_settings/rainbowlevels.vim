" ==============================================================================
" MAPPINGS
" ==============================================================================

" `<Leader>+l` -- Toggle Rainbow Levels
map <Leader>l :RainbowLevelsToggle<CR>

" ==============================================================================
" COLORS
" ==============================================================================

" Jellybeans Rainbow
hi! link rainbowlevel1 type
hi! link rainbowlevel0 constant
hi! link rainbowlevel2 function
hi! link rainbowlevel3 string
hi! link rainbowlevel4 preproc
hi! link rainbowlevel5 statement
hi! link rainbowlevel6 identifier
hi! link rainbowlevel7 normal
hi! link rainbowlevel8 comment

" Cycle Colors
" for level in range(0, 10, 2)
"   exe 'hi! RainbowLevel'.level.' guifg=magenta'
"   exe 'hi! RainbowLevel'.(level+1).' guifg=cyan'
" endfor
