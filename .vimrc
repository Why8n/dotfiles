"detected os:https://vi.stackexchange.com/questions/2572/detect-os-in-vimscript 
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


function! DownPlugVimAndInstall(path)
    if empty(glob(a:path))
        let cmd = 'curl -fLo "'.a:path.'" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        " silent !curl -fLo '~/.config/nvim/autoload/plug.vim' --create-dirs
        "   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        execute "silent !" .l:cmd
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
        call DownPlugVim2Linux4nvim('~/.config/nvim/autoload/plug.vim')
    else
        call DownPlugVim2Linux4vim('~/.vim/autoload/plug.vim')
    endif
endfunction

function! DownPlugVimIfNotExists()
    if IsWin32()
        call DownPlugVim2Windows()
    elseif IsUnix() || IsWin32Unix() || IsMac()
        call DownPlugVim2Linux()
    endif
endfunction

" Auto download vim-plug for the first time
call DownPlugVimIfNotExists()

" global configurations
if IsWin32()
    " source $VIMRUNTIME/general.vim
    "  C:/Users/<user>/general.vim
    " source $userprofile/general.vim
    let g:python3_host_prog ='D:\Program Files (x86)\Python\Python3\python.exe'
    let g:ycm_extra_conf="D:/Program\ Files\ (x86)/Vim/vimfiles/.ycm_extra_conf.py"
    let g:chrome = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
    " custom plugin install path,so that vim and neovim can shared the same
    " plugins (notice in windows: ~/.vim = c:\Users\<user>\.vim)
    let g:plugins_path = 'D:\config\.vim\plugged'
elseif IsUnix() || IsWin32Unix() || IsMac()
    let g:python3_host_prog ='/usr/bin/python'
    let g:ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
    let g:chrome = '/usr/bin/chrome'
    let g:plugins_path = '~/.vim/plugged'
endif


" let g:python3_host_prog ='"D:/Program Files (x86)/Python/python3/python.exe"'
" let g:python3_host_prog = IsWin32() ? '"D:/Program Files (x86)/Python/python3/python.exe"' : '/usr/bin/python'



source ~/general.vim
    
" reload vimrc
map <C-l> :source $MYVIMRC<CR>
" no backup
set noundofile
set nobackup
set noswapfile


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" set cmd window height :( cmd )
set cmdheight=1
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" remove gui
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Disable arrow movement, resize splits instead.
" if get(g:, 'elite_mode')
map <Up>    :resize +2<CR>
map <Down>  :resize -2<CR>
map <Left>  :vertical resize +2<CR>
map <Right> :vertical resize -2<CR>

" auto complete brackets
" inoremap {<CR> {<C-o>o}<C-o>O
" inoremap ( ()<ESC>i
" inoremap < <><ESC>i
" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i


" disable window search style
" nnoremap <C-f> /
" inoremap <C-f> <ESC>/
" vnoremap <C-f> <ESC>/<C-r><C-w>
" " command mode
" cnoremap <C-f> <C-r><C-w>

" plug-vim configurations
call plug#begin(g:plugins_path)
"
" -------------------------------------------------------------------------
" add plugin here
" Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim', {'on':'CtrlP'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() },'for':['markdown','vim-plug']}
" markdown table improvment
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plug 'reedes/vim-pencil'

"Plug 'Valloric/YouCompleteMe'
" Plug 'Raimondi/delimitMate'

Plug 'jiangmiao/auto-pairs'

" Bookmarks
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/Marks-Browser'

Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

" switch input method 
Plug 'https://github.com/vim-scripts/fcitx.vim.git'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

Plug 'terryma/vim-multiple-cursors'

" Hyperfocus-writing in Vim
Plug 'junegunn/limelight.vim'
" distraction free writing mode
Plug 'junegunn/goyo.vim' 
" 文本对齐插件
Plug 'godlygeek/tabular'

" Find And Replace Vim plugin
Plug 'brooth/far.vim'

" 缩进指示线
Plug 'Yggdroot/indentLine'

" scheme for console
" Plug 'jnurmine/Zenburn'
Plug 'kristijanhusak/vim-hybrid-material'

" Plug 'davidhalter/jedi-vim'
if has('nvim')
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-match-highlight'
    Plug 'ncm2/ncm2-markdown-subscope'
endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" -------------------------------------------------------------------------
" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()

" colorscheme settings must after plug#end(),cuz only when plug#end that plugins work
if has('gui_running')
    colorscheme SolarizedDark
else
    " colorscheme zenburn
	set background=dark
	colorscheme hybrid_reverse
endif

if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	set background=dark
	colorscheme hybrid_reverse
    " making functions and language controls to be bolded
    let g:enable_bold_font = 1
    " make comments to be in italic
    let g:enable_italic_font = 1
    " make background transparent
    let g:hybrid_transparent_background = 1
    let g:airline_theme = "hybrid"
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif 

" ====== plugins configurations
" -------------
"  ctrlsf
" -------------
" if executable('ag')
"     let g:ctrlsf_ackprg = 'ag'
" endif
" let g:ctrlsf_case_sensitive = 'smart'
" let g:ctrlsf_default_root = 'project'
" let g:ctrlsf_default_view_mode = 'normal'
" let g:ctrlsf_position = 'left'
" let g:ctrlsf_winsize = '30%'

" nnoremap <C-f> :CtrlSF<Space>
" inoremap <C-f> <ESC>:CtrlSF<Space>
"

"
" visiual and select mode
" vnoremap <C-f> "1y:CtrlSF<Space><C-R>1
" visiual mode
"xnoremap <C-f> :CtrlSF<Space> 
" command line mode
" cnoremap <C-f> CtrlSF

" ------------
" ctrlp
" ------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" set local working directory:current file
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
" exclusions
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ }
" let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
" Use a custom file listing command:
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    let g:ctrlp_user_command = ['ag','ag %s -i --nocolor --nogroup --hidden
                \ --ignore .git
                \ --ignore .svn
                \ --ignore .hg
                \ --ignore .DS_Store
                \ --ignore "**/*.pyc"
                \ -g ""' ]
elseif IsUnix() || IsMac()
    let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
elseif IsWin32()
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
endif

" ------------
" nerdtree
" ------------
nmap wm :NERDTreeToggle<CR>
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
" 当不带参数打开Vim时自动加载项目树 -- no
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
"Refresh both CtrlP and NERDTree
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

" --------------
"  syntastic
" --------------

" syntastic default config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" overwrite quickfix when execute :SyntasticSetLocList
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <F2> :SyntasticToggleMode<CR>


" ---------------
" nerdcommenter
" ---------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'java': { 'left': '//'} }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

vmap <C-b> <leader>cc

" -----------------------
" markdown-preview.nvim
" -----------------------

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = g:chrome

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

map <silent> <F8> <Plug>MarkdownPreview       
map <silent> <F9> <Plug>MarkdownPreviewStop  

" -----------------
" vim-table-mode
" -----------------

" 配置快捷键
nmap <Leader>tm :TableModeToggle<CR>
" markdown-compatible tables
let g:table_mode_corner='|'

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction
" 插入模式下，按 || 使能插件
inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
" 插入模式下，按 __ 失能插件
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


" ---------------------------
" indentLine configuration
" ---------------------------
" do not highlight conceal color(not background)
let g:indentLine_setColors = 1
" customize conceal color
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202

" let g:indentLine_char = 'c'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" change conceal behaviour
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

" -------------
" ncm2 configuration
" -------------
if has('nvim')
    " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect
    let ncm2#popup_delay = 5
    let g:ncm2#matcher = "substrfuzzy"
    let g:ncm2_jedi#python_version = 3
    let g:ncm2#match_highlight = 'sans-serif'

endif

" -------------
" jedi-vim
" -------------
"let g:jedi#auto_initialization = 1
""let g:jedi#completion_enabled = 0
""let g:jedi#auto_vim_configuration = 0
""let g:jedi#smart_auto_mapping = 0
"let g:jedi#popup_on_dot = 1
"let g:jedi#completion_command = ""
"let g:jedi#show_call_signatures = "1"

" ----------------
" vim-pencil
" ---------------- 
" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd,md call pencil#init()
"   autocmd FileType text         call pencil#init()
" augroup END
" let g:airline_section_x = '%{PencilMode()}'
"
"----------------------------
"YouCompleteMe
"----------------------------
"let g:ycm_key_invoke_completion = '<M-/>' "default <C-Space>,modify to alt+/
"" 自动补全配置
"set completeopt=longest,menu " "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"
""youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
"
"let g:ycm_min_num_of_chars_for_completion = 1
""在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"" 让YouCompleteMe同时利用原来的ctags
"let g:ycm_collect_identifiers_from_tag_files = 1  
"let g:clang_user_options='|| exit 0'
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

let g:ycm_server_python_interpreter=g:python3_host_prog
let g:ycm_global_ycm_extra_conf= g:ycm_extra_conf

" add support completions of java
let g:EclimCompletionMethod = 'omnifunc'
" add support completions of python
let g:ycm_python_binary_path =g:python3_host_prog


" -------------------
"  delimitMate
"  ------------------
" inoremap {<CR> {<CR>}<C-o>O
" Use this option to tell delimitMate which characters should be considered
" matching pairs. Read |delimitMateAutoClose| for details.
" let delimitMate_matchpairs = "(:),[:],{:}"
" au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
"
"
" -----------------------
"  marks-browers
"  -----------------------
nmap <silent> <leader>mb :MarksBrowser<cr>
" the browser window close itself after you jump to a mark
let marksCloseWhenSelected = 1


" ----------------------
" vim-multiple-cursor
" ----------------------
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" fix <A-n> not working in VIM,but works in gVIM
if !has('gui_running')
    map "in Insert mode, type Ctrl+v Alt+n here" <A-n>
endif
" fix <C-n> not working in gVIM
set selection=inclusive


" ---------------
" limelight
" ---------------
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1


" ----------------
" goyo.vim
" ----------------
let g:gyo_width=80
let g:goyo_height='85%'
let g:goyo_linenr=0

nmap <Leader>ll :Goyo<CR>
xmap <Leader>ll :Goyo<CR>

"进入goyo模式后自动触发limelight,退出后则关闭
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" ===plugins configurations end



map <F5> :call CompileRun()<CR>
nmap <leader>cmd :call CompileRun()<CR>
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

