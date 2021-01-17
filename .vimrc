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
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/phd'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
"Switch
Plugin 'derekwyatt/vim-fswitch'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'
Plugin 'tamarin-prover/editors'
" 插件列表结束
call vundle#end()

"Make setting with immediate effect
"Note: may trigger abnormal in tagbar+NERDTree
autocmd BufWritePost $MYVIMRC source $MYVIMRC

syntax enable
syntax on
set number
set autoindent
set backspace=indent,eol,start
"Load relavant plugin according to detected file type
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete

"Set colorscheme dark | light
set background=dark

"gruvbox setting.
let g:gruvbox_transparent_bg=1
"colorscheme default
colorscheme gruvbox

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

"###<vim-airline>
"Symbols
" NOTE: ga (get ascii) to get unicode value.
" NOTE: Input special symbol, Ctrl+v -> u[unicode].
" Font patch, https://github.com/ryanoasis/nerd-fonts
" set powerline symbols (test ,)
let g:airline_powerline_fonts = 1
"*tabline* setting.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#alt_sep = 1
"let g:airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#buffers_label = 'B'
let g:airline#extensions#tabline#tabs_label = 'T'
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"*whitespace* setting.
"https://stackoverflow.com/questions/32588604/vim-airline-what-is-trailing1
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
" Toggle above :set invlist
" checks options.
let g:airline#extensions#whitespace#checks =
\  [ 'indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts' ]
" To disable mixed-indent-file for go files use:
let g:airline#extensions#whitespace#skip_indent_check_ft =
\  {'go': ['mixed-indent-file'],
\    'c': [ 'indent', 'mixed-indent-file' ] }

"Other extensions setting.
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = '☻:' "u263B
let g:airline#extensions#ycm#warning_symbol = '☺:' "u263A

"###Set <visiable indent>
"Start with vim
let g:indent_guides_enable_on_vim_startup=1
"Visualize from second level
let g:indent_guides_start_level=2
"Color block width
let g:indent_guides_guide_size=1
"Shortcut key of visible indent
"nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"Set fold mode indent/syntax
set foldmethod=indent
"set foldmethod=syntax
"stop fold when vim start
set nofoldenable

"###(p:<vim-fswitch>) switch between *.cpp and *.h
nmap <silent> <Leader>sw :FSHere<cr>

"###<CtrlSF> shortcut
nmap     <Leader>ff <Plug>CtrlSFPrompt
vmap     <Leader>ff <Plug>CtrlSFVwordPath
vmap     <Leader>fF <Plug>CtrlSFVwordExec
nmap     <Leader>fn <Plug>CtrlSFCwordPath
nmap     <Leader>fp <Plug>CtrlSFPwordPath
nnoremap <Leader>fo :CtrlSFOpen<CR>
nnoremap <Leader>ft :CtrlSFToggle<CR>
inoremap <Leader>ft <Esc>:CtrlSFToggle<CR>
"let g:ctrlsf_auto_focus='start'

"###<NERDTree> plugin shortcut
"Open project
nmap <Leader>fl :NERDTreeToggle<CR>
"Set subwindow width
let NERDTreeWinSize=30
"Set subwindow position
let NERDTreeWinPos="right"
"Set hidden file
let NERDTreeShowHidden=1
"Hidden verbose help information in subwindow
let NERDTreeMinimalUI=1
"Delete buffer automatically when file deleted
let NERDTreeAutoDeleteBuffer=1

"###Signature setting.
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

"###<tagbar>
"Set the position of child window in the left.
let tagbar_left=1
"Set shortcut key to display/hide tag list child window.
nnoremap <Leader>ilt :TagbarToggle<CR>
"Set width of tag child window
let tagbar_width=30
"Do not display redundant help information in tagbar child window.
let g:tagbar_compact=1

let g:tarbar_type_cpp = {
    \ 'kinds' : [
        \ 'c:classses:0:1',
        \ 'd:macros:0:1',
        \ 'e:enumerators:0:0',
        \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"###<Ultisnips> shortcut define
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
"let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"###<Omnicomplete>
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" also necessary for fixing LIBSTDC++ releated stuff
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"###<YCM>
" YCM Color config.
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <Leader>yo <C-x><C-o>
" set short for force semantic completion
let g:ycm_key_invoke_completion='<C-Z>'
inoremap <Leader>ys <C-Z>
" turn off YCM
nnoremap <Leader>yf :let g:ycm_auto_trigger=0<CR>
" turn on YCM
nnoremap <Leader>yn :let g:ycm_auto_trigger=1<CR>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
let g:ycm_enable_diagnostic_highlighting = 1
" Open locationlist for errors and warnings.
nnoremap <Leader>yd :YcmDiags<CR>
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 开启 YCM 标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" CR as select
let g:ycm_key_list_stop_completion = ['<CR>']
" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_register_as_syntastic_checker = 0
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gi :YcmCompleter GoToImplementation<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

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

