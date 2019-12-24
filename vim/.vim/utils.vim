function! IsWin32()
    return has('win32')
endfunction

function! IsWin32Unix()
    return has('win32unix')
endfunction

function! IsUnix()
    return has('unix')
endfunction

function! IsMac()
    return has('macunix')
endfunction

func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %< && ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< && ./%<"
    elseif &filetype == 'java'
        exec "!javac % && java %<"
    elseif &filetype == 'kotlin'
        if IsWin32()
            exec "!kotlinc % -include-runtime -d %<.jar && java -jar %<.jar && del %<.jar"
        else
            exec "!kotlinc % -include-runtime -d %<.jar && java -jar %<.jar && rm %<.jar"
        endif
    elseif &filetype == 'python'
        exec "!\"".g:python3_host_prog."\" %"
    elseif &filetype == 'html'
        exec "!chrome % &"
    elseif &filetype == 'go'
        exec "!go build %< && go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html & && !chrome %.html &"
    elseif &filetype == 'sh'
        :!bash %
    elseif &filetype == 'dosbatch'
        exec "!cmd /c %"
    endif
endfunc



function! DownPlugVimAndInstall(path)
    if empty(glob(a:path))
        let cmd = '!curl -fLo "'.a:path.'" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        " silent !curl -fLo '~/.config/nvim/autoload/plug.vim' --create-dirs
        "   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        execute l:cmd
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endfunction

function! DownPlugVim2Windows4nvim(path)
    call DownPlugVimAndInstall(a:path)
endfunction

function! DownPlugVim2Windows4vim(path)
    call DownPlugVimAndInstall(a:path)
endfunction

function! DownPlugVim2Linux4nvim(path)
    call DownPlugVimAndInstall(a:path)
endfunction
    
function! DownPlugVim2Windows()
    if has('nvim')
        call DownPlugVim2Windows4nvim($USERPROFILE.'/AppData/Local/nvim/autoload/plug.vim')
    else
        call DownPlugVim2Windows4vim($VIM.'/vimfiles/autoload/plug.vim')
    endif
endfunction


function! DownPlugVim2Linux()
    if has('nvim')
        call DownPlugVim2Linux4nvim($HOME.'/.config/nvim/autoload/plug.vim')
    else
        call DownPlugVim2Linux4vim($HOME.'/.vim/autoload/plug.vim')
    endif
endfunction

function! DownPlugVimIfNotExists()
    if IsWin32()
        call DownPlugVim2Windows()
    elseif IsUnix() || IsWin32Unix() || IsMac()
        call DownPlugVim2Linux()
    endif
endfunction

