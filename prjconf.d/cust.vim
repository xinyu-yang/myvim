" ============================
" Copy this file to project's root path and rename, e.g.,
" $ cp ~/.vim/prjconf.d/cust.vim prj_path/.cust.vim
" ============================


" ====== Tag settings ======
" Customize tags for C language.
"set tags+=/usr/include/c++/5/stdcpp.tags

" The tag file of current project
let tag_name = "prj.ctags"
let local_tag = fnamemodify(expand('<sfile>:p'), ':h') . '/' . tag_name
execute 'set tags+=' . local_tag


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
