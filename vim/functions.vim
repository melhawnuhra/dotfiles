
function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that's loaded and not visible
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      exe 'bd ' . b
    endif
  endfor
endfun

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

" Reveal {{{
" Reveal file in the system file explorer
function s:Reveal(path)
  if has('macunix')
    " only macOS has functionality to really 'reveal' a file, that is, to open
    " its parent directory in Finder and select this file
    call system('open -R ' . fnamemodify(a:path, ':S'))
  else
    " for other systems let's not reinvent the bicycle, instead we open file's
    " parent directory using netrw's builtin function (don't worry, netrw is
    " always bundled with Nvim)
    call s:Open(a:path)
  endif
endfunction
command Reveal call s:Reveal(expand('%'))
" }}}

" Open {{{
" opens file with a system program
function s:Open(path)
  " HACK: 2nd parameter of this function is called 'remote', it tells
  " whether to open a remote (1) or local (0) file. However, it doesn't work
  " as expected in this context, because it uses the 'gf' command if it's
  " opening a local file (because this function was designed to be called
  " from the 'gx' command). BUT, because this function only compares the
  " value of the 'remote' parameter to 1, I can pass any other value, which
  " will tell it to open a local file and ALSO this will ignore an
  " if-statement which contains the 'gf' command.
  call netrw#BrowseX(a:path, 2)
endfunction
command Open call s:Open(expand('%'))
" }}}
