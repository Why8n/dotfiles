"置鼠标运行模式为WINDOWS模式
behave mswin
" Ctrl+a
nnoremap <silent> <C-a> ggVG$

" 选中状态下 Ctrl+c 复制
vnoremap <C-c> "+y

" Ctrl+v
nnoremap <silent> <C-v> "+p
inoremap <silent> <C-v> <C-r><C-p>+
vnoremap <silent> <C-v> "+p
cnoremap <C-v> <C-r>+

" Ctrl+x
nnoremap <silent> <C-x> "+dd
vnoremap <silent> <C-x> "+d
