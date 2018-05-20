"
" =-=-=--=-=-=-= GENERAL CONFIG =-=-=--=-=-=-=
"

if !has('nvim')
  set nocompatible                " Turn of VI compatibility mode
  set ttyfast                     " Faster rendering
  set sidescroll=1                " Enable sideways scrolling
  set showcmd                     " Show incomplete cmds in bottom right
  set noesckeys                   " (hopefully) fix the delay returning to Normal mode
endif

set number                      " Line numbers are good...
set relativenumber              " ...and even better when they're relative
set noshowmode                  " Status bar already shows mode
set updatetime=100              " How often to write swapfile to disk
set lazyredraw

set whichwrap+=<,>,h,l
set matchpairs+=<:>             " For html tag matching
set visualbell                  " No sounds

set hidden                      " Allow buffers in the background
set hid                         " A buffer becomes hidden when abandoned
set grepprg=ag                  " Use Silver Searcher (fuzzy-search) instead of grep

colorscheme ThemerVim           " Colorscheme


" == Indentation ==
set cindent
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab                   " Spaces over tabs
set shiftround                  " When at 3 spaces and I hit >>, go to 4. Not 5.
set nowrap                      " Don't wrap lines
set linebreak                   " When wrapping is on, wrap lines at sensible points

" Display tabs and trailing spaces visually
set list listchars=tab:»·,trail:·

" Search
set ignorecase        " Ignore case when searching...
set smartcase         " ...unless we type a capital
set magic             " Turn magic on for regular expression
set inccommand=split  " Some neovim substitute-preview magic

" Search highlight colors
hi Search cterm=bold ctermbg=Yellow ctermfg=Black

" Split bar styles
hi VertSplit cterm=NONE ctermbg=Black ctermfg=Gray
hi HorizontalSplit cterm=NONE ctermbg=Black ctermfg=Gray

" More natural splits
set splitbelow
set splitright

" Line number colors
highlight LineNr ctermfg=grey
highlight CursorLineNr term=bold cterm=bold ctermfg=red

" Height of the command bar
set cmdheight=1

" Make it more obvious which paren I'm on
hi MatchParen cterm=bold ctermbg=NONE ctermfg=yellow

" Return to last edit position when opening files :)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

