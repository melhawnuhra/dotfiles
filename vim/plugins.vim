" =-=-=--=-=-=-= PLUGIN CONFIGURATION =-=-=--=-=-=-=


" Use Silver Searcher (fuzzy-search) instead of grep
set grepprg=ag

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0"

" Disable ale highlighting
let g:ale_set_highlights = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1


" Load only the airline integrations we want - performance boost
let g:airline_extensions = ['ale', 'branch', 'tabline',
      \ 'ctrlp', 'gutentags', 'ycm',
      \ 'hunks', 'quickfix', 'whitespace']

" Free performance boost
let g:airline_highlighting_cache = 1

" Fix bleeding color artifacts
let airline#extensions#default#section_use_groupitems = 0

" Show quickfix and location contexts
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

" Only show non-zero hunks
let g:airline#extensions#hunks#non_zero_only = 1

" Use powerline symbols in the status bar
let g:airline_powerline_fonts = 1

" airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = 'Ξ'

" Tabline configuration
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_splits = 1

" Automatically open NerdTree if we start vim with no args
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <silent> <Leader>f :NERDTreeToggle<CR>

" Close NerdTree as soon as we open a file
let NERDTreeQuitOnOpen = 1

" Remove the buffer when we delete the file in NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Close the tab if the only remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Make NerdTree a bit prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_project_root = ['composer.lock', 'package.json']
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
      \ '*.phar', '*.ini', '*.rst', '*.md',
      \ '*vendor/*/test*', '*vendor/*/Test*',
      \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
      \ '*var/cache*', '*var/log*', '*.vim']

