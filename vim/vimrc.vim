if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

if !has('nvim')
  set nocompatible                " Turn of VI compatibility mode
  set ttyfast                     " Faster rendering
  set sidescroll=1                " Enable sideways scrolling
  set showcmd                     " Show incomplete cmds in bottom right
  set noesckeys                   " Fix the delay returning to Normal mode
endif

" Plugins {{{
call plug#begin('~/.vim/plugged')

  " A collection of sensible defaults that nobody should object to
  Plug 'tpope/vim-sensible'
  " cd to project root when opening a buffer
  Plug 'airblade/vim-rooter'
  " Editor Config support for Vim
  Plug 'editorconfig/editorconfig-vim'

  " Search enhancements
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'

  " UI / Theme
  " Theme
  Plug 'morhetz/gruvbox'
  " Shows in the gutter lines added/modified/removed since last commit
  Plug 'airblade/vim-gitgutter'
  " Provides a simple visual list of open buffers
  Plug 'ap/vim-buftabline'
  " Highlight matching pairs and provide better % functionality
  Plug 'andymass/vim-matchup'
  " Syntax highlighting for all
  Plug 'sheerun/vim-polyglot'

  " Useful keybindings for easier closing of buffers/windows
  Plug 'mhinz/vim-sayonara'

  " Tighter tmux integration
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'christoomey/vim-system-copy'

  " Provides a motion to easily sort lines
  Plug 'christoomey/vim-sort-motion'

  " Useful keybindings for working with comments
  Plug 'tpope/vim-commentary'
  " Overrides default . functionality to work for some more complex atomic actions
  Plug 'tpope/vim-repeat'
  " Provides mappings to easily delete/change/add surrounding pairs
  Plug 'tpope/vim-surround'
  " Various useful [x and ]x pair bindings
  Plug 'tpope/vim-unimpaired'
  " Provides some nice Git integration for Vim
  Plug 'tpope/vim-fugitive'

  " Text Objects
  " Dependency for other vim-textobj plugins
  Plug 'kana/vim-textobj-user'
  Plug 'glts/vim-textobj-comment'
  Plug 'kana/vim-textobj-entire'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'terryma/vim-expand-region'

  " Smart completion of matching pairs in insert mode
  Plug 'Raimondi/delimitMate'
  " Code completion framework. Supports LSP
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " Snippets manager
  Plug 'SirVer/ultisnips'
  " Showe sensible snippets for various languages
  Plug 'honza/vim-snippets'
  " Emmet keybindings for writing html
  Plug 'mattn/emmet-vim'

  " --------------------
  " Plugins on Trial
  " --------------------

  Plug 'AndrewRadev/splitjoin.vim' " gS / gJ

  " TODO include when I can think of good mappings
  " Plug 'matze/vim-move'

  " Heuristically set buffer options (indent, tabs etc)
  Plug 'tpope/vim-sleuth'

  " More sensible behaviour of f, F, t and T
  Plug 'rhysd/clever-f.vim'

  " Better definitions of w and b for camelCase and snake_case variables
  Plug 'chaoren/vim-wordmotion'

  " Save buffers automatically
  Plug '907th/vim-auto-save'
    let g:auto_save = 1
    let g:auto_save_silent = 1
    let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

  " Make * useful in visual mode
  Plug 'bronson/vim-visual-star-search'

  " Project-wide search with rg
  Plug 'mhinz/vim-grepper'
    let g:grepper = {}
    let g:grepper.tools = ["rg"]
    " runtime autoload/grepper.vim
    let g:grepper.jump = 1
    nnoremap \ :GrepperRg<Space>
    nnoremap g* :Grepper -cword -noprompt<CR>
    xmap g* <plug>(GrepperOperator)

  " Extremely useful extended text objects 
  Plug 'wellle/targets.vim'

call plug#end()
" }}}

so ~/dotfiles/vim/config.vim
so ~/dotfiles/vim/mappings.vim
so ~/dotfiles/vim/plugins.vim
so ~/dotfiles/vim/filetypes.vim
so ~/dotfiles/vim/functions.vim
so ~/dotfiles/vim/statusline.vim

" vim:foldmethod=marker:foldlevel=0
