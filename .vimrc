"encoding: utf-8
set encoding=utf-8
"Define shortcut key, namely <Leader>
let mapleader=";"

command W w !sudo tee "%" > /dev/null
" clipboard seriously slow down startup speed in X11 mode.
" https://stackoverflow.com/questions/14635295/vim-takes-a-very-long-time-to-start-up
set clipboard=exclude:.*
"Define shortcut key of system clipboard yank and paste (useless when upper
"setting uncomment).
"vnoremap <Leader>y "+y
"nmap <Leader>p "+p
" Define shortcut of yank and paste to an random selected register x.
vnoremap <Leader>y "xy
nmap <Leader>p "xp

"Define shortcut key close this split window
nmap <Leader>q :q<CR>
"Define shortcut save content of this window
nmap <Leader>w :w<CR>
"quit vim without do anything
nmap <Leader>Q :q!<CR>
"Sequence traverse child windows
"nnoremap nw <C-W><C-W>
"Jump to right window
nnoremap <Leader>lw <C-W>l
"Jump to left window
nnoremap <Leader>hw <C-W>h
"Jump to up window
nnoremap <Leader>kw <C-W>k
"Jump to down window
nnoremap <Leader>jw <C-W>j
"Spell checking
"set spell
"inoremap <Leader>cs <C-X>s

""Set python3 path(only for python3/dyn)
"set pythonthreedll=libpython3.8.so

" vundle 环境设置
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Appearance
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
"Display markers
"Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-protodef'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'
Plugin 'tamarin-prover/editors'
call vundle#end()

"Make setting with immediate effect
"Note: may trigger abnormal in tagbar+NERDTree
autocmd BufWritePost $MYVIMRC source $MYVIMRC

syntax enable
set number
set autoindent
set backspace=indent,eol,start
"Load relavant plugin according to detected file type
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete

"Set colorscheme dark | light
set background=dark

"colorscheme default
colorscheme gruvbox
"transparent background
highlight Normal ctermbg=None

"Always show status bar
set laststatus=2
"Show cursor position
set ruler
"Show line
set number
"Highlight current line/column
"set cursorline
"set cursorcolumn
"Highlight search result
set hlsearch

"show inputing cmd
set showcmd
"auto complete menu cmd
set wildmenu

"Expand tab to space
set expandtab
"Set space number of tab when edit
set tabstop=4
"Set space number of tab when format
set shiftwidth=4
"Continued space number that can be considered as tab
set softtabstop=4

" Folding Setting
" REF: https://vim.fandom.com/wiki/Folding#Folding_by_expression
"Set fold mode indent/syntax
set foldmethod=indent
"set foldmethod=syntax
"stop fold when vim start
set nofoldenable

" Load Plugins' Settings
let settingPath = '~/.vim/setting.vim'
if filereadable(expand(settingPath))
    exe 'source' settingPath
endif

"### Recursive find customize config file <.cust.vim>
function! CheckForCustomConfiguration()
    "check for .vim in the directory containing the newly opened file
    let file_path = expand('%:p:h')
    while file_path != '/'
        let config_file = file_path . '/.cust.vim'
        "echo config_file
        if filereadable(config_file)
            exe 'source' config_file
            break
        endif
        let file_path = fnamemodify(file_path, ':h')
    endwhile
endfunction

au BufNewFile,BufRead *.[ch] call CheckForCustomConfiguration()

" Integrate lf
let lfvim = '~/.vim/lf.vim'
if filereadable(expand(lfvim))
    exec "source " lfvim
endif

nnoremap <leader>lf :LF<cr>
