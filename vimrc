" Seamile 老师配置
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"自定义
set t_Co=256
set background=dark     "背景色
set nu
set nocompatible        "非兼容模式
set ruler               "在左下角显示当前文件所在行
set report=0            "显示修改次数
set nobackup            "无备份
set fileencodings=ucs-bom,UTF-8,GBK,BIG5,latin1
set fileencoding=UTF-8
set fileformat=unix     "换行使用unix方式
set wrap
set linebreak
set ambiwidth=double
set noerrorbells        "不显示响铃
set visualbell          "可视化铃声
set foldmarker={,}      "缩进符号
set foldmethod=indent   "缩进作为折叠标识
set foldlevel=100       "不自动折叠
set foldopen-=search    "搜索时不打开折叠
set foldopen-=undo      "撤销时不打开折叠
set updatecount=0       "不使用交换文件
set magic               "使用正则时，除了$ . * ^以外的元字符都要加反斜线

"缩进定义
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set backspace=2     "退格键可以删除任何东西

" 当前行高亮
set cursorline
highlight CursorLine cterm=none    ctermfg=none     ctermbg=235
highlight LineNr     cterm=none    ctermfg=gray     ctermbg=none

" 搜索结果高亮
set hlsearch
highlight Search     cterm=none    ctermfg=black    ctermbg=blue

" vimdiff 高亮
highlight DiffAdd    cterm=reverse ctermfg=darkcyan ctermbg=black
highlight DiffDelete cterm=none    ctermfg=gray     ctermbg=239
highlight DiffChange cterm=none    ctermfg=none     ctermbg=239
highlight DiffText   cterm=bold    ctermfg=yellow   ctermbg=darkred

auto BufWritePre * sil %s/\s\+$//ge "保存时删除行尾空白

" -----------------------------------------------------------------------------
" 我的配置
set nojoinspaces                             " 连接行时，忽略末尾特殊字符
set ttimeout timeoutlen=3000 ttimeoutlen=10  " 超时时间
set mouse=ni                                 " 启用鼠标
set colorcolumn=101                          " 界面标尺宽度
let g:mapleader = "\<Space>"

" 映射常用操作
vnoremap < <gv
vnoremap > >gv

inoremap <C-j> <C-o>o
inoremap <C-k> <C-o>O
inoremap <C-h> <C-o>I
inoremap <C-l> <C-o>A
inoremap <C-s> <Esc>:up<CR>

nnoremap <C-h> :bNext<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-j> :bfirst<CR>
nnoremap <C-k> :blast<CR>

nnoremap <leader>u  guaw
nnoremap <leader>U  gUaw
nnoremap <leader>w] <C-w>+
nnoremap <leader>w[ <C-w>-
nnoremap <leader>ww <C-w><C-w>
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wq <C-w>q

nnoremap <leader>d  :nohl<CR>
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>pr :!python %<CR>
nnoremap <leader>po :!python -i %<CR>

nnoremap <leader>h  :LeaderfHistoryCmd<CR>
nnoremap <leader>s  :LeaderfHistorySearch<CR>
nnoremap <leader>m  :LeaderfFunction<CR>
nnoremap <leader>l  :LeaderfLine<CR>
nnoremap <leader>M  :LeaderfMruCwd<CR>
nnoremap <leader>am :LeaderfFunctionAll<CR>
nnoremap <leader>ab :LeaderfBufferAll<CR>
nnoremap <leader>aM :LeaderfMru<CR>
nnoremap <leader>al :LeaderfLineAll<CR>
nnoremap <leader>ac :LeaderfSelf<CR>
nnoremap <leader>ae :LeaderfCommand<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>:NERDTreeRefreshRoot<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>ni :NERDTree ~/src<CR>
nnoremap <leader>ii :Vista!!<CR>
nnoremap <leader>ga :Git difftool -y<CR>
nnoremap <leader>gf :Ghdiffsplit<CR>

" 插件管理
call plug#begin('~/.vim/plugged')
Plug 'liuchengxu/vim-which-key'                               "
Plug 'mg979/vim-visual-multi', {'branch': 'master'}           "
Plug 'mhinz/vim-startify'                                     "
Plug 'vim-airline/vim-airline'                                "
Plug 'Yggdroot/indentLine'                                    "
Plug 'preservim/nerdtree'                                     "
Plug 'ryanoasis/vim-devicons'                                 "
Plug 'tpope/vim-fugitive'                                     "
Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}  "
Plug 'neoclide/coc.nvim', {'branch': 'release'}               "
Plug 'ludovicchabant/vim-gutentags'                           "
Plug 'liuchengxu/vista.vim'                                   "
Plug 'morhetz/gruvbox'                                        "
Plug 'honza/vim-snippets'                                     "
Plug 'puremourning/vimspector'                                "
call plug#end()

color desert

" 插件 vim-startify 配置
let g:startify_custom_header = [
\ '  __     ___           ',
\ '  \ \   / (_)_ __ ___  ',
\ '   \ \ / /| | ''_ ` _ \',
\ '    \ V / | | | | | | |',
\ '     \_/  |_|_| |_| |_|',
\ '',
\ '',
\ ]

" 插件 vim-airline 配置
let g:airline_powerline_fonts                 = 1
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter    = 'unique_tail'

" 插件 LeaderF 配置
let g:Lf_PreviewInPopup       = 1
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_WindowPosition       = 'popup'
let g:Lf_RootMarkers          = ['.git', '.hg', '.svn', '.venv']
let g:Lf_StlSeparator         = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "Hack Nerd Font Mono" }
let g:Lf_PreviewResult        = {'Function': 0, 'BufTag': 0 }

" 插件 vim-visual-multi 配置
let g:VM_leader            = '<Space>v'
let g:VM_theme             = 'iceblue'
let g:VM_highlight_matches = 'underline'
let g:VM_maps              = {}

let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

" 插件 nerdtree 配置
let g:NERDTreeDirArrowExpandable  = '☢︎'
let g:NERDTreeDirArrowCollapsible = '☠︎'
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" 插件 vim-gutentags 配置
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('$HOME/.cache/tags')
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags

" 插件 Vista 配置
let g:vista_fold_toggle_icons    = ['☢︎', '☠︎']
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive    = 'ctags'

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" COC 插件 coc-snippets 配置
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" 插件 vim-which-key 配置
let g:which_key_sort_horizontal  = 1
let g:which_key_use_floating_win = 0
let g:which_key_position         = 'topleft'
let g:which_key_map              = {}

let g:which_key_map.u = 'N Translate lower'
let g:which_key_map.U = 'N Translate upper'
let g:which_key_map.d = 'N Cancel search highlight'
let g:which_key_map.f = 'LF Search file'
let g:which_key_map.b = 'LF Search buffer'
let g:which_key_map.h = 'LF Search history command'
let g:which_key_map.s = 'LF Search history search command'
let g:which_key_map.m = 'LF Search method'
let g:which_key_map.l = 'LF Search line'
let g:which_key_map.M = 'LF Search Mru'

let g:which_key_map['?'] = {
    \ 'name': '+Prefix-Explain',
    \ 'n-'  : ['', 'Normal Mode'],
    \ 'i-'  : ['', 'Insert Mode'],
    \ 'v-'  : ['', 'Visual Mode'],
    \ 'm-'  : ['', 'Visual-Multi Mode'],
    \ 'l-'  : ['', 'LeaderF Mode'],
    \ 'N'   : ['', 'Normal Mode'],
    \ 'V'   : ['', 'Visual Mode'],
    \ 'I'   : ['', 'Insert Mode'],
    \ 'VM'  : ['', 'Visual-Multi Mode'],
    \ 'LF'  : ['', 'LeaderF Mode'],
    \ }

let g:which_key_map['+'] = {
    \ 'name': '+Ctrl',
    \ 'm-<C-⍐>': ['', 'Create the cursor up'],
    \ 'm-<C-⍗>': ['', 'Create the cursor down'],
    \ 'n-<C-N>': ['', 'Select the word as pattern and find the next one'],
    \ 'v-<C-N>': ['', 'Select the visual area as pattern'],
    \ 'i-<C-O>': ['', 'Temporarily enter Normal mode'],
    \ 'n-<C-O>': ['', 'Jump to the previous position'],
    \ 'n-<C-I>': ['', 'Jump to the next position'],
    \ 'n-<C-V>': ['', 'Visual block mode'],
    \ 'n-<C-A>': ['', 'Number + 1'],
    \ 'n-<C-X>': ['', 'Number - 1'],
    \ 'n-<C-F>': ['', 'Scroll down one page'],
    \ 'n-<C-B>': ['', 'Scroll down one page'],
    \ 'n-<C-D>': ['', 'Scroll down half a pag'],
    \ 'n-<C-U>': ['', 'Scroll up half a pag'],
    \ 'n-<C-G>': ['', 'Displays file information'],
    \ 'n-<C-H>': ['', 'Go to the previous buffer'],
    \ 'n-<C-L>': ['', 'Go to the next buffer'],
    \ 'n-<C-J>': ['', 'Go to the first buffer'],
    \ 'n-<C-K>': ['', 'Go to the last buffer'],
    \ 'l-<C-C>': ['', 'exit'],
    \ 'l-<C-R>': ['', 'Switch Fuzzy/Regex'],
    \ 'l-<C-F>': ['', 'Switch FuzzyPath/NameOnly'],
    \ 'l-<C-V>': ['', 'Paste from the cutboard'],
    \ 'l-<C-U>': ['', 'Clear the input'],
    \ 'l-<C-W>': ['', 'Delete the word forward'],
    \ 'l-<C-J>': ['', 'Move down in search results'],
    \ 'l-<C-K>': ['', 'Move up in search results'],
    \ 'l-<C-X>': ['', 'Cut the window horizontally and open the specified file'],
    \ 'l-<C-]>': ['', 'Cut the window vertically and open the specified file'],
    \ 'l-<C-T>': ['', 'The new tab opens the specified file'],
    \ 'l-<C-\>': ['', 'Ask how to open the file before opening it'],
    \ 'l-<C-S>': ['', 'Select more than one file'],
    \ 'l-<C-A>': ['', 'Select all files'],
    \ 'l-<C-L>': ['', 'Uncheck all files'],
    \ 'l-<C-P>': ['', 'Preview the results'],
    \ 'l-<C-⍐>': ['', 'Scroll up the preview window'],
    \ 'l-<C-⍗>': ['', 'Scroll down the preview window'],
    \ 'i-<C-K>': ['', 'Insert a row up'],
    \ 'i-<C-J>': ['', 'Insert one line down'],
    \ 'i-<C-H>': ['', 'Move to the top of the line to insert'],
    \ 'i-<C-L>': ['', 'Move to the end of the line to insert'],
    \ }

let g:which_key_map['-'] = {
    \ 'name': '+Shift',
    \ 'm-<S-⍇>': ['', 'Select characters to the right'],
    \ 'm-<S-⍈>': ['', 'Select characters to the left'],
    \ 'i-<S-⍇>': ['', 'Move one word left'],
    \ 'i-<S-⍈>': ['', 'Move one word right'],
    \ }

let g:which_key_map.v = {
    \ 'name': '+Visual-Multi',
    \ '/': 'N Regular search and add pattern',
    \ 'A': 'N Select all matches in the file',
    \ '\': 'N Add cursor at current position',
    \ 'a': 'N Cursor character alignment |V Select the visible area',
    \ 'f': 'V Same as /<last-pattern>',
    \ 'w': 'VM Switch word mode',
    \ 'c': 'VM Switch case mode |V Create a column cursor based on the visible area',
    \ '>': 'VM Same as <and supports regular',
    \ 'N': 'VM Insert the sorted Number + typed content before the cursor',
    \ '<': 'VM Type characters to align, support multiple characters',
    \ 'g': {
        \ 'S': 'N Restore the state of the VM when it was last exited',
        \ }
    \ }

let g:which_key_map.n = {
    \ 'name': '+NERDTree',
    \ 'n': 'N Show/close NERDTree',
    \ 'r': 'N Refresh NERDTree',
    \ 'f': 'N Expand current file location',
    \ 'i': 'N Expand working directory',
    \ }

let g:which_key_map.i = {
    \ 'name': '+Vista',
    \ 't': 'N Show/turn off Vista',
    \ }

let g:which_key_map.p = {
    \ 'name': '+Python',
    \ 'r': 'N Run the current file',
    \ 'o': 'N Run the current file interactively',
    \ }

let g:which_key_map.a = {
    \ 'name': '+LeaderF-All-Search',
    \ 'm': 'LF Search all function',
    \ 'l': 'LF Search all line',
    \ 'b': 'LF Search all buffer',
    \ 'M': 'LF Search all Mru',
    \ 'c': 'LF Search all self command',
    \ 'e': 'LF Search all ex command',
    \ }

let g:which_key_map.w = {
    \ 'name': '+Windows',
    \ 'w': 'N Move to the next window',
    \ 'j': 'N Move to the window below',
    \ 'k': 'N Move to the window above',
    \ 'h': 'N Move to the left window',
    \ 'l': 'N Move to the right window',
    \ 'q': 'N Close the current window',
    \ ']': 'N Resize the window +',
    \ '[': 'N Resize the window -',
    \ }

let g:which_key_map.r = {
    \ 'name': '+Rg',
    \ }

let g:which_key_map.g = {
    \ 'name': '+Git',
    \ 'a': 'N Call difftool to compare the difference from the last commit',
    \ 'f': 'N Call difftool to compare the difference between the current file and the last commit',
    \ }

let g:which_key_map.t = {
    \ 'name': '+Tabs',
    \ 'c': 'N Close the current tab',
    \ 'n': 'N Go to the next tab',
    \ 'p': 'N Go to the previous tab',
    \ }

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader><Space> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader><Space> :<c-u>WhichKeyVisual '<Space>'<CR>
