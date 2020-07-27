" neovim terminal
tnoremap <Esc> <C-\><C-n>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 200)
augroup END
