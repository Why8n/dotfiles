map <LEADER><CR> :nohlsearch<CR>
" Tab operation
map <tab> gt
map <S-tab> gT

" format
nmap <silent> <leader>fm gg=G''
vmap <leader>fm =

" Fast quiting without saving
nnoremap <leader>q :q<cr>
nnoremap <leader><leader>q :q!<cr>
nnoremap <leader>w :w<cr>

" cusor mvoement in insertmode
" inoremap <c-h> <left>
" inoremap <c-l> <right>
" inoremap <c-j> <c-o>gj
" inoremap <c-k> <c-o>gk
" inoremap <c-j> <up>
" inoremap <c-k> <down>



" Ctrl+a
nnoremap <silent> <C-a> ggvG$

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" Ctrl+v
nmap <silent> <C-v> "+p
imap <silent> <C-v> <C-r>+
" 命令行模式
cmap <C-v> <C-r>+

" Ctrl+x
nmap <silent> <C-x> "+dd
vmap <silent> <C-x> "+d


"switch windows
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
"nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
nmap wh <C-w>h
nmap wl <C-w>l
nmap wj <C-w>j
nmap wk <C-w>k

" 设置锚点
map <Leader><Leader>m <Esc>/<><CR>:nohlsearch<CR>2s
" shift+enter to append suffix
autocmd FileType * nnoremap <S-CR> <ESC>o
autocmd FileType * inoremap <S-CR> <ESC>o
autocmd FileType c,cpp,java,javascript nnoremap <S-CR> <ESC>A;<CR>
autocmd FileType c,cpp,java,javascript inoremap <S-CR> <ESC>A;<CR>
