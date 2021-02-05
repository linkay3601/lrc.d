" 借鉴 Seamile 老师配置 .rc.d/vimrc
if filereadable(expand("$HOME/.rc.d/vimrc"))
    source $HOME/.rc.d/vimrc
endif

" 自定义配置
set nojoinspaces                             " 连接行时，忽略末尾特殊字符
set ttimeout timeoutlen=3000 ttimeoutlen=10  " 超时时间
set mouse=ni                                 " 启用鼠标
set colorcolumn=101                          " 界面标尺宽度
" hi ColorColumn ctermbg=gray
" set termguicolors                          " GUI 颜色支持
let g:mapleader = "\<Space>"

" 常用映射
unmap [r
unmap [o
unmap <C-j>
unmap <C-l>

vnoremap < <gv
vnoremap > >gv

inoremap <C-j> <C-o>o
inoremap <C-k> <C-o>O
inoremap <C-h> <C-o>I
inoremap <C-l> <C-o>A
inoremap <C-s> <Esc>:up<CR>

nnoremap <leader>U  gUaw
nnoremap <leader>u  guaw
nnoremap <leader>w] <C-w>+
nnoremap <leader>w[ <C-w>-
nnoremap <leader>ww <C-w><C-w>
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wq <C-w>q

nnoremap <leader>d  :nohl<CR>
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
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>ni :NERDTree ~/src<CR>
nnoremap <leader>ii :Vista!!<CR>
nnoremap <leader>ga :Git difftool -y<CR>
nnoremap <leader>gf :Ghdiffsplit<CR>
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>

" 插件管理、加载
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

color gruvbox

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
let g:NERDTreeDirArrowExpandable  = '🐳'
let g:NERDTreeDirArrowCollapsible = '💥'
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
let g:vista_fold_toggle_icons    = ['🐳', '💥']
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

let g:which_key_map.u = 'N 转换单词为小写'
let g:which_key_map.U = 'N 转换单词为大写'
let g:which_key_map.d = 'N 取消高亮搜索'
let g:which_key_map.f = 'LF 搜索 file'
let g:which_key_map.b = 'LF 搜索 buffer'
let g:which_key_map.h = 'LF 搜索 history command'
let g:which_key_map.s = 'LF 搜索 history search command'
let g:which_key_map.m = 'LF 搜索 method'
let g:which_key_map.l = 'LF 搜索 line'
let g:which_key_map.M = 'LF 搜索 Mru'

let g:which_key_map['?'] = {
    \ 'name': '+Prefix-Explain',
    \ 'n-'  : ['', 'Normal 模式'      ],
    \ 'i-'  : ['', 'Insert 模式'      ],
    \ 'v-'  : ['', 'Visual 模式'      ],
    \ 'm-'  : ['', 'Visual-Multi 模式'],
    \ 'l-'  : ['', 'LeaderF 模式'     ],
    \ 'N'   : ['', 'Normal 模式'      ],
    \ 'V'   : ['', 'Visual 模式'      ],
    \ 'I'   : ['', 'Insert 模式'      ],
    \ 'VM'  : ['', 'Visual-Multi 模式'],
    \ 'LF'  : ['', 'LeaderF 模式'     ],
    \ }

let g:which_key_map['+'] = {
    \ 'name': '+Ctrl',
    \ 'm-<C-⍐>': ['', '向上创建光标'                     ],
    \ 'm-<C-⍗>': ['', '向下创建光标'                     ],
    \ 'n-<C-N>': ['', '选中单词为 pattern ，并查找下一个'],
    \ 'v-<C-N>': ['', '选中可视区域为 pattern'           ],
    \ 'i-<C-O>': ['', '临时进入 Normal 模式'             ],
    \ 'n-<C-O>': ['', '跳转上一个位置'                   ],
    \ 'n-<C-I>': ['', '跳转下一个位置'                   ],
    \ 'n-<C-V>': ['', '可视化块模式'                     ],
    \ 'n-<C-A>': ['', 'Number + 1'                       ],
    \ 'n-<C-X>': ['', 'Number - 1'                       ],
    \ 'n-<C-F>': ['', '向下滚动一页'                     ],
    \ 'n-<C-B>': ['', '向上滚动一页'                     ],
    \ 'n-<C-D>': ['', '向下滚动半页'                     ],
    \ 'n-<C-U>': ['', '向上滚动半页'                     ],
    \ 'n-<C-G>': ['', '显示文件信息'                     ],
    \ 'l-<C-C>': ['', '退出'                             ],
    \ 'l-<C-R>': ['', '切换 Fuzzy/Regex'                 ],
    \ 'l-<C-F>': ['', '切换 FuzzyPath/NameOnly'          ],
    \ 'l-<C-V>': ['', '从剪切板粘贴'                     ],
    \ 'l-<C-U>': ['', '清除输入内容'                     ],
    \ 'l-<C-W>': ['', '向前删除单词'                     ],
    \ 'l-<C-J>': ['', '搜索结果中向上移动'               ],
    \ 'l-<C-K>': ['', '搜索结果中向下移动'               ],
    \ 'l-<C-X>': ['', '水平切分窗口并打开指定文件'       ],
    \ 'l-<C-]>': ['', '垂直切分窗口并打开指定文件'       ],
    \ 'l-<C-T>': ['', '新标签页打开指定文件'             ],
    \ 'l-<C-\>': ['', '打开文件前询问打开方式'           ],
    \ 'l-<C-S>': ['', '选中多个指定文件'                 ],
    \ 'l-<C-A>': ['', '选中全部文件'                     ],
    \ 'l-<C-L>': ['', '取消选中所有文件'                 ],
    \ 'l-<C-P>': ['', '预览结果'                         ],
    \ 'l-<C-⍐>': ['', '向上滚动预览窗口'                 ],
    \ 'l-<C-⍗>': ['', '向下滚动预览窗口'                 ],
    \ 'i-<C-k>': ['', '向上插入一行'                     ],
    \ 'i-<C-j>': ['', '向下插入一行'                     ],
    \ 'i-<C-h>': ['', '移动到行首插入'                   ],
    \ 'i-<C-l>': ['', '移动到行尾插入'                   ],
    \ }

let g:which_key_map['-'] = {
    \ 'name': '+Shift',
    \ 'm-<S-⍇>': ['', '向左选择字符'],
    \ 'm-<S-⍈>': ['', '向右选择字符'],
    \ 'i-<S-⍇>': ['', '左移一个单词'],
    \ 'i-<S-⍈>': ['', '右移一个单词'],
    \ }

let g:which_key_map.v = {
    \ 'name': '+Visual-Multi',
    \ '/': 'N 正则搜索，并添加 pattern'                 ,
    \ 'A': 'N 选中文件中所有匹配项'                     ,
    \ '\': 'N 在当前位置添加光标'                       ,
    \ 'a': 'N 光标字符对齐 |V 选中可视区域'             ,
    \ 'f': 'V 相当于 /<last-pattern>'                   ,
    \ 'w': 'VM 切换 word 模式'                          ,
    \ 'c': 'VM 切换 case 模式 |V 基于可视区域创建列光标',
    \ '>': 'VM 效果同 < 相同，且支持正则'               ,
    \ 'N': 'VM 光标前插入排序的 Number + 键入的内容'    ,
    \ '<': 'VM 键入字符使对齐，支持多字符'              ,
    \ 'g': {
        \ 'S': 'N 恢复 VM 最后退出时的状态',
        \ }
    \ }

let g:which_key_map.n = {
    \ 'name': '+NERDTree',
    \ 'n': 'N 显示/关闭 NERDTree',
    \ 'r': 'N 刷新 NERDTree'     ,
    \ 'f': 'N 展开当前文件位置'  ,
    \ 'i': 'N 展开工作目录'      ,
    \ }

let g:which_key_map.i = {
    \ 'name': '+Vista',
    \ 't': 'N 显示/关闭 Vista',
    \ }

let g:which_key_map.p = {
    \ 'name': '+Python',
    \ 'r': 'N 运行当前文件'      ,
    \ 'o': 'N 交互式运行当前文件',
    \ }

let g:which_key_map.a = {
    \ 'name': '+LeaderF-All-Search',
    \ 'm': 'LF 搜索 all function'    ,
    \ 'l': 'LF 搜索 all line'        ,
    \ 'b': 'LF 搜索 all buffer'      ,
    \ 'M': 'LF 搜索 all Mru'         ,
    \ 'c': 'LF 搜索 all self command',
    \ 'e': 'LF 搜索 all ex command'  ,
    \ }

let g:which_key_map.w = {
    \ 'name': '+Windows',
    \ 'w': 'N 移动到下一个窗口',
    \ 'j': 'N 移动到下侧窗口'  ,
    \ 'k': 'N 移动到上侧窗口'  ,
    \ 'h': 'N 移动到左侧窗口'  ,
    \ 'l': 'N 移动到右侧窗口'  ,
    \ 'q': 'N 关闭当前窗口'    ,
    \ ']': 'N 调整窗口尺寸 +'  ,
    \ '[': 'N 调整窗口尺寸 -'  ,
    \ }

let g:which_key_map.r = {
    \ 'name': '+Rg',
    \ }

let g:which_key_map.g = {
    \ 'name': '+Git',
    \ 'a': '调用 difftool 比较与上一次提交的差异'        ,
    \ 'f': '调用 difftool 比较当前文件与上一次提交的差异',
    \ }

let g:which_key_map.t = {
    \ 'name': '+Tabs',
    \ 'c': 'N 关闭当前标签页'  ,
    \ 'n': 'N 转到下一个标签页',
    \ 'p': 'N 转到上一个标签页',
    \ }

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader><Space> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader><Space> :<c-u>WhichKeyVisual '<Space>'<CR>
