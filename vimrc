" My own stuff {{{
"Sets the character encoding used inside Vim.
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" }}}

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'drmingdrmer/xptemplate'
Bundle 'scrooloose/nerdtree'
Bundle 'ctrlp.vim'
Bundle 'DrawIt'
"Bundle 'spolu/dwm.vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'a.vim'
Bundle 'peaksea'
"Bundle 'taglist.vim'
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" My own stuff {{{
"colorscheme desert
set nu
filetype plugin indent on     " required!

" TAB key width
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab 

set smartindent
" 当vim 启动是自动加载当前目录下的tags文件。
set tags=./tags;
" tagbar settings
let g:tagbar_right = 1
nnoremap <silent> <F9> :TagbarToggle<CR>

""  设置cscope
if has("cscope")
        " add any database in current directory
        set nocsverb
        if filereadable("cscope.out")
                cs add cscope.out
        elseif filereadable("../cscope.out")
                cs add ../cscope.out
        elseif filereadable("../../cscope.out")
                cs add ../../cscope.out
        elseif filereadable("../../../cscope.out")
                cs add ../../../cscope.out
        endif
        set csverb
        set csto=0

        "" 设置ctrl-] 或 :tag命令使用cscopetag 而不是默认的:tag命令的行为。
        set cscopetag

        "" 设置cscope 使用 quickfix
        set cscopequickfix=s-,c-,d-,i-,t-,e-

        "" 快捷键设置
        nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif

"" 设置minibufexpleror {{{
" 不让minibufexpleror自动启动。
let g:miniBufExplorerAutoStart = 0
nmap mb :MBEToggle<cr>
""不从屏幕的边沿打开
"let g:miniBufExplSplitToEdge = 0
"" 允许使用C-TAB/C-S-TAB来向前向后显示windows
"noremap <C-TAB>   :MBEbn<CR>
"noremap <C-S-TAB> :MBEbp<CR>
"" }}} minibufexpl

"" 开启可以使用类vim 上下左右移动的方式来操作窗口(window), ctrl-[hjkl]
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

"" 允许使用 ctrl-[上|下|左|右]键来操作窗口(window).
noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l

" Syntastic Settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_signs=1
highlight SyntasticErrorSign guifg=white guibg=red
let g:syntastic_auto_loc_list = 1
"let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 6
let g:syntastic_auto_jump=1
let g:syntastic_ignore_files=['^/usr/include/', '\c\.h$']
" }}} Syntastic

" YCM settings {{{
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf='/home/bryton/code/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist=['~/code/styleCombine3/*','!~/*']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" }}}

"" 正如之前看到的cscope和Syntastic使用了quickfix(location-list)
"" 所以在这里为了加快浏览速度定以了如下快捷键。
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>
nmap <F2> :lnext<cr>
nmap <F3> :lp<cr>


" save cursor location, when vim open same file in the next time, cursor will
" move to the saved location.
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" enable 265 colors terminal.
if ! has("gui_running") 
        set t_Co=256 
endif 

" vimdiff setting.
if &diff
    " if vim run as vimdiff, choose peaksea colorschema will be fun.
    set background=dark
    colors peaksea


    let g:syntastic_check_on_open = 0
endif
