" reset all settings
function! Reset()
    mapclear
endfunction

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
    call s:createDirIfNotExists('~/.vim/cached')
    let l:cacheFile = expand('~/.vim/cached/lastfile.swp')
    execute 'w!' l:cacheFile
endfunction

" source directory recursively
function! SourceDir(path)
    for file in split(globpath(a:path,'**/*.vim'), '\n')
        execute 'source' fnameescape(file)
    endfor
endfunction

function! IsWin()
    return has('win32') || has('win64')
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
        if IsWin()
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

function! Curl(url, localPath)
    if !filereadable(a:localPath)
        " curl version >= 7.52.0
        if !executable("curl") 
            echoerr "You have to install curl(>= 7.52.0) first"
            execute "q!"
        endif
        echo printf('Installing %s to %s',a:url, a:localPath)
        echo ""
        execute printf("!\curl --connect-timeout 10 --retry-delay 0 --retry 10 --retry-connrefused -fLo --create-dirs %s %s", a:url, a:localPath)
    endif
endfunction

function! Clone(url, dir)
    if !executable("git")
        echoerr "You have to install git first"
        execute "q!"
    endif

    if !isdirectory(expand(a:dir))
        echo 'start to clone repository: '.a:url
        execute printf("!git clone %s %s", a:url, a:dir)
    endif
endfunction
