source ~/.vim/utils.vim
call DownPlugVimIfNotExists()

source ~/.vim/basic/settings.vim
source ~/.vim/basic/mappings.vim

" Auto download vim-plug for the first time

if IsWin32()
	source ~/.vim/os/config4windows.vim
elseif IsUnix() || IsWin32Unix() || IsMac()
	source ~/.vim/os/config4unix.vim
endif

source ~/.vim/plugins.vim

map <F5> :call CompileRun()<CR>
nmap <leader>cmd :call CompileRun()<CR>
