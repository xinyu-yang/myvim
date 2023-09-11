"******************************
"*** <vim-airline> Setting ****
"******************************
" Symbols
" NOTE: ga (get ascii) to get unicode value.
" NOTE: Input special symbol, Ctrl+v -> u[unicode].
" NOTE: Font patch, https://github.com/ryanoasis/nerd-fonts
" set powerline symbols (test ,)
let g:airline_powerline_fonts = 1

" tabline setting
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


" Whitespace setting
" REF: https://stackoverflow.com/questions/32588604/vim-airline-what-is-trailing1
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
" Toggle above :set invlist

" Checks options
let g:airline#extensions#whitespace#checks =
\  [ 'indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts' ]

" To disable mixed-indent-file for go files
let g:airline#extensions#whitespace#skip_indent_check_ft =
\  {'go': ['mixed-indent-file'],
\    'c': [ 'indent', 'mixed-indent-file' ] }


"Other extensions setting.
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = '☻:' "u263B
let g:airline#extensions#ycm#warning_symbol = '☺:' "u263A



"************************************
"*** <vim-indent-guides> Setting ****
"************************************
"***Set <visiable indent>
"Start with vim
let g:indent_guides_enable_on_vim_startup=1
"Visualize from second level
let g:indent_guides_start_level=2
"Color block width
let g:indent_guides_guide_size=1
"Shortcut key of visible indent
"nmap <silent> <Leader>i <Plug>IndentGuidesToggle



"*************************
"*** <CtrlSF> Setting ****
"*************************
nmap     <Leader>ff <Plug>CtrlSFPrompt
vmap     <Leader>ff <Plug>CtrlSFVwordPath
vmap     <Leader>fF <Plug>CtrlSFVwordExec
nmap     <Leader>fn <Plug>CtrlSFCwordPath
nmap     <Leader>fp <Plug>CtrlSFPwordPath
nnoremap <Leader>fo :CtrlSFOpen<CR>
nnoremap <Leader>ft :CtrlSFToggle<CR>
inoremap <Leader>ft <Esc>:CtrlSFToggle<CR>
"let g:ctrlsf_auto_focus='start'



"************************
"*** <Netrw> Setting ****
"************************
" Open browser window
nnoremap <Leader>fl :Vexplore!<CR>
" Set open mode
let g:netrw_browse_split = 4
" Set tree mode (thin/long/wide/tree)
let g:netrw_liststyle = 3
let g:netrw_altv = 1
" Set window size
let g:netrw_winsize = -30



"********************************
"*** <Vim-signature> Setting ****
"********************************
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



"*************************
"*** <tagbar> Setting ****
"*************************
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



"****************************
"*** <Ultisnips> Setting ****
"****************************
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"



" +------------------------------+
" |*******<DrawIt> Settings******|
" +------------------------------+
" \di -> <leader>di
" \ds -> <leader>ds



"***************************************
"********** <fswitch> Settings *********
"***************************************
nmap <silent> <Leader>fs :FSHere<cr>
