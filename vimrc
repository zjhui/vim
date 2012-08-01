""""""""""""""""""""""
"" set for vundle
""""""""""""""""""""""
set nocompatible	" 关闭vi兼容模式
filetype off        " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-markdown'

" vim-scripts repos
Bundle 'calendar.vim'
Bundle 'vimwiki'
Bundle 'fcitx.vim'

filetype plugin indent on
"""""""""""""""""""""""""

set number  
set cursorline	" 突出显示当前行
set ruler   " 打开状态栏标尺
set nobackup	     " 覆盖文件时不备份
set autochdir	    " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes	" 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan		 " 禁止在搜索到文件两端时重新搜索
set incsearch		" 输入搜索内容时就显示搜索结果
set hlsearch		" 搜索时高亮显示被找到的文本
set magic		" 设置魔术
let &termencoding=&encoding
set fileencodings=utf-8,gbk
""""""""""""""""""""""""""""""""""""""""""""""""""
" No sound on errors
""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells	" 关闭错误信息响铃
set novisualbell	" 关闭使用可视响铃代替呼叫
set t_vb=		" 置空错误铃声的终端代码

set hidden		" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent		    " 开启新行时使用智能自动缩进
set backspace=indent,eol,start	    " 不设定在插入状态无法用退格键和 Delete 键删除回车符

set cmdheight=1		 " 设定命令行的行数为 1

set timeout timeoutlen=3000 ttimeoutlen=100 " 将ttimeoutlen设置为较少的值，防止fcitx.vim在退出插入模式时较严重的延时

""""""""""""""""""""""""""""""""""""""""""""""""""
" for pathogen.vim
""""""""""""""""""""""""""""""""""""""""""""""""""
" call pathogen#runtime_append_all_bundles()
" call pathogen#infect()
syntax on   " 语法高亮
filetyp plugin indent on   " 开启插件

""""""""""""""""""""""""""""""""""""""""""""""""""
" set colors
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized


""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4    " 设定 <<和>> 命令移动时的宽度为 4
set tabstop=4
set smarttab

set lbr
set textwidth=500

set ai
set si
set wrap

if has("autocmd")
	filetype plugin indent on " 根据文件进行缩进
	augroup vimrcEx
		au!
		autocmd FileType text setlocal textwidth=78
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\ exe "normal! g`\"" |
					\ endif
	augroup END
else
	set autoindent " always set autoindenting on 智能缩进
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" calendar
""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F8> :Calendar<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""

" use mouse mappings from vimwiki-local-mappings
let g:vimwiki_use_mouse = 1

" don't use CamelCased(驼峰式词组) words
let g:vimwiki_camel_case = 0

" set vimwiki_list
let g:vimwiki_list = [{'path': '~/vimwiki/wiki/', 
                \ 'path_html': '~/vimwiki/html/'}]

"""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

"""""""""""""""""""""""""""""""
" ack
"""""""""""""""""""""""""""""""
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"""""""""""""""""""""""""""""""
" CTRL_X_K 自动补全
""""""""""""""""""""""""""""""""
set dictionary+=/usr/share/dict/words
set isk+=-

""""""""""""""""""""""""""""""""
" 显示文件状态及使用tab进行缓冲区切换
" see :help windows.txt
""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=%F:\ %l
set hidden " in order to switch between buffers with unsaved change
map <s-tab> :bp<cr>
map <tab> :bn<cr>
