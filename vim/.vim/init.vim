source ~/.vim/utils.vim
" call Reset()
" Auto download vim-plug for the first time
"call DownPlugVimIfNotExists()

function! s:basicVimConfig()
    source ~/.vim/basic/settings.vim
    source ~/.vim/basic/mappings.vim
endfunction

function! s:basicNvimConfig()
    call s:basicVimConfig()
    source ~/.vim/neovim/basic/mappings.vim
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

function! s:loadVimPlugins()
    source ~/.vim/plugins.vim
endfunction

function! s:loadNvimPlugins()
    source ~/.vim/neovim/plugins.vim
endfunction

function! s:installVimAndConfig()
    if dein#load_state(s:dein_path)
      call dein#begin(s:dein_path)

      call dein#add(s:dein_path.'/repos/github.com/Shougo/dein.vim')

      " install third-party plugins
      call s:loadVimPlugins()

      call dein#end()
      call dein#save_state()
    endif

    source ~/.vim/plugins_configuration.vim
endfunction

function! s:installNvimAndConfig()
    if dein#load_state(s:dein_path)
      call dein#begin(s:dein_path)

      call dein#add(s:dein_path.'/repos/github.com/Shougo/dein.vim')

      " install third-party plugins
      call s:loadVimPlugins()
      call s:loadNvimPlugins()

      call dein#end()
      call dein#save_state()
    endif

    source ~/.vim/plugins_configuration.vim
    source ~/.vim/neovim/plugins_configuration.vim
endfunction

function! s:install()
    " os config
    if IsWin32() 
        if has('nvim')
            call s:basicNvimConfig()
            call s:basicNvimConfig4Win()
            call s:installNvimAndConfig()
        else
            call s:basicVimConfig()
            call s:basicVimConfig4Win()
            call s:installVimAndConfig()
        endif
    elseif IsUnix() || IsWin32Unix() || IsMac()
        if has('nvim')
            call s:basicNvimConfig()
            call s:basicNvimConfig4Unix()
            call s:installNvimAndConfig()
        else
            call s:basicVimConfig()
            call s:basicVimConfig4Unix()
            call s:installVimAndConfig()
        endif
    endif
endfunction

if &compatible
    set nocompatible
endif


let s:dein_path = '~/.vim/dein'

" Add the dein installation directory into runtimepath
let &runtimepath = &runtimepath.','.s:dein_path.'/repos/github.com/Shougo/dein.vim'

"let g:dein#auto_recache = 1
let g:dein#install_log_filename = s:dein_path.'/log.txt'
call s:install()

filetype plugin indent on
syntax enable

if !has('vim_starting') && dein#check_install()
    call dein#install()
endif

autocmd VimEnter * call dein#call_hook('post_source')
call dein#call_hook('source')



" others
" map <F5> :call CompileRun()<CR>
" nmap <leader>cmd :call CompileRun()<CR>

" backup current file when forced exit
nnoremap <silent> <leader><leader>q :call CacheFile()<esc>:q!<cr>
" auto switch to current file directory when enter a new file
" autocmd BufEnter * lcd %:p:h
