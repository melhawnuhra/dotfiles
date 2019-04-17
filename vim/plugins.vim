" =-=-=--=-=-=-= PLUGIN CONFIGURATION =-=-=--=-=-=-=

" Rooter {{{
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['composer.json', 'package.json', '.git/']
let g:rooter_silent_chdir = 1
" }}}
" Ack {{{
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
  set grepprg=rg\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ag')
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
" noremap <c-i> :CtrlPTag<CR>
noremap <silent> <c-b> :CtrlPBuffer<CR>
" }}}
" BufTabline {{{
let g:buftabline_numbers=1
let g:buftabline_indicators=1
" }}}
" Gutentags {{{
" let g:gutentags_cache_dir = '~/.vim/gutentags'
" let g:gutentags_project_root = ['composer.lock', 'package.json']
" let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
"       \ '*.phar', '*.ini', '*.rst', '*.md',
"       \ '*vendor/*/test*', '*vendor/*/Test*',
"       \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
"       \ '*var/cache*', '*var/log*', '*.vim']

" " Refresh the status bar when tagging has started/finished
" augroup MyGutentagsStatusLineRefresher
"   autocmd!
"   autocmd User GutentagsUpdating call airline#update_statusline()
"   autocmd User GutentagsUpdated call airline#update_statusline()
" augroup END
" }}}
" Sayonara {{{
let g:sayonara_confirm_quit = 0
" }}}
" IndentLine {{{
" let g:indentLine_char = '¦'
" let g:indentLine_setColors = 1
" let g:indentLine_enabled = 0
" let g:indentLine_setConceal = 2
" }}}
" Polyglot {{{
" e.g. g:polyglot_disabled = ['typescript']
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
  inoremap <silent> <expr> <CR> (pumvisible() ? "\<c-y>\<C-R>=delimitMate#ExpandReturn()\<CR>" : "<C-R>=delimitMate#ExpandReturn()\<CR>")

  " Use <TAB> to select the popup menu:
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " Press enter key to trigger snippet expansion
  " The parameters are the same as `:help feedkeys()`
  inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<C-R>=delimitMate#ExpandReturn()\<CR>", 'n')

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
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" }}}
" Tmux Navigator {{{
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_save_on_switch = 1
" }}}

" vim:foldmethod=marker:foldlevel=0
