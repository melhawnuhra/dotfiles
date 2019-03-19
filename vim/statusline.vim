function! ReadOnly() abort
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' '.l:branchname.' ':''
endfunction

"define 3 custom highlight groups
hi User1 guifg=#FFFFFF guibg=#191f26 gui=BOLD
hi User2 guifg=#000000 guibg=#959ca6
hi User3 guifg=#000000 guibg=#4cbf99

set laststatus=2
set statusline=%1*
set statusline+=%*                        " colour
set statusline+=%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
" flags and buf number
" set statusline+=%2*
set statusline+=[
set statusline+=%n                        " buffer number
set statusline+=%H                        "
set statusline+=%M                        " modified
set statusline+=%{ReadOnly()}             " readonly flag
set statusline+=%W                        "
set statusline+=]
" end flags
set statusline+=%*                        " colour
set statusline+=%{&paste?'\ PASTE\ ':''}  " paste mode
set statusline+=%{&spell?'\ SPELL\ ':''}  " spell mode
" set statusline+=%1*                       " color
set statusline+=\ ‹‹
set statusline+=\ %f                      " file path
set statusline+=\ ››
" set statusline+=\ %3*                       " color
" set statusline+=\ %F                      " full file path
set statusline+=%=                        " right align
" set statusline+=\ %{LinterStatus()}
set statusline+=%*
set statusline+=\ %{StatuslineGit()}     " git branch
" set statusline+=%#CursorLine#             " colour
set statusline+=\ ::\                     "
set statusline+=\ %Y\                     " file type
set statusline+=\ ::\                     "
" set statusline+=%#CursorIM#               " colour
set statusline+=\ %3l:%-2c               " line and column
" set statusline+=%#Cursor#                 " colour
set statusline+=\ %3p%%\                  " percentage of file
