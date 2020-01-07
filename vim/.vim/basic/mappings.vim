map <LEADER><CR> :nohlsearch<CR>
" Tab operation
map <tab> gt
map <S-tab> gT

" format
nmap <silent> <leader>fm gg=G''
vmap <leader>fm =

" Fast quiting without saving
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader><leader>q :q!<cr>
nnoremap <leader>w :w<cr>
nnoremap <silent> <leader><leader>o :only<cr>
" close previews window
nnoremap <silent> <leader><leader>p :-quit<cr>

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


"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" 设置锚点
map <Leader><Leader>m <Esc>/<><CR>:nohlsearch<CR>2s
" shift+enter to append suffix
autocmd FileType * nnoremap <S-CR> <ESC>o
autocmd FileType * inoremap <S-CR> <ESC>o
autocmd FileType c,cpp,java,javascript nnoremap <S-CR> <ESC>A;<CR>
autocmd FileType c,cpp,java,javascript inoremap <S-CR> <ESC>A;<CR>
