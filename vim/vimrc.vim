if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

if !has('nvim')
  set nocompatible                " Turn of VI compatibility mode
  set ttyfast                     " Faster rendering
  set sidescroll=1                " Enable sideways scrolling
  set showcmd                     " Show incomplete cmds in bottom right
  set noesckeys                   " Fix the delay returning to Normal mode
endif

" Plugins {{{
call plug#begin('~/.vim/plugged')

  Plug 'tpope/vim-sensible'

  " Search enhancements
  Plug 'mileszs/ack.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'romainl/vim-qlist'  " ilist / dlist

  " UI and theme enhancements
  Plug 'morhetz/gruvbox'
  Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-buftabline'
  Plug 'andymass/vim-matchup' " Highlight matching pairs
  Plug 'sheerun/vim-polyglot' " Syntax highlighting

  " Environment
  Plug 'mhinz/vim-sayonara'
  Plug 'airblade/vim-rooter'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'christoomey/vim-system-copy'

  " Editing
  Plug 'Raimondi/delimitMate'
  Plug 'christoomey/vim-sort-motion'

  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-fugitive'

  " Text Objects
  Plug 'kana/vim-textobj-user'
  Plug 'glts/vim-textobj-comment'
  Plug 'kana/vim-textobj-entire'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'gaving/vim-textobj-argument'
  Plug 'kana/vim-textobj-line'

  " Code completion
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/echodoc.vim'
  Plug 'lvht/phpcd.vim'

  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'mattn/emmet-vim'

call plug#end()
" }}}

so ~/dotfiles/vim/config.vim
so ~/dotfiles/vim/mappings.vim
so ~/dotfiles/vim/plugins.vim
so ~/dotfiles/vim/languages.vim
so ~/dotfiles/vim/functions.vim
so ~/dotfiles/vim/statusline.vim

" vim:foldmethod=marker:foldlevel=0
