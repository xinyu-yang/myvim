set encoding=utf-8
set shell=/bin/bash

"Define shortcut key, namely <Leader>
let mapleader=";"

"Save privilidged files.
command W w !sudo tee "%" > /dev/null

"Define shortcut key of system clipboard yank and paste (useless when upper
"setting uncomment).
""vnoremap <Leader>y "+y
""nmap <Leader>p "+p
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

"Open tag lists after Ctrl-]
noremap <Leader>ts :ts<CR>

"Set python3 path(only for python3/dyn)
"set pythonthreedll=libpython3.8.so


"***************** Plugins Begin ***************
call plug#begin('~/.config/nvim/plugged')
" Vim Appearance
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chrisbra/Colorizer'

" Display markers
"Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'

" Search
Plug 'dyng/ctrlsf.vim'
"Plug 'terryma/vim-multiple-cursors'

" File Explorer
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

" Fast operators
Plug 'scrooloose/nerdcommenter'
Plug 'derekwyatt/vim-fswitch'
Plug 'vim-scripts/DrawIt'
"Plug 'sjl/gundo.vim'

" Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'
call plug#end()
"***************** Plugins End ****************


"Make setting with immediate effect
"Note: may trigger abnormal in tagbar+NERDTree
autocmd BufWritePost $MYVIMRC source $MYVIMRC


syntax enable
set number
set autoindent
set backspace=indent,eol,start
"Always show status bar
set laststatus=2
"Show cursor position
set ruler
"Show line
set number
"Show search number like [3/10]
set shortmess-=S
"show inputing cmd
set showcmd
"auto complete menu cmd
set wildmenu


"Load relavant plugin according to detected file type
filetype plugin indent on


"Set colorscheme dark | light
set background=dark
" Colorscheme default
" Start in silent mode to enable initial auto startup
silent! colorscheme gruvbox
"transparent background
highlight Normal guibg=None ctermbg=None
"Highlight current line/column
"set cursorline
"set cursorcolumn
"Highlight search result
set hlsearch


"Expand tab to space
"set expandtab
"Set space number of tab when edit
set tabstop=4
"Set space number of tab when format
set shiftwidth=4
"Continued space number that can be considered as tab
set softtabstop=4


" Folding Setting
" REF: https://vim.fandom.com/wiki/Folding#Folding_by_expression
"Set fold mode indent/syntax
set foldmethod=indent "indent/syntax
"stop fold when vim start
set nofoldenable

let basePath = '~/.config/nvim/'

"******************* Load Plugins' Settings ********************
let settingPath = basePath . 'scripts.vim/setting.vim'
if filereadable(expand(settingPath))
    exe 'source' settingPath
endif


"******************** Load coc.nvim Settings *******************
let cocPath = basePath . 'scripts.vim/coc.vim'
if filereadable(expand(cocPath))
    exe 'source' cocPath
endif


"****** Recursive find customize config file <.cust.vim> *******
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
au BufNewFile,BufRead * call CheckForCustomConfiguration()


"********************** Integrate lf ***************************
" This only work for vim
let lfvim = basePath . 'scripts.vim/lf.vim'
if filereadable(expand(lfvim))
    exec "source " lfvim
endif
let g:lf_map_keys = 0
" The shortcut opening lf
nnoremap <leader>lf :Lf<cr>


"********************** copilot ***************************
" map copilot accept to <C-J>
imap <silent><script><expr> <C-J> copilot#Accept(" ")
let g:copilot_no_tab_map = v:true

let copilotChatPath = basePath . 'scripts.vim/copilot_chat.vim'
if filereadable(expand(copilotChatPath))
	exe 'source' copilotChatPath
endif

set completeopt=menuone,noinsert,popup

noremap <Leader>co :CopilotChat<CR>

" Highlight of jsonc (json with comments)
autocmd FileType json syntax match Comment +\/\/.\+$+
