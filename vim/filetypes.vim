" =-=-=--=-=-=-= LANGUAGE/FILETYPE SPECIFIC CONFIGURATION =-=-=--=-=-=-=

augroup filetypes
  autocmd!
  " By default, vim thinks .md is Modula-2.
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufReadPost default.conf.template set filetype=nginx
augroup END
