" =-=-=--=-=-=-= LANGUAGE-SPECIFIC CONFIGURATION =-=-=--=-=-=-=


if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif

" let g:typescript_indent_disable = 1

let g:javascript_plugin_jsdoc = 1

let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_semantic_triggers['javascript'] = ['.']

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


" TYPESCRIPT

" Show compilation errors in the quickfix window when running 'make'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
