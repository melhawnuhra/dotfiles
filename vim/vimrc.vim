call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-sayonara'
Plug 'tpope/vim-sensible'

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

Plug 'Raimondi/delimitMate'
Plug 'justinmk/vim-matchparenalways'
" Plug 'Yggdroot/indentLine'
" Plug 'justinmk/vim-sneak'

Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-system-copy'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Plug 'pangloss/vim-javascript'
"" Plug 'leafgarland/typescript-vim'
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'neomake/neomake'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mhartington/nvim-typescript'
Plug 'SirVer/ultisnips'

call plug#end()

so ~/dotfiles/vim/config.vim
so ~/dotfiles/vim/mappings.vim
so ~/dotfiles/vim/plugins.vim
so ~/dotfiles/vim/languages.vim
