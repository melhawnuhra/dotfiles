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

  Plug 'mhinz/vim-sayonara'
  Plug 'tpope/vim-sensible'

  Plug 'mileszs/ack.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'airblade/vim-rooter'
  Plug 'junegunn/gv.vim'

  Plug 'Raimondi/delimitMate'
  Plug 'justinmk/vim-matchparenalways'
  Plug 'Yggdroot/indentLine'

  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'christoomey/vim-system-copy'
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
  " Plug 'PeterRincker/vim-argumentative' " TODO Try this

  " Theme
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'

  " Syntax highlighting
  Plug 'sheerun/vim-polyglot'
  " e.g. g:polyglot_disabled = ['typescript']

  " Code completion
  " Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/neopairs.vim'
  Plug 'Shougo/echodoc.vim'
  Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'tsx'], 'do': './install.sh' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  " Plug 'autozimu/LanguageClient-neovim', {
  "     \ 'branch': 'next',
  "     \ 'do': 'bash install.sh',
  "     \ }
  Plug 'lvht/phpcd.vim'

  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'mattn/emmet-vim'

call plug#end()
" }}}

so ~/dotfiles/vim/config.vim
so ~/dotfiles/vim/mappings.vim
so ~/dotfiles/vim/plugins.vim
so ~/dotfiles/vim/languages.vim

" vim:foldmethod=marker:foldlevel=0
