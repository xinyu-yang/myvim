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


