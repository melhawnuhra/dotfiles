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
  " TODO try replace Ack with fzf's Rg (if I can get Rg results to stay open
  " after selecting one)
  Plug 'mileszs/ack.vim'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'

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
  " TODO include when I can think of good mappings
  " Plug 'matze/vim-move'
  " TODO evaluate how well this works and remove if it doesn't pull its weight (gS, gJ)
  Plug 'AndrewRadev/splitjoin.vim'

  " Text Objects
  Plug 'kana/vim-textobj-user'
  Plug 'glts/vim-textobj-comment'
  Plug 'kana/vim-textobj-entire'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'gaving/vim-textobj-argument'
  Plug 'kana/vim-textobj-line'
  Plug 'terryma/vim-expand-region'

  " Code completion
  " TODO see if I can remove Denite now
  " Plug 'Shougo/denite.nvim'
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
