if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

if !has('nvim')
  set ttyfast                     " Faster rendering
  set sidescroll=1                " Enable sideways scrolling
  set showcmd                     " Show incomplete cmds in bottom right
  set noesckeys                   " Fix the delay returning to Normal mode
endif

so ~/dotfiles/vim/plugins_list.vim
so ~/dotfiles/vim/config.vim
so ~/dotfiles/vim/mappings.vim
so ~/dotfiles/vim/plugins_config.vim

so ~/dotfiles/vim/filetypes.vim
so ~/dotfiles/vim/functions.vim
so ~/dotfiles/vim/statusline.vim

" vim:foldmethod=marker:foldlevel=0
