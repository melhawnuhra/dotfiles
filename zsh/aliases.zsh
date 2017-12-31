alias reload='. ~/.zshrc'   # Re-source .zshrc
alias c='clear' # Good 'ol Clear Screen command
alias cats='pygmentize -g'		# Syntax-highlighted cat
alias cpwd='pwd|tr -d "\n"|pbcopy'	# Copy pwd path

# Fuck alias
if $(thefuck &>/dev/null)
then
    eval $(thefuck --alias)
fi