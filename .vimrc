"-------------------------------------------------------
" .vimrc file
" Author: Girisha Durrel De Silva <girisha@girisha.net>
" Description: a newbie trying out his first .vimrc file
"-------------------------------------------------------

"-------------------------------------------------------
" pluggin executer pathogen 
" extracted from [https://github.com/tpope/vim-pathogen]
"-------------------------------------------------------

"
" set of pluggins used currently
"
" NERDTree [https://github.com/scrooloose/nerdtree]
" EasyMotion [https://github.com/Lokaltog/vim-easymotion]
" NERDCommenter [https://github.com/scrooloose/nerdcommenter]
" syntatic [https://github.com/scrooloose/syntastic]
" ctrlP [https://github.com/kien/ctrlp.vim]
" indentLine [https://github.com/Yggdroot/indentLine]
" AutoClose [https://github.com/vim-scripts/AutoClose]
"
execute pathogen#infect()

"
"  remove unwanted options on VIM (sometimes added by your distro), 
"  make it more like VIM and ~VI
"
set nocompatible

"
" show line number at the left hand corner
"
set number

"
" highlight text 
"
syntax on

"
" have a $ sign at the end of 'cw'
"
set cpoptions+=$

"
" set confirm dialog rather than the command failing
"
set confirm

"
" set show command, also show the ^=^ nice menu
"
set showcmd
set wildmenu


"
" Something needed with NERDCommenter
" see [https://github.com/scrooloose/nerdcommenter]
"
filetype plugin on

"
" set working directory.NO LONGER USED [ this will allow nerdtree to 
" open the directory structure from ~/Projects ]
" now nerdtree working directory will be the current working directory
"

" 
" set a level of smart indenting for C like languages
" 
" "map <F2> :set smartindent! <CR>
set autoindent
filetype plugin indent on

" cd ~/Projects
set autochdir
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>
" map <leader>t <plug>NERDTreeTabsToggle<CR>
" let g:nerdtree_tabs_open_on_console_startup=1


"-------------------------------------------------------
" * Mapped Keys
" 
" 1. <F5> :  check spelling [needed for documents] 
"-------------------------------------------------------

"
" spell check toggle key
" mapped key <F5>
" language en_us
"
map <F5> :setlocal spell! spelllang=en_us<CR>

"
" mapped CTRL + L for NERDTREE toggle in normal mode
"
nmap <silent> <C-L> :NERDTreeToggle<CR>

"
" using the autoclose plugin. sometimes its very annoying to 
" add the semicolon ';' at the end of the line.
" mapped \; in the insert mode to add the semi-colon at the 
" end of the line 
"
inoremap <leader>; <C-o>A;

"
" used with the syntatic plugin. creates a file .syntatic_java_config
" where you can specify the class path for javac compilation 
" the file can be populated by typing in the buffer when 
" :SyntasticJavacEditClasspath (ex command) is executed.
"
let g:syntastic_java_javac_config_file_enabled = 1


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'

" 
" configuration for coding 
"

"
" insert spaces when tab is pressed
"
set expandtab 

"
" tabstop: number of spaces to show for a tab
" softtabstop: number of spaces to insert when a 
" tab is pressed
"
set tabstop=4
set softtabstop=4

"
" number of spaces when indenting >> << 
"
set shiftwidth=4

"
" number of characters per line
"
set textwidth=80
set formatoptions+=t

"
" set smarter tabs
"
set smarttab
