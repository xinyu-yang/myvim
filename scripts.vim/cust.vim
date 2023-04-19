" ============================
" Copy this file to project's root path and rename, e.g.,
" $ cp ~/.vim/scripts.vim/cust.vim prj_path/.cust.vim
" ============================


" ====== Tag settings ======
" Customize tags for C language.
"set tags+=/usr/include/c++/5/stdcpp.tags
set tags+=~/.vim/tags/include_tags
"set tags+=~/mb/metls/ctag_metls


" ====== Tab settings ======
"Expand tab to space
"set expandtab
"Set space number of tab when edit
set tabstop=4
"Set space number of tab when format
set shiftwidth=4
"Continued space number that can be considered as tab
set softtabstop=4


" ====== Check settings ======
" Customize whitespace checks for C.
" useful to call for particular file types (e.g., in "ftplugin/*")
"silent! call airline#extensions#whitespace#disable()


" TEST
" Commend this line after succeed
echo "This is a test of cust.vim"
