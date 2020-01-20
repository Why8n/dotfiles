map <silent> <LEADER><CR> :nohlsearch<CR>
" Tab operation，map tab will cause <C-i> lose jump function
" map <tab> gt
" map <S-tab> gT

" format
nmap <silent> <leader>fm gg=G''
vmap <leader>fm =

" Fast quiting without saving
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader><leader>q :q!<cr>
nnoremap <leader>w :w<cr>
nnoremap <silent> <leader><leader>o :only<cr>
" delete all buffers except current
nnoremap <leader><leader>O :w \| %bd \| e#<cr>
" close previews window
nnoremap <silent> <leader><leader>p :-quit<cr>

" cusor mvoement in insertmode
" inoremap <c-h> <left>
" inoremap <c-l> <right>
" inoremap <c-j> <c-o>gj
" inoremap <c-k> <c-o>gk
" inoremap <c-j> <up>
" inoremap <c-k> <down>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Moving windows
nnoremap <Leader>L <C-w>L
nnoremap <Leader>H <C-w>H
nnoremap <Leader>K <C-w>K
nnoremap <Leader>J <C-w>J

" onoremap <silent> ib :<c-u>execute "normal! f)vib"<cr>
" onoremap <silent> ab :<c-u>execute "normal! f)vab"<cr>
" onoremap <silent> i( :<c-u>execute "normal! f)vi("<cr>
" onoremap <silent> a( :<c-u>execute "normal! f)va("<cr>
" onoremap <silent> iB :<c-u>execute "normal! /}\<lt>cr>vi{" \| nohlsearch<cr>
" onoremap <silent> aB :<c-u>execute "normal! /}\<lt>cr>va{" \| nohlsearch<cr>
" onoremap <silent> i{ :<c-u>execute "normal! /}\<lt>cr>vi{" \| nohlsearch<cr>
" onoremap <silent> a{ :<c-u>execute "normal! /}\<lt>cr>va{" \| nohlsearch<cr>
" onoremap <silent> i[ :<c-u>execute "normal! f]vi["<cr>
" onoremap <silent> a[ :<c-u>execute "normal! f]va["<cr>

" 设置锚点
map <Leader><Leader>m <Esc>/<><CR>:nohlsearch<CR>2s
" shift+enter to append suffix
autocmd FileType * nnoremap <S-CR> <ESC>o
autocmd FileType * inoremap <S-CR> <ESC>o
autocmd FileType c,cpp,java,javascript nnoremap <S-CR> <ESC>A;<CR>
autocmd FileType c,cpp,java,javascript inoremap <S-CR> <ESC>A;<CR>

" open a blank new file on the right panel
nnoremap <leader>vs :bo vnew<cr>
" nnoremap <leader>hs :new<cr>
nnoremap <leader>ev :botright vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" source self
nnoremap <leader>ss :source %<cr>

" delte the next character in insert mode
inoremap <C-l> <ESC>ls

" start a * or # search from a visual block
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" customize :grep
if(executable('rg'))
    set grepprg=rg\ --line-number\ --column\ --no-heading\ --smart-case\ $*
    set grepformat=%f:%l:%c:%m
    command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
endif
