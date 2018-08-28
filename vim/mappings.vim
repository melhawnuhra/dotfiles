" =-=-=--=-=-=-= BASIC MAPPINGS =-=-=--=-=-=-=


" Remap 0 to first non-blank character
map 0 ^

" Let's be reasonable, shall we?
nnoremap k gk
nnoremap j gj
nnoremap H 0
nnoremap L $

" Quick Esc in insert mode
inoremap jk <esc>

" Easier switching between windows
nnoremap <silent> <c-[> :wincmd h<CR>
nnoremap <silent> <c-]> :wincmd l<CR>

" Easier switching between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ;b :b#<CR>
nnoremap <silent> ;; :b#<CR>

" Easier switching between tabs
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>
nnoremap <silent> ]B :blast<CR>

" Make n always search forward
nnoremap <expr> n 'Nn'[v:searchforward]
" Make N always search backward
nnoremap <expr> N 'nN'[v:searchforward]

" Easy expansion of the Active File Directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Ex mode - cycle through command history on home row
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


" =-=-=--=-=-=-= LEADER MAPPINGS =-=-=--=-=-=-=


let mapleader=","               " Remap the leader key

" Make it easier to make life easier
nnoremap <leader>ev :vsplit $DOTFILES_HOME/vim <cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" File and Window Management
inoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w :w<CR>

inoremap <leader>q <ESC>:q<CR>
nnoremap <leader>q :q<CR>
nnoremap q<CR> :q<CR>

inoremap <leader>Q <ESC>:q!<CR>
nnoremap <leader>Q :q!<CR>

inoremap <leader>x <ESC>:Sayonara!<CR>
nnoremap <leader>x :Sayonara!<CR>

nnoremap <leader>e :Ex<CR>
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
nnoremap <leader>b :split<CR>:w<CR>:Ex<CR>

" Placeholder mappings TODO Start using
" nnoremap <leader><leader> i<++><Esc>
" inoremap <leader><leader> <Esc>/<++><Enter>"_c4l

" Html mappings
" close last open tag
inoremap <leader>/ </<C-x><C-o>
" quick attributes
inoremap <leader>id id=""<esc>i
inoremap <leader>cl class=""<esc>i

" Go-to-definition (made possible by Gutentags + CtrlP)
map <silent> <leader>gd :CtrlPTag<cr><C-\>w

