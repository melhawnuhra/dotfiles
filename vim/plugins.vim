" =-=-=--=-=-=-= PLUGIN CONFIGURATION =-=-=--=-=-=-=

" Rooter {{{
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['composer.json', 'package.json', '.git/']
let g:rooter_silent_chdir = 1
" }}}
" Ack {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
cnoreabbrev Ack Ack!
nnoremap \ :Ack!<Space>
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:btt'
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|NerdTree'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
noremap <c-i> :CtrlPTag<CR>
" }}}
" NerdTree {{{
" let NERDTreeShowHidden=1
" nnoremap <silent> <Leader>f :NERDTreeToggle<CR>

" " Close NerdTree after a file is opened
" let NERDTreeQuitOnOpen = 1

" " Remove the buffer when we delete the file in NerdTree
" let NERDTreeAutoDeleteBuffer = 1

" " Close the tab if the only remaining window is NerdTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" " Make NerdTree a bit prettier
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" }}}
" Airline {{{
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
" }}}
" Gutentags {{{
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
" }}}
" Sayonara {{{
let g:sayonara_confirm_quit = 0
" }}}
" IndentLine {{{
let g:indentLine_char = '¦'
let g:indentLine_setColors = 1
let g:indentLine_enabled = 0
let g:indentLine_setConceal = 2
" }}}
" TextObjs {{{
" g:argumentobject_force_toplevel = 1
" }}}
" Polyglot {{{
" e.g. g:polyglot_disabled = ['typescript']
" }}}
" Deoplete {{{
" let g:deoplete#enable_at_startup = 0
" autocmd InsertEnter * call deoplete#enable()
" let g:deoplete#auto_complete_delay = 10

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" let g:nvim_typescript#type_info_on_hold = 1
" }}}
" NCM2 {{{

  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " IMPORTANT: :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect

  " suppress the annoying 'match x of y', 'The only match' and 'Pattern not found' messages
  set shortmess+=c

  " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
  inoremap <c-c> <ESC>

  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new
  " line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr><CR><C-o>k<Tab>" : "\<CR><CR><C-o>k<Tab>")

  " Use <TAB> to select the popup menu:
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " Press enter key to trigger snippet expansion
  " The parameters are the same as `:help feedkeys()`
  inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR><CR><C-o>k<Tab>", 'n')
  imap <silent> <unique> <C-o> <CR>

" }}}
" Python {{{
let g:loaded_python_provider = 1
let g:python_host_skip_check= 1
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_skip_check = 1
let g:python3_host_prog = '/usr/local/bin/python3'
" }}}
" Matchup {{{
let g:loaded_matchparen = 1
" }}}
" DelimitMate {{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 0
let g:delimitMate_smart_quotes = 1
let g:delimitMate_smart_matchpairs = 1
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_backspace = 1
" }}}
" Ultisnips {{{
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="±"
" let g:UltiSnipsExpandTrigger = "<nop>"
" let g:ulti_expand_or_jump_res = 0
" function ExpandSnippetOrCarriageReturn()
"     let snippet = UltiSnips#ExpandSnippetOrJump()
"     if g:ulti_expand_or_jump_res > 0
"         return snippet
"     else
"         return "\<CR>"
"     endif
" endfunction
" inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" }}}
" Tmux Navigator {{{
let g:tmux_navigator_disable_when_zoomed = 1
" Write the current buffer if changed
let g:tmux_navigator_save_on_switch = 1
" }}}
" LanguageClient TODO {{{
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ }

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
