" =-=-=--=-=-=-= BASIC MAPPINGS =-=-=--=-=-=-=

let mapleader=","

" Movement / Navigation / Getting around {{{

" Allow moving around in visual mode
nnoremap k gk
nnoremap j gj

" highlight last inserted text
nnoremap gV `[v`]

" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" really, just don't
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" Quick Esc in insert mode
inoremap jk <esc>

" Quick open netrw
nnoremap <leader>f :Ex<CR>

" }}}

" Buffers / Tabs {{{

" Easier switching between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> ;; :b#<CR>
nnoremap <silent> 1; :b1<CR>
nnoremap <silent> 2; :b2<CR>
nnoremap <silent> 3; :b3<CR>
nnoremap <silent> 4; :b4<CR>
nnoremap <silent> 5; :b5<CR>
nnoremap <silent> 6; :b6<CR>
nnoremap <silent> 7; :b7<CR>
nnoremap <silent> 8; :b8<CR>
nnoremap <silent> 9; :b9<CR>
nnoremap <silent> 10; :b10<CR>
nnoremap <silent> 11; :b11<CR>
nnoremap <silent> 12; :b12<CR>
nnoremap <silent> 13; :b13<CR>
nnoremap <silent> 14; :b14<CR>
nnoremap <silent> 15; :b15<CR>
nnoremap <silent> 16; :b16<CR>
nnoremap <silent> 17; :b17<CR>
nnoremap <silent> 18; :b18<CR>
nnoremap <silent> 19; :b19<CR>

" Easier switching between tabs
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>

" Quickly open tabs and splits
nnoremap <leader>v :Vexplore<CR>
nnoremap <leader>b :Hexplore<CR>

" }}}

" Searching {{{

" Make n always search forward
nnoremap <expr> n 'Nn'[v:searchforward]
" Make N always search backward
nnoremap <expr> N 'nN'[v:searchforward]
" Quick grep
nnoremap <leader>g :grep<space>
" Quick ilist
nnoremap <leader>i :Ilist<space>
" Quick turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" }}}

" Easy expansion of the Active File Directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Ex mode - cycle through command history on home row
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" =-=-=--=-=-=-= LEADER MAPPINGS =-=-=--=-=-=-=

" Make it easier to make life easier
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quick edit
nnoremap <leader>e :e **/

" Quick write
inoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :saveas **/

" Quick quit
inoremap <leader>q <ESC>:q<CR>
nnoremap <leader>q :q<CR>
nnoremap q<CR> :q<CR>

inoremap <leader>Q <ESC>:q!<CR>
nnoremap <leader>Q :q!<CR>

inoremap <leader>x <ESC>:Sayonara!<CR>
nnoremap <leader>x :Sayonara!<CR>

" strip trailing whitespace
nnoremap <leader>s :call StripTrailingWhitespace()<cr>

" save session
nnoremap <leader>S :mksession<CR>

" Html mappings
" close last open tag
inoremap <leader>/ </<C-x><C-o>
" quick attributes
inoremap <leader>id id=""<esc>i
inoremap <leader>cl class=""<esc>i

" Go-to-definition (made possible by Gutentags + CtrlP)
map <silent> <leader>gd :CtrlPTag<cr><C-\>w

" space open/closes folds
nnoremap <space> za

" vim:foldmethod=marker:foldlevel=0
