source ~/.vim/utils.vim
" call Reset()
" Auto download vim-plug for the first time
call DownPlugVimIfNotExists()

function! s:basicVimConfig()
    source ~/.vim/basic/settings.vim
    source ~/.vim/basic/mappings.vim
endfunction

function! s:basicNvimConfig()
    call s:basicVimConfig()
    source ~/.vim/neovim/basic/mappings.vim
endfunction

function! s:plugins4Vim()
    source ~/.vim/plugins.vim
    call InstallVimAndConfig()
endfunction

function! s:plugins4Nvim()
    source ~/.vim/plugins.vim
    call InstallNvimAndConfig()
endfunction

function! s:basicVimConfig4Win()
    call SourceDir('~/.vim/os/windows/basic')
endfunction

function! s:basicNvimConfig4Win()
    call s:basicVimConfig4Win()
    call SourceDir('~/.vim/os/windows/neovim/basic')
endfunction

function! s:basicVimConfig4Unix()
    call SourceDir('~/.vim/os/unix/basic')
endfunction

function! s:basicNvimConfig4Unix()
    call s:basicVimConfig4Unix()
    call SourceDir('~/.vim/os/unix/neovim/basic')
endfunction

" os config
if IsWin32() 
    if has('nvim')
        call s:basicNvimConfig()
        call s:basicNvimConfig4Win()
        call s:plugins4Nvim()
    else
        call s:basicVimConfig()
        call s:basicVimConfig4Win()
        call s:plugins4Vim()
    endif
elseif IsUnix() || IsWin32Unix() || IsMac()
    if has('nvim')
        call s:basicNvimConfig()
        call s:basicNvimConfig4Unix()
        call s:plugins4Nvim()
    else
        call s:basicVimConfig()
        call s:basicVimConfig4Unix()
        call s:plugins4Vim()
    endif
endif

" others
" map <F5> :call CompileRun()<CR>
" nmap <leader>cmd :call CompileRun()<CR>

" backup current file when forced exit
nnoremap <silent> <leader><leader>q :call CacheFile()<esc>:q!<cr>
" auto switch to current file directory when enter a new file
" autocmd BufEnter * lcd %:p:h
