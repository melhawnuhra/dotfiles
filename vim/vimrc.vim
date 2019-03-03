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
  Plug 'editorconfig/editorconfig-vim'

  Plug 'Raimondi/delimitMate'
  Plug 'andymass/vim-matchup'
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
  Plug 'kana/vim-textobj-line'

  " Theme
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'

  " Syntax highlighting
  Plug 'sheerun/vim-polyglot'

  " Code completion
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/neopairs.vim'
  Plug 'Shougo/echodoc.vim'
  Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'tsx'], 'do': './install.sh' }
  " Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'lvht/phpcd.vim'

  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2'

  " NOTE: you need to install completion sources to get completions. Check
  " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-cssomni'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-tmux'
  Plug 'ncm2/ncm2-ultisnips'

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

" vim:foldmethod=marker:foldlevel=0
