" Load Plugins
execute pathogen#infect()

" General config
so $DOTFILES_HOME/vim/config.vim

" Plugin-specific config
so $DOTFILES_HOME/vim/plugins.vim

" Mappings
so $DOTFILES_HOME/vim/mappings.vim

" Language-specific config
so $DOTFILES_HOME/vim/languages.vim

