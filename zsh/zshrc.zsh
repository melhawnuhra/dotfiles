# shortcut to this dotfiles path is $ZSH
export DOTFILES_HOME=$HOME/dotfiles
export FORTUNE_FILE=$HOME/dotfiles/fortunes
export ZSH=$HOME/.oh-my-zsh

# First of all, feature a fortune-telling cow...
fortune | cowsay | lolcat

# your project folder that we can `c [tab]` to
export PROJECTS=~/code

# Load plugins with antibody
source <(antibody init)
antibody bundle < $DOTFILES_HOME/zsh/zsh_plugins.txt

# Init fasd hook
eval "$(fasd --init posix-alias zsh-hook)"

# all of our zsh files
setopt EXTENDED_GLOB
typeset -U config_files
config_files=($DOTFILES_HOME/(^prompt/)#/(^zshrc).zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path, completion and zshrc files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  # echo "Sourcing $file"   # Primitive performance profiling
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -Uz compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

# Source the prompt
source $DOTFILES_HOME/zsh/prompt/prompt.zsh

unset config_files
wd() {
  . /Users/jared/bin/wd/wd.sh
}
