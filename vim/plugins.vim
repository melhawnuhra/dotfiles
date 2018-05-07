" =-=-=--=-=-=-= PLUGIN CONFIGURATION =-=-=--=-=-=-=


" --- CTRL-P ---
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0"

" --- ALE ---
let g:ale_set_highlights = 0
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_completion_enabled = 0
let g:ale_change_sign_column_color = 1
let g:ale_linter_aliases = {
  \ "zsh": "sh"
\}
hi ALESignColumnWithErrors cterm=bold ctermbg=NONE ctermfg=Red
hi ALEErrorLine cterm=NONE ctermbg=NONE ctermfg=NONE
" hi ALESignColumnWithoutErrors cterm=NONE ctermbg=NONE ctermFG=NONE

" --- AIRLINE ---
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
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 1

" --- NERDTREE ---
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

" --- GUTENTAGS ---
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_project_root = ['composer.lock', 'package.json']
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
      \ '*.phar', '*.ini', '*.rst', '*.md',
      \ '*vendor/*/test*', '*vendor/*/Test*',
      \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
      \ '*var/cache*', '*var/log*', '*.vim']

" Refresh the status bar when tagging has started/finished
augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call airline#update_statusline()
  autocmd User GutentagsUpdated call airline#update_statusline()
augroup END

" --- YouCompleteMe ---
" Slightly increase the min number of characters for identifier-based
" completion
let g:ycm_min_num_of_chars_for_completion = 2

" Turn off autocompletion for the following files:
let g:ycm_filetype_blacklist = {}

" Pull in ultisnips snippet suggestions
let g:ycm_use_ultisnips_completer = 1

" Collect identifiers from tags
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

" --- ULTISNIPS ---
let g:UltiSnipsExpandTrigger="§"
let g:UltiSnipsJumpForwardTrigger="§"
let g:UltiSnipsJumpBackwardTrigger="±"

" --- GITGUTTER ---
hi GitGutterAdd cterm=bold ctermfg=LightGreen
hi GitGutterChange cterm=bold ctermfg=yellow
hi GitGutterDelete cterm=bold ctermfg=red
hi GitGutterChangeDelete cterm=bold ctermfg=red

" --- TMUX-NAGIVATOR ---
let g:tmux_navigator_disable_when_zoomed = 1
" Write the current buffer if changed
let g:tmux_navigator_save_on_switch = 1
