" =-=-=--=-=-=-= LANGUAGE/FILETYPE SPECIFIC CONFIGURATION =-=-=--=-=-=-=

" By default, vim thinks .md is Modula-2.
augroup filetypes
  autocmd!
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END
