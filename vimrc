set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Plugin 'kopischke/vim-stay'

"添加nerdtree插件
Plugin 'scrooloose/nerdtree'
"使用tab键切换窗口与目录树
Plugin 'jistr/vim-nerdtree-tabs'
"注释插件
Plugin 'preservim/nerdcommenter'

"添加PEP8代码风格检查
Plugin 'nvie/vim-flake8'

"自动缩进
Plugin 'vim-scripts/indentpython.vim'

"配色方案
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

"在vim的normal模式下搜索文件
Plugin 'kien/ctrlp.vim'
"Powerline状态栏
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'yegappan/grep'

Plugin 'skywind3000/asyncrun.vim'

"python 缩进显示
Plugin 'Yggdroot/indentLine'

"python 代码格式化
Plugin 'tell-k/vim-autopep8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"设置显示powerline
set laststatus=2
"设置分割窗口
set splitbelow
set splitright
"设置窗口移动快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"设置按F2启动NerdTree
map <F2> :NERDTreeToggle<CR>

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"关闭加载.ycm_extra_conf.py提示
"let g:ycm_confirm_extra_conf=0

" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"force recomile with syntastic
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"let g:ycm_autoclose_preview_window_after_completion=1

"隐藏目录树种的.pyc文件
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"设置主题颜色，以及设置快捷键F5
set t_Co=256
set background=dark
if has('gui_running')
  colorscheme solarized
else
  colorscheme molokai
  let g:molokai_original=1
endif
call togglebg#map("<F3>")

if &diff
    colors blue
endif

"开启代码折叠
set foldmethod=indent
set foldlevel=99
"设置快捷键为空格
nnoremap <space> za
"显示折叠代码的文档字符串
"let g:SimpylFold_docstring_preview=1

" python代码缩进PEP8风格
au BufNewFile,BufRead *.py,*.pyw set tabstop=4
au BufNewFile,BufRead *.py,*.pyw set softtabstop=4
au BufNewFile,BufRead *.py,*.pyw set shiftwidth=4
au BufNewFile,BufRead *.py,*.pyw set expandtab
au BufNewFile,BufRead *.py,*.pyw set textwidth=79
au BufNewFile,BufRead *.py,*.pyw set autoindent
au BufNewFile,BufRead *.py,*.pyw set fileformat=unix

"对其他文件类型设置au命令
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2
"高亮显示行伟不必要的空白字符
highlight Whitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Whitespace /\s\+$\ \+/
"设置行号显示
set nu

"设置utf-8编码
set encoding=utf-8

let python_highlight_all=1
syntax on
filetype plugin indent on
set backspace=indent,eol,start
set cursorline
set history=1000
set fileencodings=utf-8,gb18030,utf-16,big5
set hlsearch
set clipboard=unnamed
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

" 设置折叠
set viewoptions=cursor,folds,slash,unix
let g:fastfold_savehook = 0


" let g:ycm_global_ycm_extra_conf='/home/zhangsong/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
nnoremap <leader>jdx :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gtr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gti :YcmCompleter GoToImplementation<CR>
nnoremap <leader>gts :YcmCompleter GoToSymbol<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
