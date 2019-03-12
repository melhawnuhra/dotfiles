function abbrs -d 'Refresh fish abbreviations'
  set -e docker_abbrs_initialized
  set -e git_abbrs_initialized
  set -e abbrs_initialized
  source ~/.config/fish/config.fish
end

