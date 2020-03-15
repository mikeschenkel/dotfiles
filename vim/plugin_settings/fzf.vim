" Open hotkeys
map <C-p> :ProjectFiles<CR>
nmap <Leader>; :Buffers<CR>
nmap <Leader>r :Files<CR>
nmap <Leader>t :Tags<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2>/dev/null'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!{*.lock,*-lock.json}" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:40%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "1;36"', fzf#vim#with_preview(), <bang>0)

" Hide statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" https://github.com/junegunn/fzf.vim/issues/47
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" command! ProjectFiles execute 'Files' s:find_git_root()
command! ProjectFiles execute 'Files' s:find_git_root()
