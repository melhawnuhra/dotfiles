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

" Use ctrl-[hjkl] to select the active split!
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

" Easier switching between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>

" Easier switching between tabs
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>
nnoremap <silent> ]B :blast<CR>

" Make n always search forward
" nnoremap <expr> n 'Nn'[v:searchforward]
" Make N always search backward
" nnoremap <expr> N 'nN'[v:searchforward]

" Easy expansion of the Active File Directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Ex mode - cycle through command history on home row
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


" =-=-=--=-=-=-= LEADER MAPPINGS =-=-=--=-=-=-=


" Make it easier to make life easier
nnoremap <leader>ev :vsplit $DOTFILES_HOME/vim <cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Surround word in quotes
" We don't technically need this - surround.vim gives us ysiw'
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel

" File and Window Management
inoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w :w<CR>

inoremap <leader>q <ESC>:q<CR>
nnoremap <leader>q :q<CR>

inoremap <leader>Q <ESC>:q!<CR>
nnoremap <leader>Q :q!<CR>

inoremap <leader>x <ESC>:x<CR>
nnoremap <leader>x :x<CR>

nnoremap <leader>e :Ex<CR>
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
nnoremap <leader>b :split<CR>:w<CR>:Ex<CR>

" Placeholder mappings
nnoremap <leader><leader> i<++><Esc>
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l

" Go-to-definition (made possible by Gutentags + CtrlP)
map <silent> <leader>gd :CtrlPTag<cr><C-\>w

" Map Null to C-Space to trigger autocompletion popup
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
        \ "\<lt>C-n>" :
        \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
        \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
        \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
