
function! s:createDirIfNotExists(dir)
    let l:newDir = expand(a:dir)
    if !isdirectory(expand(l:newDir))
        let confirmation=confirm("Create a new directory?", "&Yes\n&No")
        if confirmation == 1
            call mkdir(expand(l:newDir), 'p')
            echom 'Created a new directory:' l:newDir
        endif
    endif
endfunction

function! CacheFile()
    call s:createDirIfNotExists('~/.vim/temp')
    let l:cacheFile = expand('~/.vim/temp/lastfile.swp')
    execute 'w!' l:cacheFile
endfunction

" source directory recursively
function! SourceDir(path)
    for file in split(globpath(a:path,'**/*.vim'), '\n')
        execute 'source' fnameescape(file)
    endfor
endfunction

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

function! s:DownPlugVimAndInstall(path)
    if !filereadable(a:path)
        " curl version >= 7.52.0
        if !executable("curl") 
            echoerr "You have to install curl or first install vim-plug yourself!"
            execute "q!"
        endif
        echo "Installing Vim-Plug..."
        echo ""
        exec "!\curl --connect-timeout 10 --retry-delay 0 --retry 10 --retry-connrefused -fLo " .a:path. " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

        autocmd VimEnter * PlugInstall --sync
    endif
endfunction

function! s:DownPlugVim2Windows4nvim(path)
    call s:DownPlugVimAndInstall(a:path)
endfunction

function! s:DownPlugVim2Windows4vim(path)
    call s:DownPlugVimAndInstall(a:path)
endfunction

function! s:DownPlugVim2Linux4nvim(path)
    call s:DownPlugVimAndInstall(a:path)
endfunction
    
function! s:DownPlugVim2Linux4vim(path)
    call s:DownPlugVimAndInstall(a:path)
endfunction
    
function! s:DownPlugVim2Windows()
    if has('nvim')
        call s:DownPlugVim2Windows4nvim($USERPROFILE.'/AppData/Local/nvim/autoload/plug.vim')
    else
        call s:DownPlugVim2Windows4vim($VIM.'/vimfiles/autoload/plug.vim')
    endif
endfunction

function! s:DownPlugVim2Linux()
    if has('nvim')
        call s:DownPlugVim2Linux4nvim($HOME.'/.config/nvim/autoload/plug.vim')
    else
        call s:DownPlugVim2Linux4vim($HOME.'/.vim/autoload/plug.vim')
    endif
endfunction

function! DownPlugVimIfNotExists()
    if IsWin32()
        call s:DownPlugVim2Windows()
    elseif IsUnix() || IsWin32Unix() || IsMac()
        call s:DownPlugVim2Linux()
    endif
endfunction
