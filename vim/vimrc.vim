" Load Plugins
execute pathogen#infect()

set nocompatible                " Use vim settings, rather than Vi (much better!)
set t_Co=256                    " Use 256-color space
set number                      " Line numbers are good
set relativenumber              " +1 for relative line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set encoding=utf-8              " Encoding
set ttyfast                     " Rendering
set mouse=a                     " Enable mouse mode
set whichwrap+=<,>,h,l
set matchpairs+=<:>             " For % matching
set history=1000                " Store lots of :cmdline history
set updatetime=100              " Reduce update time
set noesckeys                   " (hopefully) fix the delay returning to Normal mode
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=0
set showcmd                     " Show incomplete cmds at the bottom
set showmode                    " Show current mode at the bottom
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set wildmenu                    " Better completion on command line
set wildmode=full               " What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set lazyredraw
set hidden                      " Allow buffers in the background
set hid                         " A buffer becomes hidden when abandoned

syntax on                       " Enable syntax highlighting
filetype plugin indent on       " Enable filetype plugins and indentation
colorscheme ThemerVim           " Colorscheme
let mapleader=","               " Remap the leader key

" == Turn off swapfiles ==
set noswapfile
set nobackup
set nowb

" == Persistent Undo ==
" Persist undo history across sessions
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" change to directory of current file automatically
autocmd BufEnter * lcd %:p:h

" == Indentation ==
set autoindent
set cindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab     " Spaces over tabs
set nowrap        " Don't wrap lines
set shiftround    " When at 3 spaces and I hit >>, go to 4, not 5.
set linebreak     " Wrap lines at convenient points

" inoremap {<CR> {<CR>}<ESC>O      " Won't work with autoclose plugin

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" == Folds ==
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" == Search ==
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set magic           " Turn magic on for regular expressions

" ====== LEADER MAPPINGS ======

" Make it easier to make life easier
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Surround word in quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel

" File and Window Management
inoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w :w<CR>

inoremap <leader>q <ESC>:q<CR>
nnoremap <leader>q :q<CR>

inoremap <leader>x <ESC>:x<CR>
nnoremap <leader>x :x<CR>

nnoremap <leader>e :Ex<CR>
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

" Placeholder mappings
nnoremap <leader><leader> i<++><Esc>
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l

" ====== PLUGIN CONFIG ======

" Use Silver Searcher instead of grep
set grepprg=ag

" Make autocompletion text readable
highlight PmenuSel ctermfg=white

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0"

" Disable ale highlighting, show error in status bar
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1

" Use powerline symbols in the status bar
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

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


" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show current position
set ruler

" Highlight current line - disabled for performance
" set cursorline
hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
hi CursorLine   cterm=NONE ctermbg=23 ctermfg=white guibg=darkred guifg=white

" Line number colors
highlight LineNr ctermfg=grey
highlight CursorLineNr term=bold cterm=bold ctermfg=red

" Height of the command bar
set cmdheight=1

" Extra margin to the left
"set foldcolumn=1

" Show matching brackets when indicator is over them
set showmatch

" Make it more obvious which paren I'm on
hi MatchParen cterm=bold ctermbg=red ctermfg=black

" Don't automatically continue comments after newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Return to last edit position when opening files :)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ====== MAPPINGS ======
" Remap VIM 0 to first non-blank character
map 0 ^

" Let's be reasonable, shall we?
nmap k gk
nmap j gj
nnoremap H 0
nnoremap L $

" Esc remap in insert mode
inoremap jk <esc>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Ex mode - cycle through command history on home row
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Easier switching between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Easy expansion of the Active File Directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" if has("mac") || has("macunix")
  " nmap <D-j> <M-j>
  " nmap <D-k> <M-k>
  " vmap <D-j> <M-j>
  " vmap <D-k> <M-k>
" endif

" ======== LANGUAGE-SPECIFIC CONFIG ===========

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif

let g:typescript_indent_disable = 1

let g:javascript_plugin_jsdoc = 1

let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_semantic_triggers['javascript'] = ['.']

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

