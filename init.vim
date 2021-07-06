"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" conmmon config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "
set number
" Set to auto read when a file is changed from the outside
set autoread
" Enable filetype plugins
filetype plugin on
filetype indent on
" 防止文件未保存而无法跳转
set hidden
" 设置swap文件到硬盘时间，默认4000（4s）
set updatetime=100
"选项用于设置Vim缩短消息长度的标志位列表，例如，shortmess=m 表示用 “[+]” 代替 “[Modified]”
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 禁止生成临时文件
set nobackup
set noswapfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Turn on the Wild menu
set wildmenu
" show cmd
set showcmd
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set belloff=all

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l
"" Uncomment the following to have Vim jump to the last position when       
" reopening a file                                                         
if has("autocmd")                                                          
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
set t_Co=256

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
" set cursor
autocmd InsertEnter,InsertLeave * set cul!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab
set smartindent

"设置tab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast save all buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>w :wa<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
command! BufOnly execute '%bdelete|edit #|normal `"'
map <leader>bo :BufOnly<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
map <leader>H :bfirst<cr>
map <leader>L :blast<cr>
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>e :e! ~/.config/nvim/init.vim<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" " - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/pluged')
Plug 'junegunn/vim-easy-align'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编辑文件
" enhence . cmd
Plug 'tpope/vim-repeat'
" change surround
Plug 'tpope/vim-surround'
" fast select
Plug 'gcmt/wildfire.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color 
Plug 'morhetz/gruvbox'
" monokai 主题
Plug 'sickill/vim-monokai'
"状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bfrg/vim-cpp-modern'
" 括号多重色彩
Plug 'luochen1990/rainbow'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'honza/vim-snippets'
" 括号补全
Plug 'Raimondi/delimitMate'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags 
Plug 'ludovicchabant/vim-gutentags'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"查找
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mileszs/ack.vim'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码风格
Plug 'rhysd/vim-clang-format'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"mark down
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
" " Initialize plugin system
 call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"leader F
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-b>'
noremap <c-n> :LeaderfMru<cr>
noremap <c-f> :LeaderfFunction<cr>
noremap <c-b> :LeaderfBuffer<cr>
noremap <c-t> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"coc config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动安装coc 扩展
let g:coc_global_extensions = ['coc-json','coc-vimlsp', 'coc-snippets', 'coc-highlight', 'coc-explorer', 'coc-cmake' ]
"let g:coc_global_extensions = ['coc-json','coc-vimlsp', 'coc-snippets', 'coc-highlight', 'coc-cmake' ]
" 设置合并左侧行号状态
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" tab 选择待选
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
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>d :CocList diagnostics<cr>   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"explorer
:nnoremap <leader>n :CocCommand explorer<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./.tags;,.tags
noremap <leader>t :tselect<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ack search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ?    a quick summary of these keys, repeat to close
" o    to open (same as Enter)
" O    to open and close the quickfix window
" go   to preview file, open but maintain focus on ack.vim results
" t    to open in new tab
" T    to open in new tab without moving to it
" h    to open in horizontal split
" H    to open in horizontal split, keeping focus on the results
" v    to open in vertical split
" gv   to open in vertical split, keeping focus on the results
" q    to close the quickfix window
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" don't want to jump to the first result automatically
cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>a :Ack!<Space>
vnoremap <leader>a  :<C-u>call VisualSelection('', '')<CR>:Ack<Space><C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" aire line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" aire line theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='badwolf'
"let g:airline_theme='simple'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme monokai
colorscheme gruvbox
"关闭边框
set signcolumn=no

"括号多重色彩
let g:rainbow_active = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mark down 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clang format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
