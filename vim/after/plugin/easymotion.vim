" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)

" function! s:config_easyfuzzymotion(...) abort
"   return extend(copy({
"   \   'converters': [incsearch#config#fuzzyword#converter()],
"   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"   \   'keymap': {"\<CR>": '<Over>(easymotion)'},
"   \   'is_expr': 0,
"   \   'is_stay': 1
"   \ }), get(a:, 1, {}))
" endfunction

" noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

let g:EasyMotion_do_mapping=0

" type `l` and match `l`&`L`
let g:EasyMotion_smartcase=1

map <Leader> <Plug>(easymotion-prefix)
map <Leader> <Plug>(easymotion-prefix)

" Gif config
map  <Space>/ <Plug>(easymotion-sn)
omap <Space>/ <Plug>(easymotion-tn)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
