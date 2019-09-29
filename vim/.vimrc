call plug#begin('$HOME/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'justinmk/vim-dirvish'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --rust-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sbdchd/neoformat'
Plug 'rust-lang/rust.vim'
call plug#end()


filetype plugin indent on

let mapleader=";"
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
" 停止当前搜索高亮
nmap <Leader>n :nohl<CR>

" 显示行号
set number
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" 鼠标滚动,所有模式
set mouse=a

" 使用 utf-8 编码
set encoding=utf-8
" 在底部显示当前键入的指令
set showcmd
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" delete键配置成增强模式
set backspace=indent,eol,start
" vim 自身命令行模式智能补全
set wildmenu

" 启用256色
set t_Co=256

" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 配色方案
syntax enable
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme monokai
"colorscheme molokai
"colorscheme phd

set colorcolumn=80

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 不创建交换文件
set noswapfile
" 不创建备份文件
set nobackup
" 打开文件监视，如果在编辑过程中文件发生外部改变，发出提示。
set autoread
" 出错时，不要发出响声
set noerrorbells
" 光标遇到括号时，自动高亮对应的另一个括号
set showmatch
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable


if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif



" === dirvish ===
nmap <Leader>fl :Dirvish<CR>



" === LeaderF ===
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
nmap <Leader>lm :LeaderfMru<CR>
nmap <Leader>lf :LeaderfFunction!<CR>
nmap <Leader>lb :LeaderfBuffer<CR>
nmap <Leader>lt :LeaderfTag<CR>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}



" === vim-gutentags ===
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
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



" === YCM ===
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" go to definition
nnoremap <leader>gt :YouCompleteMe GoTo<CR>
" 跳转到定义
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
" goto doc
nnoremap <leader>gc :YcmCompleter GetDoc<CR>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 开启 YCM 标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" ycm指定python
let g:ycm_python_interpreter_path = '/usr/local/bin/python3'
" C family Completion Path
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/.ycm_extra_conf.py'

if has('python3')
  silent! python3 1
endif

" 指定rust src目录
let g:ycm_rust_src_path = '$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }



" === rust.vim ===
let g:rustfmt_autosave = 1
let g:rust_use_custom_ctags_defs = 1  " if using rust.vim



" === vim-go ===
" 禁止自动下载
let g:go_disable_autoinstall = 0
" golang高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" golint
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow



" === vim-indent-guides ===
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle



" === signify ===
" 强制显示侧边栏
set signcolumn=yes



" === ale ===
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta



" === airline ===
" enable airline tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
 " 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>



" === ack ===
let g:ackprg = 'ag --nogroup --nocolor --column'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>



" === neoformat ===
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1



" === cscope ===
if has("cscope")
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag
    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0
    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    " show msg when any other cscope db added
    set cscopeverbose
    " key map
    nmap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
endif



" === ctags ===
set tags=./.tags;,.tags

