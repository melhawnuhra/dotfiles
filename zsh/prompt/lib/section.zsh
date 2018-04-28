
# Internal variable for checking if prompt is opened
prompt_prompt_opened="$PROMPT_PROMPT_FIRST_PREFIX_SHOW"

# Draw prompt section (bold is used as default)
# USAGE:
#   prompt::section <color> [prefix] <content> [suffix]
prompt::section() {
  local color prefix content suffix
  [[ -n $1 ]] && color="%F{$1}"  || color="%f"
  [[ -n $2 ]] && prefix="$2"     || prefix=""
  [[ -n $3 ]] && content="$3"    || content=""
  [[ -n $4 ]] && suffix="$4"     || suffix=""

  [[ -z $3 && -z $4 ]] && content=$2 prefix=''

  echo -n "%{%B%}" # set bold
  if [[ $prompt_prompt_opened == true ]]; then
    echo -n "$prefix"
  fi
  prompt_prompt_opened=true
  echo -n "%{%b%}" # unset bold

  echo -n "%{%B$color%}" # set color
  echo -n "$content"     # section content
  echo -n "%{%b%f%}"     # unset color

  echo -n "%{%B%}" # reset bold, if it was disabled before
  echo -n "$suffix"
  echo -n "%{%b%}" # unset bold
}

# Compose whole prompt from sections
# USAGE:
#   prompt::compose_prompt [section...]
prompt::compose_prompt() {
  # Treat the first argument as list of prompt sections
  # Compose whole prompt from diferent parts
  # If section is a defined function then invoke it
  # Otherwise render the 'not found' section
  for section in $@; do
    if prompt::defined "prompt_$section"; then
      prompt_$section
    else
      prompt::section 'red' "'$section' not found"
    fi
  done
}
