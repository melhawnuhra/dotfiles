call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-sayonara'
Plug 'tpope/vim-sensible'

Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
" Plug 'ryanoasis/vim-devicons' " This requires a Nerd-font compatible font
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
" Plug 'junegunn/gv.vim'

Plug 'Raimondi/delimitMate'
Plug 'justinmk/vim-matchparenalways'
Plug 'Yggdroot/indentLine'
" Plug 'justinmk/vim-sneak'

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

Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'

" Try both of these and see if they work out
Plug 'gaving/vim-textobj-argument'
" Plug 'PeterRincker/vim-argumentative'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax plugins
" Plug 'othree/yajs.vim'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'sheerun/vim-polyglot' " TODO: Use this with individual overrides set
" e.g. g:polyglot_disabled = ['typescript']

" Plug 'neomake/neomake'

" Code completion
" Plug 'ervandew/supertab' " Replace custom <tab> keybindings with this -
" handles more edge cases

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/echodoc.vim'
Plug 'mhartington/nvim-typescript'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

Plug 'lvht/phpcd.vim'

Plug 'SirVer/ultisnips'

call plug#end()

so ~/dotfiles/vim/config.vim
so ~/dotfiles/vim/mappings.vim
so ~/dotfiles/vim/plugins.vim
so ~/dotfiles/vim/languages.vim
