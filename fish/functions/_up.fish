function _up -d "inspired by `bd`: https://github.com/vigneshwaranr/bd"
  set -l rx (ruby -e "print '$argv'.gsub(/\s+/,'').split('').join('.*?')")
  # fish doesn't allow ${var} protection
  # so the square brackets are interpreted as array counters...
  set -l rx (printf "/(.*\/%s[^\/]*\/).*/i" $rx)
  echo $PWD | ruby -e "print STDIN.read.sub($rx,'\1')"
end

