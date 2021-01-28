map <silent> <Leader><CR> :nohlsearch<CR>
" Tab operation，map tab will cause <C-i> lose jump function
" map <tab> gt
" map <S-tab> gT

" format
nmap <silent> <Leader>fm gg=G''
vmap <Leader>fm =

" Fast quiting without saving
nnoremap <Leader>q :q<cr>
nnoremap <Leader><Leader>q :q!<cr>
nnoremap <Leader>w :w<cr>
nnoremap <Leader><Leader>o :only<cr>
" delete all buffers except current
nnoremap <Leader><Leader>O :call CloseAllBuffersButCurrent()<CR>

function! CloseAllBuffersButCurrent()
    let curr = bufnr("%")
    let last = bufnr("$")

    if curr > 1    | silent! execute "1,".(curr-1)."bd!"     | endif
    if curr < last | silent! execute (curr+1).",".last."bd!" | endif
endfunction

" force close current buffer
nnoremap <Leader>bd :bd!<cr>
" close previews window
nnoremap <Leader><Leader>p :-quit<cr>

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
" open a blank new file on the right panel
nnoremap <Leader>sl :rightbelow vnew<CR>
nnoremap <Leader>sh :leftabove vnew<CR>
nnoremap <Leader>sj :rightbelow new<CR>
nnoremap <Leader>sk :leftabove new<CR>
" nnoremap <Leade>s:new<cr>
nnoremap <Leader>ev :botright vs $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>
" source self
nnoremap <Leader>ss :source %<cr>

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


" fixed:Hitting enter in the quickfix window doesn't work
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

nnoremap <Leader>co :copen<CR>

" Ctrl+a
nnoremap <silent> <C-a> ggVG$

" function! s:paste(mode)
"     let flag = &paste
"     set paste
"     if a:mode ==# 'insert'
"         execute "normal! \"+P<CR>"
"         execute "normal! l"
"         startinsert
"     else
"         execute "normal! \"+p<CR>"
"     endif
"     let &paste = flag
" endfunction


" 选中状态下 Ctrl+c 复制
vnoremap <C-c> "+y

" Ctrl+v
" nnoremap <silent> <C-v> "+p
" nnoremap <silent> <C-v> :call <SID>paste('normal')<CR>
" inoremap <silent> <C-v> <C-r><C-p>+
" inoremap <silent> <C-v> <C-o>:call <SID>paste('insert')<CR>
" vnoremap <silent> <C-v> "+p
" cnoremap <C-v> <C-r>+

" Ctrl+x
nnoremap <silent> <C-x> "+dd
vnoremap <silent> <C-x> "+d

" move cursor line up & down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" shift+enter to append suffix
autocmd FileType * nnoremap <S-CR> <ESC>o
autocmd FileType * inoremap <S-CR> <ESC>o
autocmd FileType c,cpp,java,javascript nnoremap <S-CR> <ESC>A;<CR>
autocmd FileType c,cpp,java,javascript inoremap <S-CR> <ESC>A;<CR>
autocmd FileType c,cpp,java,javascript nnoremap <Leader>; mpA;<ESC>`p

" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
inoremap <C-BS> <C-W>
