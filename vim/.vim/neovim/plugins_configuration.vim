"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set background=dark
" colorscheme hybrid_reverse
" highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey30
" " making functions and language controls to be bolded
" let g:enable_bold_font = 1
" " make comments to be in italic
" let g:enable_italic_font = 1
" " make background transparent
" let g:hybrid_transparent_background = 1
" let g:airline_theme = "hybrid"

" -------------
" ncm2 configuration
" -------------
"if has('nvim')
    "" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    "" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    "" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
    "autocmd BufEnter * call ncm2#enable_for_buffer()
    "set completeopt=noinsert,menuone,noselect
    "let ncm2#popup_delay = 5
    "let g:ncm2#matcher = "substrfuzzy"
    "let g:ncm2_jedi#python_version = 3
    "" let g:ncm2#match_highlight = 'sans-serif'
"endif

