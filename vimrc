"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / | | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|


" ==============================================================================
" PLUGINS
" ==============================================================================

" Conditional activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()

" Utility
" Generic Programming Support

" Command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'

" A Vim plugin for more pleasant editing on commit messages
Plug 'rhysd/committia.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'docunext/closetag.vim'

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" emmet for vim
Plug 'mattn/emmet-vim'

" Completion plugins
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux', Cond(exists('$TMUX'))
Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-tagprefix'

" PHP completion, refactoring and introspection tool
Plug 'phpactor/phpactor', { 'do': 'composer install', 'for': ['php'] }
Plug 'phpactor/ncm2-phpactor', { 'for': ['php'] }

" The missing motion for Vim
Plug 'justinmk/vim-sneak'

" Extended f, F, t and T key mappings for Vim
Plug 'rhysd/clever-f.vim'

" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'

" Display indention levels with thin vertical lines
Plug 'Yggdroot/IndentLine', { 'on': 'IndentLinesToggle' }

" Show Git diff in the gutter and stages/undoes hunks
Plug 'airblade/vim-gitgutter'

" Changes Vim working directory to project root
Plug 'airblade/vim-rooter'

" A Vim plugin that manages your tag files
Plug 'ludovicchabant/vim-gutentags'

" Damian Conway's vmath.vim plugin
Plug 'nixon/vim-vmath'

" Automatically discover and properly update ctags files on save
" Plug 'craigemery/vim-autotag'

" Plugin to help you stop repeating the basic movement keys
" Plug 'takac/vim-hardtime'

" Combine with netrw to create a delicious salad dressing
" Plug 'tpope/vim-vinegar'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Helpers for UNIX
Plug 'tpope/vim-eunuch'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" ALE indicator for the lightline vim plugin
Plug 'maximbaz/lightline-ale'


" -- THEME / INTERFACE ---------------------------------------------------------

" Base16 for Vim
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'


" -- FILETYPES -----------------------------------------------------------------

" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

" Extra syntax support for CSS3
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass', 'less'] }

" Preview CSS colors in source code
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less'] }

" Syntax support for JavaScript libraries
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }

" Generate phpDocumentor documentation blocks for PHP code
Plug 'Rican7/php-doc-modded', { 'for': ['php'] }


" -- TMUX ----------------------------------------------------------------------

" vim-tmux-navigator - Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator', Cond(exists('$TMUX'))

" vim-tmux-focus-events - Make terminal vim and tmux work better together
Plug 'tmux-plugins/vim-tmux-focus-events', Cond(exists('$TMUX'))

call plug#end()


" ==============================================================================
" GENERAL
" ==============================================================================

" Enable truecolor and italics for tmux
if (has("termguicolors"))
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if has("autocmd")
    filetype plugin indent on
    "           │     │    └──── Enable file type detection
    "           │     └───────── Enable loading of indent file
    "           └─────────────── Enable loading of plugin files
endif

set encoding=utf-8              " ┐
set fileencoding=utf-8          " │ Set encoding to utf-8
set termencoding=utf-8          " ┘

set langmenu=en_US              " ┐
let $LANG='en_US'               " │ Set language to
source $VIMRUNTIME/delmenu.vim  " │ English US
source $VIMRUNTIME/menu.vim     " ┘

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" ==============================================================================
" OPTIONS
" ==============================================================================

let mapleader="\<Space>"        " Remap Leader to <Space>

set nocompatible                " Use Vim features, not Vi
set fileformats=unix,dos,mac    " Use Unix as the standard file type

set mouse=a                     " Enable mouse
set mousehide                   " Hide the mouse cursor while typing

set backspace=eol,start,indent  " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l          " Allow backspace and cursor keys to cross line boundaries

set showcmd                     " Show commands in status line
set noshowmode                  " Hide modes from the statusline

set ruler                       " Show current line and column position in file
set number                      " Show current line in the gutter
set relativenumber              " Display relative line numbers
set cursorline                  " Highlight current line

set lazyredraw                  " Don't redraw while executing macros
set t_ut=                       " Improve screen clearing by using the background color
set ttyfast                     " Faster redrawing

set shortmess=atOI              " No help Uganda information
set title                       " Show file title in terminal tab
set fillchars+=vert:│           " Change vertical split character to │

set clipboard=unnamed           " ┐
if has("unnamedplus")           " │ Use the system clipboard
  set clipboard+=unnamedplus    " │ as the default register
endif                           " ┘


" ==============================================================================
" COLORS
" ==============================================================================

set termguicolors
set background=dark

let base16colorspace=256
colorscheme base16-atelier-forest

" Make WildMenu selections visible
highlight WildMenu guifg=#2c2421

" highlight GitGutterChange guifg=#c38418
" highlight GitGutterChangeDelete guifg=#c38418

" Italicised comments and attributes
highlight Comment gui=italic
highlight htmlArg gui=italic


" ==============================================================================
" FILETYPES
" ==============================================================================

" Quickfix
au FileType qf setlocal norelativenumber colorcolumn=

" Gitcommit
" Force the cursor onto a new line after 72 characters and color the 51st colomn (for titles)
autocmd FileType gitcommit set textwidth=72 colorcolumn+=51

autocmd BufNewFile,BufRead *.ts,*.snap,*.es6,*.tsx setlocal filetype=javascript.jsx
autocmd BufNewFile,BufRead *stylelintrc,*eslintrc,*babelrc,*prettierrc setlocal syntax=json

" Markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown tw=80 fo+=t colorcolumn=80
" let g:vim_markdown_conceal = 0

" Vue
autocmd BufReadPre *.vue let b:javascript_lib_use_vue=1
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less.pug


" ==============================================================================
" UI
" ==============================================================================

" Turn on the WiLd menu
set wildmenu

" Autocomplete as much as you can
set wildmode=longest:list,full

" Don’t offer to open certain files/directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Version control
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png    " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pdf,*.psd
set wildignore+=*.map,*.min.css
set wildignore+=node_modules/*,bower_components/*


" ==============================================================================
" FILES, BACKUPS AND UNDO
" ==============================================================================

set autoread                    " Reload files modified outside of Vim
set autowrite                   " Automatically write when leaving a modified buffer

set nobackup                    " ┐
set noswapfile                  " │ <3 Git
set nowritebackup               " ┘

set undodir=~/.vim/undo_files// " ┐ Permanent
set undofile                    " ┘ undo

" set hidden                    " Allow buffer switching without saving


" ==============================================================================
" ABBREVIATIONS AND AUTO-COMPLETIONS
" ==============================================================================

" lipsum<Tab> drops some Lorem ipsum text into the document
iab lipsum Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.

" Automatically add `rel="noopener"` to `target="_blank"`
" https://www.pixelstech.net/article/1537002042-The-danger-of-target=_blank-and-opener
iab target="_blank" target="_blank" rel="noopener noreferrer nofollow"

" `todo` will be capitalized
iab todo TODO


" ==============================================================================

set colorcolumn=81              " Limit line-length to 80 columns
                                " by highlighting col 81
set list
set listchars=tab:▸\            " ┐
set listchars+=trail:·          " │
" set listchars+=eol:¬          " │ Use custom symbols to
set listchars+=extends:❯        " │ represent invisible characters
set listchars+=precedes:❮       " │
set listchars+=nbsp:_           " ┘
set showbreak=↪

set scrolloff=5                " Minumum lines to keep above and below
                               " from the cursor
set sidescroll=1               " Scroll sideways a character at a time,
                               " rather than a screen at a time
set sidescrolloff=5            " Minumum lines to keep left and right from the cursor

set report=0                   " Always report changed lines

set splitright                 " Open new vsplit windows to the right of the current one
set splitbelow                 " Open new split windows to the bottom of the current one

set noerrorbells               " ┐
set novisualbell               " │ No annoying sound
set t_vb=                      " │ on errors
set tm=500                     " ┘

au VimResized * :wincmd =      " Resize splits when the window is resized

set magic                      " For regular expressions turn magic on

set showmatch                  " Show matching brackets when text indicator
                               " is over them

set nrformats-=octal           " Interpret numbers with leading zeroes as
                               " decimal, not octal
set iskeyword+=-               " Makes foo-bar considered one word

set display=lastline           " Show as much as possible of the last line

set nojoinspaces               " No extra spaces when joining lines

set spelllang=en,nl            " Set spelling language

" <leader>+ss` -- Toggle spell checking
map <leader>ss :setlocal spell!<CR>
" nmap ;s :setlocal spell!<CR>
" ]s and [s -- move to misspelled words
" z= -- autocorrect words


" ==============================================================================
" SEARCH
" ==============================================================================

set ignorecase                 " Case insensitive search
set smartcase                  " ... except if we input a capital letter
set hlsearch                   " Highlight search terms
set hlsearch                   " Find as you type search

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" `<leader>+n` -- Disable highlight
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Don't jump directly to the next or previous result
nnoremap * *<C-o>
nnoremap # #<C-o>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" ==============================================================================
" TABS, SPACES, INDENTS AND WRAPPING
" ==============================================================================

set wrap                       " Wrap lines
set autoindent                 " Indent at the same level of the previous line
set expandtab                  " Use spaces instead of tabs
set smarttab                   " Smart tab
set smartindent                " Automatically indent lines after opening brackets

set softtabstop=2              " ┐
set shiftwidth=2               " │ 1 tab == 2 spaces
set tabstop=2                  " ┘


" ==============================================================================
" KEYBOARD SHORTCUTS
" ==============================================================================

" Remap : to ; to strip off two full keystrokes from almost every Vim command
nnoremap ; :

" `<Tab>` -- Jump between various pairs of characters
map <Tab> %

" `Q` -- Format the current paragraph (or selection)
nmap Q gqap
vmap Q gq

" `<Ctrl>+<Left>` or `<Ctrl>+<Right>` -- Resize splits
nnoremap <C-Left> <C-w>5<
nnoremap <C-Right> <C-w>5>

" `<leader>+<leader>` -- Toggle between buffers
nnoremap <leader><leader> <c-^>
" You don't know what you're missing if you don't use this.
nmap <C-e> :e#<CR>

" Move between open buffers.
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

" Vim-like window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" `>` (forwards) / `<` (backwards) -- Shift selection in Visual mode
vnoremap > >gv
vnoremap < <gv

" Treat long lines as break lines
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" `<leader>+q` -- Close the current window
nnoremap <leader>q :q<CR>

" `Ctrl+q` -- Close the current window
nnoremap <C-q> :q<CR>
vnoremap <C-q> :q<CR>

" `<leader>+qq` -- Close the QuickFix window
nnoremap <leader>qq :ccl<CR>

" `<leader>+qp` -- Close the Preview window
nnoremap <leader>qp :pc<CR>

" `<leader>+ql` -- Close the Location List window
nnoremap <leader>ql :lcl<CR>

" `<leader>+qb` -- Close the current buffer
nnoremap <leader>qb :bdel<CR>

" `<leader>+w / <leader>+s` -- Save the current buffer
nnoremap <leader>s :w<CR>
nnoremap <leader>w :w<CR>

" `<leader>+x` -- Save and exit the current buffer
" `ZZ` -- Save and exit the current buffer
nnoremap <leader>x :xit<CR>

" `<leader>+cd` -- Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" `<Leader>+p` -- Show the path of the current file
" Useful when you have a lot of splits and the status line gets truncated.
nnoremap <Leader>p :echo expand('%')<CR>

" `<leader>+e` -- Open new file adjacent to current file
" nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" `<leader>+e[s,v]` -- Edit file, starting in same directory as current file
" `<leader>+e`  -- Edit file in current buffer
" `<leader>+es` -- Edit file in new horizontal split
" `<leader>+ev` -- Edit file in new vertical split
nnoremap <leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>es :split <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>ev :vsplit <C-R>=expand('%:p:h') . '/'<CR>

" `vs` -- Edit file in a new vertical split
nnoremap vs :vsplit<Space>

" `<leader>+o` -- Close all buffers except for the current one
nnoremap <Leader>o :only<CR>

" `Ctrl+c / Ctrl+j` -- Map to Escape
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" `Shift+UP/DOWN` -- Move current line(s) up or down
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==

inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi

vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" `jj` -- Map to Escape
inoremap jj <ESC>

" `H` -- Go to the beginning of a line
noremap H ^

" `L` -- Go to the end of a line
noremap L $

" `Y` -- Yank characters under the cursor until the end
" This makes `Y` behave like `C` and `D`
nnoremap Y y$

" `vv` -- Highlight just the text (i.e. no indents) in a line
nnoremap vv ^vg_

" `n` / `N` -- Bring next/previous search result in middle of the screen
nnoremap n nzz
nnoremap N Nzz

" `G` -- Skip to bottom of file and place line in middle of the screen
nnoremap G :norm! Gzz<CR>

" `S` -- Split line (sister to [J]oin lines)
" nnoremap S i<CR><ESC>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" `J` -- Keep cursor in place when joining lines
nnoremap J mzJ`z

" `<return>` -- Insert a break at the cursor and enter insert mode
" nnoremap <CR> i<CR><ESC>I

" `<leader>+rt` -- Convert tabs to spaces
nnoremap <Leader>rt :retab<CR>

" `<leader>+tw` -- Remove trailing whitespace
nnoremap <leader>tw :%s/ \+$//<CR>

" `<leader>+sr` -- Search and replace the word under the cursor
nnoremap <Leader>sr :%s/\<<C-r><C-w>\>//g<Left><Left>


" ==============================================================================
" PLUGIN SETTINGS
" ==============================================================================

let plugin_settings='~/.config/vim/plugin_settings'
for fpath in split(globpath(plugin_settings, '*.vim'), '\n')
  exe 'source' fpath
endfor


" ==============================================================================
" HOST-SPECIFIC SETTINGS
" ==============================================================================

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

