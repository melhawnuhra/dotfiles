" =-=-=--=-=-=-= GENERAL CONFIG =-=-=--=-=-=-=


set nocompatible                " Use vim settings, rather than Vi (much better!)
set number                      " Line numbers are good
set relativenumber              " +1 for relative line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set encoding=utf-8              " Encoding
set ttyfast                     " Rendering
set mouse=a                     " Enable mouse mode
set mousehide                   " Hide mouse when typing
set whichwrap+=<,>,h,l
set matchpairs+=<:>             " For html tag matching
set history=1000                " Store lots of :cmdline history
set updatetime=100              " Reduce update time for responsiveness
set noesckeys                   " (hopefully) fix the delay returning to Normal mode
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=0
set showcmd                     " Show incomplete cmds in bottom right
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set wildmenu                    " Better completion on command line
set wildmode=full               " What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set noshowmode                  " Status bar already shows mode
set lazyredraw
set hidden                      " Allow buffers in the background
set hid                         " A buffer becomes hidden when abandoned
set ruler                       " Show current line:col numbers

syntax on                       " Enable syntax highlighting
filetype plugin indent on       " Enable filetype plugins and indentation
colorscheme ThemerVim           " Colorscheme
let mapleader=","               " Remap the leader key

" Scrolloff distance and cursor for each mode (for tmux in iTerm)
set scrolloff=8
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

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

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Display tabs and trailing spaces visually
set list listchars=tab:»·,trail:·

" Make autocompletion text readable
highlight PmenuSel ctermfg=white

" Folds
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" Search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set magic           " Turn magic on for regular expressions

" Highlight current line - disabled for performance
" set cursorline
hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
hi CursorLine   cterm=NONE ctermbg=23 ctermfg=white guibg=darkred guifg=white

" Line number colors
highlight LineNr ctermfg=grey
highlight CursorLineNr term=bold cterm=bold ctermfg=red

" Height of the command bar
set cmdheight=1

" Show matching brackets when indicator is over them
set showmatch

" Make it more obvious which paren I'm on
hi MatchParen cterm=bold ctermbg=red ctermfg=black

" Don't automatically continue comments after newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro


" Return to last edit position when opening files :)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Trim trailing whitespace for the following filetypes:
autocmd FileType c,cpp,java,php,javascript,typescript,python autocmd BufWritePre <buffer> %s/\s\+$//e

" Because Vim doesn't like pasting that works
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

