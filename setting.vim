"##############################
"####<vim-airline> Setting#####
"##############################
" Symbols
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



"####################################
"####<vim-indent-guides> Setting#####
"####################################
"###Set <visiable indent>
"Start with vim
let g:indent_guides_enable_on_vim_startup=1
"Visualize from second level
let g:indent_guides_start_level=2
"Color block width
let g:indent_guides_guide_size=1
"Shortcut key of visible indent
"nmap <silent> <Leader>i <Plug>IndentGuidesToggle



"#########################
"####<CtrlSF> Setting#####
"#########################
nmap     <Leader>ff <Plug>CtrlSFPrompt
vmap     <Leader>ff <Plug>CtrlSFVwordPath
vmap     <Leader>fF <Plug>CtrlSFVwordExec
nmap     <Leader>fn <Plug>CtrlSFCwordPath
nmap     <Leader>fp <Plug>CtrlSFPwordPath
nnoremap <Leader>fo :CtrlSFOpen<CR>
nnoremap <Leader>ft :CtrlSFToggle<CR>
inoremap <Leader>ft <Esc>:CtrlSFToggle<CR>
"let g:ctrlsf_auto_focus='start'



"########################
"####<Netrw> Setting#####
"########################
" Open browser window
nnoremap <Leader>fl :Vexplore!<CR>
" Set open mode
let g:netrw_browse_split = 4
" Set tree mode (thin/long/wide/tree)
let g:netrw_liststyle = 3
let g:netrw_altv = 1
" Set window size
let g:netrw_winsize = -30


"################################
"####<Vim-signature> Setting#####
"################################
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


"#########################
"####<tagbar> Setting#####
"#########################
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



"############################
"####<Ultisnips> Setting#####
"############################
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
"let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"



"######################
"####<YCM> Setting#####
"######################
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


