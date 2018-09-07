# Number of characters to show for each directory along path
set fish_prompt_pwd_dir_length 3

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch magenta
set __fish_git_prompt_color_dirtystate FCBC47
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_upstream cyan

# Git Characters
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '⇢'
set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '⇡'
set __fish_git_prompt_char_upstream_behind '⇣'
set __fish_git_prompt_char_upstream_diverged '⇡⇣'

function _fish_jobs_prompt
  set -l jobs_amount (jobs | wc -l | xargs)

  if test $jobs_amount -eq 0
    echo ""
  else if test $jobs_amount -eq 1
      echo "✦ "
  else
    echo "$jobs_amount✦ "
  end
end

function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

  set_color $color
  printf $string
  set_color normal
end

function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo magenta
  else
    echo red
  end
end

function fish_prompt
  set -l last_status $status

  _print_in_color "\n"(prompt_pwd) cyan

  __fish_git_prompt " %s"

  printf "\n"
  _print_in_color (_fish_jobs_prompt) "yellow"
  _print_in_color "❯ " (_prompt_color_for_status $last_status)
end
