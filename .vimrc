" 突出显示当前行
set cursorline

" 打开行号
set number

" 自动切换目录
set autochdir

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 去掉声音
set vb t_vb=

" 不生成交换文件
set noswapfile

" 语法高亮
syntax enable

" 打开文件类型检测功能
filetype plugin indent on

" 使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 输入Tab字符时,自动替换成空格
set expandtab

" 总是显示状态行
set laststatus=2

" 不显示模式
set noshowmode

" 显示颜色
set t_Co=256

" 统一缩进为4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 设置前缀键
let mapleader='/'

" 增强模式中的命令行自动完成操作
" 按Tab键显示命令,再Tab键遍历命令
set wildmenu

" 文件名自动补全
" 按":e"+文件名+Tab键 自动补全
set wildmode=list:longest,full

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=indent,eol,start

" vim基本快捷键
" 按"Ctrl+s" 保存
" 按"/q" 退出
" 按"/hf"+文件名+回车 水平创建或打开一个文件
" 按"/vf"+文件名+回车 垂直创建或打开一个文件
" 按"/ww /ws /wa /wd" 上下左右切换窗口
" 按"/he" 水平显示文件浏览
" 按"/ve" 垂直显示文件浏览
" 按"/t" 显示终端,结束按"ESC"键
nnoremap <silent> <Leader>s :w<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <Leader>hf :sp
nnoremap <leader>vf :vsp
nnoremap <silent> <Leader>wm <C-w>=
nnoremap <silent> <Leader>ww <C-w>k
nnoremap <silent> <Leader>ws <C-w>j
nnoremap <silent> <Leader>wa <C-w>h
nnoremap <silent> <Leader>wd <C-w>l
nnoremap <silent> <Leader>he :Sex<CR>
nnoremap <silent> <Leader>ve :Vex<CR>
nnoremap <silent> <Leader>t :terminal<CR>

" 头文件注释,适用于c/c++,go语言
func SetHeadComment()
    call setline(1,"/*================================================================")
    call append(line("."), "#文件名称：".expand("%:t"))
    call append(line(".")+1, "#创 建 者：九新")
    call append(line(".")+2, "#联系方式：jiuxin303@qq.com")
    call append(line(".")+3, "#创建日期：".strftime("%Y年%m月%d日"))
    call append(line(".")+4, "#描    述：")
    call append(line(".")+5, "#")
    call append(line(".")+6, "================================================================*/")
    call append(line(".")+7, "")
    call append(line(".")+8, "")
endfunc

" 设置头文件注释
" 输入"/h" 自动头文件补全
nnoremap <silent> <Leader>h :call SetHeadComment()<CR> G

call plug#begin('~/.vim/plugged')
" 主题
Plug 'NLKNguyen/papercolor-theme'
" 状态栏
Plug 'itchyny/lightline.vim'
" 彩虹括号
Plug 'luochen1990/rainbow'
" 自动添加括号或删除括号
Plug 'jiangmiao/auto-pairs'
" 快速注释
Plug 'preservim/nerdcommenter'
" 缓冲区
Plug 'ap/vim-buftabline'
" 快速搜索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" 标签
Plug 'majutsushi/tagbar'
" git状态栏
Plug 'tpope/vim-fugitive'
" 异步执行
Plug 'skywind3000/asyncrun.vim'
" 异步执行状态栏
Plug 'albertomontesg/lightline-asyncrun'
call plug#end()

" 底部状态栏设置
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename','asyncrun_status','modified' ]  
      \           ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'asyncrun_status': 'lightline#asyncrun#status'
      \ },
      \ }

" 设置vim主题
set background=dark
colorscheme PaperColor

" 彩虹括号
let g:rainbow_active = 1

" 快速注释
" 按"v"+方向键选中文本+"/c"+空格键 快速注释或反注释选的内容
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" 顶部缓冲器设置
" 按"/bn" 跳到下一个缓冲区
" 按"/bp" 跳到上一个缓冲区
" 按"/bd" 删除缓冲区
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprev<CR>
nnoremap <silent> <Leader>bd :bd<CR>

" 快速搜索设置
" 按"/ff" 搜索文件
" 按"/fb" 搜索缓冲区
" 按"/fh" 显示搜索历史
" 按"ft" 搜索已打开的文件
" 按"ESC" 退出
nnoremap <silent> <Leader>ff :FZF<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>ft :Lines<CR>

" 设置右侧标签
let g:tagbar_show_linenumbers = 1
let g:tagbar_autoclose = 1
nnoremap <silent> <Leader>tt :TagbarToggle<CR>

" 异步执行
" 按"/ar"+命令 可以执行命令
nnoremap <Leader>ar :AsyncRun 
