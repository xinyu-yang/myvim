" VIM Syntax File
" Language: Graql (Grakn Query Language)
" Maintainer: Joshua Send
" Latest Revision: 5 July 2018

" check if another syntax file already loaded
"if exists("did_load_filetypes")
  "finish
"endif

let b:current_syntax = "tql"

setlocal iskeyword+=!
setlocal iskeyword+=-

" Core Graql keywords
syntax keyword GraqlKeywords match get insert delete compute aggregate
syntax keyword GraqlKeywords isa! isa val iid label regex has aggregate compute group ask type

" Statistics (OLAP and OLTP) 
syntax keyword GraqlStatistics count min sum max min median mean

" Analytics Graql keywords
syntax keyword GraqlAnalytics cluster centrality path

" Migration-related keywords, templating language
setlocal iskeyword+=(
setlocal iskeyword+=)
setlocal iskeyword+=[
setlocal iskeyword+=]
setlocal iskeyword+=:
setlocal iskeyword+="="
" setlocal iskeyword+=!=
" setlocal iskeyword+=@-@
setlocal iskeyword+=>
setlocal iskeyword+=<
" setlocal iskeyword+=<=
" setlocal iskeyword+=>=
" setlocal iskeyword+="
" setlocal iskeyword+=.-.

syntax keyword GraqlTemplating for if elseif else do in true false and or not null = != < <= > >=  " . 

" Builtin types 
syntax keyword GraqlDatatypes long double boolean datetime string
" also the root schema types as their own group
syntax keyword GraqlSpecial relation entity attribute

syntax match GraqlMacros "@[^\(]+" 

" comments: //
syntax match GraqlComment "#.*$"

" strings
syntax match GraqlString "\"[^"|^(\\")]*\""

" variables/holders: $
syntax match GraqlVariable "\$[a-zA-Z_][a-zA-Z_\-0-9]*"

" Graql Rules
syntax keyword GraqlRuleKeywords when then

" Schema definitions
syntax keyword GraqlSchemaKeywords define undefine sub relates as plays owns has datatype abstract value


" Set up highlighting
highlight link GraqlMacros Function
highlight link GraqlTemplating Keyword
highlight link GraqlKeywords Keyword
highlight link GraqlAnalytics Keyword
highlight link GraqlSchemaKeywords Keyword

" Have to see how this actually looks!
highlight link GraqlStatistics Function
highlight link GraqlComment Comment
highlight link GraqlVariable Identifier 
highlight link GraqlString String 

highlight link GraqlDatatypes Type
highlight link GraqlSpecial Special
