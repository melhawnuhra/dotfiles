"
" =-=-=--=-=-=-= PLUGIN CONFIGURATION =-=-=--=-=-=-=
"

" --- ROOTER ---
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['composer.json', 'package.json', '.git/']
let g:rooter_silent_chdir = 1

" --- CTRL-P ---
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0"
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_reuse_window = 'netrw\|NerdTree'

noremap <c-i> :CtrlPTag<CR>

" --- ACK ---
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap \ :Ack!<Space>

" bind K to grep word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

" --- AIRLINE ---
" Load only the airline integrations we want - performance boost
let g:airline_extensions = ['branch', 'tabline',
      \ 'ctrlp', 'hunks', 'quickfix', 'whitespace']

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
let g:airline#extensions#tabline#buffer_nr_show = 1

" --- NERDTREE ---
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

" --- ULTISNIPS ---
let g:UltiSnipsExpandTrigger="§"
let g:UltiSnipsJumpForwardTrigger="§"
let g:UltiSnipsJumpBackwardTrigger="±"

" --- GITGUTTER ---
" set signcolumn=yes
" hi GitGutterAdd cterm=bold ctermfg=LightGreen
" hi GitGutterChange cterm=bold ctermfg=yellow
" hi GitGutterDelete cterm=bold ctermfg=red
" hi GitGutterChangeDelete cterm=bold ctermfg=red

" --- FUGITIVE ---
set diffopt+=vertical

hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse

" command! -nargs=1 -bar Diffput <args> diffput <args>|diffupdate
" command! -nargs=1 -bar Diffget <args> diffget <args>|diffupdate
" command! -nargs=1 -bar Dp <args> diffput <args>|diffupdate
" command! -nargs=1 -bar Dg <args> diffget <args>|diffupdate
" command! -nargs=1 -bar Dgl <args> diffget //2|diffupdate
" command! -nargs=1 -bar Dgr <args> diffget //3|diffupdate

" --- TMUX-NAGIVATOR ---
let g:tmux_navigator_disable_when_zoomed = 1
" Write the current buffer if changed
let g:tmux_navigator_save_on_switch = 1

" --- INDENT LINE ---
let g:indentLine_char = '¦'
let g:indentLine_setColors = 1
let g:indentLine_enabled = 1
let g:indentLine_setConceal = 2

" --- NEOMAKE ---
" call neomake#configure#automake('nrw', 500)

" --- DEOPLETE ---
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
let g:deoplete#auto_complete_delay = 10

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:nvim_typescript#type_info_on_hold = 1

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ }

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
